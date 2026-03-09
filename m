Return-Path: <linux-arm-msm+bounces-96366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ODiBr0wr2mWPQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:42:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70553241035
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85DA430C817B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 20:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5F236894E;
	Mon,  9 Mar 2026 20:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j1idi+4n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i00xx3Bl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F275B258EFF
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 20:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773088841; cv=none; b=Rk0wD4DXznh2N1huOEU6RATmwjdv2Lvvw/7kwVezhtDXyipj521PCB/UGeRkJf7pqH9YLzqA3g6TMohdO530IhWMh34odv9Hg3roP5146gJNbsfssxlUsZf54knRaC1mgASk7metBhvs8ZBnTvvDdJcmHojj6cjaaP6BY780TJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773088841; c=relaxed/simple;
	bh=IRUCbQKurQxQMsdMp8bk9CAHzugQacFOrz/gIvvDqrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNH0aGCsKSmD9e3Jr75rdddgsSiKJAzWyVO0qjXqJuWK62e85EFdwArbnFt/PTT8qih4cJh2aNQuPukREZFsFgvlHkSdEACDZjc65TSkCTrg9rCpMUBxIhSqnXOs1jdSeYV1esMuQdbNYtcbDmAjvhbqhI2zi5fAD1ohBJU1VPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j1idi+4n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i00xx3Bl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBoFv1203524
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 20:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tChwvDfZFPoUV2H4DmtB0BO8
	Jip9afM++8HSgrXKpF0=; b=j1idi+4n9cOGFfuG4H5Y2bAckIsxdRw1z/pYV+b+
	HJtjsxD+iMqX0I3lXczDthzC1sWmc2OcmNwR1nlROZSR9VWnbAHbLo2liZfaqhKG
	3nAVTi1IrGP7XZfaNsxd8ra40PkL6e8Fmf/FJSJ9dXIYbNyx4JLJqzGIG/e84Lx8
	N4pTWY4gxVNhVklbYPDOWh+u0R4+kRHLRGJFY6GZUGgT9tXzxS/1J9nRxySGMdDM
	4Y02fCbeVLKzb8+zLhEFKblN1QqDhW9570zBXJaHs7nTYomyxdNJsq903Yl+FyYv
	GLrkYYZknJuwZxNV/XB1kea85seT4zlsNM3OQtEwXNTuKg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct0329a03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:40:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7f6ac239so1160110285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 13:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773088838; x=1773693638; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tChwvDfZFPoUV2H4DmtB0BO8Jip9afM++8HSgrXKpF0=;
        b=i00xx3BlZPzPiQaP9Shvc+gSx7V0bgDLV1WeLgvg5wG7G0skmrLumuikRhFx6UV+0e
         +5jyrx4jZiooFRGAgJw9zRcLZXEJk1m/Wl7N8TtktywUtAAs/l+lLwEFv/gyYAHEkkmY
         z+9q0kBwSl/MDtB5zBZmQ5XK6Z/Nf7d6atDrIMK97i07Fa793zAUhgQeTefrMWjVLeL0
         dXeqx8rVMH5A3cZ6pMCRDhf8ZJcMs+39fHRuZq7fHND3LhBGkySlxd4PpaaZ8gj4l/vj
         cOMB5O1zKIRu6T+ipFYQT+pEtyLC385qz9kI1KkhCDtuyd/GijzEwz0xjw9BXGs7ajp0
         v8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773088838; x=1773693638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tChwvDfZFPoUV2H4DmtB0BO8Jip9afM++8HSgrXKpF0=;
        b=iB/yC0lxpruB5tg7SBJm0v7dgofmnCGPqFrEytou0q7roI5NoyKLdffj/YmWOzU3Rz
         ppAmKNSRAWxEvIJizQ60IyRQ8aXh1wpwBJZ9JT5zxhf4M40DrPj/tLstHD7I5ov+yeGW
         rXzZczNeNKNCmO4zVJowYYpt955mLhH5EiQp8T9cSQGCN8GMfNw5MR2FJtWFHO/Oo++m
         X8GWkXoDuiMN2LbG0Dg8piPwo5rMZsivVA9boNgF613k6vhsqrU+XdEPxZW6xj8pQjAS
         lJ3h6vfAm7XONxaf5LbqAAqBIzqEEaTG0ou/tVMVx5I1Fyf3EM0MWt+8ExDxg8piKqHA
         k65Q==
X-Forwarded-Encrypted: i=1; AJvYcCWN2xGdgS/HveG3l43auH68HTZq9GfI/UZUR+jBAq1luvpmZ5LQZzL2c+1MY4wreA5u7yaQ/ltSAXmb4Kps@vger.kernel.org
X-Gm-Message-State: AOJu0YyuTLEuNhIuioUxh9wHWuNBBGL0ynfMIaQJz0atD4sXm/Nu62sj
	758FUncFS4wCBAI/9WTEvGWwKO54hDTCHbogGYRpTUfRtjPyisXJ6JvmXLW7vib6L5EL/V6XsD1
	M3olfj0UgyJg5829nnqM4RU3e5yzMN0BeaUylk4KqRAHJI3/r4wZGiss0lIdqPRYXV482
X-Gm-Gg: ATEYQzzMQD5j4Aq0rf7MmkTRks14OEJJQ8D05n0raFz/cb0O91YyF8hGvYoLZDNHI9B
	S8fX+sDYY5j5GgLfGxOWfhIpSC/FB+3J+V9DS33L0Ud5j1+3pwBwmmu550OeXRznWmkV0crB280
	SBXA0nzempQy5LMrJf/8b/5CZ86rQ4OhaiYP1qeMwMTQAjz5TlJXu9OkFCLwhsfx9jBczetytAl
	zfAGWqPVmNPtM3rrcEdZPhMdTnnSmWkZt1yC9abQPmwyh+4rcNAYCI2FKUocR42S0n99FHWTFwJ
	sAL1pkEipbLYvHhi/VOdrGECoa8HuwcfjQ1zEGjLoisI9YtqBBWLjRSDbgiieFKlC9OP9cnN/ev
	9rGlXK8goarV4KdL+vbAnMHdeChYacSzuqZ21qp8ptMK/pumz8eSAfFwA7bmfjE6QZ8gNvvRWs3
	GJXPBtb7/llZsPCdbwliKKzQ6hnAvje0mZp6s=
X-Received: by 2002:a05:620a:468a:b0:8ca:2baa:76e with SMTP id af79cd13be357-8cd6d35b59amr1678105085a.19.1773088838377;
        Mon, 09 Mar 2026 13:40:38 -0700 (PDT)
X-Received: by 2002:a05:620a:468a:b0:8ca:2baa:76e with SMTP id af79cd13be357-8cd6d35b59amr1678101385a.19.1773088837893;
        Mon, 09 Mar 2026 13:40:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5d086d5dsm1148701fa.44.2026.03.09.13.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:40:35 -0700 (PDT)
Date: Mon, 9 Mar 2026 22:40:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine:
 Add model string
Message-ID: <lkk7khxzboxnekznm2pfrnr5muns263ibcyjz7ch4xxsshbet5@dtolw5qkwtbx>
References: <20260309121936.1289615-1-umang.chheda@oss.qualcomm.com>
 <20260309121936.1289615-2-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309121936.1289615-2-umang.chheda@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MiBTYWx0ZWRfX0mB87wnu3khs
 MDD09blkWkKnvrRifeU9BRD3U/olQp+0HTNhlQKY+/HKYylxnjysBUJSHSWrW4ZYGWtdlCEtBQU
 An+ifhwFKvush+i4tYN+hAgssQEVQK/lVHYHDCqBKINTx5f8jKEwyUANnOQ7RRVAEec8kDcuUux
 vx6y6xPTc447Ew2MXtOUCmJSrl4mpCdcK9DTaSK+S/9GBDs4B/bBqEFrXfC6T03QH9vNcpIDbPH
 qR5yJa0caavtRyqhdqwtwraSK6j3LWGRq1pHqcJPdsyxy5qTPoFehYAmyTtqUfUCXk9ttRbQXQc
 zReyS98h/Zly7jTUaA9oWRzhW0FrCgsEzgPGRPIpetZaMuZ6MR3dhnSUNKyhMQ54IIbYyvAFWzn
 eATadwdoh/96R0bnMQiPvUpHH2CoMbWlR/6+QsIXV//WWrq0Lc1ZyskHT0QIL9RcdFQ13Pgad7r
 ZGIDfQnIeB+JAaqCl8Q==
X-Proofpoint-ORIG-GUID: -c3pM2uMp7I8CW6K5nvTcR3b9H25Do7l
X-Proofpoint-GUID: -c3pM2uMp7I8CW6K5nvTcR3b9H25Do7l
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69af3047 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=DqEcicw_vBeIipdN3lUA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090182
X-Rspamd-Queue-Id: 70553241035
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96366-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 05:49:36PM +0530, Umang Chheda wrote:
> The RB3 Gen2 Vision mezzanine DT file lacks a "model" property,
> resulting in the hardware always being reported as "Robotics RB3gen2".
> This prevents applications and user-space tooling from distinguishing
> the Vision mezzanine Kit from other RB3Gen2 variants.
> 
> To ensure consistent identification across all RB3 Gen2 mezzanines,
> add the appropriate model string.

The model is not supposed to be used for identification. If anything, it
should be compatibles, identifying the device. However, there is again a
quesiton of having a device with both mezzanines at the same time.

> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>  .../arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> index b9e4a5214f70..879d5d853bea 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> @@ -13,6 +13,10 @@
>  #include <dt-bindings/clock/qcom,camcc-sc7280.h>
>  #include <dt-bindings/gpio/gpio.h>
> 
> +&{/} {
> +	model = "Qualcomm Technologies, Inc. QCS6490 RB3gen2 Vision Mezzanine";
> +};
> +
>  &camss {
>  	vdda-phy-supply = <&vreg_l10c_0p88>;
>  	vdda-pll-supply = <&vreg_l6b_1p2>;
> --
> 2.34.1
> 

-- 
With best wishes
Dmitry

