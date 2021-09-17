Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E90D40F096
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 05:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244267AbhIQDzf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 23:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244232AbhIQDzQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 23:55:16 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A315EC061766
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 20:53:51 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso11208595otu.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 20:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=si11JPg2tUx3AsVeQ/TovCztnetl7T3psWWpp1fS5lA=;
        b=DZOnQvfjYVw2eK0gwNwwxEXWEm5xLno5eGrvLjhgQGrgMCGhtM4kv/W42j9sLJbi3O
         pcEBZnF0iu+0HiMKill8pmsE1UQpkECyjgiq3K0ICvlL6rldHZyw/e152XjZ/43P2ZnG
         mzjiCCe9lkGDxEZvO+/SMpdWDYkRwaGvJ8SB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=si11JPg2tUx3AsVeQ/TovCztnetl7T3psWWpp1fS5lA=;
        b=My/QQtcwme7cnqzRbi89Bs2y6EDVhilEcdTOb7Il0YJVFpjyRXq9WX/8UkmR85VMfO
         1ZYtAnT2wmhGktDNfykh+OIdJf3He5qC9NH5X5uDDKTMpSEj/1g9GER/bLCTyDrNcOz5
         543jb+2DgoElZ1uoUiTRW56qCodvqvw38Cjpk5Vw3M2Qwmhp8uSmHt7kNJgN2AA4wW/i
         45NPlSP0CtR5IqHxqwTVEbVtuAEX9Y7DUlVJ3g4KE6nOvNgbNo1wT4IQNXgaYU/iWhbk
         9MXn9Ix6iEhRzjKXG3pJFq1IVFXfP9/mLcruyhZPVUvPCTNeVICaJSJsatXAN3JK3TXf
         Cu2g==
X-Gm-Message-State: AOAM531cxYRCWd84WAJJQD/L4fnyemlY7zIyWqHoPsF9uQ4+oUd5zwGV
        gz9VsLcS4CV+Wr+WxrdvIYfgkQY2pyPwXroK8bsheA==
X-Google-Smtp-Source: ABdhPJy6tPkXKq2HM2Xabj28+m9bCyAX8hcbLJrNjiL+b85iLZXT99WZxbBBCWiIknpSoYbGwM1DrBLiHpKljB+xkBQ=
X-Received: by 2002:a05:6830:18c7:: with SMTP id v7mr7659104ote.126.1631850831069;
 Thu, 16 Sep 2021 20:53:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 20:53:50 -0700
MIME-Version: 1.0
In-Reply-To: <20210915203834.1439-11-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run> <20210915203834.1439-11-sean@poorly.run>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 16 Sep 2021 20:53:50 -0700
Message-ID: <CAE-0n53uAEcj8Rpx36cRUU34k9mqtg2_tiXW_4+CYmrcihguHg@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] drm/msm/dpu: Remove encoder->enable() hack
To:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sean Paul (2021-09-15 13:38:29)
> From: Sean Paul <seanpaul@chromium.org>
>
> encoder->commit() was being misused because there were some global
> resources which needed to be tweaked in encoder->enable() which were not
> accessible in dpu_encoder.c. That is no longer true and the redirect
> serves no purpose any longer. So remove the indirection.

When did it become false? Just curious when this became obsolete.

>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-11-sean@poorly.run #v1
>
> Changes in v2:
> -None
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
