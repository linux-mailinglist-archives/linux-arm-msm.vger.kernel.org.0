Return-Path: <linux-arm-msm+bounces-41562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B06A9ED7E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 21:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D06B9168772
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 20:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943AB22A81C;
	Wed, 11 Dec 2024 20:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lhokw8CP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D300C22A7F3
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 20:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733950567; cv=none; b=Rt71srZvC/xM1kgCxHFDNR5uUX3VjjgXh5LbYkSKFwp76Jajz2SjhdESjpXkR+MMC19uUjg69IT4p6DVekxzSRtZi1wcMic9YwmZpo4jfdpc0bFzRLznKM3Vn7bDAUPDu+Xd8NJwX8NafTj2wbjuPeG3JIR21FeuSWx2wc/SWys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733950567; c=relaxed/simple;
	bh=0EPvJM1CidipSrEUVyRtwHDycmAWz7nKFmR2pFgN5Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nq6VIufWqMxQ8cs3/gDTwhrCmbJfmpT5Pc1Vn21XJ8s220UHHLfOMMcZCmyczMg7Cp+uT5vC3QdrxZfUYZjTaxeEbZz0cUZaHYtnmvePKrgX657yK9fUs3+cosDtaAMWJwM7NN2hQyxuSv7YSwZxhi9o//YNXh2ZI6PwKoqK3Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lhokw8CP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBHDEEp030187
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 20:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cz0Ob+e6s3LgfOXxmCKJHUCu
	Q2IRtNzVD04yQgOK3d8=; b=lhokw8CPbqlb3bVzAjavaFWKmFFyRBrxAyj9GGyB
	+gRVE2wKM8L02V/IWPHR+1t1tQAVjkWxI1qDoW4gA+sUDdkHRP6Nx+5geg0gOJCO
	Ot/1Ns20TA1sKdAQOf1sZXVTfUXKnLT2m1D7XwCenrsLk7PikSnNA7Ha24LoGujd
	Q+VA13q09v/WFG5skxyGNtGyzEP8MZRFXv7W94O6/2tH3aO/WueJYVmD6X6tWaOZ
	ZVQ60LZICtAhCZuMrJ41SoNZwj1TCGQqCJkBqr7Rr8sn+ldhmdpw1hdjRitoC0hU
	eWXm3GxqC5F9Yz95HpxIahs/cFpR9T906qnUm3HLIYhjcw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dxw496wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 20:56:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-7fcd2430636so5184838a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 12:56:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733950560; x=1734555360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cz0Ob+e6s3LgfOXxmCKJHUCuQ2IRtNzVD04yQgOK3d8=;
        b=rXUIE2UOOUgrMsZNAGNjbGhQPDK207CGW3OTUmJBear0jcjuImQ8G4mTE+oQf6KYkZ
         dPD8VSLYSD16BXOZYXUTfdAGQpZBnnvnB6l/HRUCYT0AC1smc3zmoxyMMDHVJcyHXmR4
         CeUzXxnmgVZgq8H4vBBZWr3yUJDixfmgrgVJ1QYf+u4uGpVLs6f5RfZitB9ggsSLKXlS
         6ldjP/lwOoLPYk6t8rY1u8A6q3sAdWdN6531cxwirFODoY2AoYO/SpPUKWEPBPj9AsEd
         OlzUVSxbM7Qtrh3QmejsPxCKykPUfYRdV7YQ6gQZw4JQ46WAE/gkzHdowS3cKmR9Pi6C
         bLZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAY7F2JEtxPM0hkForRrbYPhsJjUAF1FBon5S42w6PbF89zocTqcHjcyWabu0wrgWb3iubx9LfCoyFX8bF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4AEGc9VJjxQesrl6ZGkw8NkoLCxWXujQs7zsyIXpbpyLAIzbK
	0RjsvtB1fkEanyhZ9yfs80joqIQgGYgowxiWdfMskoPd6n/2JR6qxQfw934XLV7t/n+Fljtuzfu
	hdTgM9FGauj7ow4lyLzVe8oqu8s7iJRB2DrFIBe2a3/+qmirTG3TXmfD4xU6Cna7c
X-Gm-Gg: ASbGncv0CxKu1oebK0vrf7zMGRW5IUx/lix7FGhS6W8bx40JvR21WYbhfeTquONNtlL
	a8PGfkLpLcvexfTMtmuSjP4jBSpv+VEoscisFtiJMJDtMzW2qSlaLIlp/yfAbv0vX8V/cloGoQn
	ZNPeOteyLNuRPUJb/fSIlq9pTeCzvITa4MOwo3AwazAFf8GgYnIExX9EATLGTKF3dX1YVWIEVFx
	MyGyOqDkkeaTvum2h7X7AqcIOqUVmM7ZV1+1r9GZrt+Nd/Gl7YpBWObyolYJG8otpUbJYLxkzF0
	aoo3JUiUB/w6LXewuRKeDXdD4TiFv9c6cqTs7Q==
X-Received: by 2002:a05:6a20:d80f:b0:1e1:a48f:1215 with SMTP id adf61e73a8af0-1e1cebca688mr1120423637.35.1733950560276;
        Wed, 11 Dec 2024 12:56:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGH8f8D4wa4ldohT1wwki2Rnw5Aim3SbcBSFcaHp0PDLIC7xbjoVp1mVCyluwK6DuNmkpSfxA==
X-Received: by 2002:a05:6a20:d80f:b0:1e1:a48f:1215 with SMTP id adf61e73a8af0-1e1cebca688mr1120400637.35.1733950559845;
        Wed, 11 Dec 2024 12:55:59 -0800 (PST)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725df830510sm7377447b3a.29.2024.12.11.12.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 12:55:59 -0800 (PST)
Date: Wed, 11 Dec 2024 12:55:57 -0800
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Tingguo Cheng <quic_tingguoc@quicinc.com>
Cc: tingweiz@qti.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com,
        fenglinw@qti.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs615-ride: Fixing power issue in LPM
Message-ID: <Z1n8XYj0gzh3Q0U3@hu-bjorande-lv.qualcomm.com>
References: <20241211-bug-fix-qcs615-ride-dts-lpm-power-issue-v1-1-a08d12c415f0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-bug-fix-qcs615-ride-dts-lpm-power-issue-v1-1-a08d12c415f0@quicinc.com>
X-Proofpoint-ORIG-GUID: td4RPjktdrD36pNjERLhXNOxPRg94D2M
X-Proofpoint-GUID: td4RPjktdrD36pNjERLhXNOxPRg94D2M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110145

On Wed, Dec 11, 2024 at 05:16:15PM +0800, Tingguo Cheng wrote:
> Change all LPM to HPM for regulators init-mode and disallowed setting
> mode. LPM mode provides at most 10/30mA current for consumers such as
> UFS,eMMC,PCIe. That caused problems because consumers take much more
> than that. At the same time, a lot of drivers didn't set load in code
> that makes it impossible for regulator framework to know exaclty when
> to switch mode.
> 

Per https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
start with a problem description, then followed by the description of
the technical solution.

> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> ---
> At the beginning, The QCS615-ride device gets some power issues when 
> enabling peripherals on the board as well as in the SoC. After figuring 
> out the root cause which pointed to that drivers should tell the regula
> tor framework the required current the devices need separately, so the 
> regulator framework can get to know when to switch modes to satisfy the 
> requirment. But a lot of drivers did not set load for peripherals. Some 
> did setting and some did not, which sometimes caused problem when LPM 
> of regulators is allowed. E.g. LDO12 supplies UFS and USB. UFS sets the 
> load of AmA(HPM), while USB PHY does not set any(0mA LPM). In this case, 
> USB can encounter insufficient power supply when UFS's going to sleep. 

Why did you choose to describe your problem in the portion that isn't
going to make it into the git history?

Perhaps worth trying to reduce the "story telling" nature of this, but
please do incorporate some of these things into the main commit message
- so that we capture it for future readers of the git log.


It would also be useful for that future reader to know that once there
exist an implementation (i.e. when Linux supports it) that actually do
manage load votes and there is power savings that can be shown, this
should be introduced again.

> 
> There is some discussion about this:
> https://lore.kernel.org/all/5tbevb5wv2s43pccytv4qol4yhq4s7iw2mmqp23vt3ujqd6xev@hkioqmwoitbd/

It's okay to add this with a Link: tag.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 52 +++++---------------------------
>  1 file changed, 8 insertions(+), 44 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index a25928933e2b66241258e418c6e5bc36c306101e..32db107dc660cff9d2ccbf19eceb5c5539c591a9 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -71,30 +71,21 @@ vreg_l1a: ldo1 {
>  			regulator-name = "vreg_l1a";
>  			regulator-min-microvolt = <488000>;
>  			regulator-max-microvolt = <852000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> -			regulator-allow-set-load;
> -			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> -						   RPMH_REGULATOR_MODE_HPM>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l2a: ldo2 {
>  			regulator-name = "vreg_l2a";
>  			regulator-min-microvolt = <1650000>;
>  			regulator-max-microvolt = <3100000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> -			regulator-allow-set-load;
> -			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> -						   RPMH_REGULATOR_MODE_HPM>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l3a: ldo3 {
>  			regulator-name = "vreg_l3a";
>  			regulator-min-microvolt = <1000000>;
>  			regulator-max-microvolt = <1248000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> -			regulator-allow-set-load;
> -			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> -						   RPMH_REGULATOR_MODE_HPM>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l5a: ldo5 {
> @@ -102,9 +93,6 @@ vreg_l5a: ldo5 {
>  			regulator-min-microvolt = <875000>;
>  			regulator-max-microvolt = <975000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -			regulator-allow-set-load;
> -			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> -						   RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l7a: ldo7 {
> @@ -112,9 +100,6 @@ vreg_l7a: ldo7 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1900000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -			regulator-allow-set-load;
> -			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> -						   RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l8a: ldo8 {
> @@ -122,9 +107,6 @@ vreg_l8a: ldo8 {
>  			regulator-min-microvolt = <1150000>;
>  			regulator-max-microvolt = <1350000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -			regulator-allow-set-load;
> -			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> -						   RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l10a: ldo10 {
> @@ -132,59 +114,41 @@ vreg_l10a: ldo10 {
>  			regulator-min-microvolt = <2950000>;
>  			regulator-max-microvolt = <3312000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -			regulator-allow-set-load;
> -			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> -						   RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l11a: ldo11 {
>  			regulator-name = "vreg_l11a";
>  			regulator-min-microvolt = <1232000>;
>  			regulator-max-microvolt = <1260000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> -			regulator-allow-set-load;
> -			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> -						   RPMH_REGULATOR_MODE_HPM>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l12a: ldo12 {
>  			regulator-name = "vreg_l12a";
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1890000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> -			regulator-allow-set-load;
> -			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> -						   RPMH_REGULATOR_MODE_HPM>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l13a: ldo13 {
>  			regulator-name = "vreg_l13a";
>  			regulator-min-microvolt = <3000000>;
>  			regulator-max-microvolt = <3230000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> -			regulator-allow-set-load;
> -			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> -						   RPMH_REGULATOR_MODE_HPM>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l15a: ldo15 {
>  			regulator-name = "vreg_l15a";
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1904000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> -			regulator-allow-set-load;
> -			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> -						   RPMH_REGULATOR_MODE_HPM>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l16a: ldo16 {
>  			regulator-name = "vreg_l16a";
>  			regulator-min-microvolt = <3000000>;
>  			regulator-max-microvolt = <3312000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> -			regulator-allow-set-load;
> -			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> -						   RPMH_REGULATOR_MODE_HPM>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l17a: ldo17 {
> 
> ---
> base-commit: 1b2ab8149928c1cea2d7eca30cd35bb7fe014053
> change-id: 20241211-bug-fix-qcs615-ride-dts-lpm-power-issue-44e33c8dfd3d
> 
> Best regards,
> -- 
> Tingguo Cheng <quic_tingguoc@quicinc.com>
> 

