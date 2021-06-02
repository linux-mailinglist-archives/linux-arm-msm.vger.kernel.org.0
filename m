Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51657399685
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 01:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhFBXyC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 19:54:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbhFBXyC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 19:54:02 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E68C061756
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jun 2021 16:52:13 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id b25so4533036oic.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 16:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=O7sUSvVx4X9Ue3ybXZaq3WZClmga3LyfA3CPoyVQ7pA=;
        b=KaO68w8HrAKn93zPkQaVfAuWyiF8UF7ryWsJU0WXjR5fysUaBY1gUWQGsPthtslf/R
         dBA+coYoduNqCmqyku+m4pfBR+jcwA05SKTnWK++Mwku/2mgyql4oybFlb2UfuVvpqyX
         ii82e17MwzT5sLFPPCsXI9PgffSsDPzKHe8ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=O7sUSvVx4X9Ue3ybXZaq3WZClmga3LyfA3CPoyVQ7pA=;
        b=m12W5fY79+FvZcrcg7WXqkZheV4a7tM+XHMfFsehHZ4SZVNUpuFKXuhm3W/YdrN0KI
         mu2MAJF9dYHMLrVkQ5Nm8paXFRZI2CUQgxcq6ukR9vuoe+B/ebrC328bzzL0FgTowWeu
         h+pDJpCIfGI4POOtdMqH8SY+8ZJopM9BYTeLdedtn4g+9PbTeUHGOr0tkyEzbLuARtq8
         hMfcE58olKFUr6kS4g4Nhsl14CX0F2mMq+8vP4+DlbvxyxqVkglsx65kyalwbiHukCWO
         BO92nR88gVVaD2spcKkRov5+27PnJ5Lo8870uEzEQUHAEzbYwMVKxFCcTl6CGGNEB0sh
         Ak0w==
X-Gm-Message-State: AOAM532SiLagSnmznLiDWcvdXF9CJASEvUFS5sFJ7agYmRBbq8gEqA6q
        /kF2LHbNEsqeK1Y9Wd/OJQG1d/cWM7SH8vXDyTLJqQ==
X-Google-Smtp-Source: ABdhPJyEpvV7pUBImKOSlEHTC9uSRojsd37dHEdkjH80CvIPIOyDLk/7FhcUDuDurpeY/zPKdQJPkGeigbtQkdmu7Uw=
X-Received: by 2002:aca:654d:: with SMTP id j13mr5573390oiw.125.1622677932502;
 Wed, 02 Jun 2021 16:52:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Jun 2021 16:52:12 -0700
MIME-Version: 1.0
In-Reply-To: <20210602143300.2330146-14-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org> <20210602143300.2330146-14-lee.jones@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 2 Jun 2021 16:52:12 -0700
Message-ID: <CAE-0n53PvVjUzXsZ6etSAOEOjCD3MV5gXd6YmtfrjPaO0kEdkQ@mail.gmail.com>
Subject: Re: [RESEND 13/26] drm/msm/dp/dp_catalog: Correctly document param 'dp_catalog'
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lee Jones (2021-06-02 07:32:47)
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Function parameter or member 'dp_catalog' not described in 'dp_catalog_aux_reset'
>  drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Excess function parameter 'aux' description in 'dp_catalog_aux_reset'
>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
