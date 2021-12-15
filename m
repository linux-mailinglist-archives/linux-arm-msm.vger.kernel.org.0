Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886784761C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 20:32:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbhLOTcD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 14:32:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbhLOTcD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 14:32:03 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BEB5C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:32:03 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso26201944otj.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=37iLZzDUpFh5yORXA/4h/zBCNj8hCkym8Zzk5p+f3PE=;
        b=KGFIaQru2Z19Fmrep8ZJB8Ug70QxNjXcSZBC9ySdiB7y0R5J/rUIYeqUE67vFDJqvr
         GB3AUtYVg4qOKdLO7Uy0oyOoy6THle1C/SCD4wAcVXwNfFBKdMQh5qqV2TuB0Q1sLdUI
         dxOmRcUJHEMtJicpaqLlDOLjPr2Dxxzb7QmyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=37iLZzDUpFh5yORXA/4h/zBCNj8hCkym8Zzk5p+f3PE=;
        b=rDNu4QSi/vSIyxzE4Cn/NseIZZQbiqsEQbKkK7Ldzo/n35i/6PXKtntA1PgWXEDjq7
         5b7pSHsiYFYBATRVPpyr0G1pgdPtd6N8bLSPuHRTBgP4cMYqgPKls4ENUqgWIy75o9fY
         62x0iB+3T1po1551WZ9DkDYae0tJ/wf4ebSp48OBGf4QGhKuzg8pHa+WIaPzUY1dGORk
         13SpsRKdZJoWya1Hn1b88Bp6W3k0HcBpXws7UznvgRzhs/cNkpQZn/YtANbGMxbMfxWp
         AOYe01ABWuAevrCd8vGLRH+WTgWGIux6rzxtQsr9DPCpvY4d4wC/4JYAawcLKGyOP9jP
         6iUg==
X-Gm-Message-State: AOAM531l5BhmC/d+pwOcUtF337ICJOupvrNVk6ROQLDqvv5Enus8vNI4
        tFwo4eyJ9YusyqpFAizVgArrldH9y/9U59jed6T7zA==
X-Google-Smtp-Source: ABdhPJzehPr4Sd3IcF6mQ4BKkC++SK1JfZHU7wf7hmX1chD30TtsGgjUypAGJhCV+gaGtHafUqQwKCFzsRf7S1FrRLE=
X-Received: by 2002:a9d:2243:: with SMTP id o61mr9964550ota.126.1639596722789;
 Wed, 15 Dec 2021 11:32:02 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Dec 2021 11:32:02 -0800
MIME-Version: 1.0
In-Reply-To: <20211215160912.2715956-2-dmitry.baryshkov@linaro.org>
References: <20211215160912.2715956-1-dmitry.baryshkov@linaro.org> <20211215160912.2715956-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 15 Dec 2021 11:32:02 -0800
Message-ID: <CAE-0n51RCjyj=CW6Nz-Ei7kmAe2t-jKmZ5RbhFNfqDZ9V9gPsg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: add dpu_plane_atomic_print_state
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-12-15 08:09:12)
> Implement plane's atomic_print_state() callback, printing DPU-specific
> plane state: blending stage, SSPP and multirect mode and index.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Same const comment applies here

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
