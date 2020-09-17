Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB3926D476
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 09:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgIQHSf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 03:18:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726312AbgIQHSe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 03:18:34 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA9EBC061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 00:18:33 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id f18so633712pfa.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 00:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=ynLxGjJzusRgxkhmFN/ohIJVj9Ev6KgIVGk/i8e/nNI=;
        b=Ts0dqlozJIW/qWGqzFOiAbgbC9DRZERqoKpKu3tTpvC7XQlqA/IE+bxLWsvZXGc8f/
         VEiISqJZ2IYWvw982XeE56Mvf4E3vFCCB3SvvSH/Yapue9VF4MJIZJCdYArcS1/JjlHI
         SgI6nzy/fcnjGh0prlvpqeaAfKnzD6IDj+37M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=ynLxGjJzusRgxkhmFN/ohIJVj9Ev6KgIVGk/i8e/nNI=;
        b=QeAOzCV4gMMIuUO2xdzOe317NrW+V7kGLxxmPYTH/pjRA+rYJ8On6i7E5IByDp5kHY
         QrVNd0FTbz5+Jh2mSpr77cYOicaHHobE7G07QgNHh0sr5QGthWRRMfSSjRElRj0baLqL
         hW3x3DdujWhw61zdRnZGGMZeVdp73C9P4Lpx5g5dA7j6WpRl8mza6XmOP0ezCVrWsuQc
         cXF6R1u5RaIGhPprPinRazmTOQqcu/9DH9vxBra3xvwXL6LYnyPOuZQP+Bgwt8irF0z8
         TKXcXx6RTGTcKN1gzL5aOv/3VCCDopm2rfuvdqwHpBzbvtw/mstvp8sh6SHa5Ifv0LNi
         CYZg==
X-Gm-Message-State: AOAM533tIeLg3/QxTBGwPrpouvOiqT269sdn8JU5c3inA1VbkalTSmwA
        ZIyLVg/4ISDwVBQX5lOHgg46ZWrB/UBUaQ==
X-Google-Smtp-Source: ABdhPJxc0K6qFiNJ4R6QHz+/pHYtkO+ZQGzA01miebp+oqBr2+UjMOF8inhsObCIfPalFzm6tnmDCA==
X-Received: by 2002:aa7:88c8:0:b029:142:2501:39ef with SMTP id k8-20020aa788c80000b0290142250139efmr10119378pff.62.1600327113499;
        Thu, 17 Sep 2020 00:18:33 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id y5sm19068248pge.62.2020.09.17.00.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 00:18:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4865efd5e746d2e94cc4680a47a30a0d@codeaurora.org>
References: <1599536645-4593-1-git-send-email-mansur@codeaurora.org> <159959010893.454335.18221321331314189759@swboyd.mtv.corp.google.com> <4865efd5e746d2e94cc4680a47a30a0d@codeaurora.org>
Subject: Re: [PATCH 1/2] venus: core: change clk enable and disable order in resume and suspend
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
To:     mansur@codeaurora.org
Date:   Thu, 17 Sep 2020 00:18:31 -0700
Message-ID: <160032711157.4188128.1711388061841789272@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting mansur@codeaurora.org (2020-09-16 18:07:44)
> > On 2020-09-09 00:05, Stephen Boyd wrote:
> >> Quoting Mansur Alisha Shaik (2020-09-07 20:44:05)
> >>> Currently video driver is voting after clk enable and un voting
> >>> before clk disable. Basically we should vote before clk enable
> >>> and un vote after clk disable.
> >>>=20
> >>> Corrected this by changing the order of clk enable and clk disable.
> >>>=20
> >>> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> >>> ---
> >>=20
> >> Any Fixes: tag?
> Added Fixes tag
> >>=20
> >>>  drivers/media/platform/qcom/venus/core.c | 17 ++++++++++-------
> >>>  1 file changed, 10 insertions(+), 7 deletions(-)
> >>>=20
> >>> diff --git a/drivers/media/platform/qcom/venus/core.c=20
> >>> b/drivers/media/platform/qcom/venus/core.c
> >>> index c5af428..4857bbd 100644
> >>> --- a/drivers/media/platform/qcom/venus/core.c
> >>> +++ b/drivers/media/platform/qcom/venus/core.c
> >>> @@ -363,13 +363,16 @@ static __maybe_unused int=20
> >>> venus_runtime_suspend(struct device *dev)
> >>>         if (ret)
> >>>                 return ret;
> >>>=20
> >>> +       if (pm_ops->core_power) {
> >>> +               ret =3D pm_ops->core_power(dev, POWER_OFF);
> >>> +               if (ret)
> >>> +                       return ret;
> >>> +       }
> >>> +
> >>>         ret =3D icc_set_bw(core->cpucfg_path, 0, 0);
> >>>         if (ret)
> >>>                 return ret;
> >>=20
> >> Shouldn't we power it back up if this fails during suspend?
> On icc_set_bw() failure, we are just power it and return.
> Addressed these comments and posted new version
> https://lore.kernel.org/patchwork/project/lkml/list/?series=3D463224

Thanks. It's customary to Cc reviewers on patches, so please add me on
the next round of patches.
