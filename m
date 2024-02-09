Return-Path: <linux-arm-msm+bounces-10334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EC784F609
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 14:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9FB01C20F8D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 13:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC634381DF;
	Fri,  9 Feb 2024 13:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pLHIyyE1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4D237700
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 13:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707485542; cv=none; b=YYg0jpAtkR5nv/uc27O4DRdLBbRv4eBft+VXlkXRoZ5GtKb4z1Dc4lv50oQn8sfZwE4VPZiDaNXgPoU3VMnPuUpJKFEmWLjt7D4jCT3Ef9kXyxRoYzR0vqj3t6EwwGDiLX7V/EgJoaGcvh7o0lqc8SK/AlC70jY+vcgGB39Dig8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707485542; c=relaxed/simple;
	bh=cfZar783bIO5OOtHylGck7kBUlRsDOqUiNuW+HJlEnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/P7DrfipOMOrnhs6oRgdjM31+qEWsO8Jp6L3T3eHUXx/8HJM9gUC5OkxIU5ppRxRBrE/gNoiqS9wqby0VVFRsh3XIZ26mmxxDVZkA4XqbL915D9fOO2k3TED/bxuvImOrxp8LVW5Zz/GtjckKqmvHAGVfY/6Jv2VjIePmb3KCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pLHIyyE1; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-604819d544cso9904207b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 05:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707485540; x=1708090340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfZar783bIO5OOtHylGck7kBUlRsDOqUiNuW+HJlEnU=;
        b=pLHIyyE1aCXdyNGtZb6IT8WyfPApFKYm/xSyGkOjxMMOR3G2gaXwUvtIM/dQmPxyB8
         fqrslgI1yt99YDImaJvv5VErO7ecZBbjmS2D5osmzmUFmPQaHvx9AboUNt3qEvYKmFL+
         Jm6cuY3CjALE77jIW0FIFR7tTSB2B4hy+VufoNS6pbAVCFVFVYEOOfdoPp9e+obcUHy0
         GiJ3aO8bg+FOWeZrQ3kQkaNrX1kGhA+6S5tVsocu5830QpcYuj4wkdRREGuw9u3Wg94Q
         z1ZiiewaSS99M0yDzaq2mx8Zbht4BSLZcQANC6hAMPZKU6VVLD1nrfOy4sJAigTdrABA
         lbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707485540; x=1708090340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfZar783bIO5OOtHylGck7kBUlRsDOqUiNuW+HJlEnU=;
        b=bgNEdiMgc3MH6KdlH1DQPll97/wNCw7GOMEusXmp+Ijr0mpMCPVx2wAwfDjK1Lsyau
         WNb2srvYG9dWu3SyTPTmHmiW+8nTBWCNfQoXQtMI/jwP5BT/Y/TtWSddvwpPCCLnxCLc
         H+bNKcZcUGrwiPiHhzLzYXtjHt3Ur3ArtNYTTnRdpdI7OSHTzfFflB77/UrZCv6FJyHB
         Bab9WDULrvxSzLPBFjuoCR+w7ZgBTxDy516m1Pq5qsdoRP3SrsYDndKpcOtFfEFoReFG
         uTS7yiClQxFebTJnOxCHGStQ39bP2jY2dJl3Chsp9qtZr16ckBHe1Zhc7XZMXE8JTaZJ
         kTzg==
X-Forwarded-Encrypted: i=1; AJvYcCWIoR1r9dRxMcNHNvNjLG/auASUBVjG4McKjcMy3EAmsTn3SzfSbfptnjtTlt7n/VO29foEhkFQ0ZoCztfSlu2tLPHmOXfrXgHrnPTMmg==
X-Gm-Message-State: AOJu0YxDUe2Aji+6iYr/97QgaboWcXz/4K6s7GFERu4oTigpxZP7feIl
	CmMyCOiPF3LwvKE1ZBa8mrj7GozoQOyOQuCn+NMxWRS2kIuFk77zLijlTj4sHGtECEoiuUT50Wu
	1xQBRLsV6vTNXF0XIMIQTuwsAa1s8wn+EN8k8XKNLLfveIdN6
X-Google-Smtp-Source: AGHT+IERf3uf+9XqlHzF2oaWkcRal3264kKvnbkM2LVU6kgNrlwktr//S7HwnRLMhN4oi2hPAU15mz7H7m6uztYHtUY=
X-Received: by 2002:a81:4ed5:0:b0:5f6:4f5a:8bd2 with SMTP id
 c204-20020a814ed5000000b005f64f5a8bd2mr1656804ywb.0.1707485540107; Fri, 09
 Feb 2024 05:32:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202105854.26446-1-quic_aiquny@quicinc.com> <8376074.NyiUUSuA9g@steina-w>
In-Reply-To: <8376074.NyiUUSuA9g@steina-w>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 Feb 2024 14:32:09 +0100
Message-ID: <CACRpkdZAU-H7tmacaOFJGhDGbyzfuYCG2k2B4YDVs-ZgNjDKFA@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: Add lock to ensure the state atomization
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: andersson@kernel.org, Maria Yu <quic_aiquny@quicinc.com>, kernel@quicinc.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 9:37=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:

> This breaks pinctrl-imx on imx8qxp:
(...)
> With this commit pin_config_set callbacks need to be atomic suddenly whic=
h is
> a no-go for any device attached to i2c or spi and in this case IPC RPC.
> Once reverted systems start normally again.

OK I backed out the patch for now, let's see if this can be solved.

Yours,
Linus Walleij

