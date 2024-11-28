Return-Path: <linux-arm-msm+bounces-39442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 772979DB84F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 14:10:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AFA916305B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 13:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E691A0AF7;
	Thu, 28 Nov 2024 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NPEVjmTS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6521E1A08B1
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 13:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732799419; cv=none; b=sTgS+oaqHSNElmR/SZUoP2U1ZMOGIqaHvywdYtsQ3thfeUMfxm7tGK5ujdA+Ns+HDaXzBNDTp7S/iGbIDqKz90BrPdEKdU0y4M0MDASYgX2nsCCIrLHk0Y3UNgbQRnDH9L2qVQ4ovyASzig9ZZp9TcyrwbWdqt3hoikhyO2cpSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732799419; c=relaxed/simple;
	bh=zBLn2JOZfSzHc56+BeQX/NmVHS7xKilS78jdBA6NbSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FXpJ2zNKU8jn0HTwp6JaY63y5tICdOmClgULAMs5HLXBS1dmsZxwK2tk8gijq4ABwgjBrZKxfZIxN9j/R2TvjbM84kKIOPbcRlab6u35xy3MhOAHziBWnzBbLTwtZoSqNB7yAa5SQYUWNEZ9NFui8zSfpDuE+6EFSD4VncNQKcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NPEVjmTS; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ffa97d99d6so8927561fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 05:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732799415; x=1733404215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kvNTzzEU4BAq35zkQFeqCy12uHiqzI5kAmvUt7YoTww=;
        b=NPEVjmTSxBL2zQIRXcJ5dmiDTggmF3xsg/lHnptCjNUU9FhOmKD8qFI817S7W4al9H
         pGBfp8UOzrRaES+pDlWnQRgDzi43+tiV2bcGrxSLtlQCOMD7Nq97ShgNA01pWau894Do
         vGY4xKFoF+7q/YeP0pgfjVT5CeKUMxYwssFQQaOy2wHkusP+YPC2PxCjX8iWu5+CDWd3
         OEoQqilO27wwrhXtZTWfl6QHaPGP3NZICKBIEYXxUlD0ZaYkF5zoQvQQ/OAKE9/GKU34
         ALolMvNcQ5srzLO4aAg7wF8oGwjAn1PH0yYX4IoTIO1YVX+ABN0+Ihra6/auQrVMGicI
         qoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732799415; x=1733404215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvNTzzEU4BAq35zkQFeqCy12uHiqzI5kAmvUt7YoTww=;
        b=Pex4qY98OZ1IS45xpT+2Mr5Z0gMQt3vb51+HJGqOUq6dGIXYTs0wIrbBENhdYVkqzU
         5kNVCFxnR14ZfQkTP41ATkdxeeXGnowVeLefZSkHhgkRHXVmA3pLYuGSwl7mCCL0U7e0
         5k11wJOldKwcB9l9EyzeKKnouQAOa1bBvhFwcoBr5460HWwIKZguDkF9V/j73Y+Lagzu
         FV+fARdhky2aa0nHtVpWerKcBBx4/NacuAdGzokBvLcRZe6ZYsA+GI+rpzlL+jowtc0g
         y9RpO3qt8TIAtM8aluJAnLpKxXqNRkPOf8jYV8uQ70QLdFUmpd896GYYRJGQS1zcjD2V
         ACNg==
X-Forwarded-Encrypted: i=1; AJvYcCUgJUC8yd1l4CcpheoUvYVD4+khPRbxunL0ZTO5Fb1f4xRliJ2PbghL6hVT5cZtbFGq504kL/2F18HrZyVZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxVErq2LX/d75SdjQ1S2KFMbzNKqVDzcxnSDBbfXzRVuet6Scte
	7bm9CbvotRIfRdawjTkqoihsjdix5A/lMDQwx6MJcHsZikPfPu5Jlunn4WNXmW8=
X-Gm-Gg: ASbGnctjlzSVPLRtkQxbPiWcozXF1zJ4al/TMSJwlvQAhixjVRDLSCHFn6EzuQFgJ7W
	rBfjYoGzIARveTaZOC7t0fwHQTj2zi3Y7ImlbnLHqVGI+Ik/zR+kCE2gl/U5tgEQzzxCAwA0qcV
	H6fzru9DwRE0XNZnt7WNilPyK/TIq9TKYY6s1DOEOaX0gqTrTEKzvqT2MWo1LfS2nPcfVkz5laR
	bO3pmODZODvOCBU3Z+HtmRIfnIAEUK+oLkvt3BBCjVhlOOcyFOtlTzfGohS20iCGZU6PazCM+vC
	qnYxW6DRmzT7O1GKPMoixvI00dI83g==
X-Google-Smtp-Source: AGHT+IGOYh91Xj2WHbsqMNmtrL4jcUstcbUPpfSyD4+4zap0RPFXLe4HzprRrtHMAghWKtNFtt8YIA==
X-Received: by 2002:a05:6512:3502:b0:53d:eef4:8acf with SMTP id 2adb3069b0e04-53df00ff76fmr3871217e87.45.1732799415479;
        Thu, 28 Nov 2024 05:10:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f15asm170927e87.138.2024.11.28.05.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 05:10:14 -0800 (PST)
Date: Thu, 28 Nov 2024 15:10:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tingguo Cheng <quic_tingguoc@quicinc.com>
Cc: quic_fenglinw@quicinc.com, quic_tingweiz@quicinc.com, 
	kernel@quicinc.com, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Adds SPMI bus, PMIC and peripherals for
 qcs8300-ride
Message-ID: <sxbjxywwjbep5rlndxoi5k62hqs24biryslkwbcxtvz3ilypvl@qi4omifueyqu>
References: <20241128-adds-spmi-pmic-peripherals-for-qcs8300-v2-0-001c0bed7c67@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128-adds-spmi-pmic-peripherals-for-qcs8300-v2-0-001c0bed7c67@quicinc.com>

On Thu, Nov 28, 2024 at 05:40:15PM +0800, Tingguo Cheng wrote:
> Enable SPMI bus, PMIC and PMIC peripherals for qcs8300-ride board. The 
> qcs8300-ride use 2 pmics(pmm8620au:0,pmm8650au:1) on the board, which
> are variants of pmm8654au used on sa8775p/qcs9100 -ride(4x pmics).
> 
> This patch series depends on the patch series:
> https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/
> 
> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> ---
> Changes in v2:
> - Fixed comments in community.

comments in community? What does that mean?

> - Added arbiter version(5.2.0) in commit message.
> - Link to v1: https://lore.kernel.org/r/20241126-adds-spmi-pmic-peripherals-for-qcs8300-v1-0-28af84cb86f8@quicinc.com
> 
> ---
> Tingguo Cheng (2):
>       arm64: dts: qcom: qcs8300: Adds SPMI support
>       arm64: dts: qcom: qcs8300-ride: Enable PMIC peripherals
> 
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 23 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 22 ++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
> ---
> base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
> change-id: 20241122-adds-spmi-pmic-peripherals-for-qcs8300-0a3c4458cf7e
> prerequisite-change-id: 20240925-qcs8300_initial_dtsi-ea614fe45341:v2
> prerequisite-patch-id: 73c78f31fa1d504124d4a82b578a6a14126cccd8
> prerequisite-patch-id: 5a01283c8654ae7c696d9c69cb21505b71c5ca27
> prerequisite-patch-id: dc633d5aaac790776a8a213ea2faa4890a3f665d
> prerequisite-patch-id: 9ecf4cb8b5842ac64e51d6baa0e6c1fbe449ee66
> 
> Best regards,
> -- 
> Tingguo Cheng <quic_tingguoc@quicinc.com>
> 

-- 
With best wishes
Dmitry

