Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5E6272EDA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 23:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbjFMVIj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 17:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbjFMVIe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 17:08:34 -0400
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBDD0106;
        Tue, 13 Jun 2023 14:08:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686690508; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=a7kFma4Ob04LPtt2dRhh2jqpQNrrRQt9W++FUP5hI0TNfX+4ykWxLQ560LxxBmUmoy
    x7YLD/6XWu+2plGEYrfQP8woLK36se029TEE6cr9/xkPihwGk9jihCFvt+O7zfnO5/pC
    SVI3e+X7kWK13J9mWLWTz+Ja4tdBIZldPOphTmlCM9fFXCcLAcDA/va/TsWkhmT2lvFy
    430mgZVoMJBoOfkRMH/6bo/wKw5heqcTLuBvCI8djhtuv2urgqzfLYuOCo6wrRozjSRk
    W9nbWwlyKvwxhRJWN7VAERuFX3r/yyOAiVDEyr3RxdT9un7ON6XSACC3qaSSfHqVAUWR
    HsTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1686690508;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=nXN2h+Dei1D97pwkT2vymVQ7sbFmBMRIGz3MmIli3HE=;
    b=WBhVkRBdau7/szpg+BMlwJOvkf8s12Q2+E7+z8zSpYXryl015Js65/0aVIHUCztHx0
    XVkaVXUZ100yon1sWds7AcPVRBumJKgY9Sj+jzAUZhu29he/xs4OG5KsogC/FB/EsGHC
    n+v+EBIlxdN6gmyvFFzzpV3dQx6KNZyzDHTwv8CItNwJdSGnJ1ImVXwcQ5WK9l8P546c
    G2QzZRJq1iXdZwKuzzbsdLkvM557JMF/qCHlNoptNzGBT9Ai6e78fQCEqdR+UiiRnkgp
    SW5o53LV9EkiPPLX6BY0WJErZkIAina7S67a/ccPWtEE4vkX3HeOVT2SASJB8zU2R7kN
    1otw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1686690508;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=nXN2h+Dei1D97pwkT2vymVQ7sbFmBMRIGz3MmIli3HE=;
    b=OV7Ore3lMBJS6UZcHjoPLqhUaHK8ThnRg4XpTc8fk+B33Xk1MkGQFTS4tLYjEbHhS6
    f9CclvEFnlBYeEREckD2EZfWmV0r1nhBRDSr5RZCNd7rKcp3pdsxuHPXxDIH6SDdW7nn
    iKWH+UNQ/LGn25bkoSnJot/CgQSrLdAjn/oFIHKQ6cTfrJehAGF84qIkA17PgRRp6svN
    ckea9lVG4gH4cFWuzhdjAG8ykXv9DaMvvI/Cd5Hqz+N5AwrDahyjOQxnjSt6vgfHTV1M
    dmU6vyViBHx16yxM+SZRTyHLKuRNgDX1zzvkvNNUWS7AnqfD9A2EtHK2w56Jxm+GtzrH
    hYZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1686690508;
    s=strato-dkim-0003; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=nXN2h+Dei1D97pwkT2vymVQ7sbFmBMRIGz3MmIli3HE=;
    b=TGY8WjPQAEKxwcEse3mezZqC7U4T3WBvqURbqWcnLgwmsixtH1OYqM0/iYPZ9ggYIo
    jbiTPWb1je431WVbdMAA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4peA8Z3h"
Received: from gerhold.net
    by smtp.strato.de (RZmta 49.5.3 DYNA|AUTH)
    with ESMTPSA id Z82ec2z5DL8RaC5
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 13 Jun 2023 23:08:27 +0200 (CEST)
Date:   Tue, 13 Jun 2023 23:08:26 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Joel Selvaraj <jo@jsfamily.in>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/panel: move some dsi commands from unprepare to
 disable
Message-ID: <ZIjayn8nVy-ejThH@gerhold.net>
References: <20230613-panel-dsi-disable-v1-1-5e454e409fa8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613-panel-dsi-disable-v1-1-5e454e409fa8@linaro.org>
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[added Dmitry to Cc, since he suggested doing this in [1]]

On Tue, Jun 13, 2023 at 12:36:52AM +0100, Caleb Connolly wrote:
> The commit 007ac0262b0d ("drm/msm/dsi: switch to DRM_PANEL_BRIDGE")
> breaks panels which send DSI commands in their .unprepare callbacks.
> Migrate to using .disable for that for some SDM845 panels.
> 
> Co-developed-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-ebbg-ft8719.c      | 18 +++++++-----------
>  drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 11 ++++++++++-
>  drivers/gpu/drm/panel/panel-visionox-rm69299.c | 11 ++++++++++-
>  3 files changed, 27 insertions(+), 13 deletions(-)

After Dmitry's description in [1] it's still not quite clear to me if
the MSM DSI driver behaves wrong here (perhaps just "differently"?) or
if most of the panel drivers have this set up wrong.

This patch suggests that panel drivers shouldn't send any DSI commands
in .unprepare(). If this is really the case I think this change should
be applied to all panel drivers, not just the ones that happen to be
used with SDM845 devices. There are several others that also send DSI
commands in .unprepare().

I'm still quite confused about what exactly is supposed to be in
(un)prepare and what in enable/disable. I've seen some related
discussion every now and then but it's still quite inconsistent across
different panel drivers... Can someone clarify this?

Thanks!
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/CAA8EJpq_9iC1rkiZVom28Kv_B3QLd4pBgFObxBfSpJ+Xh=Mp1g@mail.gmail.com/
