Return-Path: <linux-arm-msm+bounces-33295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9484599217B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 23:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3888F1F20EE4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 21:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF3E43AB3;
	Sun,  6 Oct 2024 21:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SOiaGrP6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E15512FF69
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 21:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728248465; cv=none; b=Vi2pt8uD1Oryk1jKiCGgN+VBr0a2Q39p728NTfs8395HwuT05X+gA8vgX2RR616LAJEFB7fJ0XK5rAIS0LdjN9sxWwPPU8vOhC/B8UoNbKoEQ+qcxAljqKwrdCAcB2IOQF7K/di1fzxHevcM9QhiZZ9PmkFWXcWMSaCvBhHhlyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728248465; c=relaxed/simple;
	bh=pc8//kKVPVBXlvabN/hzt/gk3ZNBOboLITX4xE4dMvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0/Kuvg7qtWyD01aP8X1y9z2Fr28WIdEd6iAGrIvw3yzCntKoIbP5r/90krNxrW4dXoKtrip9NmAKNYdJFlrtZxz1fiS6R7iF+bBICqLfNtxH/UM1EKwKnH7folIU1dXLmTTRkXhBBgDcHLO9pYopswQaUlu2seyKypkz8RHaeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SOiaGrP6; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53991d05416so4200732e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 14:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728248462; x=1728853262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wHv+kTlolQRcaMKgigpNuG/Kn+91LTfDW7oca6ZBhQM=;
        b=SOiaGrP6W0sW5S7Vzta5KeG3XzGkKvxueLtfLetofvpmdtI4KfN0UIN6gRADvsZY/o
         Xst9bOUSu0bIBh5MjmfQlN2CLgLLI4VDrZfs34p9LfW3T5vVyjS6U74C+F2CcNPH5lbz
         ExPInU48MUn7evi3jIMkaCAQW6zi5T5PmwSGCEVcaRwuDvCHSfvdEYuR9j4KRR62rYOY
         K/p+MGxJt7OCLK2FUUEjiXP5fDfr3Ewy09ST59NlttIHQiEcBzWyY35U4n82F/SPmBMj
         6Wxqv6/nbai/HoVufrUouqFlo1h/sCJ5HFel28QAnsnZF6HAmO/Go2kd6J2tmui6E8Bg
         x/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728248462; x=1728853262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHv+kTlolQRcaMKgigpNuG/Kn+91LTfDW7oca6ZBhQM=;
        b=teP0X8dNDz9OuHtauNJl9ZmQCSiof+FeGqVaYsflncEt7XQTskz7toFmYHPgeGSV+z
         Ppj9AP0zb5Msc56O6fcwAO7JP8iu+lN6HiG5V3nKOrIFh8p2QSNXyqi8d3v3TZjY2pt9
         Trwg754Qd6LgoIencV2WlCK8XdlqC9yrluDSO/+9t7x6r0t+M7q0O+9TXJ2EGaVlWSrV
         Np0zOCJxY+hOvcBxN0l/K2hmlEtyZknSzDQmyBXF87/mRadtfbgT4SbEbhQx4+UzvqBz
         jsvgBspbHNa//O0aX/Nzl+YYz7HpFZDdbgL/R9HBYBRA8qfDeWUdn9j129TX87zdgHcQ
         r36Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7UX0DBxK3P2yyTSD5qv2Pr7QhrrMNdVs1bbuKT+PVl13ITUUwes1Q/mOtwyFg2sLdQBma0nZUSVUNsCW+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr1cWJleeYWpas8lummwNyEyLrCiOcFgElDHLrLvMCdjtTBYdR
	Q1eKGsd5ocJwaKJ+TORbT1TXpyV89lEOBsP0CRb1QSdLVsBZD0zKP9LUv8UDA8Y=
X-Google-Smtp-Source: AGHT+IHGmws/UH8b4s8w+FVVdPBTcFdBRKUyJvo8OGeHGkHtmr57c4OGi7cgQH4rp1ZuhGQyFAI+uA==
X-Received: by 2002:a05:6512:696:b0:539:8cd1:848 with SMTP id 2adb3069b0e04-539ab9ed8b8mr4691760e87.61.1728248461451;
        Sun, 06 Oct 2024 14:01:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff1d10bsm613526e87.137.2024.10.06.14.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 14:01:00 -0700 (PDT)
Date: Mon, 7 Oct 2024 00:00:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jianhua Lu <lujianhua000@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add
 qca6390-pmu node
Message-ID: <ir27tt5fllg2hpumh43myeib6v6mikwqblbhmjh5gwxfnv3mba@begbmdmaqdkw>
References: <20240929112908.99612-1-lujianhua000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929112908.99612-1-lujianhua000@gmail.com>

On Sun, Sep 29, 2024 at 07:29:06PM GMT, Jianhua Lu wrote:
> Add qca6390-pmu node, which is used to manage power supply sequence for wifi and
> bluetooth on sm8250 soc based devices.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
>  .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

