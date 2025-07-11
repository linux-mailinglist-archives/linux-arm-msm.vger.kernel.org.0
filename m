Return-Path: <linux-arm-msm+bounces-64501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C336BB01531
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 09:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B42B91892E86
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 07:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FC41F4261;
	Fri, 11 Jul 2025 07:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0EYSHf0R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80801C5F2C
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 07:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752220313; cv=none; b=h7kSeTnOSzPfsRB5wb/cDZOmRg1+Kc7XwiGfLfc3w1jyui22GHPyBzHk+wyPPExhWgkfxztz85lHYqXiOWPq02pMwh1xTbe24z8ouCX375sBirvEeMrChk1uqXO7nuDS5IoHyUppJbA2px+h57qrp5VgwEuXYWqIhYryW8DpJFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752220313; c=relaxed/simple;
	bh=xPBWnGeT+ZkowyBG+TGuWUGOrJimbpN1WNzJXeQmpqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAF5xeV0imQXxmFr/eysrPLIwJR2k/vhtAH5SSEHY46PDy37sru3oqiq5eqVdSXAywhC+k2oF5x9MqyH/H79JD5lnEHJhYv+su5BeCWCY+5zw3iRo4ndIZm7r/7ewVyKezst++llhdjr9oReN+nZSYKUf3kdsZQQX2GZV5WSDMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0EYSHf0R; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553b584ac96so1782611e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 00:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752220310; x=1752825110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPBWnGeT+ZkowyBG+TGuWUGOrJimbpN1WNzJXeQmpqs=;
        b=0EYSHf0RK26TIXN5nXPLeMqiNndHySiX3asGO19cLnTiOjrdN/ewzDEqwxdKkzvIZC
         XJ+x4qnBMVG4GmR6ootSLjZH8NpDqUJuJfuMf7oXvddLn1rUz07atY+UubP5ZU3gZusI
         AzLGZFQJ8rPQK+zTfHuxUN1U4/04WBTkcx5/4T+KrO6oKozM4/z0vmtF7RsFgy0B7ddp
         uWL1zQjDQQgy1S/lm3et9yiGfVJEh2UR6KlKXoRjJKC3/eaSc9EUYJRzQH378njuT+w+
         kmo0jnZl4DuzhTcLXLKG7C0qYjMH4DJdQQ2MfHv9DpCvDHbs60lSpJSnu3d4nng7rEBG
         UCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752220310; x=1752825110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPBWnGeT+ZkowyBG+TGuWUGOrJimbpN1WNzJXeQmpqs=;
        b=dPNPRWjhvI3jQYzOR9aEJL5qIC8TR8fY9YMbQpETWg/C55GKMPlS9JX2mmZ0vQEE2I
         KSUk/UgF2VAomToghpmpTpFGOG7jtETqA9QHMeAb+L3xED8wM8G7Gdadx/6s/PH3ilxu
         mNvV9D4E8xV6gA95GTX9wYTPmYIZ2/t46NuNBgODr17OtFn7dZs9fQqJmdyW8b5icMhj
         B0/PrmGWwZdMEhz5xCgOUYj72PaFhf3icDEvkjTaWV9CuCQ4mJ7MYG+FF6ATXURNdEqd
         48M9qyiKgc38ud03lsExrMxdVNwbhN1A3jCYg++tYbSvzP3TIjQEvcdMUUkiluaZnRgV
         Tppw==
X-Forwarded-Encrypted: i=1; AJvYcCX5LCiqoGkDLXtVKyBxGX+05tTnmUSe+sHhJmjP45LY6CuFkARt3ZqCiBTGjdjHkciSjaaHHzJzDt29ApvW@vger.kernel.org
X-Gm-Message-State: AOJu0YyOXj86iBAHYAYQ4fKqOsoYFUa7EPJFHVpCFh8xenKp03GulFAi
	9gPyRIc1LJa5WC2Wc+Es4El7j4aV1BaEJcaqQpJH9IQ8k7zmMJXsKnkWdkIApvg6v29FxGBCxFG
	ywY6t/mMnmshEyLhV4X5Nl4ynvjDNioQQb3ytUwWIcA==
X-Gm-Gg: ASbGncvRHdwQ4Co2D7LTuFClVlKStBQcGPk9LsqcDtQrHRgOq2IhwjAD4zJ7xWZAwu3
	HJUk0pJkSH9ULCxFMdKTgJVXSn3fnaZPNF0Nh7bUz5k8WifmrpXw1AEcyPcvHd7G2qhPEHIbcW4
	VI5Rv3zntdx4bZ8mjmbNgMuu6x3olaDeDjhqdsckb1qkNJAhMl6ms5xJCpYI/8pZToKtI6CQNEU
	GYz81QOkG2NzbdBWgb3GAqkImUPGw3MfdcIkA==
X-Google-Smtp-Source: AGHT+IGPyUWmLfi01YzuGstUS2Vbkw4PQMxBgxEyG73Fs26b9n6ZiV02FI5SvQ43Jmygm3NL3xJAyCrUFc/JGRtIixg=
X-Received: by 2002:ac2:4bcb:0:b0:553:acbf:e003 with SMTP id
 2adb3069b0e04-55a057dc13dmr388356e87.13.1752220309800; Fri, 11 Jul 2025
 00:51:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625152839.193672-1-brgl@bgdev.pl> <42dd44ef-cd6f-4dce-bd40-6f5cb32c5fbb@oss.qualcomm.com>
In-Reply-To: <42dd44ef-cd6f-4dce-bd40-6f5cb32c5fbb@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 11 Jul 2025 09:51:38 +0200
X-Gm-Features: Ac12FXzYGxuxHuUsoBRUpadwCLcatnVpepQxQPlM_RsnnT6km9D2BJ7BVbgWLlk
Message-ID: <CAMRc=McshVar8j80CbSTyQTs0MLdX9JCHyVu3xTMZQc36-6ugA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm6115: add debug UART pins
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 5:09=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/25/25 5:28 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We should not rely on the bootloader to set up the pinmux of the debug
> > UART port. Let's add pin definitions for uart4 to tlmm and bind them to
> > the relevant device node.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

We're late into rc5 so gentle ping, any chance we could get this
queued for v6.17?

Bartosz

