Return-Path: <linux-arm-msm+bounces-35405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1489AA0EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 13:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E86C6B215BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 11:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DC219ABCE;
	Tue, 22 Oct 2024 11:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HbUtiiEt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68186199FC1
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 11:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729595675; cv=none; b=FrMzk5YGPIvDh5ykOy8iaF3mltHlla+jcQzTM/PUHjnKQis0XEPqHO6nQuEIPiAz8SgOfWESZTyRs934+aKubxeUERNVqTzJ0znkLD3rQ8PUgmH55vyJCCcGPZMVZ5sWEy6jKTKqYuRmV8fv6qayD220LOxcvEpFXkrKlZli64o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729595675; c=relaxed/simple;
	bh=RDoWcRABCczbsRh/bIrxVD2pdjz24qe0cc2s6ituHAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j1DbYv6/QzYoklIbJF5pwFyzzvoO0Rf9YZJSsxC9b75lgeaHknCpp+Q6jjU0l3mP6ccZrZrLhsWowwCegLUgLO8fOH/tAGzQYRy9Hb90cDUsEG4jjPbpM8QLa14E1bqL9jryvv8Yg/4uSdjgLcKW1RhXKZ1GE1EiG4WeuYdAhbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HbUtiiEt; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e29687f4cc6so5439567276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 04:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729595673; x=1730200473; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nH7CYeO71ANQYCtq9Z6qGrFirusG6U+5W2achtUgNO8=;
        b=HbUtiiEtWnN/6J8LNeCONC0FvZnN5eUYvKsx/AgiTAmvv1ufu9WiEbXzFnXr+TYKpT
         B3sxIrTQ+X9p5576DqckXk8RF/GZlO6Arv+xPBnJiI6hqLCq64kYRwzYpiIXd8efMiwl
         tlbSrtIzDfBm71MbjHNcCQNcqSyR+RL+0X+s8yNMUv6grjQnDOzSAOIk177w7564L9cl
         4/jPKK9de0pxEtoyjdi85RLGmo5TOfXOQ0fP7+G3rkNYsf0RaapxrK6XTsAdpJhsUXQD
         m83sak9MMajN4ykVtpVFr2ZLGWfNHuU7vMC2G+nDmYQXm5TKJ80uJEoPLBqJTlquamk4
         kdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729595673; x=1730200473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nH7CYeO71ANQYCtq9Z6qGrFirusG6U+5W2achtUgNO8=;
        b=VfJJmgU10+93D1OKUJdiGPTEoYan8iPBNo7EvJSRjSIGkFpHyxLji4jRkwx/JjOIIQ
         DCzm5/OuE4cgZ8IyWkVlyA0EFv2d5D+vzO1HzLSwc26RpaeKaMgpFelTXeK+wNAvXHL4
         Pi0xUgL5l6bI0LWBW2AYZrutnR39YQdGjEFBBwJ/qg3fasE+Oi3miAAwdLBtOshlRMKn
         fDEniPC2HBV4CoHtItS4WwcFEtagTeKKaahCwiV1pYBRlx687bV2wpiJg+54MW/JsqMf
         Y+miyUBy/4nnpBFanjeALGk7rFWTJNmsu3DPL0XCDE+PTllOIGRRSr3LQPTjWDzvESL8
         RgNg==
X-Forwarded-Encrypted: i=1; AJvYcCVyQFThssAtwjX7DTv538VcPB84JbHPUkF+7GGdx4TMrMxHfXyD5hmu/xgdAT7o8Z1yHxmyO5SU1O5jQPL9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr2Ewro8PGhd8kAhgaWS5lEJp6WrWlaCHVJ52tvEgO+slhrYPp
	q6ll/bqaJ309VjB/YQ8V40AfBxpymJcLyljrC40osP0xDyzWPJnyD2TXVsU+Te+CDyPhdBax+zp
	Xf62LCzUBB6vA98Y5kbGbDNtOS49YEnZv21YkpIESA4bj33Kf
X-Google-Smtp-Source: AGHT+IEO/xvtb/gCSTdniTtZAz329siXTAEkxHcZHf2dVBhENnXkUopUfXByHrvSGCkPQNNCRHhUMb/Ci3JVE9kVetY=
X-Received: by 2002:a05:6902:991:b0:e29:23f7:ccf8 with SMTP id
 3f1490d57ef6-e2bb12eeaf4mr13607038276.14.1729595673177; Tue, 22 Oct 2024
 04:14:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017-sar2130p-rpmhpd-v1-0-f4bf7f6fd12e@linaro.org>
In-Reply-To: <20241017-sar2130p-rpmhpd-v1-0-f4bf7f6fd12e@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 22 Oct 2024 13:13:57 +0200
Message-ID: <CAPDyKFrDmNwj=x-189CUYCk9MqbG1yEmmv=gfFus19dJSCU7Mg@mail.gmail.com>
Subject: Re: [PATCH 0/2] pmdomain: qcom: add support for RPMh power domains on SAR2130P
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Oct 2024 at 19:52, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Define power domains as supported by the RPMh on the SAR2130P platform.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (2):
>       dt-bindings: power: rpmpd: Add SAR2130P compatible
>       pmdomain: qcom: rpmhpd: add support for SAR2130P
>
>  .../devicetree/bindings/power/qcom,rpmpd.yaml      |  1 +
>  drivers/pmdomain/qcom/rpmhpd.c                     | 25 ++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> ---
> base-commit: 7df1e7189cecb6965ce672e820a5ec6cf499b65b
> change-id: 20241017-sar2130p-rpmhpd-010527d95757
>
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>

Applied for next, thanks!

Kind regards
Uffe

