Return-Path: <linux-arm-msm+bounces-38480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADD89D3A0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 12:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F1321F266D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 11:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C53919D894;
	Wed, 20 Nov 2024 11:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UqI0dZxF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8285119F429
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 11:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732103879; cv=none; b=EM0J0cvLfJLL8fHjwhlUa2lrRE632REq+nPwcaedyVWbqf+U295MYMzQx5W0SIFdPSPblD43S01Xcj8AdHBz6klJfkOP4JyvibE2z5di/c7PXvwso884KkTh3UDJp54iOwDUg/RaXYGrEiLtohNBswqR51U3cYEtAQ4v8GmyKa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732103879; c=relaxed/simple;
	bh=0e0nr2aDV/a5TiJuxeZ1nyQWXMPEjp/tJGOao9xoL1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oW/mVAEfs8L5is5bLW/9UWrW2MqAEdthWOw+sNI3Fw4C7cf/NkPPDP+/LHQdcDfcqBdXGsOrnfs0SRrwBPAZpWKAJHJmGxJ+zo6xVSsrNe+ndVCP/h9kUB7xy3j1hhiuZEAhD6PF3ACnubCaEUC+AG6KQ4mUv4YkFR/GXowIyts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UqI0dZxF; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f84907caso2679370e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 03:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732103876; x=1732708676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kkDJuRPym29fU3HSSlVBvB5wB9QK3I5iEUymjLs3BXM=;
        b=UqI0dZxFjUM6pkeHNrTr9DZly81eUQuGEU7Q4qo+Xn+XbekRXeL3LNkbuLkgpCvBf5
         2BLNPZOSMPIdBKYYc/dSYQat2V1qiSRZmQVbVJFOVMjuIBzYGbTn44wTx7G3gYiD1D1g
         +gZH8FtNWiV7F95q0FV+/HLKtLG5ucCjCRvq7JfSm4gIHNDsvnjB3DPy/EbuAf8d9Mhi
         HGxu4DrP/BXhXmPb2aJ/WHgLdF9k+ZxoUmoATip0Abilz4AuaPhHBc78XEhI6Zt4ivBO
         /XSCmUb0bWR3cx6ZkJUOe5FnmSVKgltDvqCMcZusYShH3qbD8GRXTec2XRll7hFcW+OX
         VcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732103876; x=1732708676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkDJuRPym29fU3HSSlVBvB5wB9QK3I5iEUymjLs3BXM=;
        b=MuwpGldm1BqbetLi9N/+J3kA8sCwFyfoM+DRRHW/KqmKLokRZhGbVIO1k7SK4fCblJ
         nBqTv123IeHomorDEcNPToZg27n58mQ7/j1zCyhO2/avXyGtHd6FIF4qK3Ahqm7CZa9D
         3y5OunDRzA5TLrK2SDZAM024l/ZuS8+1GOo5Hgcea8uQ2/WWeo+6+bdkZtGQrVLkYes5
         R5qAkLcteUZtHUW2qRtwiWY7WRYDuXH/W3VlGJkU1b4tBf28OnaOJEddSbPTZKRgM6Rg
         aB3ODarSMmrCHtY0Po0bEgFLrJIRLuCCdaY6lhw8M4CH/s+GbiZhmW5HtjEYp5E7qGu3
         IRvg==
X-Forwarded-Encrypted: i=1; AJvYcCUsoF6BiFBdvGr19T/b6Dp6zDkih8bmPVecv3aF8xZ2aL1ws6G7FusEzJ9MpTFmZgdkxW3Bk54ISgta/ddJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxzXPvJqe111LSfDjssHG0niNyxUL7PV1f0MAzeNam3xdRkeQqe
	OHHnIB8RY/0V/B3TXMkUNV0DJQ+HTWr+6RnFiB3ERNGiHRDWGHSPshRpbIhsKMk=
X-Gm-Gg: ASbGncv0fIKtO85RcVc+rH57Eq3sgJ7ourXgF+m5q3cBghNWDrUr0dkRmpncqLGSQkK
	dNYaVR3qnevEI1WQlStp1nSNFLGaX+4+Hwwcx5xH1w14v7IR0zpfzrdfOzKhLDxkBGB0n1n1Pv+
	f30GipkxCmwc78ZPFxX04HiRmcAqKM57a4QHdM1EypZCwC6sow5tjCgas3oB01/vXCHB+3RR68I
	n+0vUFgPg5q43gizCoCByR/ihBOIfUw4x2G53QgezLD7sc/mD7FxCC94u3P58E2G+exBLFyQd1p
	OJ7lxzT5IvoQu+BcUnESwx6lb+hCug==
X-Google-Smtp-Source: AGHT+IEhdK1oi5UhEJitu+CYeExmzTppA+htmFSLIfQ47nQb2OOw28dJBcmFit/oz+783D827lApYA==
X-Received: by 2002:a05:6512:3b2a:b0:539:edea:9ed9 with SMTP id 2adb3069b0e04-53dc13275aamr1000536e87.1.1732103875668;
        Wed, 20 Nov 2024 03:57:55 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd4671d9sm606538e87.115.2024.11.20.03.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 03:57:54 -0800 (PST)
Date: Wed, 20 Nov 2024 13:57:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Melody Olvera <quic_molvera@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: qdu/qru1000-idp: Fix the voltage
 setting
Message-ID: <orvnnjclxlwrab34daxrepn3m3la3heogkxbncl44yjyn3wxkt@vnp4knb5nedo>
References: <20241119070812.16079-1-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119070812.16079-1-quic_kbajaj@quicinc.com>

On Tue, Nov 19, 2024 at 12:38:11PM +0530, Komal Bajaj wrote:
> While adding the USB support, it was found that the configuration
> for regulator smps5 was incorrectly set. Upon cross verifying for
> all the regulators, found that smps4, smps6 and smps8 are also
> incorrectly configured. The patch corrects these configurations.
> 
> In particular -
> - smps4 is 1.574V min and 2.04V max
> - smps5 is 1.2V min and 1.4V max
> - smps6 is 0.382V min and 1.12V max
> - smps8 is fixed at 0.752V

Could you please comment whether your values represent the min/max
supported by the regulators themselves or the shared min/max by all the
devices powered by the corresponding regulator?

> 
> Fixes: d1f2cfe2f669 ("arm64: dts: qcom: Add base QDU1000/QRU1000 IDP DTs")
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
> Changes in v3 -
> * Minor nit pick in commit message
> * Link to v2: https://lore.kernel.org/all/20240524082236.24112-1-quic_kbajaj@quicinc.com/
> 
> Changes in v2-
> * Updated the commit message as suggested by Krzysztof
> * Link to v1: https://lore.kernel.org/linux-arm-msm/20240514131038.28036-1-quic_kbajaj@quicinc.com/
> ---
>  arch/arm64/boot/dts/qcom/qdu1000-idp.dts | 16 ++++++++--------
>  arch/arm64/boot/dts/qcom/qru1000-idp.dts | 16 ++++++++--------
>  2 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> index e65305f8136c..6e8f9007068b 100644
> --- a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> @@ -96,20 +96,20 @@ vreg_s3a_1p05: smps3 {
> 
>  		vreg_s4a_1p8: smps4 {
>  			regulator-name = "vreg_s4a_1p8";
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <1800000>;
> +			regulator-min-microvolt = <1574000>;
> +			regulator-max-microvolt = <2040000>;
>  		};
> 
>  		vreg_s5a_2p0: smps5 {
>  			regulator-name = "vreg_s5a_2p0";
> -			regulator-min-microvolt = <1904000>;
> -			regulator-max-microvolt = <2000000>;
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1400000>;

Having 2.0 V regulator with the range of 1.2V - 1.4V is strange.

>  		};
> 
>  		vreg_s6a_0p9: smps6 {
>  			regulator-name = "vreg_s6a_0p9";
> -			regulator-min-microvolt = <920000>;
> -			regulator-max-microvolt = <1128000>;
> +			regulator-min-microvolt = <382000>;
> +			regulator-max-microvolt = <1120000>;

The same applies to this regulator, 0.9V usually can not go to 0.382 V
and still let the devices to continue working.

>  		};
> 
>  		vreg_s7a_1p2: smps7 {
> @@ -120,8 +120,8 @@ vreg_s7a_1p2: smps7 {
> 
>  		vreg_s8a_1p3: smps8 {
>  			regulator-name = "vreg_s8a_1p3";
> -			regulator-min-microvolt = <1352000>;
> -			regulator-max-microvolt = <1352000>;
> +			regulator-min-microvolt = <752000>;
> +			regulator-max-microvolt = <752000>;

1.3V at 0.752V?

>  		};
> 
>  		vreg_l1a_0p91: ldo1 {
> diff --git a/arch/arm64/boot/dts/qcom/qru1000-idp.dts b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
> index 1c781d9e24cf..8b0ddc187ca0 100644
> --- a/arch/arm64/boot/dts/qcom/qru1000-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
> @@ -96,20 +96,20 @@ vreg_s3a_1p05: smps3 {
> 
>  		vreg_s4a_1p8: smps4 {
>  			regulator-name = "vreg_s4a_1p8";
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <1800000>;
> +			regulator-min-microvolt = <1574000>;
> +			regulator-max-microvolt = <2040000>;
>  		};
> 
>  		vreg_s5a_2p0: smps5 {
>  			regulator-name = "vreg_s5a_2p0";
> -			regulator-min-microvolt = <1904000>;
> -			regulator-max-microvolt = <2000000>;
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1400000>;
>  		};
> 
>  		vreg_s6a_0p9: smps6 {
>  			regulator-name = "vreg_s6a_0p9";
> -			regulator-min-microvolt = <920000>;
> -			regulator-max-microvolt = <1128000>;
> +			regulator-min-microvolt = <382000>;
> +			regulator-max-microvolt = <1120000>;
>  		};
> 
>  		vreg_s7a_1p2: smps7 {
> @@ -120,8 +120,8 @@ vreg_s7a_1p2: smps7 {
> 
>  		vreg_s8a_1p3: smps8 {
>  			regulator-name = "vreg_s8a_1p3";
> -			regulator-min-microvolt = <1352000>;
> -			regulator-max-microvolt = <1352000>;
> +			regulator-min-microvolt = <752000>;
> +			regulator-max-microvolt = <752000>;
>  		};
> 
>  		vreg_l1a_0p91: ldo1 {
> --
> 2.46.0
> 

-- 
With best wishes
Dmitry

