Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B95D43C9334
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 23:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhGNVmZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 17:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbhGNVmZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 17:42:25 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3019DC061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jul 2021 14:39:32 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id m14-20020a4a240e0000b029025e4d9b0a3dso998114oof.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jul 2021 14:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=7yU/lXVPq8v5DxUavviakd+XqTwyKh5GL+eckjJwhhU=;
        b=Huzsn41/m5wNJTthgcAkHFWvNusXC97KqI0iRCAyi4I1V8yYIvTOhj+iZO052RBDgY
         /jxRFEZK8vH/CEYJ5CnaKLfuPND5/1DeDeNXoS5qhh5axGrqcLRDIAgCJvKCy8aLX8g1
         uCSMpbZnly1BXgEIB0LWc1Jh/Ao6j+lmqofVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=7yU/lXVPq8v5DxUavviakd+XqTwyKh5GL+eckjJwhhU=;
        b=XT5Zx49FKS4OzmcrI5i/suziFbHvP86u2BhAy+jSbBmwvTuqVT+Bhf5T6ory3vTnU2
         XqqLq3SyTiQTUp0CfBcBLzG68LdTVw+okHbuIs8NZijjKJdwfEdnhv8xNPXGsFqiVf8/
         JCXTiNN3VTAOdghHnzyw+jx0CqL2KsL/gKQ+tY10aWyXrxJeYpxV2zhcPHjXsmYwJijZ
         QdZJH+gJ1T/5dH8NKD1FVhXaxH9g7Bi2y1SnZc44yI+bZ+YQvw386qUKbuWHc1cZ18oh
         Hm0jQ5h5V+CicCopPRhvkCgsnNibFlzJbpUU5kD0cG62Lj5iac609broRqyyswZ+0XoS
         lQSg==
X-Gm-Message-State: AOAM532VCLDv4MQ78NlgG16f/cZ3DReytaMHgVK+9hJX+DPmaH0RKO6u
        bXQcbr75XpMAAwbkx/psk5iS06sUffLAV4kZvWC5LA==
X-Google-Smtp-Source: ABdhPJwE2R3+k8+ce7HwbkPywG7nnMFEF4vtMpBltJIbIWP52CkUWZLrAOaoBO6XdJi33DjezNuNWFNaiYMAd18hPNU=
X-Received: by 2002:a4a:e206:: with SMTP id b6mr17846oot.16.1626298771497;
 Wed, 14 Jul 2021 14:39:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Jul 2021 23:39:31 +0200
MIME-Version: 1.0
In-Reply-To: <20210709024834.29680-1-jrdr.linux@gmail.com>
References: <20210709024834.29680-1-jrdr.linux@gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 14 Jul 2021 23:39:30 +0200
Message-ID: <CAE-0n51cqCz4JD75n4ZZV2LDxbB6b0QwJ-La2hU8mnPcckNmSg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Remove unused variable
To:     Souptick Joarder <jrdr.linux@gmail.com>, abhinavk@codeaurora.org,
        airlied@linux.ie, chandanu@codeaurora.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, khsieh@codeaurora.org,
        robdclark@gmail.com, sean@poorly.run, tanmay@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Souptick Joarder (2021-07-08 19:48:34)
> Kernel test roobot throws below warning ->
>
> drivers/gpu/drm/msm/dp/dp_display.c:1017:21:
> warning: variable 'drm' set but not used [-Wunused-but-set-variable]
>
> Removed unused variable drm.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
