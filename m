Return-Path: <linux-arm-msm+bounces-109507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCU9KKkpE2pE8gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 18:39:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ECE5C32BD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 18:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A57C13007CBD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 16:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BB4397E9A;
	Sun, 24 May 2026 16:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIrnan5g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jydSDTqu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A738511CA9
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 16:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779640709; cv=none; b=c4SQOxNR13l6mxSRpwn2TUsSLmrfdXK9PmCQUTDfvd8BdGEn5a5dbE0UU9ajPH+GbjPlxSDfSfyRczc+X0EsyN31sNMjKd1oalLlVZA4c9DOKdED4VjFQC09nzn5UQUw+8SgJgi+f4odR6OqZjfhq6Jeu/7UzbJpisSeX+SWdqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779640709; c=relaxed/simple;
	bh=nZ8uD2E3cWwF3V8jToxtNK3Knu4/IB447jIT76/zTbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGSDgt9aN1cNvdeEEXzK8o3a4a9qb7Mx9BjQCqu4TE9V6+XmDwuI7K81+ch/rf5oqAPrIo+tkV52HlUij6EVV78pJd6HaAalVjPvRubDWpdAwTJlthrsTBZjHJRVEn5vP7PwzhgVww7ZlIQhEM3IbMdYyW0214AphC8ikeKUbf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIrnan5g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jydSDTqu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OAv9PP373231
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 16:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VXsbIGfE/YGMhTf/DNGAiwi0
	TECdbjhbag3+7cTDv9k=; b=SIrnan5gB1jAJWsSJPjwGzlEU0sRG+SUfFPAS+dM
	PO4mUtGh7aP2yIIRTd/2B983/QN26DJ4MFUOzvmlHzPKXfr7TWI3r04JceRo7MuK
	asr+XPAbJwqsR9JoXb1sNnqoH7v/O6boHetmm+IB8tE0H5bYqFXCLIqp1GyS9Yk+
	ZdN1MBLNDIhfMxLqWNEgpiHk/L5ZL93RRpqrxFTdfNnlnj4bgjoWh2bJ0WlP/45f
	VXPARvsqhPyRPf3bB4FtRVKtXw0+9veBnNddzIpLGu0f0vKN3XR2lQF+VAkvCd0i
	3DN9IQoMugg9yW7WmUKj53uzvsfoz9uk6TOri7PIF/tP6A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4asukk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 16:38:26 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-63cbb164b37so17950257137.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 09:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779640706; x=1780245506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VXsbIGfE/YGMhTf/DNGAiwi0TECdbjhbag3+7cTDv9k=;
        b=jydSDTquhS7dpPhv/Jlh3Mx/zr8ZF3reyhYoIN/qorwnYcsLbzSuT54i/JVwzZu37U
         kkN4Cp3bDb6RHw+gqudcyS1Jms3yt20u5uLVSh9OyvlGPWYdUHj7GNiNtNrngIWfrMX3
         ApbC/gLrjFUGxycRPbsOQId0sZoqf8IuygOTPx0qA4k0F27hfJJy7uTW/HkdAvLqvih3
         F1MQ6qUne58y3ZdvUHNjPfzlvz1kKhPNlldO2XzUbInojVASQdOqu1N6yKBVPcRkDvNY
         qv11+HSVprof1zeFWtJJwpU2idCOd4AiFKO1Ekbf7XF51ZYEGr8oHpyHD06I1h2V4rsh
         ir5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779640706; x=1780245506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXsbIGfE/YGMhTf/DNGAiwi0TECdbjhbag3+7cTDv9k=;
        b=Xyvwrhh4w8S6CeNzeRNQaQ0sR78hQJYMW7NRjmOIQ1YRU9kcyfnMc59GuJOh0CJacN
         ibuClJukutwKlr3zaCaXKyqP304+Yy/tcnW/OaYbZj0B5jxqQ9VVmTILYuJJpsV4j+hU
         2mLDU+hnp01v0m6NJwHkg2c30cU0SlkKEdSUloOQ0hDqiydysoD3xjMxdlSpKILYZWdC
         OBMDF88QuXLOnTnHUzV9Q3AAD13lxav0s64ZRGYGTcbaUZqvDFqdeKoy8j78eb7pT43n
         SgsN+4Ckl1q/xQU1S5+G5/WTMv9hHw49pQ/XPQLWwIjSa4o6ZiHZuWZthZjulfkat5RL
         PWPA==
X-Gm-Message-State: AOJu0YyTFJ4fE/QX3RqkUEjDKn69ROy3VqCS/Ls1eng+8AVfy7mANJem
	DLMx1qQwZ8QRqV2Hzo3J2SF6ol48Qk83/BQ9lyAsjXpVAVrxaFtvAw/7ZU8qexASgYcTybSZJhF
	5zZsjHrQQ+ftRfY6vDm1whRVATkc+IBXATNFIknHCXW2YAYSqhpR4OzS3+fwSJRxosi//
X-Gm-Gg: Acq92OFoh+njXvUQUFJSPc3zqWz8pgsXhO5c9exCEoMgwtAdqFNHEAVK5tg7GFHvIe+
	yd0ztg3+B5n8HbbO+EMQ4pgGVhWwJXpQyTotmWMDHrYeY3wLDg5gJkrrc3tixv4eHrOoGVNIxiK
	nQsxEZJwwN2mgjXp/dAuNHdJr+JaYEn+q0o5/ojh07O1/fdSwciZNFH/BDj0hMLLe9vAkGUBE9g
	q8w9EjQ6DJ5gkELb7iTFalJLOeGhALLSbAu8lQvnaJbLOwUv4e4jnAv6cyoYXMHTOXFApn6lL4d
	uAMub5RHBPo+pWqAKyy9Pl6fUX+IbyG0HqQcTABMRx7llVUeR7602WocnqnuaRDLVVvKjb1vRmy
	907bKxHYkloLNFCFWdlpcWI2S2VVu577xIfadYJWtHtdtxB5PYMpu4CAwNpd+g6O80WpgkZj5DC
	F0aWADQ55Ly2NsdEiLi2Ocap8CwkpqrIL9Ha8=
X-Received: by 2002:a05:6102:8641:10b0:631:9366:da89 with SMTP id ada2fe7eead31-673c31671d9mr4237845137.8.1779640705982;
        Sun, 24 May 2026 09:38:25 -0700 (PDT)
X-Received: by 2002:a05:6102:8641:10b0:631:9366:da89 with SMTP id ada2fe7eead31-673c31671d9mr4237842137.8.1779640705537;
        Sun, 24 May 2026 09:38:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cc08c0sm2020669e87.36.2026.05.24.09.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 09:38:24 -0700 (PDT)
Date: Sun, 24 May 2026 19:38:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Graham O'Connor <graham.oconnor@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Add
 regulator supplies and disable EUD
Message-ID: <hwlkksr2nbarur6n7i7gt56ghhuxxscaey2idff75cx2sthsqz@cd52yzmhyybp>
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
 <20260522060645.4399-5-graham.oconnor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522060645.4399-5-graham.oconnor@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE2NyBTYWx0ZWRfXzn+yrHP81sFd
 xiWLc86vkSWEB+jzg/vM9FoJuyK/JRRgbFBQwBjSKM5uYPlXqpld7qG563P7KbLnqtlDiPQiBli
 piWObEtjD600ImUeXNPD643w7QSxtVMRfT7RNhfSt3sOgm+pkzA+Nm8xufE7n5reb2PKgoAZt1C
 gxDkBRGlXThzxix5FNeWrrm1CPdkQ9CxbMbH/3kYRghnWIL/4YLK6Rcko4v0jD7ue77YbzfUnvH
 8OxmHelkg4FGyU3D6I9svrJUGYFVlpWzS3lrZeHMAuz96kIKJhigVZkCPuQMfiJIaO5S1pMeERV
 nPx1v70OMePnUc1Dx2XfOZP0GaZW+SFKNizHhJl/b03Yuv9s2AUJE9MpAGWw4LCfNyq4wHpDKkb
 Jz7ff9ULz0xHjQVsyezdDEVCiQ3oAd6Sk/B9db/bKLKtbwFOJ7ID4TnD+awabgf64PR530OoN3C
 nqD+SkB8jyDnRgLoDBA==
X-Proofpoint-ORIG-GUID: Urlcmk5pDdTNZjBCD9Kay3_Sqn-c5Cm3
X-Proofpoint-GUID: Urlcmk5pDdTNZjBCD9Kay3_Sqn-c5Cm3
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a132982 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=xsPyQ2l8_84pY8PHn1gA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240167
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109507-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 43ECE5C32BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 06:06:43PM +1200, Graham O'Connor wrote:
> Add missing regulator supplies for qfprom and the PCIe controllers.
> The qfprom node requires vcc-supply for correct eFuse reading. The
> PCIe controllers require vdda and vddpe-3v3 supplies for the PHY and
> connector power rails.

vddpe-3v3 is a legacy property for specifying power rails for connected
devices rather than the controller.

> 
> Disable the Embedded USB Debugger (EUD) as it conflicts with normal
> USB operation on this board.

Separate commot please, with the description of the conflict.

> 
> Tested on Radxa Dragon Q6A (QCS6490)
> 
> Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
> ---
>  .../dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> index bb5a42b03..4003837ad 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> @@ -1093,3 +1093,23 @@ &sdc2_data {
>  	bias-pull-up;
>  	drive-strength = <10>;
>  };
> +
> +/* Provide required regulator supplies for qfprom and PCIe controllers */
> +&qfprom {
> +	vcc-supply = <&vreg_l1c_1p8>;
> +};

Please keep the nodes sorted.

> +
> +&pcie0 {
> +	vdda-supply = <&vreg_l1c_1p8>;
> +	vddpe-3v3-supply = <&vreg_bob_3p296>;
> +};
> +
> +&pcie1 {
> +	vdda-supply = <&vreg_l1c_1p8>;
> +	vddpe-3v3-supply = <&vreg_bob_3p296>;
> +};
> +
> +/* Disable EUD as it conflicts with USB operation */
> +&eud {
> +	status = "disabled";
> +};
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

