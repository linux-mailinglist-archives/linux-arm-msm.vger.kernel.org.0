Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0D372272EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 01:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbgGTXc3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 19:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726021AbgGTXc2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 19:32:28 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0669C061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 16:32:28 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id mn17so640689pjb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 16:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=+uXLuocAO8lxCToiXlu/ReZ2hnWMT9ytGR6dkaeKVcg=;
        b=L3CaE1u0T+Opv+kLiWcX3Ec5X59jjbA9ANZp1cgG9bOS3DXa2o1L9a9YEcj4cXlKC2
         YpsMhC0kPyoFSgBcTddfFOIKE7LiXt/QMGZWsarCu2NGjirgyXZxVIhiB74qP1gv62v9
         Q1bvn8ox2SETeiMeFmiw8sTgBuT2J4USRqn5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=+uXLuocAO8lxCToiXlu/ReZ2hnWMT9ytGR6dkaeKVcg=;
        b=HPU3hyme4AW92X2PGD+/9gJ5aU1vK5cjwHK8qw1wtoJ3YpvFnzk1haqC4MxQN1Kqbm
         592Ls11jM5VvHg5369WIQHX5/18+XlBwqZFDFXUiVrfjcu9Gar7N7+N4MRW/rfjQPtuU
         /yfbsdITkUA+soPlY3KaZFWsX0Oh4bTJZ8hWnwhAHHWoPaDwxTfcuVt/evuNheYr5k9E
         PaQ47PpY2c1GPJEB9xua1AqHJkjNb78v0D3y4+DH/FKC0A5KuQq9/6xQ/iUek2YszZNm
         jBl0SXPpojmOXvFCqs7K4VfAnfZ23d2vAXKqD9P4IwEG/OPNYtHSDfD7Zh1+qmehPI8l
         zzxw==
X-Gm-Message-State: AOAM533UFp1bjsP0HA6MzodfPS3rcU40WT+G1PxEDm5RPy2ONPk81Jim
        lbQ7a2/Vt7ofB9F1Rv6b6tg2uQ==
X-Google-Smtp-Source: ABdhPJyzZqIFkJvQhLWQiuq3uOD8kLbvlBxMBgJb3gbD3D7nIYizU92Vunzu1FrFGUCCZSH/KMaTmw==
X-Received: by 2002:a17:90a:7487:: with SMTP id p7mr1715589pjk.233.1595287948100;
        Mon, 20 Jul 2020 16:32:28 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id a9sm18301137pfr.103.2020.07.20.16.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 16:32:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <91a8eef836c1939cb57942c6fdcf2772@codeaurora.org>
References: <20200707184125.15114-1-khsieh@codeaurora.org> <159527632812.1987609.6364896740387949838@swboyd.mtv.corp.google.com> <91a8eef836c1939cb57942c6fdcf2772@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     robdclark@gmail.com, sean@poorly.run, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
To:     khsieh@codeaurora.org
Date:   Mon, 20 Jul 2020 16:32:26 -0700
Message-ID: <159528794676.3847286.1584696687662833591@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting khsieh@codeaurora.org (2020-07-20 15:48:13)
> On 2020-07-20 13:18, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2020-07-07 11:41:25)
> >>  drivers/gpu/drm/msm/dp/dp_power.c           |  32 +-
> >>  drivers/gpu/drm/msm/dp/dp_power.h           |   1 +
> >>  drivers/gpu/drm/msm/dp/dp_reg.h             |   1 +
> >>  17 files changed, 861 insertions(+), 424 deletions(-)
> >=20
> > It seems to spread various changes throughout the DP bits and only has =

> > a
> > short description about what's changing. Given that the series above
> > isn't merged it would be better to get rid of this change and make the
> > changes in the patches that introduce these files.
> >=20
>=20
> Yes, the base DP driver is not yet merged as its still in reviews and=20
> has been for a while.
> While it is being reviewed, different developers are working on=20
> different aspects of DP such as base DP driver, DP compliance, audio etc =

> to keep things going in parallel.
> To maintain the authorship of the different developers, we prefer having =

> them as separate changes and not merge them.
> We can make all these changes as part of the same series if that shall=20
> help to keep things together but would prefer the changes themselves to=20
> be separate.
> Please consider this and let us know if that works.
>=20

I'm not the maintainer here so it's not really up to me, but this is why
we have the Co-developed-by tag, to show that multiple people worked on
some patch. The patch is supposed to logically stand on its own
regardless of how many people worked on it. Authorship is a single
person but the Co-developed-by tag helps express that more than one
person is the actual author of the patch. Can you use that tag instead
and then squash this into the other DP patches?
