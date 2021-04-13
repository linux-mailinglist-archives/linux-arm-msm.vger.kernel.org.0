Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4993235D5ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Apr 2021 05:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245526AbhDMDaR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Apr 2021 23:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245028AbhDMDaQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Apr 2021 23:30:16 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C53EEC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Apr 2021 20:29:57 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id nm3-20020a17090b19c3b029014e1bbf6c60so4078125pjb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Apr 2021 20:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=DynDyWvccRYWPixdZN4H8oJ4zvAUSDNQf2dmUS2wW00=;
        b=Ql2Y2Kg3KxgNqF3Zg8yz0YIMGEicTbn1eIgNdhf4EPE2qyysjk8AssDl42K3Div+5T
         /4xnHeJVzx4DG9EHMdtng46958IMwdL0u1FlfgKzZapuBL42VnweL9/i3pYSquPq/GCE
         y16hpkz/ha8LsmU7OZiz0FcfjDQCJvz2sCi5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=DynDyWvccRYWPixdZN4H8oJ4zvAUSDNQf2dmUS2wW00=;
        b=HeKkdoIFcgdHrk+g8ZyMDJ1ioT8qCb3iGKdypTMiPioT7vCzKrPk86WudnR5aORbwI
         aorz1u7ztFGz3mKkneHUPe2ASdcv8yd1TDEywlC8u+8Yj0XEFOARybPbGj9O1xFGQS/L
         5rSW7/R2eXTu1HegUCZy51gHHdObhU8VBxyNOT5Ab0SV77JyK1XGV8e31IPHalt2Bmxz
         Xfs+8eLv9w74pY+QQxDohdwegUK4tf+4XsuJFSuumqa86bYZEh/qu85CPNvpLSeawJUP
         zv1m7swlntBszcsApLpdOlt54kahY18eHOFCE1vu8WeA08tTidVULU1Q59BFFdN2HH5V
         SyaQ==
X-Gm-Message-State: AOAM533kWlrb5fN9r4u25rFAEFYNrCjZx4pGSby81o3Bqtu8iuzyN3GW
        bkNor3R8pspNq1OfVZhR5bJE0A==
X-Google-Smtp-Source: ABdhPJw9dbnsMYGsSa9Am46g8wAw3a8D88wOwThNmlb1jIzTMyJnO6BG+AI6KgAd6QyZgQVycVY1Vg==
X-Received: by 2002:a17:90a:e28b:: with SMTP id d11mr2583048pjz.53.1618284597380;
        Mon, 12 Apr 2021 20:29:57 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:1d18:a339:7993:e548])
        by smtp.gmail.com with ESMTPSA id r1sm11724978pfh.153.2021.04.12.20.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 20:29:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618246971-28754-1-git-send-email-khsieh@codeaurora.org>
References: <1618246971-28754-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH 1/2] drm/msm/dp: check sink_count before update is_connected status
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Date:   Mon, 12 Apr 2021 20:29:55 -0700
Message-ID: <161828459569.3764895.16686521998891540267@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-04-12 10:02:51)
> At pm_resume check link sisnk_count before update is_connected status
> base on HPD real time link status. Also print out error message only
> when either EV_CONNECT_PENDING_TIMEOUT or EV_DISCONNECT_PENDING_TIMEOUT
> happen.
>=20
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Also please include

Reported-by: Stephen Boyd <swboyd@chromium.org>

in the next post.
