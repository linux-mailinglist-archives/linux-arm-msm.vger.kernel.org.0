Return-Path: <linux-arm-msm+bounces-64635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E063FB02397
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 20:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F25F11CC2A99
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 18:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677842F2C6C;
	Fri, 11 Jul 2025 18:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J9ZQpNgQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9B52F2735
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 18:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752258409; cv=none; b=KFZ5QMNanCEHpW5yvECfbmEoDv4dWpALMw3Rd0vAheNpjWliU64+DYRITgjepWCReHdrzc/xDR26byHzpeaO6eByvayV+12UbIndb4xom+PcmKG51gu93kVTS5aSre1qd86RP3AlEQXnGYRO/RWU1am/6BbtVyo/VQjACNNGPBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752258409; c=relaxed/simple;
	bh=su517mkk+oxzFqk3UP0BekUx1TUAeS3VlwMBUTxhr1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=badT7oflj4BTHbvnwMPUzvQIqWsnh881aLEkqjJeQK0DhG151Ry3GM9UIJYE3p0DCFGJVJPpeGgxKZfTbS50VIqCRcwfcMsT4n9aVvz50mcqQplXcCciDnUaVu8KKyLiKOk/S6C+O5Ciol7RcUNdp+8aJiNTStbbUU04ZUO0dR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J9ZQpNgQ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso2745135e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 11:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752258406; x=1752863206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=su517mkk+oxzFqk3UP0BekUx1TUAeS3VlwMBUTxhr1Q=;
        b=J9ZQpNgQAtAbEjB0+/XpvKMHMa5y2yOfDmprEzkl0/qsPH3CfQrTAXr6Np7Xb870j9
         zREf516urqki4bA8vb9SJzJv1fRnnOG6pNnzCSL/Ff84DmLRdBY5f20VBz5/2xptMo9J
         jLPhH4OjJkuqhfVSK+AJylqH4zptq0mzbEzD1MuWtpel4evb6mn9X8Rv2rEXZzwwmY6k
         7gesmyTAqPaSCnP+KL/9s7vTUnQhuWXe/GiVa9u5dZg7C2KCrxnNi3U4KhIDXknnhOZv
         FCMT1V3WuBdMIt24NvEcNtr+tOW7qUQiVBpz7QMRFYYlb538QozqmKm3Jf0QKUHWEGMv
         gVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752258406; x=1752863206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=su517mkk+oxzFqk3UP0BekUx1TUAeS3VlwMBUTxhr1Q=;
        b=gY93hunvQz6dH74V7Lzr7yzF3n4xt7Fgy46GBLLviScpRkP/bmsa1FYWcaHSazj/HC
         flr/SwGJtWth/bErZx7LHOmTyWZ07Lthw5HVdGFZ9baRsN5RJ28Idff9YwO2c+fuIS/T
         K7Wa7jwe0LUnt1Ts98dE9mtioIm9lMhvfN/r8k4tRDGcLiCTR9gWwLGAf3lyLWiK5hRO
         NcIeAn5eRQmr4xpQRB8b7u57S5+sht69X2A3QNs8cukesWH1OUzCQNxPoyGUKk6F7aP7
         FclUqi8XtKovh2zU/df3r0L7fqbZcxe6mKfySDbSY2zK2ynzLGFzmTWyLCZfXvL4a6dq
         7kQg==
X-Forwarded-Encrypted: i=1; AJvYcCUdslkQ0DVJp0XLOejMrinNDlnI8fro/b0JBLIJCqRKwxkv6jc8b4MdR0nzbrsIfl3V7oxHaONZkleWL4F9@vger.kernel.org
X-Gm-Message-State: AOJu0YyclYrwjvjZKbK0UpfVk8flG8EO2i18KwFXH+e6WWg195XlTeHe
	/dWXmKkbNrQ5GMh11Sv7zZVdEDbxQ5a6JjdV2+3cN8uUIVchDvCcKDzhByxi/C37fWaK78PfBe/
	NAwah6LLeOSbWYzs+BoI64ErwM2NbzQzJteQmktPi6xZ9BqfzLcov
X-Gm-Gg: ASbGnctp6RCd4K2QEnJqa8KcGiM+QsLoFMhif/rXWtLnnXipkIcP2aKYFHV8VcL7DLJ
	KjgACeYwI1YQQhkJOFdM524y5dfKrafPsUKfy9ML+sEITjMuV3TqGM4UM64UufMeHpflL8vF+gQ
	riF1EaJ0G+ISRROZnq1LsppItZz+vntYmNwjMBReEDmd2aVmCOE9KJscPsSlNvcy2qyhdMf8uHb
	Ixp5nA=
X-Google-Smtp-Source: AGHT+IG/MoMOERMcdwRe0u2MCnKNH5c6G0Ju9EQCtJSlh1jp+ka6aa2/4j15Ntd51i+P9QmOojm9ELTDBk2mPF4JmWM=
X-Received: by 2002:a05:6512:3a89:b0:553:2ee0:7728 with SMTP id
 2adb3069b0e04-55a043e9350mr1420176e87.0.1752258405544; Fri, 11 Jul 2025
 11:26:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
In-Reply-To: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:26:34 +0200
X-Gm-Features: Ac12FXzxbq3zhEMygG1ywvm57ienmlxEOsz-4IQUAfbc1IiUJliLFPebYAlPvr8
Message-ID: <CACRpkda8+veE-qQdQf=LMFO_URiUAiFvkc2QCbJBQizqyg37Eg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add pinctrl driver for Milos (SM7635)
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 5:56=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.com=
> wrote:

> Document and add the pinctrl driver for the Milos SoC.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Patches applied! Good work on this Luca.

Yours,
Linus Walleij

