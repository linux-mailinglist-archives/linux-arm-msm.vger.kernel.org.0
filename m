Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0B437311C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 10:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244222AbjFOIJ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 04:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239368AbjFOIJZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 04:09:25 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A97F1A1;
        Thu, 15 Jun 2023 01:09:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686816558; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=CM7X1acMlB9WU8dvRzsFaeuR+Zxu4lSplpwEgbSpugUa9RAg2qqohuAnJAoqe8ZAhF
    6pPANXYTQH9flPD4cWTmMgVPfXT83mP1DUIZgqMqTyGvYptaP5EMXyktTqJkUKwrHkog
    K+D33JWQkJmx+bwHHWXgoDQ98IvEMkso2v0y3VpwchWop/OoT9ZzRbLwFGYdu02vTTGV
    ywdG5X7y6IPwO3v6poPLO+NHEmdfpuHJKZPiGIrmpdkIl4fjaAh9jyyc06sfATA7XWTz
    GtDXf/iMgnZBYUAFacExRV/40+NfkfiSGMUwL5R74oyBPy0TqAgrbFpSPPD4A5/Se6rF
    SMvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1686816558;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=fHWWafcLE6QbxDZMj4uI+BLupiwN2GnJnfQh/hNxH3w=;
    b=EilZDXPgL9RnXrs4Q7bb79kSb+2Y9saXgDc5xqj6kXL0/7zFSLob8W7rcyJPmZCLbJ
    KJ9CyeBMGPwN4WaydiABVLlViwq5cXGIdPn+su4Lw1wuI/diBmcx1dF6PLKtzLd86aut
    ZGD5A2nLamYb56Pwmv2WjTGX255u6Oyu1QuRQKggUGDdgzdfxB08r8wVPyrsnFx1qBQ1
    ipHmc2bYGUbhDCByXlA27mjFFS9hzKRKx3cuvuk9VRxMm+6chG/Up64Na14bOu+nteiP
    mji12lqb8bzyZOZqdmtlrBy3xabd8hVduUgSYQOltkQXa87cKBJ5LCjn6Z5fKvbgzl0D
    6yzQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1686816558;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=fHWWafcLE6QbxDZMj4uI+BLupiwN2GnJnfQh/hNxH3w=;
    b=fYekLnWK/msIk09f0xVngrxb/OzQleVapVWg8qySgcFjEdgLF919n2Apkg3Upqa450
    o/h2jP/g2cyoLffYtEllyfHjHhTmSI5RS9/7RUalT3wK9xxt2/hDKvSF8ddLzEw7aChx
    CICeaH1+kkxzvKjmXk9DxDwtIUDFhCUocCLBWUS00/hi+vZr1T/UuRLAdzlpiMvntFzD
    n9lyltZarnb2oZLE1mLKIoAY8lYsdqCVhD9RARrQF8X4dPUCreMQWh5Dnr5RRGvCLEI5
    rGn0MQ5zkKIyGV+m02w5VcrAKo3PBUavQ1ifEQkasdblhLttKJVyHyMX+7CWRcCeYBU7
    P+uQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1686816558;
    s=strato-dkim-0003; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=fHWWafcLE6QbxDZMj4uI+BLupiwN2GnJnfQh/hNxH3w=;
    b=8W/5Wst501Ovg8dERHZTLgFkDKd47TFrLgU6DVM53Ic/bnegN1+Mlaw9glGzNOUn2m
    YV7Z6Evh/7EWHjGD8wCQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4paA9J/h"
Received: from gerhold.net
    by smtp.strato.de (RZmta 49.6.0 DYNA|AUTH)
    with ESMTPSA id D0d0a8z5F89H1vN
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 15 Jun 2023 10:09:17 +0200 (CEST)
Date:   Thu, 15 Jun 2023 10:09:11 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ajay Kumar <ajaykumar.rs@samsung.com>,
        Thierry Reding <treding@nvidia.com>,
        Douglas Anderson <dianders@chromium.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        dri-devel@lists.freedesktop.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        phone-devel@vger.kernel.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Joel Selvaraj <jo@jsfamily.in>
Subject: Re: [PATCH] drm/panel: move some dsi commands from unprepare to
 disable
Message-ID: <ZIrHJwm2-ghSUHL0@gerhold.net>
References: <20230613-panel-dsi-disable-v1-1-5e454e409fa8@linaro.org>
 <ZIjayn8nVy-ejThH@gerhold.net>
 <CACRpkdZ7a3aARMs3iBbBavF_0AkPOPs3fH8e6CrZYo7Ybr6m_A@mail.gmail.com>
 <4f78b601-6e6e-2274-3174-87c62d7cfcd5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f78b601-6e6e-2274-3174-87c62d7cfcd5@linaro.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 15, 2023 at 09:49:27AM +0200, Neil Armstrong wrote:
> On 14/06/2023 22:58, Linus Walleij wrote:
> > On Tue, Jun 13, 2023 at 11:08 PM Stephan Gerhold <stephan@gerhold.net> wrote:
> > 
> > > I'm still quite confused about what exactly is supposed to be in
> > > (un)prepare and what in enable/disable. I've seen some related
> > > discussion every now and then but it's still quite inconsistent across
> > > different panel drivers... Can someone clarify this?
> > 
> > It is somewhat clarified in commit 45527d435c5e39b6eec4aa0065a562e7cf05d503
> > that added the callbacks:
> > 
> > Author: Ajay Kumar <ajaykumar.rs@samsung.com>
> > Date:   Fri Jul 18 02:13:48 2014 +0530
> > 
> >      drm/panel: add .prepare() and .unprepare() functions
> > 
> >      Panels often require an initialization sequence that consists of three
> >      steps: a) powering up the panel, b) starting transmission of video data
> >      and c) enabling the panel (e.g. turn on backlight). This is usually
> >      necessary to avoid visual glitches at the beginning of video data
> >      transmission.
> > 
> >      Similarly, the shutdown sequence is typically done in three steps as
> >      well: a) disable the panel (e.g. turn off backlight), b) cease video
> >      data transmission and c) power down the panel.
> > 
> >      Currently drivers can only implement .enable() and .disable() functions,
> >      which is not enough to implement the above sequences. This commit adds a
> >      second pair of functions, .prepare() and .unprepare() to allow more
> >      fine-grained control over when the above steps are performed.
> > 
> >      Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >      [treding: rewrite changelog, add kerneldoc]
> >      Signed-off-by: Thierry Reding <treding@nvidia.com>
> > 
> > My interpretation is that .enable/.disable is for enabling/disabling
> > backlight and well, make things show up on the display, and that
> > happens quickly.
> > 
> > prepare/unprepare is for everything else setting up/tearing down
> > the data transmission pipeline.
> > 
> > In the clock subsystem the enable/disable could be called in fastpath
> > and prepare/unprepare only from slowpath so e.g an IRQ handler
> > can gate a simple gated clock. This semantic seems to have nothing
> > to do with the display semantic. :/
> 
> It had to do, .prepare is called when the DSI link is at LP11 state
> before it has switched to the VIDEO mode, and .unprepare is the
> reverse when VIDEO mode has been disabled and before the DSI link
> is totally disabled.
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L938
> 
> then
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L855
> 
> but Doug has started changing this starting with MSM DSI driver, leading to
> current panel drivers not working anymore with the current DSI init mode
> and requires setting pre_enable_prev_first for only some DSI hosts
> who switched out of set_mode().
> 

Hm, do I understand you correctly that setting
bridge->pre_enable_prev_first / panel->prepare_prev_first should work as
an alternative to $subject patch, at least for the MSM DSI driver? With
it DSI commands should be possible to be sent in .unprepare()?

Thanks,
Stephan
