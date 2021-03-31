Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D902350261
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 16:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236157AbhCaOc7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 10:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236065AbhCaOca (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 10:32:30 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9141C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 07:32:28 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id x9so14526587qto.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 07:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i5wECuC5weZgjdPi3xLPpPAVwy9+CVkNbVRnPB22rV4=;
        b=Cb1kQzuwRvV8yJG2PLXhPjMlw/q8NuMLEfvdtsAcm9Hb41ToBl/n+b4hL0HBxKy2i/
         leYphrDJFXbTdKb8aRPx+K+wqzaQBnHyonEd1P1gmCBoIUhXmpdP/cI9wzWFC9LwNxHR
         7eLWNY4hAwXmzzSt0QeXdkggESIdeZ5jlp/wQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i5wECuC5weZgjdPi3xLPpPAVwy9+CVkNbVRnPB22rV4=;
        b=J9jWIroJ5JCDcHFw/YKgx2OZq0uDfJOh9qyQSZJKjC7ltpPx21WG+/7l8WS3mBxFHZ
         2E2BaS67GWgfLhX+rlX1JoYlHxAK8v4kQWEZljVbsqY1D5X9dEEi6mRrrZvFm37BtDAS
         AqoFqmJtumkPewNIg3Z9EH/G2FwoGb7boKrituQv5ke1feSnjtxZHWcbtR/PWacw3TnE
         RPU28L3GlcsSJpetMydHL72PR3UjCI+0RWouNZpnH7akmaKb0LssxULU/ffA1yj3EyZa
         M9I14TxCUL74fZ45xKVAjep41F9f4qvR/4JSHJkEvKG5cZgL0bGCyTXf+WkY5BuIldT1
         8WHA==
X-Gm-Message-State: AOAM533L0yLn6Vl51JsoCGV8w5OFnnIYkfpJhykcBuqY+7SVycNiIook
        ASFm5CRKTHi5P3T88jSgdDl/VnAJdYbeXA==
X-Google-Smtp-Source: ABdhPJwuz3fB2PGpH/5pHOJRtbTVqC5FaZ89QRCM6AUaKecoMP2qwZwTiMF8o13vvdl6N2GlPa4ByA==
X-Received: by 2002:ac8:5510:: with SMTP id j16mr2636913qtq.339.1617201147913;
        Wed, 31 Mar 2021 07:32:27 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id s13sm1548489qkg.17.2021.03.31.07.32.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 07:32:27 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id i144so21407013ybg.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 07:32:27 -0700 (PDT)
X-Received: by 2002:a25:4092:: with SMTP id n140mr5092311yba.276.1617201144211;
 Wed, 31 Mar 2021 07:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210330025345.3980086-1-dianders@chromium.org>
 <CGME20210330025443eucas1p1e53f4fb8623c3dc2ae8ce514e3009bc5@eucas1p1.samsung.com>
 <20210329195255.v2.10.Ida6151df6bfc71df77afee1d72bb7eb0a443f327@changeid> <26d73f36-e150-57ec-d957-4b7bda6b366e@samsung.com>
In-Reply-To: <26d73f36-e150-57ec-d957-4b7bda6b366e@samsung.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 31 Mar 2021 07:32:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W6SABggAaBbw9LXdf5sHOGGQzZJp8YFmYcWG1yf1rW5w@mail.gmail.com>
Message-ID: <CAD=FV=W6SABggAaBbw9LXdf5sHOGGQzZJp8YFmYcWG1yf1rW5w@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] drm/bridge: ti-sn65dsi86: Stop caching the EDID ourselves
To:     Andrzej Hajda <a.hajda@samsung.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Clark <robdclark@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Robert Foss <robert.foss@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 31, 2021 at 3:12 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
>
> W dniu 30.03.2021 o 04:53, Douglas Anderson pisze:
> > Now that we have the patch ("drm/edid: Use the cached EDID in
> > drm_get_edid() if eDP") we no longer need to maintain our own
> > cache. Drop this code.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Note that unless the advice given to me changes, I'm dropping
${SUBJECT} patch on the next spin and putting the EDID cache back in
the bridge driver. See:

https://lore.kernel.org/r/YGMvO3PNDCiBmqov@intel.com/


-Doug
