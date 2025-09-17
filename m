Return-Path: <linux-arm-msm+bounces-73944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECF9B7FDEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 447D4627C09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CA42BE7B2;
	Wed, 17 Sep 2025 14:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jzGEKl2l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4343132BBEA
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 14:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758117759; cv=none; b=HQvgXRDriZtkWcfL7XfKMfR1VuuPQL6IEQYMksC1XUK2J6EMOGydOIxc7VHf73sHor9bK2sjLommL2q0pYInFihzi7op95c7v+mix/Z/AUC4xAFdds5nL8gw+9x6a592Ec5+G3gRVc/YxcIF5k3b1JNQajBqipLON1p3gGzI374=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758117759; c=relaxed/simple;
	bh=RefTj2LFec46dsJYSPZ8tEBm1+3mD1JsxhEJXrBH8b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LiDzVcG1tEIfWsxUQYoHzP38PD0cGEBy3Z42TImeHzedyueBz5groXMGx/Uiuuu5gXjrSP02eoA8Uz9dcDrQiGfUPi0aUnbYpS1BJlvJn2NlEARXERhPm716M/ee7I7EOtn7O4sj86Oa4MUQGSqK0OH4jj+C4dgag1Xr0VD6Hek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jzGEKl2l; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b0b6bf0097aso702828166b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 07:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758117754; x=1758722554; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+aI0KZC1S6i6KZFgi+7mCnlg3sWeGuC+L+mdTKqHXWA=;
        b=jzGEKl2ldjQhOOSsKb06Fha6LgYoyLdKgQ3A4Jx6N9aXyL25JkKSdHMv3WQPzK44Jk
         2e2A/q4FWpYAEoco41Qr6Fg/vwnaX2gEb7tp/l5+6uXdPDdptI4Pesl5xHH4cg7APoDM
         xXr7IWGz569kWGi6atos85QR0WvnEdd4S1KRvyYLfeGlvWeUptRQx2C+hTl4q8K2moYJ
         KCrg8a9zN4bbWJ6l03a7dIFkqLljT/+rnYA0N4ceMuPNoy+7K/CiANyoHDZf26G4JbY1
         GpdzsZ05mW2cHfUkf910zsCe55jgTVY5t7IEGWbZmWjdYhFdhCAngArPksI90WX4Wf3q
         np0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758117754; x=1758722554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aI0KZC1S6i6KZFgi+7mCnlg3sWeGuC+L+mdTKqHXWA=;
        b=U3SqbFYZpQVPHK9znuXGrVOnLv/TeO9hRpxr0UtKXsv3ZQhCGwDUkcCjIf5OFXoGGO
         TYbnajUW7Xa1ta/Wo6SJ5QIxqyokK6BXyF/JRyVOyJkedxJ+gYpkZhfq2SBlq7IUgjXD
         Rw33mCZkrO65E1CJPiSzzeyedTAJjk6hVwbZcC8dbfopVWCXJDx+3+amAJ8qZ7JbtIVx
         idlSQFywv4SDlbTdKSh9J8LJKSIeYNpXbbyWDWvU5yzRlZOM8gwAfIZvXJfyqg/VwYsh
         //IxTJDV4WPglI0+ixR1X9WeJUSv+F+wyd0s9ly2GZJhkxOLBVfLl+42GAY8fcd4c6cy
         2xFw==
X-Forwarded-Encrypted: i=1; AJvYcCWC1aIPhsADViEYzQ7a0Bc6B6fa165AODc9peTjayKA7CDLVvPdhzfjTjwiiWals/eDMTkkLEs6YuzmEI0g@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9+3ZkWjhWZWc9KNdqxw6id57ucTAesxSjKU2Jku+Msbc3y7zG
	+mdxQFnWrrAkntCU/aHsEDopHWz4Bz774C9YY1/SbFsGUYNgGowYmhQQxnRSv65fEfY=
X-Gm-Gg: ASbGnctThsquNZ9wAhJ/c+QfWa9s5ui2ioMOPtYpZgdxwDj36f/B5oX5NlCc3rJ3HsV
	STL5ehovTt9Si4mQX+/4DidtrKhxmBnf0sjAlHR6BdHeg747KXF+oOWhpbtK8toMlQ8cNy5WDtc
	jRflltcUIUUZUW+QCMzYPi3ga4tBfcSb/1DT6YVsHjahtCv5bP7MfMYUgGIHxOaLXr5D8o6uaPd
	/mRGsI2dd21xJxZ/X1ILN06KfrCmeoTE2W3pJetf6eGcjZ8hhFAVRbDEBWtakTp3BXpmG5yIPGT
	WkJ6b9RBoEVFQiVKxpl03xBbLtuppDbnAEa9kXjNczpV6f3FJTu1UN8XKopBD7j1v02c+aS5oEf
	ZekKUnQ8qPOBwAcqgG6irLDVKLFZcSQ==
X-Google-Smtp-Source: AGHT+IG4Gian2+1eYXK+LJPiJ/IOk7YXX7BNAP8tJbijpr4j+Tg2SNRKcI5T/sLwoI+EVC41Iboriw==
X-Received: by 2002:a17:907:9691:b0:b04:3b97:f965 with SMTP id a640c23a62f3a-b1bc1168641mr281451566b.49.1758117754340;
        Wed, 17 Sep 2025 07:02:34 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:96c4:427:30f:64da])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3347a4fsm1352382866b.103.2025.09.17.07.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 07:02:33 -0700 (PDT)
Date: Wed, 17 Sep 2025 16:02:29 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Paul Sajna <sajattack@postmarketos.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Amir Dahan <system64fumo@protonmail.com>,
	Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v2 11/13] arm64: dts: qcom: sdm845-lg-common: Add
 bootloader-compatible board and MSM IDs
Message-ID: <aMq_dbLRShTVLlc8@linaro.org>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-11-5e16e60263af@postmarketos.org>
 <acb4f8a2-ff08-4a90-a7ad-7b25a7f4b6b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acb4f8a2-ff08-4a90-a7ad-7b25a7f4b6b0@oss.qualcomm.com>

On Wed, Sep 17, 2025 at 03:55:47PM +0200, Konrad Dybcio wrote:
> On 9/17/25 3:09 AM, Paul Sajna wrote:
> > The original bootloader (fastboot) requires board and MSM IDs in order
> > to boot the kernel, so these have been added. When re-using the same
> > files to chainload U-Boot, these compatibles are also needed to ensure
> > proper booting.
> > 
> > Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 ++
> >  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 1 +
> >  2 files changed, 3 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> > index 1baec758c7d881026bf6001a0a305687d7a14b40..a513cd931b3a984443183ee4e8df7b0e45732630 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> > @@ -5,6 +5,7 @@
> >   * Copyright (c) 2022, The Linux Foundation. All rights reserved.
> >   */
> >  
> > +#include <dt-bindings/arm/qcom,ids.h>
> >  #include <dt-bindings/gpio/gpio.h>
> >  #include <dt-bindings/leds/common.h>
> >  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> > @@ -29,6 +30,7 @@
> >  
> >  / {
> >  	chassis-type = "handset";
> > +	qcom,msm-id = <QCOM_ID_SDM845 0x20001>;
> >  
> >  	aliases {
> >  		serial0 = &uart9;
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> > index 8c1692f86e6ceea7b718361965e78f95d39373bb..beb1372dc6c17f5f06c2044412ee1c8165858cd1 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> > @@ -12,6 +12,7 @@
> >  / {
> >  	model = "LG G7 ThinQ";
> >  	compatible = "lg,judyln", "qcom,sdm845";
> > +	qcom,board-id = <0x020C0008 0>;
> 
> This is almost QCOM_BOARD_ID(MTP, 12, 0), except for the odd BIT(25)
> which the dt-binding promises should be left unused..
> 
> +Stephan maybe you know more?
> 

I'm not sure what BIT(25) is exactly, but I think you can generally give
up any hope of trying to make sense of the board IDs of large vendors
like LG, Samsung, Motorola etc. It's a pity that Qualcomm has never
created a board ID scheme with enough room for customization for
vendors. The qcom,board-id scheme seems to be entirely focused just
around Qualcomm's own boards (MTP, QRD, SBC etc). That is why we ended
up with every vendor using their own incompatible approach. :-(

Sorry, I wish I had a better explanation. :-)

Stephan

