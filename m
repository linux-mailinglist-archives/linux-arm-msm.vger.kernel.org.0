Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D83B740F098
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 05:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244168AbhIQDzk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 23:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244242AbhIQDza (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 23:55:30 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B8CDC0613E1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 20:54:08 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id c8-20020a9d6c88000000b00517cd06302dso11106650otr.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 20:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=d5KyeDq946nuEeP72I+rCwfJA6i1ndu160NKjlUa2U0=;
        b=mt1KgHCUrzi0gHUfIAMUuM50Mo8Ku7RFyKsj1qvnM2za0GMZ7eHfB+N2t9eBxjt7vS
         MVnIxvn0Uz1RI0WYgj1ULdJJHLoi4wAHt2ST37m5sfn7bGAXLpGsbL/FULbxhsq2T37v
         DkIQseFnkfaed/TqEmvIaV7jHFC+81p/zsZxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=d5KyeDq946nuEeP72I+rCwfJA6i1ndu160NKjlUa2U0=;
        b=H5eEUR2JS8eQVl1+VYBFb7LD0J4ikM881g4YXqz5gIuBS4Dm+WYek+KC25Tdtq3Sts
         lDaDsr3NarGqdndPwmzvEGFL942+bvbFV4N+9lohwR5j+t9aJoScnV5uRzQh2KWE6rE7
         m6I9BOA6RRtMeqwTOZ8DUGYGtjivO+oRXYGjiKM5sB64uz8Zku/6No/l5FrsoyT2lZ2j
         bE5H3fMsLI09zYnXFd2WtkuV+HReQuqdyL6LzbKoT9r9xTSbVRcM3co3P1RKq2soOkDe
         gtvrG6mLrz50Z28FjYSpRsdGo3BY3u/5TmO+lza4dR53ecUxcOsesfhbgWMapWyOMbid
         jfQw==
X-Gm-Message-State: AOAM530hjTx8yvs3X+17Tg799B6yEYZN+bbYfwZfwuYcNJojLLw1QxUV
        8QZjGab0lDuOz7gIBU8B16Sukwo7jYiDUSE1wu/vzw==
X-Google-Smtp-Source: ABdhPJzcbhAQp1Hj5R9izqiK2ZL89sVw4r1RXvzPY1p8ELBpYgolJMvLXTBcI+y11f9ZXleFHZ3dGmm68Ou4VgvCCb8=
X-Received: by 2002:a05:6830:1212:: with SMTP id r18mr7334996otp.159.1631850848045;
 Thu, 16 Sep 2021 20:54:08 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 20:54:07 -0700
MIME-Version: 1.0
In-Reply-To: <20210915203834.1439-10-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run> <20210915203834.1439-10-sean@poorly.run>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 16 Sep 2021 20:54:07 -0700
Message-ID: <CAE-0n504ZgOW-=3_DgPy+rFxNnkYjjp2U83X=K1ZMne-cN0ZPw@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] drm/msm/dpu: Remove useless checks in dpu_encoder
To:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sean Paul (2021-09-15 13:38:28)
> From: Sean Paul <seanpaul@chromium.org>
>
> A couple more useless checks to remove in dpu_encoder.
>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-10-sean@poorly.run #v1
>
> Changes in v2:
> -None
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
