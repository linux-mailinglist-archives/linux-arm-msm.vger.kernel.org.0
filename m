Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4842F2606
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 03:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727062AbhALCE5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 21:04:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727082AbhALCE5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 21:04:57 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B647C061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 18:04:17 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id b5so696071pjl.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 18:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=fe2mkczbp1t/E/ldhMQUrkd5DSYed87fCtNvZY007Ik=;
        b=KJ/unG0DMwgO8FOHpLwA0BAGGO8yEgZ0kZmUxPC2a4zmth9V3xtzyqeig3Fj9AosUm
         Nxx6FqOXJ22uU4SceH/4Ut1DoTDtq0wiufH6sm1hDw2NoCos08qzi5O8ZEHp549VhhdH
         G6rzgxxZaKzCJTzqc5lC5Lk3bne9QbGLcaJzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=fe2mkczbp1t/E/ldhMQUrkd5DSYed87fCtNvZY007Ik=;
        b=mQ+zysP+avLj9YTcpb0gnUMFxpXOt+kaiyq7EccDgWjPGUM1Fk0p22y1tOOPJnl8oy
         vweAMWuNjYNcOfuUPL3GumH0r0K0LgBK2MNbPxrzYS8zytaF5ZgYIrFnCCveBIfuLoku
         9JIcTqJSFKt25vmzAum8bUi25+zDuw7zcfsCivBX1JFFDv7ak2kY+JI30kfOKvY2+9eF
         JJagWCjwBPCbONTYV2a0ROmye8Vwcf6EvFPnRrwBz/HRwUm8O+zfj3FflGjXfH8cAmJZ
         r3l977OzAKcBDgTuftF4aatDVSHD18PU+YKgJUfzXLOj3xrZcvRI60nhbA/GbM+fLMlT
         PAYw==
X-Gm-Message-State: AOAM532VnNmIPbHMr/G0IwhOi7ittQaZ1OHSx/x0G42mGAF5SFH50GYY
        QIyobfrk3BtAswbUZA4Dj+662Q==
X-Google-Smtp-Source: ABdhPJyN19svv59QhQEu8hZ7lIHMauMtWTxanOuICr3xOYCM6BMmfN2oPXquM0xU9ModjRJKMdbuWA==
X-Received: by 2002:a17:90a:ad82:: with SMTP id s2mr1819632pjq.167.1610417056650;
        Mon, 11 Jan 2021 18:04:16 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id h8sm936536pjc.2.2021.01.11.18.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 18:04:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=VZ7BPw0=_3mfLYmO+kUDLbOfxy=wzH5Vnff=MiGP5oVQ@mail.gmail.com>
References: <20201216071926.3147108-1-swboyd@chromium.org> <CAD=FV=VZ7BPw0=_3mfLYmO+kUDLbOfxy=wzH5Vnff=MiGP5oVQ@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: socinfo: Open read access to all for debugfs
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Date:   Mon, 11 Jan 2021 18:04:13 -0800
Message-ID: <161041705349.3661239.3305335724733202161@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2021-01-05 15:06:35)
> Hi,
>=20
> On Tue, Dec 15, 2020 at 11:19 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > There doesn't seem to be any reason to limit this to only root user
> > readable. Let's make it readable by all so that random programs can
> > read the debugfs files in here instead of just root. The information is
> > just that, informational, so this is fine.
> >
> > Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  drivers/soc/qcom/socinfo.c | 40 +++++++++++++++++++-------------------
> >  1 file changed, 20 insertions(+), 20 deletions(-)
>=20
> One worry I'd have is whether there would ever be any PII (personally
> identifiable information) here, like maybe a chip serial number.  If
> so, is that something that is OK to provide to any random process?
> ...maybe I'm just being paranoid though, since presumably there are
> enough random HW characteristics that could be strung together and
> hashed to make roughly a unique ID anyway and hiding every HW
> characteristic would be a bit extreme...
>=20

I suppose if that's a problem then the process that mounts debugfs can
change the access to restrict it. I'm not aware of this needing to be a
kernel policy though, so I'd rather leave that up to userspace to decide
if it should be restricted further.
