Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA3BB3F82EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 09:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238975AbhHZHO7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 03:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239919AbhHZHO7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 03:14:59 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8295AC0613C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 00:14:12 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id q39so3169429oiw.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 00:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=aRiLbWEP9NQgwwctmdG3N2zfgTjntvnVENFb+awS0zA=;
        b=F81Cr3R6yT7asoMk0pyICvtOXoQZAXvI1ZnDNCPSezR35pdJ3glHU/05ASNiivAux1
         fSfqjB1WU7WW801D5dDdGncQYjxSGvFnL/wsbjCe2P3mYZLuDRXxDNkfrGdnRoesZ4pm
         DIf81ahimaKl/WhY/sF0MPtxSm6wmliMthhJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=aRiLbWEP9NQgwwctmdG3N2zfgTjntvnVENFb+awS0zA=;
        b=CvIGtmKEwISOE/0zGl9xtT/sE87N6A/1o34U2lns09OT8kGCgTtPYlC7qMFd9FW2D2
         vI+pf0JOjl5uegpRfILC6Yh2hHndZCwi2SB/MK2pzGebxGKIEc1yCNEN2nQMFF8sE5vX
         6rN+zdM8eHjNTAHHVEQzNNUSUPRE13ckTxEdTKUJ0FayTsER4hIG8xpdguzqr/f22iKR
         tGsnGX3iFYHJYBJRwBCe7h4sBUFEUjcGbZ9f8jCoTLibYtULO9bu2IX0Z/fNM2IRW0yZ
         PZheWu4Q6rvQrppwfFgfPw/QdjbQOWGpz0vpzGzYUP3m9AHHR7Pa6xrwEKs0eZxDscPv
         /KTA==
X-Gm-Message-State: AOAM531rLpCPIrtkZz24sRNgFpF/t2BZ3kgQFeNbWqq1Em83lmCESJ/u
        FfaYAEjliclFB3c9sOwtjn4LUjCR9Ay7bbUfGJg70w==
X-Google-Smtp-Source: ABdhPJzUDekyoWqTfrkclEr8+8sWlzJ7PWjVoXwVhqtZb33xoA6jHZ+GqQ45EOn0Awx+UlXeZahflBl7bsDJeh8AC6Y=
X-Received: by 2002:a05:6808:181a:: with SMTP id bh26mr10217298oib.166.1629962051961;
 Thu, 26 Aug 2021 00:14:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Aug 2021 07:14:11 +0000
MIME-Version: 1.0
In-Reply-To: <20210825234233.1721068-6-bjorn.andersson@linaro.org>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org> <20210825234233.1721068-6-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 26 Aug 2021 07:14:11 +0000
Message-ID: <CAE-0n50FhJgE-Z3DvdhfTZxRbwCx50TT2An_i=Xorf=OBE0MYQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm/msm/dp: Add sc8180x DP controllers
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-08-25 16:42:33)
> The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
> DP driver.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
