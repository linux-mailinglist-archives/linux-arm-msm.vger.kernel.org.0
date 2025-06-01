Return-Path: <linux-arm-msm+bounces-59983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 941D1AC9EFE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jun 2025 17:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E569174C71
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jun 2025 15:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182AB1E5207;
	Sun,  1 Jun 2025 15:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AeS/IFUm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631871E2838
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Jun 2025 15:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748791431; cv=none; b=GkH+F5N3pvX5MSDkb/99K+stimbRKjs96ZxjC7i8AB9/bweBcEREWhmA0lbDq6jnS3gqKp8wQRHU5nQAuexlLuEjZgXsv5bEg0F4LA0BYZAETxBGaQNGk0EUz+smsQdxVsHuofvA7pX27yFylwfkbAkm1M+ixMwLMhndqg75YDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748791431; c=relaxed/simple;
	bh=awDyxNK92htKl6XKtbeqgZ2v4gNXbHrZXkiiIbRovzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gumSqo8PatE5iwZcCtHPT05IyyKZYHlvJpdhY6ji/TargGxU16yImK/g5Zc2onGFHNFgKtFtnRmwXJazEQFVuMKcgQ7KZnUxzI3GiUSP12eFisH0vvuBp6a07i6LwvDbo6C0xMuFfL8e2DgVE0m8vwRJ1+95/ck2ScfMRGmQR4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AeS/IFUm; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234d366e5f2so46551115ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jun 2025 08:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748791429; x=1749396229; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/HdCnbvcFFV1hX8QFWwdms9CXcq6ISLWHzT3pbdzBT4=;
        b=AeS/IFUmW15Eq65Yq8GWUwbfEHdZCgE0VOxnWyr4zkQ38LBSL3lP7gcM7729kDz5PG
         CdJsGxMcRkmVLtAZAogouKe1nb6gRZgx01xH2dHuHuFXwjlBEVO4LjZDXQeF7Jx4XPF3
         Y4cBQ0y1S9vW4iF7xOhlojfuiSn6oAIGT5PVLzgJfth4Q5skwgrgDiasfuekl6uAHSP6
         DGLz1GUZ7u192gDlg30fjBZHokXL01ajwe3o5STl6tetMvD6/qqMJgmc6GKKBXCl7LCk
         Q5G01VI4T3p4eYaoQP9VN46WOZMvSlmpf9QGNA/vgDx/zcH1nQJ9RsPuPXUBFfeTZOac
         p/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748791429; x=1749396229;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/HdCnbvcFFV1hX8QFWwdms9CXcq6ISLWHzT3pbdzBT4=;
        b=EQnaqa62xcnIYckWyKZbOF8Qjxpi9nFKG+lmzFYxEtUK4hwWuvuaBbF+sII23akdRs
         21Sm21bk1fajwJVnfgGbe84xf1roG8PNN1Go0VFM6wQpK30Aj02fwFTCRPjM4yy8/YcY
         M87AtaxPfAUMKIW+Rtfe4aouLiDpqph3IE956k+AEZtY5XqVCdl9E4ohJYMh3y6OgCe2
         CndJ1jqHdKCvzUGBy3uZ+X01HAI0MjhqFEhrTUBpx3j2TavIFlFleUJfg/a7NIJo/l9Z
         AmyQU6NPAnnhqhHItctrapSCU3Nl3RxluKkSGNtCQVKjDxOEQ0u70MjEb8n8zB4QYy8X
         HaWg==
X-Forwarded-Encrypted: i=1; AJvYcCWS5eq2bkOZnohWYDCyu/qwaGd5xeaZ/8piWCg3eWau6aFPNMnmlWfaH7g2qMYsH6U0gjHNWhXoHi2Oe/Nh@vger.kernel.org
X-Gm-Message-State: AOJu0YzSnr2pVwlGDuRAnL411EBmuhSIGMHjAGRWfrfFqMUIRKjwUZBy
	mo/TJ4P3XGfnPv/vPJQ5ikTRzDjTwoCmPK2Fwgs6KT0uQ+JhappkDk7upJ2lWXoC4A==
X-Gm-Gg: ASbGnctw9kNg1e+qYiqdXWjwdqxB67+dqH1PbztgX/7zZ3zqVVu5NRpBjVIFAOycWAv
	GhiDtdeXqOTzkHqg1s3EQ5W1xojiLX8+KeiH3ETb4fA3tHOmSWqvNsfjxKrqDptUfpp8mR44GR7
	CejGMOM00sabehMSye4BwQ8axovlWxmfdJSdvSw+ieksaTUsb3rSQpu6wBUT+pOEhzz1a49njOz
	PqfKpNS7n2X/GJiMAts1qYcTTu+fhpCDJPtW221yZKg485NUn0RiDU4aZXXhduuw8F8vmIMs9EF
	6G6GfIpvweBH+TZEDoYEQ0OXewk7m4SEwsoPdfF4TDbss5cx0vRoEsMQR3+kVdB0394hVjmyPw=
	=
X-Google-Smtp-Source: AGHT+IGUdxmEKcnjoqEdCbuH6KK9aWHG/KH7U1DjnF6q5AY9MZlPYni+3+TOgk8U92OpiYvQCGwyQA==
X-Received: by 2002:a17:902:e842:b0:234:9670:cc8a with SMTP id d9443c01a7336-2355f9dca47mr79764925ad.24.1748791428646;
        Sun, 01 Jun 2025 08:23:48 -0700 (PDT)
Received: from thinkpad ([120.56.205.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf53a9sm56361895ad.196.2025.06.01.08.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 08:23:48 -0700 (PDT)
Date: Sun, 1 Jun 2025 20:53:42 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc7280: Add wake GPIO
Message-ID: <wjduwhkgroqvzo25dwcspgrogz3orqab4tjosamxodvye47i4a@vd6cgknvx4nh>
References: <20250419-wake_irq_support-v2-0-06baed9a87a1@oss.qualcomm.com>
 <20250419-wake_irq_support-v2-1-06baed9a87a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250419-wake_irq_support-v2-1-06baed9a87a1@oss.qualcomm.com>

On Sat, Apr 19, 2025 at 11:13:03AM +0530, Krishna Chaitanya Chundru wrote:
> Add wake gpio which is needed to bring PCIe device state from D3cold to D0.

WAKE# GPIO

> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts   | 1 +
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi       | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index f54db6345b7af6f77bde496d4a07b857bf9d5f6e..ebfe2c5347be02ea730039e61401633fa49479d2 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -711,6 +711,7 @@ &mdss_edp_phy {
>  
>  &pcieport1 {
>  	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
>  };
>  
>  &pcie1 {
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index 60b3cf50ea1d61dd5e8b573b5f1c6faa1c291eee..d435db860625d52842bf8e92d6223f67343121db 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -477,6 +477,7 @@ &pcie1 {
>  
>  &pcieport1 {
>  	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
>  };
>  
>  &pm8350c_pwm {
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index 19910670fc3a74628e6def6b8faf2fa17991d576..e107ae0d62460d0d0909c7351c17b0b15f99a235 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -416,6 +416,7 @@ &lpass_va_macro {
>  
>  &pcieport1 {
>  	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
>  };
>  
>  &pcie1 {
> 
> -- 
> 2.34.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

