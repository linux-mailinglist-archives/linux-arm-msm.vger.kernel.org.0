Return-Path: <linux-arm-msm+bounces-15074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1303088AC9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 18:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44FCF1C601B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 17:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA2D4691;
	Mon, 25 Mar 2024 17:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PX/58+xC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7956A3DAC1A
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 17:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711386972; cv=none; b=nieVs+K+87wed3SIASP7lQwY4255gm6JjWB0IIlzOFMLrLNsU1NYDq5t+BUQ79isqFNcTt2zbhK1bRu0b6FHkYI2a46gtRRkmQTbu2XMxjxwlYbClm+NfyLGBRmHboC3pLQEI1GCEhtuKEdEQrXIXQAiNkPT/FGt3dK4vR0XLg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711386972; c=relaxed/simple;
	bh=5z7JWgRm+prE8c9r61qKqkGGuVaMbLVUWLsiDunLhpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WMdLMNDRLtjzimvMIxNnxwZU4g541AHSKFsND0VytT79GQdMjTS62JzX9SBtsgiByjmxfhgIv5oUmp5whHtgcAxKlZZPQO3EuBqH7HP+pnmnivA3qvn/cEk6f486RO8P86dqdI2pdBhpbGQk5rm4RjYgWgYQkFwCS2cKA3kJSfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PX/58+xC; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-69107859bedso31098026d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 10:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711386967; x=1711991767; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5z7JWgRm+prE8c9r61qKqkGGuVaMbLVUWLsiDunLhpA=;
        b=PX/58+xC1fNRI6lc5d432WfiXaq3h0SrIUmAt1aLuSIX0ZTRrBKPdx6mM99YRu7etI
         x6K40p2FcwKvIJhXQlKsFEJsXKfXz9tzNWLBjSYjjgHVNTvMcCLfkikVdcczozM/YlAU
         PP8DJdVYH/Tfq3/z8HH5a5hbfrU2+B4REx7Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711386967; x=1711991767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5z7JWgRm+prE8c9r61qKqkGGuVaMbLVUWLsiDunLhpA=;
        b=YRCklO6mlDMtB1PbvN968l8PI25MpLF+czuN7Y4oZGjq05g6PIrkMM2y2Hx5XjQgTe
         1GOY/caNs8ke+QfEZKs49APC9fuZrDMZU5uvWPe2Oo/dJIl/bzrXahHiR4K1Nhs/gUIj
         vtefznrJK4Oo0+PfpuIomZmj5eu3pCTTdub3vOuXkWaZfl4wWfOHZpbr4KN2I4d++lBq
         mA4xy29YCy5SKxxGwsunxtcANK1H7XBLlLlizBWIe3OH19N8L46dCifqNy4HjCR2vz2u
         bTqXJJJaOvFGKUbvlheqLm6j/fbbKpt1QNFjowUq3nGnaHKzvSgaaUvG1vwlPMOcT9x+
         dF+w==
X-Forwarded-Encrypted: i=1; AJvYcCWByP0sONv5BHw2SjbcJmYE8+PtNKGzpK7gHNWxRjcQ2SGAOZ9itetmhz2DySQM7UgMrT7q5hQZkTS1JlL2BNNirXZI4TOgYTE5Qj9dUA==
X-Gm-Message-State: AOJu0Yx+L0gnapFZS70mq1ds/CwStzxESFhrhgW8vymgbAh7eHgPWf7C
	iaLkk20P8PNOmdwyoTQzZHaYLPi4FrYD3Gyj8wrB7IGWbeL7LqTrAqxy/ZeUbDPeo6uI+zMkB9I
	=
X-Google-Smtp-Source: AGHT+IF1+tn+8IyNvYG/Ip7OgOH2DYV+hBPQup75gSo2Z67WwLhN6zOZcTJ5cHr8lNpE55GDYwetPA==
X-Received: by 2002:a05:6214:ca6:b0:696:8bf3:ea02 with SMTP id s6-20020a0562140ca600b006968bf3ea02mr575782qvs.56.1711386967449;
        Mon, 25 Mar 2024 10:16:07 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id z15-20020a0cfc0f000000b006968ecc002asm1231740qvo.80.2024.03.25.10.16.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 10:16:06 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-431347c6c99so14771cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 10:16:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1l4BFCts8N5G+WZ2I4zBFcsT8IzacuODarvjQZX7AeGJL5hJa7iw2t84lmxHNdfWscUldWQRDgveCPztpUS7U3wp8G7rBa1MALYnuJg==
X-Received: by 2002:a05:622a:2a06:b0:431:baa:825 with SMTP id
 hc6-20020a05622a2a0600b004310baa0825mr1246888qtb.25.1711386965873; Mon, 25
 Mar 2024 10:16:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325054403.592298-1-sboyd@kernel.org> <20240325054403.592298-5-sboyd@kernel.org>
 <CAD=FV=Ws-LYcpiitibPBPRhqrbS8rTo_7xtPPw2kA+qBzybOxQ@mail.gmail.com> <42ae624ca2289fb82e00f3ac8938d05e.sboyd@kernel.org>
In-Reply-To: <42ae624ca2289fb82e00f3ac8938d05e.sboyd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Mar 2024 10:15:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XcHdEiMf8Z228sT=ChvjJs8Ujw6q8Hcf4b588ocwJHiQ@mail.gmail.com>
Message-ID: <CAD=FV=XcHdEiMf8Z228sT=ChvjJs8Ujw6q8Hcf4b588ocwJHiQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: Get runtime PM before walking tree during disable_unused
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 25, 2024 at 10:06=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wr=
ote:
>
> > > +/*
> > > + * Call clk_pm_runtime_get() on all runtime PM enabled clks in the c=
lk tree so
> > > + * that disabling unused clks avoids a deadlock where a device is ru=
ntime PM
> > > + * resuming/suspending and the runtime PM callback is trying to grab=
 the
> > > + * prepare_lock for something like clk_prepare_enable() while
> > > + * clk_disable_unused_subtree() holds the prepare_lock and is trying=
 to runtime
> > > + * PM resume/suspend the device as well.
> > > + */
> > > +static int clk_pm_runtime_get_all(void)
> >
> > nit: It'd be nice if this documented that it acquired / held the lock.
> > Could be in comments, or, might as well use the syntax like this (I
> > think):
> >
> > __acquires(&clk_rpm_list_lock);
> >
> > ...similar with the put function.
>
> I had that but removed it because on the error path we drop the lock and
> sparse complains. I don't know how to signal that the lock is held
> unless an error happens, but I'm a little out of date on sparse now.

I'd settle for something in the comments then? Maybe tagged with "Context:"=
 ?

Thanks!

-Doug

