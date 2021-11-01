Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9231E441FE2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Nov 2021 19:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbhKASVo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Nov 2021 14:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbhKASVn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Nov 2021 14:21:43 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE13C061714
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Nov 2021 11:10:22 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id t4so26093006oie.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Nov 2021 11:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=RTpcjCaKMjk8wOfkGg+XhDUUHXGzz0r5LuC/nlABn74=;
        b=Hms4n8EsBYjDqEWRwfdorGPR19Sl0b3GXGDHqXv7432wT6aufk+qulIlNLvHRxWc7Y
         6GqpCN/WAvrnAbLSSgUR8ItaRk4yqFg2tqM2BQjivbc736Aqte31NKEF7KwCFIxJWVEp
         h49MfXiHYM8ZfKMRwLGJRHnF18Z+2mV7PY2yQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=RTpcjCaKMjk8wOfkGg+XhDUUHXGzz0r5LuC/nlABn74=;
        b=Osmr3dS0aWojFYw+BfLF7c+zRRo0+sanHCWqYcL9wqAFtg8i5n/AXXcIiDiUKro25s
         olzBHyjtQP1EYn1g3r4dY6hZfGs2zuv0KsAIE2cqmEJDI/dsfA6Cssot+Gyj2bzu4Vco
         4SxNJdENtL0hYpRo9bg+W6XSkpxkcn1uuJrHIb3k1RL2KZBex/8kXkgfhr8pTRfzCjET
         /LlYR3SFSNEOMgZIsu7pdWO/6SgEtGC+PMkYjyZBsjx/5F0KvLgr5NjrbZ0GGCFATF0E
         ftenAoaE4uZBzX4aklLyAJIdae7dy5+jIfWN42P4H8HJIPrQvSmRY/zTs68YwMeUWKan
         BBKQ==
X-Gm-Message-State: AOAM531gIG9ntxoH0OgFgsy8Mlwzz5j9qPBBPENZCNQA4RlX5zO/LEAo
        irr2NLq1vUnvfR01qyV93VpjxRaMV3AQvlDitSQc4A==
X-Google-Smtp-Source: ABdhPJzgFmKoi4uMfFK3RymVte6R4WSjg8lMx4INzmZ1qraDiHERExAQVxP6DSOAOu0WpWxcuwqOAr8FQwmKA+sd1BU=
X-Received: by 2002:a05:6808:2307:: with SMTP id bn7mr519321oib.32.1635790222358;
 Mon, 01 Nov 2021 11:10:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 1 Nov 2021 11:10:21 -0700
MIME-Version: 1.0
In-Reply-To: <20211030100812.1.I6cd9af36b723fed277d34539d3b2ba4ca233ad2d@changeid>
References: <20211030100812.1.I6cd9af36b723fed277d34539d3b2ba4ca233ad2d@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 1 Nov 2021 11:10:21 -0700
Message-ID: <CAE-0n529Nfp7rOA4a4dtvh83rPxjVQ2VK0uDORgzOWmSsDa6rA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: set default num_data_lanes
To:     LKML <linux-kernel@vger.kernel.org>,
        Philip Chen <philipchen@chromium.org>
Cc:     dianders@chromium.org, robdclark@chromium.org,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bernard Zhao <bernard@vivo.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Yangtao Li <tiny.windzz@gmail.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Philip Chen (2021-10-30 10:08:50)
> If "data_lanes" property of the dsi output endpoint is missing in
> the DT, num_data_lanes would be 0 by default, which could cause
> dsi_host_attach() to fail if dsi->lanes is set to a non-zero value
> by the bridge driver.
>
> According to the binding document of msm dsi controller, the
> input/output endpoint of the controller is expected to have 4 lanes.
> So let's set num_data_lanes to 4 by default.
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
