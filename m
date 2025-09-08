Return-Path: <linux-arm-msm+bounces-72579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4C7B48EB0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A300C165241
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 13:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13680309F15;
	Mon,  8 Sep 2025 13:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wWAKFTfs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451F6309F00
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 13:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336750; cv=none; b=EC52ibaNhD58ZvEVaJ/58aIKS4X4Id3IOEC/WSzAu013ieGWu7cqwsOZNNQDS4I0c1yOW+HZNELpG7tiCGOIuitIla/T8FCn1MzLjsjYQR0v0+5MTGJ3bQUJeVGVbmumW3FiQYoW/5+APnYx95USL0lHGfdPVNTUExbOznDsHnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336750; c=relaxed/simple;
	bh=LYN91bQqUrNYUhmQdW71bD3/SM1otCIFFxtgi6WtlVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ofIi8LvtRZnatY0H4v0GdHEBo9SAGlwuAwq0z+odibOvyQX6hQhNp6i5yCdQdmKrWNtIHc+DP83f1uV/fNb1SjG7Pv9CY1RSsTJLLdxait/1H6p/ckx9P6pfzp/dQMlyFbSlWUzp/T9LqRCJRxSxjhuwPE5Tlt5SDnxC5GiH2oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wWAKFTfs; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55f76454f69so4147076e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 06:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757336746; x=1757941546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYN91bQqUrNYUhmQdW71bD3/SM1otCIFFxtgi6WtlVc=;
        b=wWAKFTfsK1JlnBBVH6qjsuFVaE+Mtpm4d79TTwBjvveQEuxWzd5fwUCWUE4DHHvA83
         5BV5+CmZERW1sgjSZfjm7A1JKEtmyBvPXWv2c868IBpGiZR5XbZT69ln04lkOghoH8Gq
         sJz1f4Dlb2ZTd5Kj+O93G0ug6nXvwwW6Io/jjRKFHOQfQtAoBnMdQX4YpmKQ7PAFdGCD
         2VtD8QSDpbny/yu3CVH/owmHV9KHyeDhTU1FkJnDIHY7/rXPSBi109DMeJuudp7kUDAY
         RlClapLN9wUQnpiE895qF+whFGZGOuyDJX0uqID6hiS82Zp1QduIj/5L1OHLxdhz29bv
         248g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336746; x=1757941546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYN91bQqUrNYUhmQdW71bD3/SM1otCIFFxtgi6WtlVc=;
        b=ZU+sJvdoi/86xfiTmjVKtAJfd0S9+PZDdwVmWsNI+jXO+axE3mGaAAMm1hinlo9RlV
         C0ZKfeYexNUP00vgX6IJp6fz6tbHaGHaFfrNEW7JyEeZfo9tiDqvCQsmlLFABRL+nDF4
         k1xZDK14KH1So41OM7Ht3QWiF1V16plOaTubtIlgj/RLyfzxNOQ/13YPIzA36NJYgOkG
         /0nCfP2G+AsCPxYBJ6fQrSY5LwN5swtrqfANTNYZew9hZ5boWsXfu4RovHijf7B/F+dh
         93C6dDTS7F18TeQLqJ2c/zcLSNYdFfypuUZvQ8wB/+3Q+wwsQ8EO6MdRM1PC+MSVitb2
         +gtA==
X-Forwarded-Encrypted: i=1; AJvYcCXZzo6isu9pM5ScsmiflxDSY76V5c7O9KN+KKO4P2kQf9VM+pPZDQBfyyooPNtMbgcJRndBhm+Oq8aT46A5@vger.kernel.org
X-Gm-Message-State: AOJu0YwwSe/iaadFgAAVoxXYObcWxnqsqRR96PBWIqjvmzAnxPvd27Qd
	GnhC5AjPV/jSK8yyWZQ3h52sE7CovMjS6AxI1j3zaY7e8AOE2T9VM5+vg5st4AzX/9/mEHtiICL
	wb2uzKXjNCGg2KGLwDBakUXG9r7YfwTwyXi9GmbmMBg==
X-Gm-Gg: ASbGncs2VUvxLC5UepBIADeagoTXiQ6SRegwVeezoAkPETMsRzIeHqUB7hx7jtMw3mD
	atJs0SHNFYR7/c/2qtzc/KMRGuXwcxt8Q3QgDVXydy2WgDsiMqtdqFBkzT2SQTzLOvnIkYjpJEb
	I0L8BlgrhqYRDG3cvPAyEFvRwDUACo6sZY/keBZVSeHwwEOgZb08IZGabxK8x5uF0eIO1ZeV6Qn
	XJFoEiGkXVfjPWyeA==
X-Google-Smtp-Source: AGHT+IFlTN8OpHYsGHM62R0OPEAwkGGAxDlHW1WL1Lov0st1tkOFwInpDmo4NNdZazteQFyHlXy5vp/W4pyIsH/Vy4c=
X-Received: by 2002:a05:6512:33cf:b0:561:96e7:1048 with SMTP id
 2adb3069b0e04-56260e42bd8mr2388356e87.31.1757336746015; Mon, 08 Sep 2025
 06:05:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-sdm660-lpass-lpi-v6-0-e0a2e2ffff3a@mainlining.org>
In-Reply-To: <20250908-sdm660-lpass-lpi-v6-0-e0a2e2ffff3a@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Sep 2025 15:05:34 +0200
X-Gm-Features: Ac12FXyXUXNncuUUxovWiCD-JsAXl6Mwe1cAZlACtOqaRJ3LpgqrnQJl9Rw6oPc
Message-ID: <CACRpkdY4Wahd88d281Gxc+oGdHtpiZWRFUhd3W3w98v4qnj8uA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Add SDM660 LPASS LPI TLMM
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	linux@mainlining.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 2:30=E2=80=AFPM Nickolay Goppen <setotau@mainlining.=
org> wrote:

> This patch series adds SDM660 LPASS LPI TLMM pinctrl driver and
> introduces pin_offset field for LPI pinctrl drivers to support
> SDM660's quirky pin_offsets taken from an array with
> predefined offsets from downstream [1].
>
> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27=
-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107
>
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>

Patches applied!
Great work on this series Nickolay!

Yours,
Linus Walleij

