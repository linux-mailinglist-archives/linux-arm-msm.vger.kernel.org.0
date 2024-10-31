Return-Path: <linux-arm-msm+bounces-36585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9589B8157
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 18:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BED8C1F25CB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 17:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92B21BDAAF;
	Thu, 31 Oct 2024 17:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XuThTd5m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857231B3B2E
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 17:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730396089; cv=none; b=DQjlaxqCx98DMUCA405QycLhiRmMJfhRfe1fj46hRN4RV+XeaOIIM4FXHPt7HRu5aFuEks1szYQ2OzqCq2Adr90kK9Y2FMU9luAwVEsiDkSKtiTObNhAam0QRSINKoaWaZepV0SOvXOdlHXxRFab2myFol9qxEEuomWTd/y2ayc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730396089; c=relaxed/simple;
	bh=cbeHlvePxEgJXbsgXRe4qLP1Qd5zm23lX6qTD8wO/iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUEsI9OBsX2BeBz7kZGp0fChrndSRFESmldOuhhZapriYUTOT5uDeW20wrlgvERxrhgj30+SMuiz1JfEFJq51fx5PBxxpEaq0ebVH5k0aHBQhV4xgcxQQvk+bRWXN8H95PxAJferCTVkc6cd3M0IW6eWZ7WtcfIWOKtjQIV3ZFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XuThTd5m; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f1292a9bso1511031e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 10:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730396086; x=1731000886; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fgyIh7I+uF+AidcQv9WavMCfOun0eWZrIXu6HKkgwI0=;
        b=XuThTd5mIVhNtI5FPsxUVJeBmNlydpH937ZLsH8Ef0erRd5JIWqCwMqe3Du3hc8Q9Z
         gdTzUVngScNPTRJskXyUsizbvQYzRw38JYD7O6JtMf5N8XIrO6E7Iwi1mVvlsmTiVyTo
         doK4Dvy3uHICwzHGwmJOAuTZzqaLLBIw6GR7dCePTqP2IDIovt4WYkgQwtP4+EjetMYq
         AaclW/hyn3uS6Q3o2T65BbBd3ruW/TVmmqMoVfklFCR0MnyLb+DAiGo9XyLEIn6aKdQS
         XX7ke7FapJyGsNiZ/XknfyEHThbLdwIWiC7HLY62n7pV/bcRdjnPcuqt94iwBQU/3Bnl
         5X7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730396086; x=1731000886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgyIh7I+uF+AidcQv9WavMCfOun0eWZrIXu6HKkgwI0=;
        b=rOjpa8YoT/f9OK+P+y3/O8GrrY7RJv47/40zebWFUkMcUCo6aDDIYJG4Sw8uvFi2mK
         Cp9d3mi91SgruVaGaxsdkU3J6ZGAgDoS/U7smXubo6zVqqkZnT9JbIkgTrLyI7yVhmMC
         8svPDLIcoOgf57xxQdA9unuHTyiMbIH+hZwq347i3xikH47lOTI8jLVVNGtnw3HszKlw
         bnwK+iQ+Bz+autaBnSfR3S3U8C21w5PLO5XusP0POVWTL1AW8eI66HWqXDCZruFuvkE7
         ZHvVlY0F9G801m/71foMRl/Tj/aFhUh7niLLaRDaiB5zdcovqZ7usz5wASj1TEbA+30v
         dO6w==
X-Gm-Message-State: AOJu0YxYiEp2GpPKTGywEL0o/KwaS3RXmdUenBGHcUk7IsJ7J35E4bCt
	MCyVhPtZmgOe3j82lwcQyV6TRV/XCRR+f3qKMQfUf5VBJHWM0gu+AV4qRr272D8=
X-Google-Smtp-Source: AGHT+IEm54sjQQUUKBLUvmio+DiC1Z3Eoj2tBNEMV9t8/e5e/FsejRhG4++UnStFvHO5bn0kkfgjqw==
X-Received: by 2002:a05:6512:3e26:b0:539:fbfe:418f with SMTP id 2adb3069b0e04-53b348deb5fmr11781880e87.32.1730396085526;
        Thu, 31 Oct 2024 10:34:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc959e0sm272433e87.9.2024.10.31.10.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 10:34:44 -0700 (PDT)
Date: Thu, 31 Oct 2024 19:34:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: qcom,pdc: Add
 SAR2130P compatible
Message-ID: <t2trcojqskryzbuh6cbuqev35eioduarneskwtcm5aeeqlvbkv@3kj4x36ebkqk>
References: <20241017-sar2130p-pdc-v1-1-cf9ccd9c37da@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017-sar2130p-pdc-v1-1-cf9ccd9c37da@linaro.org>

On Thu, Oct 17, 2024 at 09:13:01PM +0300, Dmitry Baryshkov wrote:
> Document compatible for PDC interrupt controller on SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Gracious ping, the patch has been acked by DT maintainers, but is still
not present in linux-next and got no other reviews.

Krzysztof mentioned that the patch should be picked up by Bjorn, but all
previous patches for PDC schema were picked up by Rob Herring or by Marc
Zyngier (and one stray patch was picked up by Linus Walleij).

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> index b1ea08a41bb0c369985c5f2d5b4c4644367a88dd..a54da66a89e73212f7b965997dc487d9f0d421b0 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> @@ -29,6 +29,7 @@ properties:
>            - qcom,qdu1000-pdc
>            - qcom,sa8255p-pdc
>            - qcom,sa8775p-pdc
> +          - qcom,sar2130p-pdc
>            - qcom,sc7180-pdc
>            - qcom,sc7280-pdc
>            - qcom,sc8180x-pdc
> 
> ---
> base-commit: 7df1e7189cecb6965ce672e820a5ec6cf499b65b
> change-id: 20241017-sar2130p-pdc-18d3f08abdbe
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry

