Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 465E047BFC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Dec 2021 13:33:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237609AbhLUMd4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Dec 2021 07:33:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237614AbhLUMdz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Dec 2021 07:33:55 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 975B7C061401
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 04:33:55 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id a1so12612547qtx.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 04:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PRb2+biYRz+tifj2jXTfIb0511qliwqkvCVc/e674+s=;
        b=KAGNb75gWranBedQ0OOHTCdA/GRp7awXZJzsYnyHq+2z7I4KNYm4wt++TwpqQ4jTSo
         We/B9kqRFzFS2z0MSdEcbKdpeAjP6nEw3tDrBgNU0FcU2G9hcVc6YVelgnACex7YYL3C
         9yvqSH8M8Ssmn8PUarOQOddKq4T6OKTge/Oct38IfILq4P11FY/iUY3z6UnFzEq8gYY+
         KisrK8/SGAGU+MV060KX4+qXn/cZ1SRKv1162/q/gfQHEaarGpizYeD8Vej98QFwidp7
         mQCL34GO0K+Jm8zJSAam8u7RLi49uWX9m1LcR2taObR3AIo5AoZV6T1RG19605cPwb9g
         vIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PRb2+biYRz+tifj2jXTfIb0511qliwqkvCVc/e674+s=;
        b=js4L9eSACL9g7Cih/8yqaWYpRrhDz8gdh+O5C8jkVBs70x51IckA1re61tRRMrSk4b
         jAzeEmGgkrgLpXxe1bO+M7/h1ist+gPY5t0xrV2FO5RbHEkySKvx0//uvta57sWPXbsD
         6xCn9Vy3OuFeuYevA2Non9u5vtV+WfxkpjHVPuJTN5VvtEakViFjKLxGHWiCI2CO/UB7
         QbqjGVGo6ODnaRBm/6ojVRkBmX+a0eX6e/OxPmh7B4u0n3X2R4x4WYPzA40kl6TjmGHw
         ELHOJFsBHop7yo7bkGoo8hM3XvDgooxP/7aDNKxxHx3w5GGZG9vctOAgZfP/LLSNw0N+
         d5Nw==
X-Gm-Message-State: AOAM532TB/kbdKOvkd6fiVueRJpNaovXTQeGBQvh6hpt+h2S/70QCO0Z
        rUVPA09VeNCsculgj3WErTIWIOtY2BucdSeAJeCRaA==
X-Google-Smtp-Source: ABdhPJxcLyr8ljv9Q9dBtqLQefPD1HkvmcH0HRVsbIk1HMQukTuHmA8fLRpIsiljsrgoSRt6UIyDzbICxEAlCA0czQY=
X-Received: by 2002:ac8:4e8c:: with SMTP id 12mr1876205qtp.45.1640090034796;
 Tue, 21 Dec 2021 04:33:54 -0800 (PST)
MIME-Version: 1.0
References: <20211221101319.7980-1-jose.exposito89@gmail.com>
 <20211221101319.7980-2-jose.exposito89@gmail.com> <CAA8EJppMsqot1isnMYeSWVJm4tC-PoqUDL9jwd5HJ72tca0HQQ@mail.gmail.com>
 <9_OAfk8h0URTETEHMPKLX0zP7-pirLOCmv0iAiOCuRRcuuVRBjYBXk2YWAAogEANzumyffgjeRZD0nGtKTk5AeGdTLsN5Q7gVnQzr_x45WA=@emersion.fr>
In-Reply-To: <9_OAfk8h0URTETEHMPKLX0zP7-pirLOCmv0iAiOCuRRcuuVRBjYBXk2YWAAogEANzumyffgjeRZD0nGtKTk5AeGdTLsN5Q7gVnQzr_x45WA=@emersion.fr>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 21 Dec 2021 15:33:43 +0300
Message-ID: <CAA8EJpphECjTnr=EPaToxeqoQshSt-aF_41mEjO41GukZqbvTA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/plane: Mention format_mod_supported in IN_FORMATS docs
To:     Simon Ser <contact@emersion.fr>
Cc:     =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
        freedreno@lists.freedesktop.org, jernej.skrabec@gmail.com,
        airlied@linux.ie, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, wens@csie.org,
        linux-kernel@vger.kernel.org, maxime@cerno.tech,
        tzimmermann@suse.de, sean@poorly.run, linux-sunxi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 21 Dec 2021 at 13:50, Simon Ser <contact@emersion.fr> wrote:
>
> On Tuesday, December 21st, 2021 at 11:48, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>
> > I think the fix should be applied to the generic code.
>
> Related:
> https://lore.kernel.org/dri-devel/t1g_xNE6hgj1nTQfx2UWob1wbsCAxElBvWRwNSY_EzmlEe_9WWpq8-vQKyJPK6wZY8q8BqHl-KoGwS5V91VgN8lGIl3PJt7s2fkdsRd3y70=@emersion.fr/T/#u

I'd still suggest to fix create_in_format_blob()

-- 
With best wishes
Dmitry
