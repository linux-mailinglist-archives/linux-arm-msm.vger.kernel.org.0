Return-Path: <linux-arm-msm+bounces-12094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D530A85EB83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 23:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89BB91F23F9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 22:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F11127B6C;
	Wed, 21 Feb 2024 22:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kTeeYe+9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B091272CB
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 22:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708552903; cv=none; b=KwuthJcoeVwISon4WwDohQFU8fklfWvBRto08yuonAGR1GHNU3RfUWTsLPmQSylymYq65/yAcDOpnbaHA9AJ6rxMdp3bYXIudH9Db4o87tkF0Aqd+Cyl6+eYG3fahKac8TQz9NR31Wlhi5p9fzB641C8OpL5WzRLVOXLCuUHsss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708552903; c=relaxed/simple;
	bh=iNw2KqCWmRNQPgf2kdh7zI9t8Dz1bKx9uiQC7k43/yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nMiYOoUjLiZ+EaJ3icjmIopAs+d9rG5kzy+5lmPT8OkUMSML+ClgLpRP7E1IMCd6JGhvBaI4L3hJjCVTnSvqiiaHX+SlEahy1HEX7zNpBtiHqxR+pX2xd1romnG6IIocweiAkSJ219fv0Q4ue5HlV3ZQjyGT8OeHR4pd7IVf7X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kTeeYe+9; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6087d1355fcso7580357b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 14:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708552901; x=1709157701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNw2KqCWmRNQPgf2kdh7zI9t8Dz1bKx9uiQC7k43/yw=;
        b=kTeeYe+9mzFWcwOls8v28c7uAyZJn+2A/r2fRPTp6DkUweL/tC2O9MF/P0xieaXz6F
         YxwdpnilpfASWSKMzIvfnJePfYkzSkMWQmEFpfE8ftwVWSlnCbrijpjZReIMCU/YYeNB
         EpnTnnax65u8RYJTY2+rMUXTIsopidhF5ArcxFggcwMNToDXmdAEUeJ/p4bDB29dufGr
         qmGPgSim1L1G2wdDZBnP64RBpz4Jy/R+gXq8nSAJTM4J+ZOYKLLk/a3hbYihySkGhOub
         i+p5H9FaYqf7trQRAoQUX90+8J7st/5GSW6qm4Ur03RKNknacDIm6rasgY02JYt9u+xx
         P3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708552901; x=1709157701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNw2KqCWmRNQPgf2kdh7zI9t8Dz1bKx9uiQC7k43/yw=;
        b=S1FB6aU34yAiHGcN/FXjZqkoUSPSg9CTjG96wLFjUWXgOt4qqs1vCX4JwYlebqAM7C
         qsiSTg4RH1azUdTCUHn64I1/sSpbxee8l8k5v6MY+IVBrcI1mFlxDzRPzbQ1F/sYrJO8
         W/kAZpQel1+P6XGa8Dnai5T3NTAHV04FYQWKF+YoFSoZzVqx3vcOBYA3s6Y0+LnSuFqO
         VWJMmVI2GsyrjS//NvW0Z9eB8bg3DcFghXtdl/fvEUi1OviFImPTkr3q8zMvI0uWwQRc
         p//KhBYU8RBMEHIlD1KEJggjM/tcRYUYxGofsxmpVT5JHmoRitE5ZQB7FijUZa81DPpw
         l0Og==
X-Forwarded-Encrypted: i=1; AJvYcCX7Ofg3p0RILTDl7x7omHNkSK2Zpb4spSEDISudBksJHGVmAJdUvH+mkSJzlehBTUI7RUC0v3CrByQmUkQ2OOJeLtKddAncWPRNQ065zg==
X-Gm-Message-State: AOJu0YyUIGkZBS/W22ibVZiPZlaGMRBizvUTkH38DSuIfX75VI8/r4rD
	Ah7jhft2vuy9bP805GEZStNcMo/+4rHfqCub9fV+JMs0/hO1Dv7FAxinKBUYokkVzmIyl716rg+
	bMRXtIre2NnwlhAV20W21DzqL7K0mg0z7/xpCsg==
X-Google-Smtp-Source: AGHT+IGt7B28bXGqHFPzSlnPE3u5pmDcd649uWARD4nozEqzjnhA0mNDtNnmwavCtFt30Cy0Tp2XEPHZZyHNc1h1yjc=
X-Received: by 2002:a0d:d905:0:b0:5ff:9aa1:8970 with SMTP id
 b5-20020a0dd905000000b005ff9aa18970mr21216281ywe.34.1708552900788; Wed, 21
 Feb 2024 14:01:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216102435.89867-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240216102435.89867-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 23:01:30 +0100
Message-ID: <CACRpkdbOEir0x7ivXRdMgdi+Sk2e1-m9u2pruh1-RWrkoNd41g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sm8650-lpass-lpi: correct Kconfig name
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 11:25=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Use proper model name in SM8650 LPASS pin controller Kconfig entry.
>
> Cc: <stable@vger.kernel.org>
> Fixes: c4e47673853f ("pinctrl: qcom: sm8650-lpass-lpi: add SM8650 LPASS")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied as non-urgent fix.

Yours,
Linus Walleij

