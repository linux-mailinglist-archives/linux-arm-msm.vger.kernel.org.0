Return-Path: <linux-arm-msm+bounces-21687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CD98FC029
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 01:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B78F3282F85
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 23:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB8E14D2B8;
	Tue,  4 Jun 2024 23:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LJoUNHlM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6721411F3
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 23:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717544843; cv=none; b=Ej4QkNtzfFPF1WYA+fpk+zqDxXTfkZNSToEvKwSA/krhNYcHVwBEPumLUQhG77lP+9mdqEjlghWZn2wnbyXXYwR5MJUmI34wlsexabPBYXo9+OHuQTxFC5S9X3UEvrwJPs2Y8X2+JyBExP+UTAWB0HXEZDAqM941C2TdoyggLtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717544843; c=relaxed/simple;
	bh=mmylbRfB4KEKXyGBeR6H9S03CC6T+tHFQPGAlkjagrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TrCmo2Xdm2s9VxireWaifJZdNxQjkp9EBndzQ2/U2+LNJptq5Zvxm9t0adQLakXvMgjHb1bTxjayXpJljOwE9tlwYKFpoeaB2hJT4alYtak5dxHuvp5+ieq3KOLLySF08ehS/XEqZMkUHYYO3QIrr7KfbFahd9eiIvSCv65NMsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LJoUNHlM; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52b9af7a01bso3469168e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 16:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717544840; x=1718149640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rBt8eFQEo5ebAofL3QZI5AwFoi6fSHWEjf2SqXfLAIY=;
        b=LJoUNHlMmWgzBdALd6+b5i7UoZ7DhTNz55ERcKg6LAHG+wMG4Yi+xGRuufelbv2Lr7
         hXYaACNa17rhrOp32QuqwjyWUxVvCNYm/ogvCrrxDvV6z82kNMMsCw5lCLtMGs2Z1fjw
         DYfYm5+gpFZkcLqfBkBnuNIfz6zXDl6qXd+VRD45EXdmGEarlXXTcKpXVUX3NaIzauQR
         iLCUFEofZ+4g+hQC+3LiWdHp2gNZnApsGiGjAROvkqGVRtjKum/MVPJ7GggpnIJ8fsvI
         Scb+mNMNHG1Eld6+2VJ7VetHsO1B2A1sy8JR93AWdsZG0sMQ54Jy92hYJ8Ql52fgSIEc
         EtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717544840; x=1718149640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBt8eFQEo5ebAofL3QZI5AwFoi6fSHWEjf2SqXfLAIY=;
        b=XaG+KLukA67aXs4JnXFnbl3xWZ6s1bqUMRHgOv35W4b65i/QdG154X2UYPbbH9jgpO
         YZ2pfUwYzr5iY2GQcQD7u3xVb8OV8o1xpp5okbIwZb5mAukAHTXvg83OCVnDYiQVvPkw
         pnjVZAR0BGmHQHiXrDUECsxSTzTJ4gFLFaOmdXhIeb4KxVgvXVAUHnNF39YHdSo/z/nB
         xy1lLnX3dnBJ6aPyxpgjE13S7G6VuBO7LVxq2CD0uu3v6hImrNk96sBjzOgL7rUXNaEi
         crS6d3FimHo8WUmJiaKwdAR2oZGJV442O9BC2s4YiB80m2vylPZVnMzCAQWsH74Jf9Fl
         G6ig==
X-Forwarded-Encrypted: i=1; AJvYcCWt7xh0v/ge/dBZVm5uoPNML26LJQFrzifnsgBrwse0/P5zViDSh8sAa5abXIHRBUKL9SKVGH6UwifNtFGwnMkywkSLPO6797sULj6lXw==
X-Gm-Message-State: AOJu0YwULcbjow63o1Y4pgVvWHkL7HYw1X6dXfoLKrABUEZD6tSXBWsH
	uWFEKz+OAuhZtjg9xfqNsfYxANTDHTMvmA5WwN+R8En310gU/nnBCNHUztC43wY=
X-Google-Smtp-Source: AGHT+IHbuLGX10F/ysmCrzCCkUQnoJywch6uPTMMgJQLv8uC1wFTg2UN7uiqWbEABiv2i8OZph92fQ==
X-Received: by 2002:a05:6512:12ca:b0:52b:86cf:91b2 with SMTP id 2adb3069b0e04-52bab4f6fbbmr565864e87.46.1717544840076;
        Tue, 04 Jun 2024 16:47:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52baa95c304sm111154e87.276.2024.06.04.16.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 16:47:19 -0700 (PDT)
Date: Wed, 5 Jun 2024 02:47:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, cros-qcom-dts-watchers@chromium.org, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, Pin-yen Lin <treapking@chromium.org>, 
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sc7180: quackingstick: Disable
 instead of delete usb_c1
Message-ID: <4ksgrgsmbkze3m3sv2ikajvkv5asehzzhuw3c45hob275alvfo@yctbxgiv5oe2>
References: <20240604214233.3551692-1-swboyd@chromium.org>
 <20240604214233.3551692-2-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604214233.3551692-2-swboyd@chromium.org>

On Tue, Jun 04, 2024 at 02:42:30PM -0700, Stephen Boyd wrote:
> It's simpler to reason about things if we disable nodes instead of
> deleting them. Disable the second usb type-c connector node on
> quackingstick instead of deleting it so that we can reason about ports
> more easily.
> 
> Cc: <cros-qcom-dts-watchers@chromium.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: <linux-arm-msm@vger.kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

