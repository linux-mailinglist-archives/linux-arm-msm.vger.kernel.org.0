Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA4913BF5ED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 09:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbhGHHGH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 03:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbhGHHGG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 03:06:06 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 886AEC061760
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 00:03:24 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id l17-20020a9d6a910000b029048a51f0bc3cso4878214otq.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 00:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=e6F7jpKZgLK0g03ikV1DlLAQGZ9FCDYcFLY+NH5H2aM=;
        b=Djs5afqAC6AxTyRA78ZOnar6Uy1KsZPKM46v6cMxRutda3qAl0rMc29SQFeYmcTVV2
         bHQzlb7Hrg/3l8KKovEXvZw4Vu7s9Y0oqhDIseA7kQwbnhunBuh89Uf71cJDQKipvOhx
         acz2ky+Q04C+NbMI2SDQUCNXaauTAxxkQPI+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=e6F7jpKZgLK0g03ikV1DlLAQGZ9FCDYcFLY+NH5H2aM=;
        b=J+RFbEuBlci/JM3B+YBUtnPmHDmIJzA5uMBcff5922ARA+uxEF5wcLQUCP/W4rmVLr
         DTxDT50i6f7FR4vONy6PeZxzo29vBoJ+K9tI837Wc7iZ+cmUU/DiHlafXF5TkDdze5HP
         St0X4YYrYFHajYF691Uan+TAPHGXZrzJJpBaH97NCWq2Bd4fI/96aGzKsdTIhTgVYoLR
         +GrcLGsug2yUa/kV+rMupjthysoKCunB/GVtC4zMXg5qv8FM/zuOP7M5xhrtzL7CCYMx
         pY4TJm+MNpHX3wfk0oR8dbf87K8mvmWUqu/HP84WB1oH/VDfINuNnHUm4zHaQ1QiceMl
         qHNg==
X-Gm-Message-State: AOAM530C9J0S5jD+k3eA8n3E6RXt/MlqeizRIH4xUjAf0tjVzWfTGfAN
        CriDeD3kxhU3v2v4esq/ijzOsSmQcdNyqwdAztKaPw==
X-Google-Smtp-Source: ABdhPJzv/+s+l3IZI9ThycAUNiy4ELjrN4eN6oM11SYrQzEXtZPCGXuXmoPGSwVp0XoUtbH4vMfH0qB1UZFeF4HeV1o=
X-Received: by 2002:a9d:2781:: with SMTP id c1mr22106411otb.34.1625727803794;
 Thu, 08 Jul 2021 00:03:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Jul 2021 07:03:23 +0000
MIME-Version: 1.0
In-Reply-To: <1625592020-22658-2-git-send-email-khsieh@codeaurora.org>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org> <1625592020-22658-2-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 8 Jul 2021 07:03:23 +0000
Message-ID: <CAE-0n52SxJx8kOwQddWF096PsPy-0f8bDq_ss=u6i-hisD54Hg@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/msm/dp: use dp_ctrl_off_link_stream during PHY
 compliance test run
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

Quoting Kuogee Hsieh (2021-07-06 10:20:14)
> DP cable should always connect to DPU during the entire PHY compliance
> testing run. Since DP PHY compliance test is executed at irq_hpd event
> context, dp_ctrl_off_link_stream() should be used instead of dp_ctrl_off().
> dp_ctrl_off() is used for unplug event which is triggered when DP cable is
> dis connected.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Is this

Fixes: f21c8a276c2d ("drm/msm/dp: handle irq_hpd with sink_count = 0 correctly")

or

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")

? It's not clear how dp_ctrl_off() was working for compliance tests
before commit f21c8a276c2d.

>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index caf71fa..27fb0f0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1530,7 +1530,7 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
>          * running. Add the global reset just before disabling the
>          * link clocks and core clocks.
>          */
> -       ret = dp_ctrl_off(&ctrl->dp_ctrl);
> +       ret = dp_ctrl_off_link_stream(&ctrl->dp_ctrl);
>         if (ret) {
>                 DRM_ERROR("failed to disable DP controller\n");
>                 return ret;
