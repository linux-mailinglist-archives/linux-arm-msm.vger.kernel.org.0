Return-Path: <linux-arm-msm+bounces-115072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VKGNOMtsQmqQ6wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:02:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DA39D6DAAEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:02:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OtKc6xDj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PM9tblU4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115072-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115072-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BA9E1301427B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780A4401A3C;
	Mon, 29 Jun 2026 12:58:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E984740312F
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:58:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782737889; cv=none; b=mpGw3y/PM5M8dQYTeJlNAkDa+EeN2LO2cRFjF58nl+TwDHcDz/VHbTe3LYcYs7cpw+y/BpBW3BZvSALZ9aguYfv18jK/gE7A9lHh4IPecBV+AjliD37U+6QVdlpdR+a2cxcpxFcj4eDe83WhcPbv2DcaEClPixbSQMmbeGfRQlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782737889; c=relaxed/simple;
	bh=GN+ENysdiDdzO37pUY+h8l/bPE2nFulQeO00vlfFr1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rGUNNma/ORgphQHO5f9uFOuDIF7BqGACvp6BFIJy5gWtev/vjtFRyWaS15Bof+6cHHcNnTZYqM/xgOiVuklMWSZ7tZ8trwYuBnP0iGRNrC6PCp5iQGZH8ANb66O/SvNMq41D6U/5KbAte5m2poWPoxUMa6LCsdDR6xXqqui0NT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OtKc6xDj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PM9tblU4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TB5OF22728927
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PNfdf4Gwdi1FOTJ0GQC585fh
	e2B9GJS+MtypU4Ccw5U=; b=OtKc6xDjTQLyKv/lHqDPhJza+kazCPzh4U4QUz3W
	eFaaoszQcy0iRI7mt0cy1IUI1c2KJ3HcJ5+fxuK5bEdiygLecRmCAyPPyGLqqxvB
	8m0Ak+0Uz2ZmKoJlvdRZn7lSxb355WLcukmme1J5ORpaBGWhH4rAvri349jATJ48
	JLCcLNcLR0kV7fwXT60rI87zU8rquzKzuCAfrTVS84angfvGP4hg9XuuQS0IYuCD
	5AtarUwRikY6rSmlfi65pZXPvB+Ncf/U7WJMbdvb3l2WiVvesj1O8H96lmC8hb07
	vyxE+jVoY5xrwQoSiG1uxEEiKB0AB1CEI2Z6Dj9jOaeShg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3qha8cqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:58:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92da6f3cc81so403519685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782737886; x=1783342686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PNfdf4Gwdi1FOTJ0GQC585fhe2B9GJS+MtypU4Ccw5U=;
        b=PM9tblU4ZtEpcfkZHuTD/3ZFLFfM72Fnqp6S0ZHBAHIBoGbcM+Gc/A0BMorAr8N4Sh
         THG5x8yvWs+tezjf+XDO1gW69KkHCK/GxnB8/Frm6rUN19J6IUg6fU0D9EwYvhZ4PPIR
         Lp052sXkeICnAo9OOXHTRxhNl3Q0r4jpUs2TFPimqOj5hOFC3zr7+48A8bE8vQFGMvoU
         UQOWHPWk9nrsnrPE+nkOOH+0D9ApLFXeoqb35bbUIAy9TwJm7AyTAU43gV+DllxTqCfY
         TloJtUKUTsEqesi8nuQB+u2rnV9sOzACxY6wbGXH+mFCsj2mQIEOsjIYmWAidZvTRjy2
         zz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782737886; x=1783342686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNfdf4Gwdi1FOTJ0GQC585fhe2B9GJS+MtypU4Ccw5U=;
        b=kax3aiJ6CkiP0zUohb64ciaJ9P/AY1dbX+KIUpDR0XcKimTHtOz8YuHZIXauw1s5G8
         fMrFy95xAVXSeP9hbVUGR8jyAhA5cul0QubeVea+zIqXHfjL8kDMfzhNHpj2nZU7LyRc
         akxKBdenRfbNA+0KsuFiVuIk5gV55ikvK07HzaWcRY8AcZmGTy0iRcDLCo6mgsn3plfW
         DYlty6Vc4TQPg1Zh5gyPxJyV9RhGEHazFfmj1gqbvXIiJM9J/uVqQuRBhOZPPWoDDL4k
         eo1CDmRlR7oWavZ/AGVt4FedsXnhelOMhtVy1bPf2k7PTdImkutf5nAwQjrW66KvD1Gm
         7S4g==
X-Forwarded-Encrypted: i=1; AFNElJ8hOxAfhAmKvPkm1WTR9spNkYYq7jh0O2xGnDPkrh88c6jZ55KdExSxd+R2xZdKjdOM/z+Bt8P4Vo7+HLHE@vger.kernel.org
X-Gm-Message-State: AOJu0YwpmfqPayMPIJuWkodI+qfN8CU6DbAhmCbdDwvIe1E2kT+Vydln
	CbHWcS3398d2EcHCGYxNVTU5ccWiogjBa4RJ16qsO/U0lBOoeGpXfJs4XV36oFrUiiv+MPsIMEa
	dO5X4YBfKmtDe3lFZTSsOnfrZ0wE3ecOqYX1I9Fo5mVZ8RPZIB4IliU9t1nibl+zycJfY
X-Gm-Gg: AfdE7cn/au9ceVdJDe5C7X+Kw/9FJTszC35GbDfBkeg+RFoXuD+PUnMeqKpNuETvLGW
	fNkflEgsDWjr5bGiWYJd1LdOMFR/dc4TBGZK3IJB3xWTh0geU+L8gHVM0lZ4ooZV994NO+eDpAk
	vRPwjYGueniF6qEKYmusEg5szqMUa/WuH7g/7Knf/IG0x4YAHNsHBPvlTph5qHmCFtHUi6WlecB
	6b9zRhMLk+yg4eZ2fmwYfmIDHnHsUH3YaPdLdMahFEYzJrBTxfctTK7GsmZtSZyeEeiIfHoNWgT
	HS7s89YIbuRU9JGdCojJNy1Mk05oZ1KQZMqL/thO/YGIDSfyzT1vJCroWzdyIdCdc0+on6Tq2A5
	VCjUJa3PNkG23+eqM9wHAArUU0RrKV9j1D0Q5W7gxYwWlR8cNzUNUUvw4Xr3c4EZgJiSJ4XpBI2
	CLZEtWT/yHvC69hCyOrng0RbGV
X-Received: by 2002:a05:620a:44c5:b0:915:bf79:3e08 with SMTP id af79cd13be357-9293e3c92cbmr2740043385a.56.1782737885978;
        Mon, 29 Jun 2026 05:58:05 -0700 (PDT)
X-Received: by 2002:a05:620a:44c5:b0:915:bf79:3e08 with SMTP id af79cd13be357-9293e3c92cbmr2740035485a.56.1782737885217;
        Mon, 29 Jun 2026 05:58:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b1a4e2d5fsm1091291fa.37.2026.06.29.05.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:58:04 -0700 (PDT)
Date: Mon, 29 Jun 2026 15:58:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: media: qcom: Add JPEG encoder binding
Message-ID: <gaod5k77yywmimg6bajpdk4keym4hirksgdxxbphw6rw6mkfal@oquq5oyies2c>
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-3-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629121750.3469292-3-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-GUID: fotAPGB2uO1FctcngImgRjw12ZG3cvB6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwNyBTYWx0ZWRfX/hOJSYpOTyQG
 dX8qutIV/6aUkuSdlt1qKhH6OnDtgj1eTROdarz/OVDPo3K8ekoVyV5rao2YFIYFg2Wjv2y21bN
 MU1UGLMlQvfSPmo7t+IFi0fqJn5VDIukzous4qed5+3FLgKs+Cs4yB7+zFbK3NqToofDBVHdIw3
 CPFBY5fh3m2EM9czPNi521diUM9ZZXIgFibCjp8L7GsgEr/eunMa0+YI3Cf7maFZ3q08qBzm0Vm
 sDYcmW0jcHg/sSua13ovL7UqT5ZcpH1pDfyGDruTk0KiZy+at/V3fJRSXgCXV/fYxPHIFY9y73z
 WW+5u6vOydArHBKRG0bHtlgTo7A2SHDdVxH5XJ3rL/4vrVZNYskurJp2qIGOBL5CTDtB/19Ek4Q
 ka7UkQjjSRu7lD+qJyTMyNNMRKsPHnJy/tWZ7nLFuDIZoFn1AmZLfMBxVN2bqBqtYSc3dY8YkOI
 UfeLDl9HiYZl0IvDx+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwNyBTYWx0ZWRfX6JQz/uId5+Oq
 HW3DSdjtHT08dRbOlT84dWGtOAwQ3Naa+hctro+PrIFRZdLMQKxnwFUU026Ah98zNi9FjrhRckn
 s5KLfQ5CPDYrNTDkj0KNxQTuabP7mDs=
X-Authority-Analysis: v=2.4 cv=O9UJeh9W c=1 sm=1 tr=0 ts=6a426bde cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=xu2w3LTtMloSOAqb-NgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: fotAPGB2uO1FctcngImgRjw12ZG3cvB6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115072-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oquq5oyies2c:mid,devicetree.org:url];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA39D6DAAEC

On Mon, Jun 29, 2026 at 03:17:48PM +0300, Atanas Filipov wrote:
> Add device-tree binding for the Qualcomm JPEG encoder hardware block
> present in SM8250 (Kona) SoCs.
> 
> The JPEG encoder is a standalone hardware IP within the camera subsystem
> that performs JPEG compression in memory-to-memory fashion.  It is
> separate from the CAMSS ISP pipeline and has its own register space,
> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,jpeg-encoder.yaml     | 160 ++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> new file mode 100644
> index 000000000000..c8b4808054cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> @@ -0,0 +1,160 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm JPEG Encoder
> +
> +maintainers:
> +  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm8250-jenc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +      - const: hf_axi
> +      - const: sf_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: cnoc_axi
> +      - const: jpeg
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    description:
> +      Two SMMU stream IDs for the JPEG hardware. The first entry is for
> +      the JPEG core engine; the second is for the JPEG DMA/scale path.
> +      The exact stream ID assignment is SoC-specific and not publicly
> +      documented by Qualcomm.
> +    minItems: 2
> +    maxItems: 2
> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: hf-mnoc
> +      - const: sf-mnoc
> +      - const: icp-mnoc
> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - power-domains
> +  - iommus
> +  - interconnects
> +  - interconnect-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
> +    #include <dt-bindings/interconnect/qcom,sm8250.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss@ac6a000 {
> +            compatible = "qcom,sm8250-camss";
> +            reg = <0 0x0ac6a000 0 0x2000>;
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;

Drop both SoC and camss nodes. Rework your _example_ to work with the
default seeting (address/size-cells = 1).

> +
> +            jpeg-encoder@ac53000 {
> +                compatible = "qcom,sm8250-jenc";
> +                reg = <0 0xac53000 0 0x1000>;
> +
> +                interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +                power-domains = <&camcc TITAN_TOP_GDSC>;
> +
> +                clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                         <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                         <&camcc CAM_CC_CORE_AHB_CLK>,
> +                         <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                         <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                         <&camcc CAM_CC_JPEG_CLK>;
> +                clock-names = "hf_axi",
> +                              "sf_axi",
> +                              "core_ahb",
> +                              "cpas_ahb",
> +                              "cnoc_axi",
> +                              "jpeg";
> +
> +                iommus = <&apps_smmu 0x2040 0x400>,
> +                         <&apps_smmu 0x2440 0x400>;
> +
> +                interconnects =
> +                    <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
> +                    <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
> +                    <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
> +                    <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
> +                interconnect-names = "cpu-cfg",
> +                                     "hf-mnoc",
> +                                     "sf-mnoc",
> +                                     "icp-mnoc";
> +
> +                operating-points-v2 = <&jpeg_opp_table>;
> +
> +                jpeg_opp_table: opp-table {
> +                    compatible = "operating-points-v2";
> +
> +                    opp-300000000 {
> +                        opp-hz = /bits/ 64 <300000000>;
> +                        opp-level = <0>;

No numbers for levels, thank you.

> +                        required-opps = <&rpmhpd_opp_svs>;
> +                    };
> +
> +                    opp-400000000 {
> +                        opp-hz = /bits/ 64 <400000000>;
> +                        opp-level = <1>;
> +                        required-opps = <&rpmhpd_opp_svs>;
> +                    };
> +
> +                    opp-480000000 {
> +                        opp-hz = /bits/ 64 <480000000>;
> +                        opp-level = <2>;
> +                        required-opps = <&rpmhpd_opp_svs_l1>;
> +                    };
> +
> +                    opp-600000000 {
> +                        opp-hz = /bits/ 64 <600000000>;
> +                        opp-level = <3>;
> +                        required-opps = <&rpmhpd_opp_nom>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

