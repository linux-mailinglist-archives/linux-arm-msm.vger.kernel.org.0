Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60AD847B670
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Dec 2021 01:28:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbhLUA2x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Dec 2021 19:28:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbhLUA2x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Dec 2021 19:28:53 -0500
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 235CDC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Dec 2021 16:28:53 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id q4so4311676qvh.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Dec 2021 16:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HyMTClXKcOmtIsZExXjZqaWJL6q3mx1fJZYSYSwBgL0=;
        b=ZeNjH18h1W0khX97cOeS74ickSGmTFUNJoGkIfAtYtOCji5wS0uGZRkb5pgVwhazkC
         WJvBLdM3rMZSjQ92bmgdShE9LJagkNF2epAKOU3AxDgs0eokcmgfX5gsn2gqHP5L61NB
         F3GjvO9C0IYi6+c/28XKp1kOo5paipS6iVD1jMMhqyJIp4NlXJlyU0v4rOCHga/bbW7/
         fVSYoKmHQdM1EfKSwx31H5CgBE+gmab9mPaEMC6InBrS5/gHtB+JdLzW/UXsSdRnx+fQ
         dasyEgndUlz/xiCOfgWBC8TH1cGp4AEQsiQTphc2SBg8JX0LJiJxbwOO4R8VHICEMuwf
         H6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HyMTClXKcOmtIsZExXjZqaWJL6q3mx1fJZYSYSwBgL0=;
        b=a77Q4LJrYZ8pHWDk9qy2piSKjIu2JYt1CxPrGIYBTRVClFqKiiMFB9PjCKBGswf9sb
         n+paoaB6hvqnUnhwQw8ZMxYVA44t6Sisz8m4TnsuL7joVf98RnrcDwn54dUmDCJOQhfS
         lZbk7uO/a4Z9EmSLOhnHq4bWTs+0fqSsvXqqRAI889EPLrmvbE7jmBLLJakx8UgidxeQ
         P0EpZlfZrPM9ZUqkc0uAZ1+5507X0tb2e04m74F2wpP6EWQzU1DrsdhBrvCXeM2W6KwW
         BYf13rdcQ1UfMnn3m7WdN4ybqg0Nx71ycs5JjYvxGNnQjO5RI2/Sw0TxA6KM7gJJUZeW
         SJXw==
X-Gm-Message-State: AOAM532Eu2/0jKg86pF8/Mr1LNl3H5tS+quABxc2rhRuN0QS9q5fufu5
        vY1ZSJpiPb3R/3KH4fwnppxK7+Y9hoXjrnDZOCEgPg==
X-Google-Smtp-Source: ABdhPJwd9DGlMNrAW6gI7tM4340jxQj9pjQVaDEX2Q4hWtzzx8HXNZ7pxFXsx6Wo1HozXJdq0KKkggPoNqN1xeVn2lo=
X-Received: by 2002:a05:6214:260b:: with SMTP id gu11mr610476qvb.55.1640046532043;
 Mon, 20 Dec 2021 16:28:52 -0800 (PST)
MIME-Version: 1.0
References: <20211217002643.2305526-1-bjorn.andersson@linaro.org>
In-Reply-To: <20211217002643.2305526-1-bjorn.andersson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 21 Dec 2021 03:28:41 +0300
Message-ID: <CAA8EJprTe2sN_vTBXMsxbM6rzuDsUXTe9FjQUAjRcOgqWPxRQg@mail.gmail.com>
Subject: Re: [PATCH v6] drm/msm/dp: Add sc8180x DP controllers
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 17 Dec 2021 at 03:25, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
> DP driver.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>
> Changes since v5:
> - Dropped DPU hw catalog change from the patch
> - Rebased the patch
>
-- 
With best wishes
Dmitry
