Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB5E933A0FA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Mar 2021 21:24:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234299AbhCMUXp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Mar 2021 15:23:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234288AbhCMUX0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Mar 2021 15:23:26 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB95C061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Mar 2021 12:23:26 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id w7so9990758pll.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Mar 2021 12:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=ZComPBNmBnlqs+w0q0axDrp2f7RBu3PW/uQNk9c0Mhg=;
        b=nZrKaPnBoh/iTbk/rPQgvk9qqHWK/RiepcUBKG52cr72cN8noIjG4ylYQAnV6vV03+
         L7uTZCeeYJZPFnHf5oaOUgCir5abAz2eN+6OTWrpWm5qHWz0/BxJyifYCG1rKZNZQpOX
         ws2D8Ddv06kWnUXJOEOC10pHfySsaIMqJibbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=ZComPBNmBnlqs+w0q0axDrp2f7RBu3PW/uQNk9c0Mhg=;
        b=Geyxa9qxzoaIndtiyYXp5s3uPm52ZUpJlbkP39l8Cpa7EHR89o12So8jPk3cjt0r1w
         bCWFeiS5ukUPphW1zirv+U9tJINtk+7THHkrcn5Zw5MRr5VjnudNmZs0LgkzsSlNkBOd
         HatSb8asMout4aBBHiTVGTMMP0q2MnSkFekUyPgB3D1kcNieS9HTfHNvUG3xuJz2lHNt
         8ymz2f7TDxyb3PHoIogzR0ae+0QGK6KAjlk/lOs5tscrUhIOryUAyNbypsgrI8PYvTYn
         FnhxkNs3VSJwSFUu5CylYdGhBWkTjMr7mzo8LuRXVhphrOZX9b0pcZHQlYc62648v8Kb
         CZig==
X-Gm-Message-State: AOAM533W+39xz9Mop7f1qRURNDf/afutaUtUxRasMavWqy+1SWEN7YtN
        aVBq7yzG+PkwbUmSBdewAcqY+SiggQgSSw==
X-Google-Smtp-Source: ABdhPJznrkgb4Vd9RGXUd7Ed7KRkZc2x1ozNjnwo1RoQtD567KQBnrtv+hRFwfyfkIYeRiOhS0oyPw==
X-Received: by 2002:a17:902:8a91:b029:e6:3e11:b252 with SMTP id p17-20020a1709028a91b02900e63e11b252mr4516299plo.7.1615667005608;
        Sat, 13 Mar 2021 12:23:25 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:e859:c7d5:7d7b:5ed8])
        by smtp.gmail.com with ESMTPSA id 22sm2521970pjl.31.2021.03.13.12.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 12:23:24 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
References: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
Subject: Re: [PATCH 1/3] drm/bridge: ti-sn65dsi86: Simplify refclk handling
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, robdclark@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Douglas Anderson <dianders@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Sam Ravnborg <sam@ravnborg.org>
Date:   Sat, 13 Mar 2021 12:23:23 -0800
Message-ID: <161566700332.1478170.13745405253404480721@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2021-03-04 15:51:59)
> The clock framework makes it simple to deal with an optional clock.
> You can call clk_get_optional() and if the clock isn't specified it'll
> just return NULL without complaint. It's valid to pass NULL to
> enable/disable/prepare/unprepare. Let's make use of this to simplify
> things a tiny bit.
>=20
> NOTE: this makes things look a tad bit asymmetric now since we check
> for NULL before clk_prepare_enable() but not for
> clk_disable_unprepare(). This seemed OK to me. We already have to
> check for NULL in the enable case anyway so why not avoid the extra
> call?
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
