Return-Path: <linux-arm-msm+bounces-33279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4902399211C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 22:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9426B20E71
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 20:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7D618A94E;
	Sun,  6 Oct 2024 20:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cs8o1h4D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639A7189917
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 20:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728246436; cv=none; b=KPj5UL00xeufG3xHXDcLbeZOsGPeGTfp+pr+SI8Lyhz141OCkl7ASquQG8HLjwXEaUx4FVP/UiLTgK/GtdPuran1yLp2ZorPThD/louo1H04LpWM+VsXec7fsfrUtSojo9vR1oiw9/sAN7OCvcTWdvUk9gA4oinp7PtvftXAr2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728246436; c=relaxed/simple;
	bh=yhPA2kPPr+irT5h+ngrDZkWz+Sy7YuDwpnMMCxiCuOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5ZyxsFRzibWCobc43b+t2nUlLHBe15ogKX/TYMFwsq1p4aE5uPx+TRBGQUVBJWCSD8NHYfdxSwl3FDxYrH6+Rloc9Ro0WNQjPE9fb22TAOi4FcqjWTrWK+Wcj3UmS5jKgWgxUIMNocI0MGqOFZZNbCNG/vVzZF6iRNyxTE6Qmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cs8o1h4D; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5369f1c7cb8so3913357e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 13:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728246432; x=1728851232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KG4Cu52jH1+wuoZCYvuQvhQt8ogTWacNvYvQVScmYPQ=;
        b=cs8o1h4DeEQbk18TuCqyDOuOAcfbRQWG/Y6NRloo73oVk9mrTExR0aM2VQIEXo4oCm
         Mus87edzbTlhRLtJ9a8fvfREv/i9SwEWzVoIMhXcMP2RFoyQ9opKVwBJ0OshjG0sDImR
         8EfeAu7LqEk3DSAt+AQUCmet9C+cpWf959JXNCMKCf1Ve5Kxm4YyS5yAEJvHCzba2lQl
         JVel2nzEx93aAtQQ+htnRfGo2ha99Lmbtxv+nEJEOWab9lf31S71FgrgiTXLjl39CLZI
         Z3DK0kYqC77lOYgvY62jOkud5v83g2usyNF+fo9LMTFRU92+KtzjFbbgaShknmColFxI
         eYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728246432; x=1728851232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KG4Cu52jH1+wuoZCYvuQvhQt8ogTWacNvYvQVScmYPQ=;
        b=pO/suBCZEKaQWuoULpcIVy1860FaF2dhaa18Vd5+ulsfIabTgBwniKKp+q/gjIydRZ
         7VjN8Ft5Iwd8EPge1Ermac3HndkLD9MAQPQzoZobhKTi6dW8w4SOo2inqPstZnxOpcdy
         /lfwlxDkbe5whefc7eZ98H0ggfnKDv23VaHKOuYKUxICacoxdtAkVGM5FpAlrmt4IwFQ
         aL6TJ0pa6Bvgjj34m/edWchzNT/T4umFUcFxtZninBm6fZ1jBOojHJDxWhjMl+deOCYY
         AwsmeHSyFGm6TW1IQgJAhnecCWrvF4nD8gxpNVeNUAbOu2UADkaddsNBabTDHfmJ/JTC
         0xRg==
X-Forwarded-Encrypted: i=1; AJvYcCX3CVF8FKpx76FaHUUnFqAZtjucWLLELnH0BxNsJa7H6HqA3AHPDs3xOZ3BMiC4y9brohn+1TyjXLiuj3I9@vger.kernel.org
X-Gm-Message-State: AOJu0YxHaFRR314eE7dUr6lgRXR56EmfxctQPghEkocoPLVLKP5FEjhd
	SXvIsNf1vKKH7KpMG2Fxnycm+2k3hV+3qo8L8iq9Zn2YcG5NcdUc275Q1qFigTI=
X-Google-Smtp-Source: AGHT+IFXh/4eKKDLzO40PDk0m4HqYHS84qgcRmgFjXIg9HcENQ7CKLytVUOSpIL6hB06NTq4BXBqUQ==
X-Received: by 2002:a05:6512:104b:b0:530:aa3e:f3c with SMTP id 2adb3069b0e04-539ab87476dmr4490318e87.14.1728246432493;
        Sun, 06 Oct 2024 13:27:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff235casm599750e87.226.2024.10.06.13.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:27:12 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:27:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm6350: Fix GPU frequencies missing on
 some speedbins
Message-ID: <2hhqe7s5agfcjh3gvunggxr5boblc72747lo2qktprxlibiz3x@qdgvna6ufz3g>
References: <20241002-sm6350-gpu-speedbin-fix-v1-1-8a5d90c5097d@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002-sm6350-gpu-speedbin-fix-v1-1-8a5d90c5097d@fairphone.com>

On Wed, Oct 02, 2024 at 02:58:06PM GMT, Luca Weiss wrote:
> Make sure the GPU frequencies are marked as supported for the respective
> speedbins according to downstream msm-4.19 kernel:
> 
> * 850 MHz: Speedbins 0 + 180
> * 800 MHz: Speedbins 0 + 180 + 169
> * 650 MHz: Speedbins 0 + 180 + 169 + 138
> * 565 MHz: Speedbins 0 + 180 + 169 + 138 + 120
> * 430 MHz: Speedbins 0 + 180 + 169 + 138 + 120
> * 355 MHz: Speedbins 0 + 180 + 169 + 138 + 120
> * 253 MHz: Speedbins 0 + 180 + 169 + 138 + 120
> 
> Fixes: bd9b76750280 ("arm64: dts: qcom: sm6350: Add GPU nodes")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

