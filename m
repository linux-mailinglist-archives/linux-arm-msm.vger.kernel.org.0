Return-Path: <linux-arm-msm+bounces-35974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4A29B0FA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 22:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABF7E1C21B00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 20:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8151F76A9;
	Fri, 25 Oct 2024 20:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b0zmDbAW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657C9186E5F
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 20:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729887365; cv=none; b=fjwU4OABOwqusqOB7nhyID8Dhwgn0QXU9CWdHBuJ2Lhzwjjkv68k6ngK3nprd9apUHH6N+oFy/aEtia8hnE0isBOWHtoxIus1UyI8tjjYAQ1Mmcr5IvdQ/EzaBb9KVxyM1OBvS3eEXgDtXK5XJvXWu7cyFS9WAz/+KfJwYctFp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729887365; c=relaxed/simple;
	bh=HXwNlsDX65qK5k66z7IA8yvdHHI0vAUZEoGmEzH1HZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RL1+qNEkuwtZYlxoD0b37+rPgbwDRzgvuRU32ZtJ7P2d5OnhutrlpjV9QWmn3gbo6xderh1wq26l1uk07nULAJ7qahb813R1iWbO8sOQHkC+0ZpI1xgEvCACrf/05YttrLaGT3THJ29IJdo4AI1wUhcemtO+1d+StfHcrdTzNjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b0zmDbAW; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539fbe22ac0so2845316e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 13:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729887361; x=1730492161; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrfKOY+CFQBFpuKjqQn+EovTIGUgf43WkJJ5IpUgMGA=;
        b=b0zmDbAWTCZoENFtPAIXDx19kkEjUiYrIzOTvABHQIYGBBu3pxEp2j0S4qfISGixYj
         ntC5jhZBiUBDoFkn3crgUlr31E0CF+RH6B19CR831E0x0wkFzf6JGKMrXEHBVfcqpwqY
         92C/Fd8CNuGe9jVVeDObcxE74SNzrA1IY5mCUNIX2ULTl3Vz7nD8tmu1n0RU6s4ZAHJb
         Ib5k4ZGVSGEQEziaFDA725NEJOlJlc/wEDXSnIR8C3RrKybipQmVrwYYzkwq+7B/IDvA
         h2ONgs9jeoSHaO18J1CVxmLAbLdob2bKotMTxwxEfQ5WsqQEIcWFFXP69vDmAyJ5/rwG
         aWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729887361; x=1730492161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BrfKOY+CFQBFpuKjqQn+EovTIGUgf43WkJJ5IpUgMGA=;
        b=qpiDLzD8diUnOLt0AmKX6LJwiag3YQAfaEJ+W3pq/VgE25DQKjoeMhdEhh59qNijjW
         XWolWvGMJL50/ennUjR1WxOqNsKvEntclAzOYz+DPswv5toitrF68xriktWWI0rbPJuw
         twzjIkavkhBf3ByROlk43F2XRczwSuQpW35Gupi/xwwWMfdwPyV0+xVNe2zVHPIAVdoj
         HBvx5BJjAaqvsn0XJ/1VciHtCd1c23mtSWNJ+c3TXlVCPsDQcutYyhzMJRT2Vs9Go0uJ
         8DXp9Zm2VZScLicpXtH1VWllyqyq1PYc+aiwsS/jb/+wokXRVaVASZoDzdbB8S2jzaAE
         /aYA==
X-Forwarded-Encrypted: i=1; AJvYcCXBVmyNpXzaEeW8dL747EXoz3YdRblZ8BZTBpzEM5O+XmLCbLL8GvSnMHSsp09UhwHeB0tCLbfhWEDlwTgv@vger.kernel.org
X-Gm-Message-State: AOJu0YzyHm3hLMuTkIIUaKwRf3o164lja459KRVhJI8ICRZvnuLadyuA
	0bcXDa+oFdwUwAY21+zXa271WCHzx+ManL9AQACkniujiEUYENwQaPUfgx870Oyxzg2XWK8syLh
	hy2QtBv0As+yw3JaJsCwMY85v7QR0k2yKFwWUE9jRA+Rqiruz
X-Google-Smtp-Source: AGHT+IFhpeik0nSV3W/KgV00KKhCd+MCqLZInlp9rhg6YetJwEu4kfb6FuXzMeDghjhw01tKCsjFDM0Iin7o1GFcDsY=
X-Received: by 2002:a05:6512:3e1b:b0:539:f4a6:ef40 with SMTP id
 2adb3069b0e04-53b34b395cfmr248111e87.54.1729887361373; Fri, 25 Oct 2024
 13:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025121622.1496-1-johan+linaro@kernel.org>
In-Reply-To: <20241025121622.1496-1-johan+linaro@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Oct 2024 22:15:49 +0200
Message-ID: <CACRpkdYowN4gWohH+Qmp6GAmHUyXNCdA65Uwp_9ii4phrd_+Rg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: spmi: fix debugfs drive strength
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Anjelique Melendez <quic_amelende@quicinc.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 2:17=E2=80=AFPM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:

> Commit 723e8462a4fe ("pinctrl: qcom: spmi-gpio: Fix the GPIO strength
> mapping") fixed a long-standing issue in the Qualcomm SPMI PMIC gpio
> driver which had the 'low' and 'high' drive strength settings switched
> but failed to update the debugfs interface which still gets this wrong.
>
> Fix the debugfs code so that the exported values match the hardware
> settings.
>
> Note that this probably means that most devicetrees that try to describe
> the firmware settings got this wrong if the settings were derived from
> debugfs. Before the above mentioned commit the settings would have
> actually matched the firmware settings even if they were described
> incorrectly, but now they are inverted.
>
> Fixes: 723e8462a4fe ("pinctrl: qcom: spmi-gpio: Fix the GPIO strength map=
ping")
> Fixes: eadff3024472 ("pinctrl: Qualcomm SPMI PMIC GPIO pin controller dri=
ver")
> Cc: Anjelique Melendez <quic_amelende@quicinc.com>
> Cc: stable@vger.kernel.org      # 3.19
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Patch applied for fixes, thanks for digging into this Johan!

Yours,
Linus Walleij

