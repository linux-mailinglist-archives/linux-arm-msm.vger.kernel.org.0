Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9121C4DB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 07:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725320AbgEEFgW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 01:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726788AbgEEFgU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 01:36:20 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E3AC061A10
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2020 22:36:18 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 207so539084pgc.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2020 22:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=PgNn3V7/MzuRcjOMN9rd19kSSaAjSXc1sbvAQljU/hA=;
        b=SM7cLj321gsqku/RcDGUTvjhUWhaWgSRlq+T4JlGUjnomhg0gFtNX4IPqFznQGaCE0
         fJ+ioa3bAOkK0uMmzhCYvKPr5NydIsmo27aIJ5EDtHwGsuykNx/UOt15PO5YBLJ24CbA
         H87V4WJ1KvGvLgl9IN6GleQbJKC8t08luv4wE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=PgNn3V7/MzuRcjOMN9rd19kSSaAjSXc1sbvAQljU/hA=;
        b=Km3QVCRB2wtXafrBX6CmBGPNG7Bm+CxRkmB+pbMkHquvif7bwUVKOwdjQw5XKeVt1l
         eCvvbbULYu5hkY2VlERDLfow3Zu88m/qMHOFZqxI5rcDyUrTKTsOs7UGOVe62/p3clDo
         Y5VASyuGXYbFeQAXvR6lMXYpmcQTPWyqkSkzGJ99XpUw3vIED0CC+uc7V6iTwfKXPlnx
         bGt9aRaEyWAi2ykHr1mlKW/DH6y2Isq4XpEJn7ugBUmA4ZxFDxey5/iU+1sRvrG0FNy0
         wtQPvyepqZkalNO5k/8JlqQR1Fu4TfdGQk4MrKkrWoWZ7LghLagH+X6rxNQwYtYjoC6X
         a3EA==
X-Gm-Message-State: AGi0PuamqMzPdLPMUwJK2gizbc2+6vTAY5bjGkkrfvmt/wDMoq1URhKW
        OTAc7lQyUeL3ErooM3N/3xJpWcgOZWU=
X-Google-Smtp-Source: APiQypJCj1XTR2XkP+3PzHlfBOHxZ/4kCpbE0LsmFF42bc3+AilTA09X7ifq6p9O0wuvwLTx9dfT6A==
X-Received: by 2002:a05:6a00:d:: with SMTP id h13mr1562393pfk.254.1588656978175;
        Mon, 04 May 2020 22:36:18 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id h17sm803393pfk.13.2020.05.04.22.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 22:36:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200504213225.1.I21646c7c37ff63f52ae6cdccc9bc829fbc3d9424@changeid>
References: <20200504213225.1.I21646c7c37ff63f52ae6cdccc9bc829fbc3d9424@changeid>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix off-by-one error in clock choice
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
        robdclark@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sandeep Panda <spanda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Date:   Mon, 04 May 2020 22:36:16 -0700
Message-ID: <158865697643.11125.1165741750015641823@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-05-04 21:32:29)
> If the rate in our table is _equal_ to the rate we want then it's OK
> to pick it.  It doesn't need to be greater than the one we want.
>=20
> Fixes: a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver=
")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
