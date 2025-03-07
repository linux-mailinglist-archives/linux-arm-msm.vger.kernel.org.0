Return-Path: <linux-arm-msm+bounces-50599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE08A5603C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 06:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7081175E98
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 05:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DC71946A1;
	Fri,  7 Mar 2025 05:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KYy+KXpX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AFB1922C6
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Mar 2025 05:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741326505; cv=none; b=DyGiRwqZm5KylObJUVaTTqjWU0+S5KIotp877vWV+vxrNBUzaU3psRFuUnwjr1qD/C2lFd2QkH59+LLwM0LZFa5CFvRnecyClp478n7FE+dVN6qotRV1kHbVEcoGU7QrCmgGwuL+umFhsg5ByBbzn0k2jVMjund4/T0VvXrJYxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741326505; c=relaxed/simple;
	bh=7xvEUPrOQT15JKJTO/aintccF5IU0wvr211Eyg0HZ6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8DqRUHcarnOJsFpkVufWy6B4qAmmW6RpmuwRTMmpotcA9beucxcKpKBeH5U3Nby8USdwaT9yu7b7qzSYQSAVPjXs9NsYGz4v/8WMM/pLPu3HHtFXVNXgYo0WLUvlF3Ti0bsmMVFMwRTsNuPqwfhN/FEOPiPXcEwgDHMDCGRDfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KYy+KXpX; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bf8632052so967671fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 21:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741326501; x=1741931301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QBJJ6mH3Lq4uasqO2w/mLpbOX1gw+uVajo1XywdLac4=;
        b=KYy+KXpXktr2O7aeRohhpe4tUH2F7WizQBrmgkoYG+1Eyo0G+wCXxV+w5JO78pgIKu
         w0qcvjmmq7DiC8L0rgPu030asLUbBkK9PZBKT1NtiFXEOOImHGC6BS6GIJcEt8bI5483
         fwmaxcP+iartRG9wY0TWW2RNUuR35OjnHwewn3+/yFgZ2m2qmuwIHZW4ZLP+4ZPNvN0Q
         F7cFegDYb5p37JGMyk8aBU/Sq46jN/FkGd1/tLnIXUDVWHubC8qPwNIhXDOdvBn//w3x
         OK4v5fhtyV25sUMUr8ZhnVKjmDgiRBpql7eziLWiEuwkoRl78QejWWiUBonwhtAcQ8HI
         dsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741326501; x=1741931301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBJJ6mH3Lq4uasqO2w/mLpbOX1gw+uVajo1XywdLac4=;
        b=A38oEInMlnWXQ/Oot7bK234ibSETiwKoK4nY6lyu1r146t/sNbue6bHCdcjdVTRQwi
         Y9GgNWfw+NTCOQfzVHg/5snCNCizoKPlf8NoetkKs2WPAvtmZdm41TqNvUt3eugivS6c
         qajkCMfZhSPBvp/d3sbSSUZw/zWekbDOB+gIhxjth0khBBkyoN2Z1zmL/PRm55bbxlKe
         UHk42buFyV/qhsFGpeZAwIngxc9W8m440qKzku4tT//63m1sZoRFKA4js/1lqi99bhJr
         87RHyUrEZEwpUprJDyqHXYtkb05E9dopljd79DQy8+PJRmjkjXDh/61JdW5uq149NGq8
         LkCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2ze64GHNMjC21fVAV7HvdkzmI3ToQED3MP3eH2akpra06+Is9kTx9GvajQEu2BDA/5SRlWNUjatwUwwcl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2jrw/4AtkfuqqvGK4NRpbwmh+ngFFURYoa1CpVGKipbPaV1sn
	NLKeMRAqe+K1jsxdJooWSIY4Ye3I15InTfhL/AmD45of5mPIDvUeNal1Xzko8QE=
X-Gm-Gg: ASbGncv+KLeJus8b+UjhyS1IxPkcG6zRKj7tYK9alL8Ge0PEggqi6ZpQliBgeCkg7V3
	Fq5dsuuXauwKXFDfxNjz28mMujoLFlsDrrpa5sUFfygX77e4xTLtoRYo7EgCLxkE3ElfzVwq0Nq
	C8FOUpe784KAh2PyW3Im7iXXKNr6mBFTq59Y0+FKmawTpR6smWfCUIfkcOSUj2n8naEtQn2cAVD
	9Kw/0ONTOEfXuxfFXVXUwYlsMCYWZ5OslUjl1hFfzScus1buFKG7FnX4EWI8BtkaTDqxoJT4+rR
	AtV78mN2nlT4MNzB5nJX03FABfgVXUJiLv690WGIpgNHLxnjCaDwaE5QvkpVUTT5gIa7vTom56t
	Q0SQeVQPZQahtmRX6rJ9TGcd3
X-Google-Smtp-Source: AGHT+IGmsERqhfZqLPyNL7GHC82EoyeyaDNDfDa4E87aEDrWxyBlXoZ/5KIqAbmzZjDQsHi6vMCl1w==
X-Received: by 2002:a05:6512:3d8f:b0:548:de7f:b3be with SMTP id 2adb3069b0e04-54990e5e265mr590371e87.21.1741326501038;
        Thu, 06 Mar 2025 21:48:21 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae579a3sm380848e87.53.2025.03.06.21.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 21:48:20 -0800 (PST)
Date: Fri, 7 Mar 2025 07:48:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Robert Foss <rfoss@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Christian Marangi <ansuelsmth@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rohit Agarwal <quic_rohiagar@quicinc.com>, 
	Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 04/11] arm64: dts: qcom: msm8916: Fix KPSS ACC compatible
Message-ID: <5e3i5p4er7hcqsm55nf2qjvegmoozntq2aqrpk4lvw43ydlvcl@xsgxgx4fj6zx>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-4-0c84aceb0ef9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-4-0c84aceb0ef9@oss.qualcomm.com>

On Thu, Mar 06, 2025 at 07:11:16PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The current compatible has been used with no corresponding
> documentation. Replace it with one that has been documented.

qcom,msm8916-kpss-acc is also not documented. Most likely you meant
qcom,kpss-acc-v2

> 
> This has no functional effect, as these nodes' resources are only
> consumed through a phandle reference, anyway.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 8f35c9af18782aa1da7089988692e6588c4b7c5d..33a28f8163dda0e53f4176d61738ce175efc096c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -2574,7 +2574,7 @@ frame@b028000 {
>  		};
>  
>  		cpu0_acc: power-manager@b088000 {
> -			compatible = "qcom,msm8916-acc";
> +			compatible = "qcom,msm8916-kpss-acc";
>  			reg = <0x0b088000 0x1000>;
>  			status = "reserved"; /* Controlled by PSCI firmware */
>  		};
> @@ -2586,7 +2586,7 @@ cpu0_saw: power-manager@b089000 {
>  		};
>  
>  		cpu1_acc: power-manager@b098000 {
> -			compatible = "qcom,msm8916-acc";
> +			compatible = "qcom,msm8916-kpss-acc";
>  			reg = <0x0b098000 0x1000>;
>  			status = "reserved"; /* Controlled by PSCI firmware */
>  		};
> @@ -2598,7 +2598,7 @@ cpu1_saw: power-manager@b099000 {
>  		};
>  
>  		cpu2_acc: power-manager@b0a8000 {
> -			compatible = "qcom,msm8916-acc";
> +			compatible = "qcom,msm8916-kpss-acc";
>  			reg = <0x0b0a8000 0x1000>;
>  			status = "reserved"; /* Controlled by PSCI firmware */
>  		};
> @@ -2610,7 +2610,7 @@ cpu2_saw: power-manager@b0a9000 {
>  		};
>  
>  		cpu3_acc: power-manager@b0b8000 {
> -			compatible = "qcom,msm8916-acc";
> +			compatible = "qcom,msm8916-kpss-acc";
>  			reg = <0x0b0b8000 0x1000>;
>  			status = "reserved"; /* Controlled by PSCI firmware */
>  		};
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

