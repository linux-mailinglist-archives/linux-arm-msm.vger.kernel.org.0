Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63B5313E47
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235957AbhBHS6z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:58:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233278AbhBHS6F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:58:05 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E905AC0617AA
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Feb 2021 10:57:09 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id 18so8157692pfz.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Feb 2021 10:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=2/gzTW7nLFsuo+IwWrIaRt+TvJX/TxBhhTnVcO/vt5w=;
        b=lOB8zinUAvyLO85HhB6TSwBqNnQK1ljBILQkgdqwfhQOiu4unf9pzceIqrYuZ078ty
         wGXEoy5Tx8tezMyFsu3JPxkei8ZS+/8rZR7me9KJSJQjcW5ybLZCGNnHESTPPIX6xJS+
         Mmt59ZFieppEbkC4SulqdsBEM9V7x6RjGQu3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=2/gzTW7nLFsuo+IwWrIaRt+TvJX/TxBhhTnVcO/vt5w=;
        b=YcTQj3Givj1zbAfRs+LEd+oIuHpq1x7pYCIAM3Xyx8Z1dsoaVI8ghz9E+B/24/wR7O
         c6eSwwqps/uoKmEcakYp/ni33T54JDPLmZIRwMO36Kxkj3Jgw/enxQnM6qdVpJCxwPfW
         XeldvnrV0AQHqDL82LO0k5AIiy/OyLcmG+A0STeFcBQ2ze49fSL9Aj9053rWmwLWQxzb
         daRqyhGuY+ykoUzfzhzgCzeJoiGy/kPibQ1Nkbcy1nokq/ea+Q7l5s2aA1kFW7LuSrHE
         Y2W2jV+G3YE7aHzfJ4/pX97DBZGJS+Jtv/l8b2Snq9mqslOHzk55oqFwl3v80lhRA5I1
         jrhg==
X-Gm-Message-State: AOAM53192muNRtOa9zrLcWEPaat+9Ji0Ufj6mtX+Jg4b8iANYHMOmngz
        /dnTki4B8WrqQ+rt/CO2irCagA==
X-Google-Smtp-Source: ABdhPJw7v065YuC3/mbkLcjCDyAiR6tav2E1VDnkk1wO2jAZ5ggH5FG4+RFceqHEy7gfiUQeynQvcA==
X-Received: by 2002:a05:6a00:15cc:b029:1ba:5282:3ab8 with SMTP id o12-20020a056a0015ccb02901ba52823ab8mr19019293pfu.77.1612810629426;
        Mon, 08 Feb 2021 10:57:09 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:751a:ba0b:8918:c305])
        by smtp.gmail.com with ESMTPSA id r15sm20452075pgh.39.2021.02.08.10.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 10:57:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8943f0acd2944144b21b5796c07e79ff5e707aaf.camel@perches.com>
References: <20210207041858.3317171-1-swboyd@chromium.org> <8943f0acd2944144b21b5796c07e79ff5e707aaf.camel@perches.com>
Subject: Re: [PATCH] drm/msm/dp: Add a missing semi-colon
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Joe Perches <joe@perches.com>, Rob Clark <robdclark@gmail.com>
Date:   Mon, 08 Feb 2021 10:57:07 -0800
Message-ID: <161281062730.76967.14597290603195200219@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Joe Perches (2021-02-06 21:06:54)
> On Sat, 2021-02-06 at 20:18 -0800, Stephen Boyd wrote:
> > A missing semicolon here causes my external display to stop working.
> > Indeed, missing the semicolon on the return statement leads to
> > dp_panel_update_tu_timings() not existing because the compiler thinks
> > it's part of the return statement of a void function, so it must not be
> > important.
> >=20
> > =C2=A0=C2=A0$ ./scripts/bloat-o-meter before.o after.o
> > =C2=A0=C2=A0add/remove: 1/1 grow/shrink: 0/1 up/down: 7400/-7540 (-140)
> > =C2=A0=C2=A0Function                                     old     new   =
delta
> > =C2=A0=C2=A0dp_panel_update_tu_timings                     -    7400   =
+7400
> > =C2=A0=C2=A0_dp_ctrl_calc_tu.constprop                 18024   17900   =
 -124
> > =C2=A0=C2=A0dp_panel_update_tu_timings.constprop        7416       -   =
-7416
> > =C2=A0=C2=A0Total: Before=3D54440, After=3D54300, chg -0.26%
> >=20
> > Add a semicolon so this function works like it used to.
> []
> > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/=
dp_ctrl.c
> []
> > @@ -631,7 +631,7 @@ static void _dp_ctrl_calc_tu(struct dp_tu_calc_inpu=
t *in,
> > =C2=A0
> >=20
> > =C2=A0     tu =3D kzalloc(sizeof(*tu), GFP_KERNEL);
> > =C2=A0     if (!tu)
> > -             return
> > +             return;
> > =C2=A0
> >=20
> > =C2=A0     dp_panel_update_tu_timings(in, tu);
>=20
> Wow, that's really unfortunate that dp_panel_update_tu_timings
> is also void.
>=20
> Perhaps this as YA checkpatch warning:
>=20
> ---

Acked-by: Stephen Boyd <swboyd@chromium.org>
