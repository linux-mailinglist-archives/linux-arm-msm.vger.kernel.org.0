Return-Path: <linux-arm-msm+bounces-15065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E530388AB8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 18:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 229D71C3D892
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 17:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C674512F36D;
	Mon, 25 Mar 2024 16:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="COAq4fVs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE4212E1E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 16:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711383567; cv=none; b=R6q5PvFXNRbhjh44ukeb2VBt2v2h4AwXNNMtWjMS0Y2xr7fwaYamINjBpnr+AlX+pe4/YVN5yij/56QArfta04k8gc4UYV5t38gpdcAMpCSKJuvJIAzMW91u7iWUVzUBDjE1ejdMoBFcDHOFcFAHeZcWz09Q2WfC22pcs5GQhek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711383567; c=relaxed/simple;
	bh=6utOFEwbdwWyQcN7SLxfqSV+M2t5uCbikbD6Z3HiO1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y2anonHg9PUxgIvJL8+k6kik0qMElSQE5fqM/PDui353S7NLEtuKkJOrFnK4s2mLyyk6hs5ZypsFURy1FUDxEy67XyJ1MoBUu54Bk+Sn6lbK9DjFEB8jttAVIbwtywjmFcBnwqdxbgbJcyYl6apafSFYKKTF9aoGNb6jrnjgk+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=COAq4fVs; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-78a3ca01301so190436485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 09:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711383559; x=1711988359; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsgsfaYuhO9HIMjIvNDS3p/KRrPkbJlG84J7jcdFiPU=;
        b=COAq4fVs8WLSyhzuZWdojy9732BJkeHAxZ0dB7XPbkCJ+/CVWXgKb/eI2oxfxUNwoi
         2V4n8uuq5JhI3aE8B9SYGBBJGlu9KcmmTbJ5xkurkDXcNBFdZdqj7df0PiOvQwbKvKre
         RnzbZx7pExxulfKCffnMEByko/GZOmini2HWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711383559; x=1711988359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DsgsfaYuhO9HIMjIvNDS3p/KRrPkbJlG84J7jcdFiPU=;
        b=v98NxOhCH3uHuHhFqHcZQaFXnlHgRoxiF1YW6t6LRf6OXuUDx+WYv5NUQRmScv/ZP3
         eKQNnlD2l0gWvzrWFpaSNKLQ1DdVP7T54wnj9dELUwRAPuEQmxSV9g6q0I8lbewmG6uY
         djOO/tJtRqrMg9CyZpAz3LIwgArOP9jY0cMtgVLhwjchiLt5gFXaK7eX0ZeOpSnsfdce
         8Cqj6Jg0N/Adgk+lNIoikgSaJBYkf8LcONRvNg+aZ0QJr4e7FpBqULm4L9QnGakDAPkD
         QwL9KuSgoC1WRBC8ehVigVKkD7+pJDLW7aTM1Iq2RXi1x28i77kJH5cDdiVHuBLMstyd
         8qIw==
X-Forwarded-Encrypted: i=1; AJvYcCWY3/qmo3ry4FDVKrKviHgSYU0g7XepRgvgeb6I+TIWKCC3atcCzSudL2TlOX0rYtQ/NCv/xU9WB0jAKmSL7WaV1IMhPLuXvLGWq6majg==
X-Gm-Message-State: AOJu0YxrAFc/egFsos9/H1Je8fMfMMHK2LO1tXgaV4hc6LsYTTyolHP8
	6ZYMM3oT3ad42k9xqSFVsS6VgwkL+n6wW5G2OnB6cfB1Ihg6MnbfQqgwAgSO3LzgWHab9NJoWs0
	=
X-Google-Smtp-Source: AGHT+IEJri0w3bj7+dozLeEyOq1J6BRFLQahf1fK4iClBQ613ef5x80SSysdt3o2fg14y4O5orQwoA==
X-Received: by 2002:a05:620a:15b4:b0:789:fe72:22d with SMTP id f20-20020a05620a15b400b00789fe72022dmr7090257qkk.61.1711383559433;
        Mon, 25 Mar 2024 09:19:19 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id j8-20020ae9c208000000b0078a177518afsm2236736qkg.125.2024.03.25.09.19.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 09:19:18 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-430d3fcc511so467621cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 09:19:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrEqd9WU6o5Pcj+8zdUrXllAaauRqTv20S0IxlszEaD6SPj6i9TwQBXeQ0qSKe1C/Nk1SjOTV6gSSlmplBveekzBxFd6gB0ggZ9coB6A==
X-Received: by 2002:a05:622a:588e:b0:431:56bb:2347 with SMTP id
 fh14-20020a05622a588e00b0043156bb2347mr265739qtb.21.1711383558167; Mon, 25
 Mar 2024 09:19:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325054403.592298-1-sboyd@kernel.org> <20240325054403.592298-3-sboyd@kernel.org>
In-Reply-To: <20240325054403.592298-3-sboyd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Mar 2024 09:19:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wu_SuLcHYQ1bLC-zhV1FnoFor84t-=EERT9mnDdm5Q2A@mail.gmail.com>
Message-ID: <CAD=FV=Wu_SuLcHYQ1bLC-zhV1FnoFor84t-=EERT9mnDdm5Q2A@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: Don't hold prepare_lock when calling kref_put()
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Mar 24, 2024 at 10:44=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wr=
ote:
>
> We don't need to hold the prepare_lock when dropping a ref on a struct
> clk_core. The release function is only freeing memory and any code with
> a pointer reference has already unlinked anything pointing to the
> clk_core. This reduces the holding area of the prepare_lock a bit.
>
> Note that we also don't call free_clk() with the prepare_lock held.
> There isn't any reason to do that.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/clk.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

