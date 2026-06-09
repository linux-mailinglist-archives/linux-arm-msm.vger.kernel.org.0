Return-Path: <linux-arm-msm+bounces-112136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LP83EanvJ2p05wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:49:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7C965F1DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:49:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eKbtvGn6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F2jdDNEF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112136-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112136-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C9D43018D65
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 10:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BF63F9277;
	Tue,  9 Jun 2026 10:48:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121D53F8EB2
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 10:48:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002084; cv=none; b=Nbz3jmLHo+Py3ZYuUZzB3kv+dznh7Zw9LA/s2z5fxh0Iote1WIADtKytrrLvTLQ+MKGC49+g/teq1SS7tMWIPriGOyyeaF7zdxop2X+nnKigA31UkfvJ3NTqkXoGLumyo0kUCRSI703oOakIqt8J5cX8gwVpf5Bgb7ad18Bnr2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002084; c=relaxed/simple;
	bh=/fmIzCVQFlRc9hqGthcJ8jz++uNYfhPm1KVVgsySGU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pOjxHzOInIu/wDKbTN++l9R0SgJJT9LbyXfWy0EZCFRfuUxyVWmXdRylHtaZvhNJBtFCtZfNABtlZpGkpWFkZsGtn5J8i8OK/NZMAzNE8So06BBl+/NtFV5Mzs9jB5fli78qVCHbq0c9el39Xona9DzuF01osIB/LWoiGO8Hoe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKbtvGn6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2jdDNEF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vHdx1869322
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 10:48:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UuGTO67RmC+ivHQmIuRBVduc
	tswyL1nN6TdGwGzdo4M=; b=eKbtvGn6qNyrvxqiCmTZMXlJ+rFa7CuUFK0NL4os
	78YNrHKvvop++uK7mOW3XHHZpMa/QMvAgHccTGcbXACwFieFvq9bVgxEYcoVe9tb
	V9TCroc3Z30CN+o255C5/iGmPvFK96F7GbMydqxRTqwISA2+XMCPHM2GZ+8auQjc
	KqM8ngDELKAm453BtdgGmpQFfb38EMJkuXf+QfkQ2Ae9FefmkwghFwIJzmUesyM2
	yiTWI7GVfFE2QUHwCLvlcw/PcWT1/b618aeSlmTwPH/PlvsZ2n1CYILKLKyQJy0a
	69hHna6jnxsMDJ+iFbs8hOpxSq++Pdqid1EfOxjyqFoNQg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqggr2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 10:48:02 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5a10923f7d7so8993138e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 03:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781002081; x=1781606881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UuGTO67RmC+ivHQmIuRBVductswyL1nN6TdGwGzdo4M=;
        b=F2jdDNEFOwz+c0lelpAlFXXoaL/yMReJ+gnKYw0IgO9sIH0MJY3kY4yQi1/qsLvfQK
         bkJljo4xKAJP4eBjU/5FQyxyvPtQ9DS/lWZsZdCvUcWVff3Wo3hTt4/uw+rTmsTEgsLE
         8+uI768vXUDj0IID64IeMq/vCp6BSWVisAiG51N347oN0iEzIXgtg+B7BqgDKi1WD3D9
         P1CgOxHyXQVrMAYaSJyDnfpHVP4xzHjMQU/On065vHj4kmgL2mEcsBnGH3lCm9sApSs4
         UJWs5ezkCo1Mj/i/uuexA/8tC25PEqF6T9U76iYP9oaGq0aCt3NmkoH+n4OIVLH0gcku
         397Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002081; x=1781606881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UuGTO67RmC+ivHQmIuRBVductswyL1nN6TdGwGzdo4M=;
        b=C2mMsNYx7U4+O9qqEPoz5XtOdaR9AFWVDF+2BNUHY63YFdebEuaAlZXHk5LqME5UkT
         Vb2xlLiGZbZtsVWQ635oOSiZCXDWklAhcnEv7X7ZeGjI11E8H5rt8NCPQO4LXxNb+rXX
         nTgVnL3OJIUd1Nkh1r7GmiKvT1ECcr1Wx2laa5IIlXESSKQTKr3YYv7qKDhlYeVSiIYc
         64TCxT4mmvjyYE1AuEfsuwCQhjoRL6XZjN1bfGyBoDxHPrhg+kd8DeC4o2/p4EYHgqUD
         Hbuez643C9RGDcJee+ZuiQRFuH+5xNsACBQm/pCd9EFUWZ55NEc9sWomOSCsCFFTetoH
         m/Nw==
X-Forwarded-Encrypted: i=1; AFNElJ94DT4RH6ACbR2UCsKR558U3SM9npuYjEPAvrUur63aIOegzGPgYIhhIa3WlFqTwYhSY5oabU6ThtEt51lR@vger.kernel.org
X-Gm-Message-State: AOJu0YypPBEhfXmft8QBFzj39B3mL4wbySt2LCv1lCbddMNf0wSHop0G
	Wp2HSMWAa9MM2yhkW6GfJvBbFUQIppyrXG2fnAU6lumVMduAoS8IoNTg9k0BKejwbS0FeyzgsX3
	JpXMLn/Xaj6nMkLAs5pCZY3fwBWmjaYu6T3EaJrFZ2EWtIvRy6FfMmT8ie5i8iyV2jQIU
X-Gm-Gg: Acq92OF84hMLQHW+aWKZ/ANDuB77OaL1957C7Xve8BmtcD+h/UhOl6AHxGDNyafBlNq
	PshfUOh0ZL/dD3mKlEc97jz8QLFYuthw1e2ZrN1KFbN91uYkIQmPvrC1eV5SShU5q7IjT/7zyyi
	ei/DRrBn9pk2dGPzgh15dIn4coIFie+n5Nlye6gOzaGimAuPNFMobCxS2LQ+L6NnqKiQNR3KBkA
	19LYYpuCMhynI3yb7fBZodvY+eT2qbXfiNxE/xw8SMEctrB6+YB+qUvi7iHCcMs3oHG7fFaTRwA
	uE8Lqs2AwENdwoUZyLkToDwvWS0zEieKL7J/gkfFpxGxmaZPRDyDVdyhXzrFV7aCfEywJ7/q07v
	0HDk+oihT/Tz4ifEtmhmBku4vuRLnRrBDY6tnOeDzAZdCP5ZCk/K99Gu3uFVxqhBWIqf65Y/a6+
	2p2r8hkllcseERcFvkVJ/GjA+yd3O5yrCK14lbEqvBQaLENA==
X-Received: by 2002:a67:eb47:0:b0:6cc:8a90:9f88 with SMTP id ada2fe7eead31-70037cb32b6mr5316821137.16.1781002081434;
        Tue, 09 Jun 2026 03:48:01 -0700 (PDT)
X-Received: by 2002:a67:eb47:0:b0:6cc:8a90:9f88 with SMTP id ada2fe7eead31-70037cb32b6mr5316797137.16.1781002080993;
        Tue, 09 Jun 2026 03:48:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99c11csm4466142e87.78.2026.06.09.03.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:47:59 -0700 (PDT)
Date: Tue, 9 Jun 2026 13:47:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
Message-ID: <ujf53zya6hes3hkddhsmgu4wyabodnyg3zdwarxmcsoy6p5h3c@ild34ppiyvre>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEwMSBTYWx0ZWRfX2vLtc1RAPdrt
 OLJrg6t/Ce/WWEQwAHJJJSC8cfbDjJDwMRJG4pWKQ30oExKUxUJuoXnzxhxVTS/pXxGdIC3+ZcX
 SvMH9eJAQoO34Ofd7Rw4YtFHK2Gi1ylzHA5FClB3stjU/COdFCXWm7Z3airbUd6QEyEdQkmdnKq
 xsPWjFBn1ZLpJWS7jmkBrBDY2LB6wrWhh7yXYTys0kF0J4Q7LTwp/zhVXuO2xAF9HRTKbCsXAre
 2Z0COWoTOoT8/lmZkAhT6wb52btVBbuXcZk/6C4bGNHuJx7kcrmaKqXHXtU/uIgSPUECUwxBEah
 HAw4R5Y4ogyQWQA7BS/okvpKecNsVsU7r7HdrWuJJsxIIaMDq2iP78CAc5z8T5OU6k3nWgfrsQL
 4ndIxs4lYAsun6Wtdy3jT2aZhJv4n9FQKAxzlMGGv+apEDgkIkT9knVfo9yHyh89NXB7EKyECQ/
 9u/vPoAJXCCxvJIhw6g==
X-Proofpoint-ORIG-GUID: 5SCFkbown0NDlV2oPlDEnaF45ok-o30x
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a27ef62 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=3uhaW4yOT-U-B5mjbOMA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: 5SCFkbown0NDlV2oPlDEnaF45ok-o30x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112136-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,ild34ppiyvre:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D7C965F1DE

On Tue, Jun 09, 2026 at 03:52:56PM +0530, Gaurav Kohli wrote:
> Document Qualcomm PAS remoteproc thermal mitigation properties used for
> QMI-based throttling.
> 
> Add:
> - #cooling-cells (2 or 3)
> - tmd-names (thermal mitigation device names)

Describe _why_ you are performing these changes. For example. why do we
need to handle two different cases for the #cooling-cells?

> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,pas-common.yaml    | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> index 4607b459131b..0d07a0750762 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> @@ -79,6 +79,20 @@ properties:
>        channels and devices related to the ADSP.
>      unevaluatedProperties: false
>  
> +  '#cooling-cells':
> +    description:
> +      Number of cooling cells; 2 for min/max cooling state and 3 when
> +      selecting a thermal mitigation device index.
> +    enum: [2, 3]
> +
> +  tmd-names:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    description:
> +      Names of the thermal mitigation devices available in remote processor
> +      subsystem.
> +    minItems: 1
> +    maxItems: 5

Missing example with these properties.

> +
>    glink-edge:
>      $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>      description:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

