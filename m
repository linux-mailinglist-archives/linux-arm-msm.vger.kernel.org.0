Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5442320175
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Feb 2021 23:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhBSWr0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Feb 2021 17:47:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhBSWrZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Feb 2021 17:47:25 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C37CEC061786
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Feb 2021 14:46:44 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id n10so5999795pgl.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Feb 2021 14:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=77aFN3X3B8ZOa2LFV3nt5PPEdkKjE+anr2eIHArGBZI=;
        b=mNayBvgQSMayniwbb1d97dRJpctfMgOIorNOVhijMSM+SLYhY7+q7UyttewTf9a2Hp
         B3Jp3CFUjbYUJfipkc3GFgul0vtBVKZAasjqy/DQskZ8j9FkqI0Wvgx3wDdMzisNK43X
         YkWW/eknmby9epgU1tvmCJXUYmOHkCdklRSmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=77aFN3X3B8ZOa2LFV3nt5PPEdkKjE+anr2eIHArGBZI=;
        b=Lt+7tbl1Rb4WXBwyGhlKQMUNUX/UV5qw5J13l6A7mgrdB4cRJRlGbxljcDNrE3KYST
         aWIX3l4c+h9gN4hJTZqBlJXoUotrser2nsspgtr7W/6hvf3ve/rpSolRgZQxB6Hx6q9+
         EXiuHDBmvUdo8wUsRS2VhNR1ZB6j/ZOi1RKzQ8uShVTdA5jD/3NroE+e36HdY/GsJeGh
         iFCE4ig3biRPrqZKNbBLBoCuuQLyhLi+mhDp+7jMKqo/xfXY4GXwZzWJyPb9J3XgS7UO
         A2fhJc2FVdbZ2JFXxH3gR3h8GcrXUUPMBIn3oVPL/5kpcp+FQoKHjLZ+wqax31vHfaGv
         q1UA==
X-Gm-Message-State: AOAM530KGM0Q49aJK0Qgfm86kvwkqwyYsQMnwpMWD8+oRbWkW3F/IFoT
        CxALNzD/buqgDSLUGY5/gPN5hQ==
X-Google-Smtp-Source: ABdhPJyphuJcAQ8DmrcSWPjKefON0H2PGIBTxC+RlzDXEyHoy4w2bBE6hWP83maxY6SZS9eKqjnzGw==
X-Received: by 2002:a62:e703:0:b029:1ed:5a8b:4308 with SMTP id s3-20020a62e7030000b02901ed5a8b4308mr2846228pfh.67.1613774804277;
        Fri, 19 Feb 2021 14:46:44 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:dd53:b29e:3c8:33ae])
        by smtp.gmail.com with ESMTPSA id x9sm9342392pjp.29.2021.02.19.14.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 14:46:43 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7af07dcacd5b68087cc61e467e9c57ea@codeaurora.org>
References: <1613681704-12539-1-git-send-email-khsieh@codeaurora.org> <161368935031.1254594.14384765673800900954@swboyd.mtv.corp.google.com> <7af07dcacd5b68087cc61e467e9c57ea@codeaurora.org>
Subject: Re: [PATCH v2 2/2] drm/msm/dp: add supported max link rate specified from dtsi
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     robdclark@gmail.com, sean@poorly.run, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
To:     khsieh@codeaurora.org
Date:   Fri, 19 Feb 2021 14:46:41 -0800
Message-ID: <161377480166.1254594.16557636343276220817@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting khsieh@codeaurora.org (2021-02-19 08:39:38)
> On 2021-02-18 15:02, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2021-02-18 12:55:04)
> >> Allow supported link rate to be limited to the value specified at
> >> dtsi. If it is not specified, then link rate is derived from dpcd
> >> directly. Below are examples,
> >> link-rate =3D <162000> for max link rate limited at 1.62G
> >> link-rate =3D <270000> for max link rate limited at 2.7G
> >> link-rate =3D <540000> for max link rate limited at 5.4G
> >> link-rate =3D <810000> for max link rate limited at 8.1G
> >>=20
> >> Changes in V2:
> >> -- allow supported max link rate specified from dtsi
> >=20
> > Please don't roll this into the patch that removes the limit. The
> > previous version of this patch was fine. The part that lowers the limit
> > back down should be another patch.
> >=20
> > We rejected link-rate in DT before and we should reject it upstream
> > again. As far as I can tell, the maximum link rate should be determined
> > based on the panel or the type-c port on the board. The dp controller
> > can always achieve HBR3, so limiting it at the dp controller is
> > incorrect. The driver should query the endpoints to figure out if they
> > want to limit the link rate. Is that done automatically sometimes by
> > intercepting the DPCD?
>=20
> ok, i will roll back to original patch and add the second patch for max=20
> link rate limited purpose.
> panel dpcd specified max link rate it supported.
> At driver, link rate is derived from dpcd directly since driver will try =

> to use the maximum supported link rate and less lane to save power.
> Therefore it is not possible that limit link rate base on dpcd.
> AS i understand we are going to do max link rate limitation is due to=20
> old redriver chip can not support HBR3.
> How can I acquire which type-c port on the board so that I can trigger=20
> max link rate limitation?
>=20
>=20

The driver already seems to support lowering the link rate during link
training. Can't we try to train at the highest rate and then downgrade
the link speed until it trains properly? I sort of fail to see why we
need to introduce a bunch of complexity around limiting the link rate on
certain boards if the driver can figure out that link training doesn't
work at HBR3 so it should try to train at HBR2 instead.
