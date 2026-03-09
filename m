Return-Path: <linux-arm-msm+bounces-96365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NvAMlowr2mWPQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:40:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B963240F9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26C403063D7B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 20:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817EA36BCC2;
	Mon,  9 Mar 2026 20:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bmy5lUHw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TAyXr4h0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517B6368972
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 20:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773088678; cv=none; b=p+PGvL/aH22go9zv8cUTJpxSUpSYP71mmWYwUxHGdsjK/r+LNVvCeBiO6IwcvSzXZ7j9ziAXACHcY7KlaUV4mpVuzpB2UjA6bQRukuGrAwiBNnH4Ec/+zAZ53Gktb2qCA1L4vA4WpSFOW3D2mggQLQYOHNCoY/gUpKWwYfkHAhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773088678; c=relaxed/simple;
	bh=n1fNQr3ghPfS1Zys7EYSxWajk/+i8tpaEOBMT99VD6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUIBfOqlOMD5VKWgR17xjBS0Vi44Imaso379K5BS35yGi6AAcSeyHrNBh4A/x6S8nimvl31/k2A1r/xcOETGkvAiU5E3CIlywpCzOD8gzYMuXwXdJg2HFGs2ME26Qlc0w6XypYlWAPlBQU+9lGhPJyjP9vUeQzPTdH2SHzu0R5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bmy5lUHw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TAyXr4h0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC1XQ744396
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 20:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KNIeH0ocueE3DKIQJNEpTC6Z
	EDvoFsfa8wBzo2fLi9A=; b=Bmy5lUHw4vtL4x5lsGJPddOnycMYUKOweKDcZkk7
	3SEbOBgDBDpd8lDA1Nh0YKs0+6HqOh7mr4pSYz/0obknjn0X+HhfQ2EjbXUC+OjK
	Iiut+9cKMX09xtguOJQsi2FuCIdWZbTrAm7lAWljKOxQpRm6ZcC0xKOoFeECJrS5
	ocjoxX6heugEcUYTREiU0nJ6EES8mBbSkVQgp4zDqkHgDLI4Gud3QzijkHXoajpQ
	jMuU0LSCVXtlLwRYJGizTu7R20eBcWS3RRMSg4Cn2ro1Qzhe9saL5XBX7r1ebgiE
	LfDKcOh4BjSYl1rgcugWJlEzeQVH6rZrWEtTCKpt9aFiMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsaadgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:37:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4d191ef1so1669483385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 13:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773088675; x=1773693475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KNIeH0ocueE3DKIQJNEpTC6ZEDvoFsfa8wBzo2fLi9A=;
        b=TAyXr4h0ake4YfEL+tI49WWB0S27B8S+FUZtOiaHaRiuJ2tG863AYSwvrk4r7FN264
         Fkl6frqWJ1mcyW1AlxGUzzNo5JP1EqoB8hYB/NymGkKtyoFKyPnsPnwSPqg5P8e1t+La
         XCmKHY5BCmX39bPi/oFaX5mS1OoaO4D1w7ZLKcLSHixxMZkwHoXwqYpR9gFSb3Kmuud9
         HPhRDSMJsMZCQdYVQJ+65FUTXKRc1KVn0Uqoevs40LsuWEu+cz/ZJeD5oh1dh+5HC9R7
         3o9mkYAVz11tV9lMHQRX+xomcMKuJKpffS16NR4to8QLslRF4YZw1zhPegPVLhqm4Z4x
         BcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773088675; x=1773693475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNIeH0ocueE3DKIQJNEpTC6ZEDvoFsfa8wBzo2fLi9A=;
        b=UGToYvQqVP9Gtr2AbUjy7PqOem59w8sjJAOP+MQZ5a3AmnlWNIgj4M3UgpaMLQE4XQ
         id6S3fn7zgXc29SpjX2yyFda4fDQ+7NHI9p/wVl9pcZ3UfeWDdd+oJfK03SQJoDkydRd
         bmP0NPLqE0vtL/QshrkPQ8nxBf3Z1Fidvm7zC4wfuEOfRWl2YNYxsJXwd1SPMjhB76cD
         2Adv5Dx6+ZTeGEVLvE/CRjh+tZWtlqfhtow3nXPT2tMl5ARRpiWRKnjgZztIfhMLVwOA
         Pd9GEgQwb02rtSF6cyBqr0GtPgezLo2WlgZSl/RRJg3eDvIC3lzNIEEeatVxJfCAXCf3
         nuTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjSh61Q7oGRsZtzjXzfUCMqIWqYKo/CWcGBIeddxeJd0tJQRv/+QjHz8zR8A7vjW3pEmNs1i+Qx3ZFLow7@vger.kernel.org
X-Gm-Message-State: AOJu0YzAC01V8dHpvAoEgMCFjh8qClHG2Z/gVu1Ajsuolu5B+PaMVMYz
	5u5nBYindEHJPIZFoJ1LzhlviYFS+XHUe+Bg8VZlJaug4c2kRuVXCLM4zoXg0zerY4zHxZ06+6W
	yfb3rhHabR/DSY6DB/j0QOULyuZaaZUn7Yqbg+Ublv69y8kL/ymZJ6Q8keS8w9XYxovvf
X-Gm-Gg: ATEYQzwhh5DFSxq048uBwn8vMgiaIKitZ2USl55uE6kcukiZtjIPTHzSjLVrRmhJ+Pt
	URouMfHMwg1pn1b/bWBGoGIvkQIwl2OBYUQFPXGiSrFZx/aAzLxfBarnvQdf5Okkn2w/wzV8OJg
	RsjdErM5lAfoNxbtFnIidL1BGXtgI2bI6Wr9X7TNcv61CKk86ZlabRoWobDZZBHIngjJlWVOsJ1
	CxI/0DsG1frdetzcHcCIwe4FiRr5csH34kYbbtZqjIILbZVCmX311b6TO+M+jA6G9JTfTneMVz5
	kL/whyHkbMdDWXXLac28FS77nlmSdvieWOUxS4LgDIQwcieS+a+l6Lcp+P5sgsu7Ix61ovFWSHs
	0prZ7LlAUtwiyL88e89+FZdwHH/lGsNW587tzD0ZEbMNcBgwFrKLkPOYb6IDv2evNirowjQXISm
	B8ISqiwrx9VmRYaqwgk0VbA0cB0+zps7rQsjk=
X-Received: by 2002:a05:620a:25c7:b0:8c7:177f:cc17 with SMTP id af79cd13be357-8cd6d428484mr1567371385a.46.1773088675418;
        Mon, 09 Mar 2026 13:37:55 -0700 (PDT)
X-Received: by 2002:a05:620a:25c7:b0:8c7:177f:cc17 with SMTP id af79cd13be357-8cd6d428484mr1567368885a.46.1773088674930;
        Mon, 09 Mar 2026 13:37:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08d8a7sm2225853e87.92.2026.03.09.13.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:37:53 -0700 (PDT)
Date: Mon, 9 Mar 2026 22:37:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add model string
Message-ID: <rdglzhmncexfcvec5hyenj7jx3m5hsphjlxsaeq2zhi4z4arml@bjeqghbbaoa2>
References: <20260309121936.1289615-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309121936.1289615-1-umang.chheda@oss.qualcomm.com>
X-Proofpoint-GUID: ijAiqjX8IDxpP5BtBzbo1dCfhoVUKliM
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69af2fa4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=z0PlPj1O7gEpuhW_vqoA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MiBTYWx0ZWRfX9Fe2XIS7wayu
 7FHdWugEcaPytGiZPh7H9IJm6c/MTpR1DCcdpPantgVKQu9LCJWlB9i4T6p60dMDFwuUd0HsU+u
 Za+pRBa3UB7HxRQSOwLVAIv/0tDqu6eZFUywe20U9XEPW1Qveixhu4lMxo9T8SYuCp1M/0ZYQF/
 B/8eQywDIJEiczTAO+/D106geKgTQz/z8LjapZ+LMtrlkvxfIC7lA0bRsGWEpX20fNfY3u2PO8F
 xoXUMaNWacfR+4T1FPul4S4vTTd04lSpSI8Jz/7uRss3bH4FsEmaMsPtcl0sA3Uitp8CaC1Tdl7
 JwyPbi01YSeuXZJYx3p0xvcje7YkV3dIGQUEuSEqjXU/9OWszjy9ZrGLUUFVWIOPkJRuy7Xt9mT
 9h3nGTkfxowmhEoCiV45prNGkvuCEYZ69dTX0LOqh84YJVPqmtyXzoGz2yXzlcZqmCcyPycVuaS
 fV/UsxZ6vCWkl23BdLA==
X-Proofpoint-ORIG-GUID: ijAiqjX8IDxpP5BtBzbo1dCfhoVUKliM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090182
X-Rspamd-Queue-Id: 6B963240F9F
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96365-lists,linux-arm-msm=lfdr.de];
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

On Mon, Mar 09, 2026 at 05:49:35PM +0530, Umang Chheda wrote:
> The RB3 Gen2 Industrial mezzanine DT file lacks a "model" property,
> resulting in the hardware always being reported as the "Robotics RB3gen2".
> This prevents applications and user-space tooling from distinguishing
> the Industrial mezzanine Kit from other RB3Gen2 variants.
> 
> To ensure consistent identification across all RB3 Gen2 mezzanines,
> add the appropriate model string.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso   | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> index 619a42b5ef48..7d6e425dae89 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> @@ -8,6 +8,10 @@
>  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> 
> +&{/} {
> +	model = "Qualcomm Technologies, Inc. QCS6490 RB3gen2 Industrial Mezzanine";

So, what happens if I combine Industrial and Vision mezzanines?

> +};
> +
>  &spi11 {
>  	#address-cells = <1>;
>  	#size-cells = <0>;
> --
> 2.34.1
> 

-- 
With best wishes
Dmitry

