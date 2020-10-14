Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9F8728DCCB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 11:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730783AbgJNJUK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 05:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387855AbgJNJUH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 05:20:07 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03253C02524E
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 17:37:49 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id w21so910096pfc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 17:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=hj/dmzhSD6nEq1ECbJRrN5k3Yj70fyLPOHyyW3Lpa2M=;
        b=kubmvMu5gTY7pe6tnlFzYeC3gTJERFLXcbo2oIc2aoaGVmm+rI0CYNxe0OLsyZjRws
         xiq1KhAlYf0lKT3uew8qUdM2El6LoZ2FsouGYxKdKL2OQNPwgXebCx9wmHNtYiYyZI4q
         vTh4pcTulPq9jus3R3S/D25hLkJgue+fJuk6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=hj/dmzhSD6nEq1ECbJRrN5k3Yj70fyLPOHyyW3Lpa2M=;
        b=HuiAM7FHA4CnZUcGpvqD62sJP0gqA29VwCLOij6oZA4PEGso4yFbuxZcB9eXYiBJAr
         Dp80mKX9mLoGZCVOZIAq6Oyn3REVsmVdzsv331UrE75uCx4qTCp6ZozEman6mj8Y2b08
         AJbB94SsWoinyQXeC0sJPcwHaKcqWt77yp980nkSE0L6yJ8UyCdovJZJ7TcTE4bW4XaT
         rUilP4QDJyFUHWQyKEY0SxKQ+HUBdjAPZZxAyYfSRUFLbbznts5DGirEYafDBk+zjMec
         hvGhjFhkFVm49XuJTk0PCJ6iC1cVXjetBrWTpJPvEl+391GAzuXfbDtMLKKOt3xdQm22
         L1qg==
X-Gm-Message-State: AOAM533J+g7QWdQ1qAjsh33lBSSmU5SXWJXr7dk7rBg5I71knbE61eU3
        LTOITmO+m8io6Yq+FMzXP7ZRIA==
X-Google-Smtp-Source: ABdhPJy6yojyBg652Pz+i9adM86lSaHrUVX9BrY5jyJAsPNpduOoyeGyfJRzzoqU3rl001da66WPpQ==
X-Received: by 2002:a62:cd85:0:b029:152:6881:5e2c with SMTP id o127-20020a62cd850000b029015268815e2cmr2060162pfg.36.1602635868572;
        Tue, 13 Oct 2020 17:37:48 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id u8sm833323pfk.79.2020.10.13.17.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 17:37:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201013233544.5324-1-khsieh@codeaurora.org>
References: <20201013233544.5324-1-khsieh@codeaurora.org>
Subject: Re: [PATCH v3] drm/msm/dp: fixes wrong connection state caused by failure of link train
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Date:   Tue, 13 Oct 2020 17:37:46 -0700
Message-ID: <160263586661.310579.4100614256936519238@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2020-10-13 16:35:44)
> Connection state is not set correctly happen when either failure of link
> train due to cable unplugged in the middle of aux channel reading or
> cable plugged in while in suspended state. This patch fixes these problem=
s.
> This patch also replace ST_SUSPEND_PENDING with ST_DISPLAY_OFF.
>=20
> Changes in V2:
> -- Add more information to commit message.
>=20
> Changes in V3:
> -- change base
>=20
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Any Fixes tag?

Tested-by: Stephen Boyd <swboyd@chromium.org>
