Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45AC5747C6D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jul 2023 07:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbjGEFbE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jul 2023 01:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbjGEFbD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jul 2023 01:31:03 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8252BE5
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 22:31:02 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-c11e2b31b95so6959025276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 22:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1688535061; x=1691127061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhZT6HGQXrVs8HZ8Yfrd/PZq4RDzl4JlYHbBSawlJgI=;
        b=R5OVgpIC90iWV3nWzt2HXZGAIvsOeD/ei/ifmVZdzx6b4rVqE8L79w94X/5VBCpfQ1
         hPrCtKY1IzJm8mwCi4kDeLrfwlk3Ip3KPawv70AgPxJjDEKJRueNME6H9QNikl3J6/j4
         bMMnID1Wxnw6A56aOLw7sDJeGDDD6ikNpJQFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688535061; x=1691127061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhZT6HGQXrVs8HZ8Yfrd/PZq4RDzl4JlYHbBSawlJgI=;
        b=ZRNdn7NSvHHbhOxUPNSlvrHBl22reQ14Vd/xvl/N0OnVHOP29FT5S/f2WzvvXHbwu2
         VWDBWh8Ym4rywVG9G4Ak/e0ClJiDoOBblJe96GQQJSFO5QhkTOISlVmE0/xjy1JLMNW9
         JwqadMPEpfeVRMDXDIPY1QzcpcraeoKe5w70Kht+PdjD4s9L9KPCBUOrgxpJV1HlFYyH
         xZ/OmKj02rH5tgUHUrr8h2n185hN0A80Ih/QWLp6kuOIogZVqRF0H0Kp+PDTW7j1EoWf
         ptr4dO2ZX02tbBzR5a6WXm4Ilwxu8THK6ftNDcqLcW6FD3Mcf4uF0VUsbXjHWceH7WH3
         E+lg==
X-Gm-Message-State: ABy/qLZGZ3Q74u/UKcqbxtmrNUttJvXdSbKgCUqHkEakDSVf9flfZ13+
        JUL3AmUfp7+DCNbRbD8BgRuo7ipb5AWvx7nGJ6qOfA==
X-Google-Smtp-Source: APBJJlGhxcdbaq6knM24Q2XbhP4OqN8lqf9RuZf+WpretMgSEJbM954+clOOc+Jp7/XBlDYvX88W3zII7F/VAeLDgx0=
X-Received: by 2002:a5b:5c8:0:b0:c63:7758:701f with SMTP id
 w8-20020a5b05c8000000b00c637758701fmr355911ybp.65.1688535061715; Tue, 04 Jul
 2023 22:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230403221233.500485-1-marex@denx.de> <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
In-Reply-To: <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 5 Jul 2023 11:00:49 +0530
Message-ID: <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Michael Walle <michael@walle.cc>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Amit,

On Wed, Jul 5, 2023 at 10:15=E2=80=AFAM Amit Pundir <amit.pundir@linaro.org=
> wrote:
>
> Hi Marek,
>
> On Wed, 5 Jul 2023 at 01:48, Marek Vasut <marex@denx.de> wrote:
> >
> > Do not generate the HS front and back porch gaps, the HSA gap and
> > EOT packet, as these packets are not required. This makes the bridge
> > work with Samsung DSIM on i.MX8MM and i.MX8MP.
>
> This patch broke display on Dragonboard 845c (SDM845) devboard running
> AOSP. This is what I see
> https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-displ=
ay/PXL_20230704_150156326.jpg.
> Reverting this patch fixes this regression for me.

Might be msm dsi host require proper handling on these updated
mode_flags? did they?

Thanks,
Jagan.
