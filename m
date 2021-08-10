Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF953E855B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 23:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234315AbhHJVeK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 17:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234331AbhHJVeJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 17:34:09 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C1FDC0613D3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 14:33:47 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id y23-20020a4a62570000b029028727ffa408so84611oog.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 14:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=K89ryxZKdGzSi1l6ZgbY5SW5/B4L1gkXo7ILZAccfU4=;
        b=iBzrlbp6mNut88ED6fWJqIB9hl9saDzoC0ziK0cNST5Dd4rpzrrfFer7Ih/9Wm+rQQ
         3c0d9XcwLXshbkR3X5DbIRHOytVjh2ZYKOq+DRRa1euJMdl5rNdXD2Y4zPcXTn587tsM
         yQtL1P8eTdlE5WsraMeaSEvpIQigKz8gi2cW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=K89ryxZKdGzSi1l6ZgbY5SW5/B4L1gkXo7ILZAccfU4=;
        b=tHsa/0Bw+disbVvhXA47QivUJcbwh74nMBRCAXpnmfKEhc9u3CrPYjfSAJm7T6VLvP
         Mio+R+w1htHna6UaZ0QYZ34EIilW2Uaa8wsS+SLng1q0+EsnrOKvZcXbvP/gDZI0zANT
         /0rXjxTRsBYjvNjtxQZT43bPpNbnm0p2dqTv132NpJ9DlNVco8VcgVcWnEd6C3lQiyh6
         3uQavyuHQfahIfny0p5v0jss4y7TIIQH3SpnsPWcIFT0faw/xMrqUS0UNHlfPtkuCkaB
         4+UA1kRZiWhlGPtdN9K2IvxeoS8asa+g1NfOk8hGuECYMBxAm5xAX4+/xh8yQefLUp+M
         8d/g==
X-Gm-Message-State: AOAM5312Wex+tLXUP4Z3IpvL2KGVT4Y/z/fCHp5E0QyASN584YW6odAi
        DFwMq9qNOjhlImVqKKuy3gJHfq3KsPUB0gN9hcb5qQ==
X-Google-Smtp-Source: ABdhPJzMSqm7mlJWw7m6cKtMxq0odiWwUHDwLozyyqB71lusEKk+/E8sZ86F1JfKGqRqGY8ymvo2r2rYgeFoZrYEHrc=
X-Received: by 2002:a4a:c60e:: with SMTP id l14mr18621189ooq.80.1628631226738;
 Tue, 10 Aug 2021 14:33:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 14:33:46 -0700
MIME-Version: 1.0
In-Reply-To: <1628196295-7382-5-git-send-email-khsieh@codeaurora.org>
References: <1628196295-7382-1-git-send-email-khsieh@codeaurora.org> <1628196295-7382-5-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 10 Aug 2021 14:33:46 -0700
Message-ID: <CAE-0n535+OOwQ=td-ow71MPZNq4=DFjP+hLEvrE1ZaMo+0j1rw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] drm/msm/dp: replug event is converted into an
 unplug followed by an plug events
To:     Kuogee Hsieh <khsieh@codeaurora.org>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-08-05 13:44:53)
> Remove special handling of replug interrupt and instead treat replug event
> as a sequential unplug followed by a plugin event. This is needed to meet
> the requirements of DP Link Layer CTS test case 4.2.1.3.
>
> Changes in V2:
> -- add fixes statement
>
> Changes in V3:
> -- delete EV_HPD_REPLUG_INT
>
> Fixes: f21c8a276c2d ("drm/msm/dp: handle irq_hpd with sink_count = 0 correctly")
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
