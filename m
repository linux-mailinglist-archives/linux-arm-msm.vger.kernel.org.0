Return-Path: <linux-arm-msm+bounces-19539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6858C0712
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 00:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C420DB21A95
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 22:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD3A132C39;
	Wed,  8 May 2024 22:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="niFLhDAd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8840D132C1B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 May 2024 22:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715205834; cv=none; b=KLRENlMZokI45VVB9zFwp+WUIeeCcR2tSRfyYM6wDzRuoYVudDtFJ25F9QigXs4nxN4N7arEE4yZ+TL3rxQ/9uWaeweuFFVZ1wKXsB5fpz1t4DeEjpPhC5izCHDe1q87zbUUWvM3AGO6FZk6IjVEWqM4LiGBnJqCQ6dnC3FJffk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715205834; c=relaxed/simple;
	bh=96vmw9sZP7htVh/QPL6h0Ai8HcoMhL+MI+Xk9QD2OX0=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZBaII55JXOmleI/YxHZh2YLlaae694bWakrOWN3plvp00yNP6EdVHm9ubml1P3MCOPn7sjyIIcqD9nXvQhVnbC5HdzuqLGx1kcfSG7S+l2+aO0U+gaTOQY2Fla/Eo7lSn4M3vW09BcYvwSLViGKBuHzesylAbKuPDAMCVkkuM1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=niFLhDAd; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-de60380c04aso300686276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2024 15:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715205832; x=1715810632; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96vmw9sZP7htVh/QPL6h0Ai8HcoMhL+MI+Xk9QD2OX0=;
        b=niFLhDAdEWOSfzZEXWpD0nv7vClze8dbf+j4xkB2NgV8q/xCR82TxKPi/b6IcMPbeG
         z0QBMVeIsU8ss/lH/GXDX3YT+wA8LvXuN5/iDAoZR+dS2tvUHx53thGkkWZFpGkR6tLM
         NCwOSbz8wE2SbhGKB6+fKCn2hHAo2i+yVxVlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715205832; x=1715810632;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96vmw9sZP7htVh/QPL6h0Ai8HcoMhL+MI+Xk9QD2OX0=;
        b=AX4OFGYWPgclMZIRiPOXe+ZwDH3G7M4z9uV6WjWHu6y4PxpbRhIx86bbGjTBkXhqRG
         4TzP/6v3LW5w7AET11xjgq9D6yakLmZluzds7L03ataiu1B1Ubv282o9B/WsEtOcZheu
         em4a/srxzqCTTOBFn3OGj7WqcjxO35eluZO7th4L/+NZYychZyjjxbSMaakUHIjzQB0M
         Y6PS38cajn/E02yZJeeJWC7K1fGrUOapFM5GO66to0cl2KioHGzj2nyCIaJq+PyLTKWK
         fbaoloSUMZz1mDN1NiDDObpGWWztG0cPQVXEDabsH7FomVvZ+I00Bw+g/DKTV6qlBGJy
         iKDA==
X-Forwarded-Encrypted: i=1; AJvYcCVW4DVQUiNVnC/cWmnOm4xkSXpT2BG4UCz1Rpw9Uj3zi3eE3P82X+8jgsXFWhDflaWTawjX3qF8KW/McKM7/tWNvLVEMtyICrRHyWTHjQ==
X-Gm-Message-State: AOJu0YyqHPbTGxrRH/SxWvjYvRXy83jxgikNrbjAt9iYN2adtzHnBAVJ
	6bJWytstWhii3320hs0tfaKRO9IHvlDcSsMbl8ulE0FJ9RSf05KpXlBgV7woWXj5r0MVrpXCPkS
	U3OG+Jg7KMCE2+DZL6mWAZfvnpvsK+Isai0x9
X-Google-Smtp-Source: AGHT+IGV+P68fPaEtQm2PeJISJUIhS+PtZ4zxOJL+5m8uOShfZjtjoYC4aTyUsAJcLofHgE4zkZtzRKSS6k1GmygOa8=
X-Received: by 2002:a25:c549:0:b0:de3:ecc8:a0be with SMTP id
 3f1490d57ef6-debb9d8ce90mr4661286276.20.1715205832681; Wed, 08 May 2024
 15:03:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 May 2024 15:03:51 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240506150830.23709-6-johan+linaro@kernel.org>
References: <20240506150830.23709-1-johan+linaro@kernel.org> <20240506150830.23709-6-johan+linaro@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 May 2024 15:03:51 -0700
Message-ID: <CAE-0n53sfgZhmFTE=a0HEp4n=DrfsTPhK865yWYAdji7tsi7wg@mail.gmail.com>
Subject: Re: [PATCH 05/13] mfd: pm8008: use lower case hex notation
To: Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Brown <broonie@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya <quic_c_skakit@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Johan Hovold (2024-05-06 08:08:22)
> Use lower case hex notation for consistency.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

