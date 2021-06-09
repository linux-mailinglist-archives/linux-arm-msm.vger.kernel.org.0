Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D08033A120C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 13:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233074AbhFILJO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 07:09:14 -0400
Received: from mail-lj1-f170.google.com ([209.85.208.170]:37880 "EHLO
        mail-lj1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237862AbhFILJN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 07:09:13 -0400
Received: by mail-lj1-f170.google.com with SMTP id e2so31143407ljk.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jun 2021 04:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=edtgaudOZI4aiobavQOBXkJeOQl3hnYi6MVEV9AQq84=;
        b=ayZr7B/HMgVlC0okdohGCei7GaktNCuF+JQVg9SStH5spMXSHL3MnoVsgcy0gRKsa4
         pmC0Ygl7wVqf8VNXIa61EBQp1XUesgEtUX6+OLbue18UVTP2J47q+hd2k9/FHzfOHm5z
         v4s5fWNXcE4/VZXgXHruumXCmX5k8xgRxNY7/zlcN6NTfr5/GC2s1LXU9dTDHZshBKAk
         fI5MiFrk14taaL/0EL1VY7ryUodwSdjXb05t+Qz7hHFcs3/UjKjSPPUYSd7DSJxsvaO/
         ziRY4ZuBQwp9SwRC/wZ2DbWTwttmeVHxRTQE75htG42JEINP5VSFO96y+WHJUC6jJULz
         mX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=edtgaudOZI4aiobavQOBXkJeOQl3hnYi6MVEV9AQq84=;
        b=qVcSHGAf489i8SPXq6T/C6qn6eJGjTYCfx9EWF9en83SQSnb/Q6d6/p/r81z2uP0tW
         34fqWQAIcZLQm6COGxoqAyN4A2vBjCT0i6Ajd4dfCqj28haRF1evFpIf7f+30QJBUzOv
         3McZePNTiWukpC6l1nCJ370HKab2YHe8xwiCZ+1RDjnyBLLaaGFZq/KYuapn02lxykZ5
         UZ72NcMYzNDri4+1p9er08UnkgNUjmSkI9+NUGZfbjyT7SmN7BS+fUqd2YBvQwxuH15E
         oVW3jqFlBrFsVRVZ7Rn2VpJgfYK7M5pjPtfr3bPSRnyAxHjm75w5f1itU324iYW5CmPw
         3iAQ==
X-Gm-Message-State: AOAM532ZkPHe1NNscXkgJhCIW9TFlRs+wJUamTGwzq+GbrAIlIloHBU2
        re//5ACBCMNdbkeRocGnFLM4dpSWTKo2XMrbS75Ong==
X-Google-Smtp-Source: ABdhPJzV9fO/orVbfpt+Pzff+qMI9NVxWDVHQAbz6au45P7iPdxzk0Z/yoL6wNzUHNhPVrsLwIbINGn7G3wSbYXVuXg=
X-Received: by 2002:a05:651c:1411:: with SMTP id u17mr11266433lje.438.1623236765968;
 Wed, 09 Jun 2021 04:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210607170555.4006050-1-dianders@chromium.org> <20210607100234.v9.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
In-Reply-To: <20210607100234.v9.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Jun 2021 13:05:55 +0200
Message-ID: <CACRpkdZF_WgoJHExbw8R8ejVkWh7h32VfXQw8mfux_i2+sy-QA@mail.gmail.com>
Subject: Re: [PATCH v9 03/11] dt-bindings: drm/bridge: ti-sn65dsi86: Add
 aux-bus child
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Lyude Paul <lyude@redhat.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Panda <spanda@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 7, 2021 at 7:06 PM Douglas Anderson <dianders@chromium.org> wrote:

>  The patch ("dt-bindings: drm: Introduce the DP AUX bus") talks about
> how using the DP AUX bus is better than learning how to slice
> bread. Let's add it to the ti-sn65dsi86 bindings.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
