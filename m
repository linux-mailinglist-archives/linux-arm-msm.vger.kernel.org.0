Return-Path: <linux-arm-msm+bounces-84532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C7ECA9E40
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 03:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A5A43020687
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 02:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E7723BCED;
	Sat,  6 Dec 2025 02:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORCr4Ekm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RIqWuo0c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D645E22A1E1
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 02:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764987155; cv=none; b=a1Rm5JELhrFkge+qzMpIbI8mlTDkiiNkaNkVVCqFtZwM+I88CrYOQF920xOO7y/VazrUWVB6QwGa/q2KbE+Cc+GwDcumRQUizr3HmKi5zQB4C2IVKGc47Pv1rJV0FyzwOChVXS1SIKIng1j/4lmqBaE+wPOVJdl4+r+xLiu2l6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764987155; c=relaxed/simple;
	bh=7yNAmAKzkKFFC4L/AwgapzOUtmtpc+H2W+Q1xkEmB5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHp4HufBjxByXkwP+JZFzJcrgQSmcCI3PzqyiuMLf6hLPy5JeNA8O3js9p2DRh47tbLglWnmwvm1g2hjnWY3ISdY1Dl7ICbuTyfSsJE5df9sJ5uhJW7sltHbdgvstITZSySyQ2TTd0TgoQTRSx3MkNfRiwgZNliZuozyKlXqoBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORCr4Ekm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RIqWuo0c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5K26tC1644614
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 02:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NriRLIBLbLRgpuodB6uNsqyz
	SDU182qlWrscE4aX1fI=; b=ORCr4EkmDnVi5J/iY4LbqyPMYwasw+00jPxX4Iup
	hilLF6a/O9CjwQdVfpZ3eliBh56X4REtyhLyaUYXL5wj9Zl8/XHW3g//HUfBPpgF
	L3xZGsOur5jcN+EzvwYnOD8HPr7IlaVowdG3O1QpbBP5NNe/j1gwr8CUaWEjumFt
	gjGXLD5vkXw8i0m1h6yiamnDPyUQXe38eAH2cqUq2+TxF7Lh/o+g/q0fkFhIaW2y
	F1r6+EBermEDaplMzhs4suDtm/uFvW3aui/UlxPon5tr4iqfmFErkErNpj0PJBAw
	0kstfwQRMokS/FtHhmOZFxbv29PQas79X2JxgjoQY/U5Rg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av62u0pq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 02:12:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b26bc4984bso949517985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 18:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764987152; x=1765591952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NriRLIBLbLRgpuodB6uNsqyzSDU182qlWrscE4aX1fI=;
        b=RIqWuo0c3cNBtNOQXTjhBHYtgY1Qw5PGNq5cDxViStq6DRcuPY2xWwxZjC7qhGG/a5
         Ecvyzdwj33I1+dhy7mYQDfZiWgHVM4QeiPZBeJ07z0pTouFoKUe/pLuXWw3X2mVNK4/2
         AODKUQpfs0IhWvA1NPnlnwjuvE2yUEM3xyfOzt/WInMkK9mteoC0XLarmcqqa1ozYJQ1
         7IgSITvfvAeOKrscZfYE2aadrnttFqZawixVnpwmT5njb7zQbpqmJ8vNa4VUFmlPIat6
         MqzRJTMGL3mdgBh/0BkIGhMWZRtKAf6qYqaCAhY7JhEIvt0aO+7B1Ax05gnc+PYuc3xs
         w1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764987152; x=1765591952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NriRLIBLbLRgpuodB6uNsqyzSDU182qlWrscE4aX1fI=;
        b=v3v/xuPzGlK504zGqgjb5svrXWYfShwv+eZoe06TBOc7Ti3RsRk4o2cDTYK/fNzuz3
         fcNqmGgv/l88qC4yJQNeuvJLAv18SyyRnR0oyhiSxMh0j20JXF6+/gLJMonqto1IVZ2p
         41OW809EweqJqeVg8RjsvrrtAtDUiaVG2is+3I0fGzXIAbtFrnG3NIXdeP0M5ssBo4tj
         VF1+d56DbIj3Aik9RYd9zjsF0BtiReWxfponCIryT9hvHuWX5pJyLkab+uZvxXK2ZWU/
         J0i3jzq7LbFXSkBiYcrszaAx43A6m1EJOI7HXLGCwuObqmMfOSZsAlMGIspeYztg1CKy
         zHFg==
X-Forwarded-Encrypted: i=1; AJvYcCXgYxm7M8cvHJGN7Hgt9wC8/1MpX2pVAkjzNZg45aCyRe6CfcV1ka1wJqpTn5yW595W4u/XpNvjmgHYeZ4a@vger.kernel.org
X-Gm-Message-State: AOJu0YzpJgvTMh+n72aM2qaEb47liXAAVvUsvrrCq1f37lsJ38F8kPvg
	msIep1n4dxTadFpqXbxhekqkujQ0+xWWzENrAtNh0fXEHxWXeyq/RHVN4N7IzgcDr6Wo2JnuEJI
	DWDaafoMqqNihzGLiLMKfZ31Zjggmy5EwnN43QBCPK8FvgXL7i2aFoGAPJbbZRHHKsKSY
X-Gm-Gg: ASbGncsQBia0c+fZfzJQsNblO46fWDxcN3qzeB6fibzIeeHn/te+jlJD1KMbl11tQ0K
	ebz0MeRM8qIwtwYnJmq+bSVL4AEvR2tZqY53aOsdW6jqk3e7r5JIPhxGJIlLk2RL7sbG6MMYlkG
	SKN3HX6aHgfIzmWc7LpzfwMyhN0s+2rfnMRTYfQMfIQ+1TSf1tCVnb57LKNBnGM2wYumkkueSm8
	zseNdEfm7XEciHllLjxi+aU+0yGaHffZl0K3egNyhpELrVcVd5IjtPddoAWjAe9ECMeKzLEJMmE
	IoJGOEces69ktidZppEO3+yM8HnPfl8YbBqdFxQVihutqdrhQ8uK/F8D2vzRvhnrYoupdEdC3Oe
	j23fhaRmAvyYgMztyGa2629M50u37LgG4qnL5LeTkuPylJE/MYqaJPxW2RWNzPHDt0qlyEPeLB5
	WMtt12PhYD+Lp8wQ+jlBTUsZs=
X-Received: by 2002:a05:620a:1720:b0:8b2:f182:694e with SMTP id af79cd13be357-8b6a256a62cmr193343185a.54.1764987152092;
        Fri, 05 Dec 2025 18:12:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsjGX3ZaFj33EEt/9/11MBWa69nvrxsbShB10wF+o8/A8Fd+0QjLcnFFQT/NmPOdo4Sd9SKg==
X-Received: by 2002:a05:620a:1720:b0:8b2:f182:694e with SMTP id af79cd13be357-8b6a256a62cmr193340385a.54.1764987151614;
        Fri, 05 Dec 2025 18:12:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b24719sm1998856e87.24.2025.12.05.18.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 18:12:29 -0800 (PST)
Date: Sat, 6 Dec 2025 04:12:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 07/12] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Add wifi node
Message-ID: <bynxwz5venb6jkybamylu5dl5pmjavknoa56dkzyhgrskpgcxl@oyxqp3telscp>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
 <20251203-judyln-dts-v5-7-80c1ffca8487@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-judyln-dts-v5-7-80c1ffca8487@postmarketos.org>
X-Proofpoint-ORIG-GUID: aI-4_bXhne8PjkYR_F7_Ft1ZcDuopro1
X-Authority-Analysis: v=2.4 cv=VMPQXtPX c=1 sm=1 tr=0 ts=69339110 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Gbw9aFdXAAAA:8 a=IqCYnrxLgLuRO9zwK-sA:9
 a=CjuIK1q_8ugA:10 a=dK5gKXOJidcA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAxNSBTYWx0ZWRfX/ysr8TXkJ5M0
 e8FmmKLOFKrkQRtoWCFx3K0PAJy9XWiS4g+CB8LKmdJinR4i6o71rl5PqqSnrfiuogwkGEzaCQS
 DFEzubkQNtej/cnUZz8iREaFHUebuz3+VWvdxYF1rreccWITQGJDqHGQjFEoY7I5POCXosxMPVn
 Uus5mXBYLPKfQgiHgSRsVwO2Me5lmUmDlr5UVYUUfeGq/0BNrytcStrT3DCvpgc5Vj2gQR7mh+S
 rlPbpm5fbrO9hQLVaXLVC1/o+92qfPpWqjNYrjaXlxTfyw5lSIHcs0yRHRy2Axn7r2RGxwSW991
 UGaq8amVV7qJWsVFK7S7QcE3Arwe61bjQkcoJ9RTZrj1VjogqYomixgF00exKyHkWwcb0a0IUZW
 dEhzMswXRJv1nPU+m8M2eQtfblPZ0g==
X-Proofpoint-GUID: aI-4_bXhne8PjkYR_F7_Ft1ZcDuopro1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060015

On Wed, Dec 03, 2025 at 01:40:56AM -0800, Paul Sajna wrote:
> Wi-Fi now works with this patch and relevant firmware
> 
> ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
> ath10k_snoc 18800000.wifi: qmi fw_version 0x20060285 fw_build_timestamp 2020-10-12 23:35 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c4-00645-QCAHLSWMTPLZ-1.336037.2
> ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
> ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 1 tracing 0 dfs 0 testmode 0
> ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
> ath10k_snoc 18800000.wifi: htt-ver 3.83 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
> ath10k_snoc 18800000.wifi: invalid MAC address; choosing random
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 12 ++++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  |  4 ++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index 49d285c3e6b2..8b88f75b36af 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -145,3 +145,7 @@ sde_te_active_sleep: sde-te-active-sleep-state {
>  &venus {
>  	firmware-name = "qcom/sdm845/lg/judyln/venus.mbn";
>  };
> +
> +&wifi {
> +	qcom,calibration-variant = "lg_judyln";

Please submit the bdf file to ath10k: https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +};
> 
> -- 
> 2.52.0
> 

-- 
With best wishes
Dmitry

