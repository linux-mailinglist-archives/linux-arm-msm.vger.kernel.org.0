Return-Path: <linux-arm-msm+bounces-37330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD259C1764
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 09:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6BFC28306D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 08:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0323F1C3F1F;
	Fri,  8 Nov 2024 08:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l+DfAR+v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455F5194120
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Nov 2024 08:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731052978; cv=none; b=cNOyj+z4TVyIGBx/DJcadv9yOM2dCcBaGFSmoT16hmRu10Ac7Ev7G+PMLe+os//bcJlTfGy10S9gXRav4zQmI35GXwN5FlnGKbcr+b5G1i6adN4N+nN1GeDm6C1GbqPBtNPvuSO2cWA0fewpqXSbrxtDvz8XCtugipN9cmN2m2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731052978; c=relaxed/simple;
	bh=dUTRSMTXrdg5Zyft5yF6+XKivEJnOQQBelPLhQbyq08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IcT3gBHEoCiyYk+5W/dRgp5aBYn56Ipc7TFN5/QOZs0OM6Db2bT6p6LYvdXTaU13AYIMIV+s6YBeozC6VbOQqiFKnqk+4D+3N4qhHt0PUnrcMykXTm83h7aX3lkKiUFeIektb4/ToJSRGCcCVoAEuB4MmnMAWDnw8khEECjq4VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l+DfAR+v; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso29880841fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2024 00:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731052975; x=1731657775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUTRSMTXrdg5Zyft5yF6+XKivEJnOQQBelPLhQbyq08=;
        b=l+DfAR+vndpMxpYhRy8VqptIQ54GEpn0doEYqzMrkNzWPZp7yvYjMkl+You36tfCS5
         2/I4eX/bFpIwim37svG/08ymFcZyn2Zc87TS264R4lSW6VK35TqkVOUmd52d0a3aTdRW
         LKjOji39FRwBPTY6FVup3upq79VSYMTS3KA1T5fMk33soccfK6L2jPh2eXwZ44BJauyy
         P1E7IWOgZAZmrNk2tQWSxpvJDTzlGW0e8/CxrhrNW+W/S3KSauB0pd96uYz12xarJ8Ui
         ZlL2DHjOM4FXUMR2VIUFMaYoyZtUb+ugQAcUG7sTGUyMOUxXSSNreySONUUAY/NmNvTs
         k68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731052975; x=1731657775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUTRSMTXrdg5Zyft5yF6+XKivEJnOQQBelPLhQbyq08=;
        b=sbDS2cmylXU7ozYHRlJtg4E2kDR/BFfCw9gGAqRDzVIzSfCz1A6whgoC0eikqcyEhG
         U5KzGznp6kOIZhgsyWGkqyQCZah4rmKu68BPiHiCIB4R2gJWeic3xoKMWsUXnDhMQuwX
         Op1q1B1XddvIGiJcvhba5AiGY6iygfZYpH2cO6QP+hmogCBm7sHYwHrRjPnP9CzLz06l
         HFJiLIc7QCObjbWIEK+BFgleLFULFUTF5HXm82u42wpjn3tSLlY4SR8g5dfApJQDVMM8
         4Ck+U/hOlC1IqCdv1ADFWXGDzW0w8bN5H05yeV8ZtbeogLkRxIR3DZAinO301iFbe/rr
         ZBaw==
X-Forwarded-Encrypted: i=1; AJvYcCUqzArezVZRPCxn/s64U2XJe6spTNIoAN00DdWKOJ0Gqsbyt/mzVJfHfj95fK1AeclvRId6g6iUhCzsep4u@vger.kernel.org
X-Gm-Message-State: AOJu0YzcMA3cosHDhzkX3ticHV0ZgbNqyQvZZ+rjX4eWNBn9kIRBRyuN
	+DuW1CmQEE3manNVOeelFyaOhzaMdXJn8DIljf5meP19fuiQLsm66tf+W+BjtsiOCshLxkhP95p
	Cz83jot4Kkd4NzLwL0JqKH+yfd/kPhB0RbzLq2w==
X-Google-Smtp-Source: AGHT+IHU/p5ucmbmja2ZUVCS8fngsFc6zkmCp3xSAKppUYK59btpa33qjaOf6+2FVOvM6vBZDak2yrRRRPxlKbfHz7A=
X-Received: by 2002:a2e:9b96:0:b0:2fb:3881:35d5 with SMTP id
 38308e7fff4ca-2ff202ac3ebmr11214621fa.35.1731052975268; Fri, 08 Nov 2024
 00:02:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104194437.327430-1-robh@kernel.org>
In-Reply-To: <20241104194437.327430-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:02:44 +0100
Message-ID: <CACRpkdbiAKX-o3GYqVP5bz_o-GhbvgHLkSDM4ZMXgMMteaoKTg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use of_property_present() for non-boolean properties
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 8:44=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:

> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Makes perfect sense.
Patch applied!

Yours,
Linus Walleij

