Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B14E33F8FA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 22:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242830AbhHZUag (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 16:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232495AbhHZUaf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 16:30:35 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF7ADC0613C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 13:29:47 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id y18so5458219ioc.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 13:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KS5bnFn8Y6gpkFwk4lSN+qMk+pSitVKJiQuPfookyLw=;
        b=T54Mvt1OkOwZKZVC8yB84osFcFFszP3nEEnPGks9V+7ttcd8WE2PBRj6Ot7p1qMdsW
         VSv9mCMx7aofBcB6mNmnGZjZWadQh+ektzlJapxEgZg2Dng9mfsIUQW/K8eCyu+Z58Nf
         zby4pVnJ8OIKewOqb1HUFgKHhglU2C+pPtqcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KS5bnFn8Y6gpkFwk4lSN+qMk+pSitVKJiQuPfookyLw=;
        b=dnCG/H/AzQRuEefd3fU0k0A2wdGVbUb6jKvgQ8rrFe6H2w/KwkPSnm/a7aymjfBPmw
         TvPbVGH9SzcouI/0/LnTzq8byzeVkLVRGZ5hnTldHW1FVJ8drEIfosaaRsCdyzCPJcqk
         DbhXJrUHQt+6vCAoZvWWz7iZJEq4A5HNTkQBrKxC5l1a+uxtDibL4PhKVVs35zuIlpUc
         plmiDEDf2RUREewp3tt9hBMbz/7o8tJkagFmEaGX6YAaQUvSOVENdOufYGWgjyD5yKuE
         ck/CNXsPpP4uOkPy3oWXzLqDFv0Q0fVuXpKekxPF7OnzFKM3OR2Ct9dNe2kOnYy9VB1u
         sKFg==
X-Gm-Message-State: AOAM531wK+0xUwPTzzmhB+4WbUd9S45Z0iFx+yKRJYVFKfJ4bmNZKhx+
        3/wfqBTMZDN0WhAWx+xfj7iK7LxiecL2qQ==
X-Google-Smtp-Source: ABdhPJxgVxTLiHYSYEpBUYeFUIjWZ0tv5PViKwtsI6R5Ld091/fiwbCDOeeUZcU5r1btjTuHLbnhSQ==
X-Received: by 2002:a02:c64a:: with SMTP id k10mr2623194jan.112.1630009787023;
        Thu, 26 Aug 2021 13:29:47 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com. [209.85.166.178])
        by smtp.gmail.com with ESMTPSA id d12sm1955848iow.16.2021.08.26.13.29.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 13:29:45 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id g8so4598222ilc.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 13:29:45 -0700 (PDT)
X-Received: by 2002:a92:cf4a:: with SMTP id c10mr4099123ilr.269.1630009785168;
 Thu, 26 Aug 2021 13:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210726231351.655302-1-bjorn.andersson@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 26 Aug 2021 13:29:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VUeV+G30b=YOMrdNbvT8rVkA-iibeB3S36NFwOrxcfiw@mail.gmail.com>
Message-ID: <CAD=FV=VUeV+G30b=YOMrdNbvT8rVkA-iibeB3S36NFwOrxcfiw@mail.gmail.com>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Vara Reddy <varar@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jul 26, 2021 at 4:15 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> +static int dp_parser_find_panel(struct dp_parser *parser)
> +{
> +       struct device_node *np = parser->pdev->dev.of_node;
> +       int rc;
> +
> +       rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);
> +       if (rc == -ENODEV)
> +               rc = 0;
> +       else if (rc)
> +               DRM_ERROR("failed to acquire DRM panel: %d\n", rc);
> +
> +       return rc;

So rather than storing the drm_panel, I suggest that you actually wrap
it with a "panel_bridge". Follow the ideas from commit 4e5763f03e10
("drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge") and the fix
in commit c7782443a889 ("drm/bridge: ti-sn65dsi86: Avoid creating
multiple connectors").

If you do that then actually a bunch of your patch becomes
unnecessary. You basically just have to attach the "next" bridge in
the right place and you're good, right?

-Doug
