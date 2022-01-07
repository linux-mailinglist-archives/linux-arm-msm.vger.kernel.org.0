Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B076D486F58
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 02:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344052AbiAGBBT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 20:01:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236544AbiAGBBT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 20:01:19 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D1EC061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 17:01:19 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id s73so6188603oie.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 17:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=3aLFLMZ1Dseun6uKJsc+bIv6lNMMhVYnO4Fayb77aRM=;
        b=NxvMKXyNXfvk+rvWfYW0hDKZJBK+pV+TtVJQHw8pxC6E5YX3AZMTgBu6COF2P7QKml
         6FDsuzNJszwb7bxzl5yIg6LlkSUDz1UosIsalGR0Cjn5Kw3T1nq1SoAADDOuA+N1tPHi
         odAFwsmI7e4dr4RoVf5DBNlkKqBMqZ3eNHqkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=3aLFLMZ1Dseun6uKJsc+bIv6lNMMhVYnO4Fayb77aRM=;
        b=LCBRQ4xYVSUQ/qgclDSmOX6tbh2NJnwqDeYmQDLg6ZimoyEyYIapm1BeNIN/DG67kz
         czkF5U/NDVre56+JkS/y4yng5MQypxAqcZjBFpp+RkcXl/6tBXrsEGkMYFJDv0ZFVXQv
         8SAyblL5vJQp/gEA7wRJiZs1dJvnxeDnUfBRVZbsBqouRm/jH+O6xCnTVMHVP5l/e7Ne
         m/wI8nvlNu5qXl6ZDTh2eqP/dO7e/kg8TgHgEZJi+fchnzamM1eqgN5D14mBzTzDcxCQ
         jWxVBWleEHqxNe1DK/prbHtdd/0DQwhk1CCNyXNk2c5TLjfCFPCZ5ynhBzJPGtrsHtF7
         7FXQ==
X-Gm-Message-State: AOAM530SBDGQB5A0cGb4Cx27LCCm7BBJdsgxLXWo+MNCcoo4hXB44Xbt
        R64yhMF8DEfkelStCK2LinzI396WWQzTYkg1sDMghw==
X-Google-Smtp-Source: ABdhPJzcj89bg7jDGE1SBDpxPgTR5nriTuyXnwlH6PAIRGs4WgjJmMJh/5xLxeMSC/JOUdGDGYwVEv190lJt48jFdd4=
X-Received: by 2002:aca:4382:: with SMTP id q124mr8123351oia.64.1641517278523;
 Thu, 06 Jan 2022 17:01:18 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 17:01:18 -0800
MIME-Version: 1.0
In-Reply-To: <20220105231031.436020-4-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org> <20220105231031.436020-4-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 6 Jan 2022 17:01:18 -0800
Message-ID: <CAE-0n50LfC1GqM44rF4qnGP7dJEcXEjs5DQf9Kp1ErmGdJ9C0g@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] drm/msm/dpu: get INTF blocks directly rather than
 through RM
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

Quoting Dmitry Baryshkov (2022-01-05 15:10:29)
> INTF blocks are not really handled by resource manager, they are
> assigned at dpu_encoder_setup_display using dpu_encoder_get_intf().
> Then this allocation is passed to RM and then returned to then
> dpu_encoder.
> So allocate them outside of RM and use them directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
