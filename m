Return-Path: <linux-arm-msm+bounces-19063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF218B8DE9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 18:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29F20282362
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 16:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D4312FF91;
	Wed,  1 May 2024 16:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FVe1JJuu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB4854FB8
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 16:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714580318; cv=none; b=nmIuXMEFolsoQVrfIOroxMhK9q6D7Ef+hjVWTHOGBcRiq+KO48eQisrvfYEcdT2laZkA/6YIvDd4mdRUgSDIDH93s6TxyyHjm+lSS/Kfcw8+OZ2zD/q7YtXgIhCATJLJFcknn05SX5G//5z3Gk/q3yac4b340ouYe9cB4hjJFuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714580318; c=relaxed/simple;
	bh=RrsRAJmWysXYR4n1Z7QuovA3tEKIJY2HwJxpKg4/cqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Skhd6BKngE1Jghy49xe76G487Po0DN0rKAkEpyXUlgosWPoObhB8XjRTU9rMPvWxmM3qos5dceR39hhUPT3e2CXBMxPG/kbihG2Ybk8OnTnG1RKWYP4uXcoj6/nybGH0IGhnZRm25Yz+9V3RSBCiB7nhpZ6spCZzMUpIBzORUAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FVe1JJuu; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6a04bae512aso35384316d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2024 09:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714580314; x=1715185114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrsRAJmWysXYR4n1Z7QuovA3tEKIJY2HwJxpKg4/cqM=;
        b=FVe1JJuuwmeJUs0Vbjx+S2qWt8uj0yXY/nTokp3DIy0kOqT2dgy+Kk4ID3SQ1A3jth
         Qoj6zSpLeFDLCiIWhZkf6Xkz2raTesIi6rpD6DuDQznHSKVnyq1+KJpFPP5Vp+x8FsVT
         UE8xk+zmprXSvGHkjCh3knKhZWits+3k3FlVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714580314; x=1715185114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RrsRAJmWysXYR4n1Z7QuovA3tEKIJY2HwJxpKg4/cqM=;
        b=m5SmZ2KuLfKbRUT1Yaz6cG3OrWRg5O8kvl4UAbrJsrvfdxG3TM3qGk2hBDL6CGHY4j
         +ZGOeZm5KszeOLsztF2IjkTWK70FmD4yW7FR8zEJbIIEmaH6V1vZz/QvfIgQWFZYDt1z
         1vjO8zFwt3kIaijG3F7wTtZ7fqwwUlNefIikToWpawvfHj4Y7qpnBu7YgZgXOchlgj/Y
         /x/Jv2ZOFEUVMTTFHmtB1WRfMXyJPTkzD8v9E3QdpMaapvs02fEm0zi5OvAG3RqPfMmY
         bJUURNeVrB1/yA6yDXhfGffMs9cDeEFkrUzqvjC5yjxFw4v7yRNRk6/eEgaAvaX7GmnW
         Q3VA==
X-Forwarded-Encrypted: i=1; AJvYcCUu6Kbz7ZeSU4SvRZR+3uNy91fXT1Sv4KFS79LdK8OsZ8VrJkAVGj0rQhZzbCxTweKfFvh5sRv5fAN9iMY5/wpnfAigsQmoDWnhpKpNEA==
X-Gm-Message-State: AOJu0YyVmTGduWSAEBbBBk+ebF52B9LzRr6PPk82PMzuqQyAoLW2Wb5i
	I9S1dAjbtrubfgAYT+qc7RVgXMEa04vxt+tHOWxE2ye4XueIKNykhmv09CnBGpNmh9QyGztZZwI
	=
X-Google-Smtp-Source: AGHT+IHakWPRFup0FNQAx/DffIZAA7DP9PLxEymNkcwEuj9ZG9epKnn9xiv9+IHLW6gucacduSPtNw==
X-Received: by 2002:a05:6214:528e:b0:6a0:9b16:c33f with SMTP id kj14-20020a056214528e00b006a09b16c33fmr3129168qvb.40.1714580314133;
        Wed, 01 May 2024 09:18:34 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id l12-20020ad4424c000000b006a0e64f8e7asm1326607qvq.62.2024.05.01.09.18.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 09:18:33 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-439b1c72676so82681cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2024 09:18:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXUwKAHWSpvX5OdMstQmcUPLzeRiS8EbkWn0Sn5J74XtYmfNkJ9p5mBw6wD2EHQFOLSQhXhbh0ep4G5PoUI1Z/y2gYxUMWo6XnQk6nDlQ==
X-Received: by 2002:ac8:5d8f:0:b0:43a:c84f:5689 with SMTP id
 d15-20020ac85d8f000000b0043ac84f5689mr236131qtx.1.1714580312414; Wed, 01 May
 2024 09:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327202740.3075378-1-swboyd@chromium.org> <CAD=FV=VLwa0AFsrXXxKGG+hcyW+h7u7-tyg3uoDB8M_XdPti_Q@mail.gmail.com>
 <CAE-0n51osUcpqqh6o9OhURLbRKjcWbRZT-5oHLi_mwfJsUngEw@mail.gmail.com>
In-Reply-To: <CAE-0n51osUcpqqh6o9OhURLbRKjcWbRZT-5oHLi_mwfJsUngEw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 1 May 2024 09:18:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=USC_WO_cqYbuHBoScbV=TLtxKSfXmtOBruLSpzSTy4mg@mail.gmail.com>
Message-ID: <CAD=FV=USC_WO_cqYbuHBoScbV=TLtxKSfXmtOBruLSpzSTy4mg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix a black screen on sc7180 Trogdor devices
To: Stephen Boyd <swboyd@chromium.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Laura Nao <laura.nao@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 30, 2024 at 5:17=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> Quoting Doug Anderson (2024-03-28 09:39:54)
> >
> > I spent a bunch of time discussing this offline with Stephen and I'll
> > try to summarize. Hopefully this isn't too much nonsense...
> >
> > 1. We'll likely land the patches downstream in ChromeOS for now while
> > we're figuring things out since we're seeing actual breakages. Whether
> > to land upstream is a question. The first patch is a bit of a hack but
> > unlikely to cause any real problems. The second patch seems correct
> > but it also feels like it's going to cause stuck clocks for a pile of
> > other SoCs because we're not adding hacks similar to the sc7180 hack
> > for all the other SoCs. I guess we could hope we get lucky or play
> > whack-a-mole? ...or we try to find a more generic solution... Dunno
> > what others think.
>
> I think we should hope to get lucky or play whack-a-mole and merge
> something like this series. If we have to we can similarly turn off RCGs
> or branches during driver probe that are using shared parents like we
> have on sc7180.

This is OK w/ me, but of course I'm super biased since the only
Qualcomm platform I'm involved in is sc7180 Chromebooks and that's
handled by your series. If it helps, I suppose you could add:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

IMO it would be good to get Bjorn or Dmitry to buy in and maybe post a
PSA and/or request for testing to a few IRC channels where folks hang
out (#linux-msm, #freedreno and #aarch64-laptops, maybe?)


-Doug

