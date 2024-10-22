Return-Path: <linux-arm-msm+bounces-35419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9DE9AA261
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 14:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76D361F2324C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 12:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B64F19D89E;
	Tue, 22 Oct 2024 12:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ys1SotQF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BDA14EC46
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 12:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729601136; cv=none; b=kBr9HyuYabdsstrBVcUFgfKc7WOtn1od98lBPMm2k9geGMAYKeWm3akxRSVslA0kzyKEJvNQpCwZoyI6pu2UIRJvz5NbzyTN8jYNJdWTsbafZZAJgd81FETJJwXYBsBuLuaReJhgfHr3NnHvxuprqTXaWrZB3tucyeVw77PQYsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729601136; c=relaxed/simple;
	bh=WmPfsYC5XxLwxgy7QyhoKQvCTq1ZP7iOmD4cZtl9AQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uk9FKOz4goYCn81r7yUHvJSt234SVI7Mn3hQqXYmnmk6k2hMI9nGJro2R1XldA9KzVQ0oF5F0LrJz6aeSpGgLF87blJvsWyaAZmrA9tHBv1vhXmqcvMx8BrKmDPA5qHs5j2tn2sLVjRAsCGigPU6MC9sZiqzApGj0h7FF/bdJ44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ys1SotQF; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb599aac99so55198861fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 05:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729601132; x=1730205932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmPfsYC5XxLwxgy7QyhoKQvCTq1ZP7iOmD4cZtl9AQw=;
        b=ys1SotQFqgck++FDGN4LMK3T3+1PCjlyd0nRj/JpYXEWJdRbL+z+bsNt6j0DW/bnWu
         tp0GsNZuMDiyb7k7dlvs+dltSNehbtT7Qu3K//8bgARPQYW7NO4iqp8YH647g2SmljwE
         uETbDNhunRMH1/HjkIFbq2ZwAffMsUPHnQN5XgDuprVhQNek/L3HJW9GjitbMCvMBUW1
         4PHcFSRijqw/8GkDwAZRKQJWEaUd6lheFIbIUsBr1iIQmrAASX4FssyvF1m5tZ8uXzl+
         7WuplLOYVLKw6yweIKR9UhPi0XGMY4SrCEXAjpnE8vWVEsvaUV4NTcoaoFw2e4Qc4R1h
         1H1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729601132; x=1730205932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmPfsYC5XxLwxgy7QyhoKQvCTq1ZP7iOmD4cZtl9AQw=;
        b=kng699ZhGeFmKjMOW0iLraiDOpL+gHplnf3YZ3/4VHvlcT9XjQWPURqPGbCBw2UN+t
         ScVhV9IVp1qETUZxeoKB4mbqzE3SdBiBuZovzmO+j/IPpNoQTYRhOoCTX4ApKM80lLl+
         SDpf3dHaG5iJwV+caig6FnuTesWUTf/kYNA4fQ83DkIejVgRyHZf9xxkQcDIs+ziyjqo
         Zv/2a8nMkY/WdYmmmdSWiaHuoJ88Ekawh+FFFCCEbWTYKTFcn51JvcVSBsXZlEZrPj8L
         LgzKfkKXkaWJ6mihYllDtJ6bDfVhBuL53IaeEywYs/vZsKqBtDAm0G5/dr5MutXRv8X1
         ZbUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW45pj+PrS4jsBNyKOVVkpJNQSEvUqMGR7XILLDp/6ZgJwbcL6lYomjBGZErlpTYSHpb8LktgXdvDFDpeXA@vger.kernel.org
X-Gm-Message-State: AOJu0YyURONkq5qfKEM29AsyAYwGjqoSYEa4aKW6JFUccufBFfud4LOU
	N14KIi8+i6z8AhSclH4YBPI7DHHzFYqJMcewHwixhYrNTXtdTkcBtoD+N97ah/1iRQbfVDgnmV3
	qafsiMPCifRhRmoP55eT83KIyni2c9EzeovYX8A==
X-Google-Smtp-Source: AGHT+IGcIByKZtdq0adKPnNWneZwqEUqTIt73JdOZNS52T9t2MPtuTBH2U31H8pdlHUFENcf3DKQJdHVOhl8MRblnkY=
X-Received: by 2002:a05:651c:211d:b0:2fa:cc12:67de with SMTP id
 38308e7fff4ca-2fb83208e04mr71395491fa.32.1729601132347; Tue, 22 Oct 2024
 05:45:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018-sar2130p-tlmm-v2-0-11a1d09a6e5f@linaro.org>
In-Reply-To: <20241018-sar2130p-tlmm-v2-0-11a1d09a6e5f@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 22 Oct 2024 14:45:21 +0200
Message-ID: <CACRpkdbOf+VyUYXV-SM0ua1RpoTxuHhu9OCZMFKBOHmN1-YQfA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: qcom: add support for TLMM on SAR2130P
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mayank Grover <groverm@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 10:42=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> Add driver for the pin controlling device as present on the Qualcomm
> SAR2130P platform.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Up to v2, bindings ACKed, no reason to delay this patch set so
patches applied!

Yours,
Linus Walleij

