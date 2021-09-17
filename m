Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7864140F086
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 05:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244120AbhIQDxV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 23:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234543AbhIQDxP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 23:53:15 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15A8EC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 20:51:54 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso11203768otu.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 20:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=eC8WWm0GB9m9+OiTXjvJDwwJ4bOx9YsGIUwSquTEdkE=;
        b=leXlvUp4wCgJ+WDoSlsI5mfKEeObgFzMYEyDUeRToizAqmkwRLhzsTBxrdEHJ1LdYD
         F1jlqshs/rFCIBHW6i5CscigoTLiIEwaxQ1O/7w84B5WqXaa6JB05tIBgBGUouTzY+BZ
         5ngRCTCyGAVKY1/dVw68vCIPuKawOTvBfu5lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=eC8WWm0GB9m9+OiTXjvJDwwJ4bOx9YsGIUwSquTEdkE=;
        b=BUDLz8r8G/+rhBjt0PmL67wnr3GbMLk+6wPTletvnyazRqQSicwPs78At+F+tMoCuK
         xve5al2YVKJPCwuzqMyLhH/77EgJF+Oct0WwP0VjzBFV83IV26nOjZeqjGjZSV4tAQAA
         E6u7hIudOc5IMWrZOqhPyvJhPIC74/uAyLh5vjnsHCTCBtG7FVvL8ryUjjWoAmzXgCV2
         aXZFRL0WqoBIRjEWTBfsBKISYxBgMsVq0eXcD66+NA/jYTgowg8mffjMzFqaI85q7ksE
         FIQHriht43VBMWp83BP9uHzfkPOiNkzv9CxRx9NmW7RBS9X3DUD0RTh9vbjcRWwc97/s
         5JyA==
X-Gm-Message-State: AOAM531T8TT268xTJY8Bcx3ysq2YNb8WGQlHeh/E1PzkZTfJHm+RoaMi
        u0cnZtYOq2tIxk3dQKSO1ffxgUB8bpCWzDqDruNd7Q==
X-Google-Smtp-Source: ABdhPJwb+CAeP1LbhPRSrTra9NOvhp96+APdALmb4BWvnUD6hxz1CMABXqTRzuUhf7PFT5ityKS48rAG+XuHAMo+ZcQ=
X-Received: by 2002:a05:6830:719:: with SMTP id y25mr7534615ots.77.1631850713468;
 Thu, 16 Sep 2021 20:51:53 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 20:51:52 -0700
MIME-Version: 1.0
In-Reply-To: <20210915203834.1439-12-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run> <20210915203834.1439-12-sean@poorly.run>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 16 Sep 2021 20:51:52 -0700
Message-ID: <CAE-0n53jiiasodgaat9jJPifxGg=mNo8vewzORdBB+ZVd3VXTw@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] drm/msm/dp: Re-order dp_audio_put in deinit_sub_modules
To:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sean Paul (2021-09-15 13:38:30)
> From: Sean Paul <seanpaul@chromium.org>
>
> Audio is initialized last, it should be de-initialized first to match
> the order in dp_init_sub_modules().

I don't really understand why the driver is written with all this "get"
stuff but sure.

>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-12-sean@poorly.run #v1
>
> Changes in v2:
> -None
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
