Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C68A2041F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 22:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728582AbgFVU2i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 16:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728421AbgFVU2h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 16:28:37 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC78C061796
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 13:28:36 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id d64so1591217vke.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 13:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/mKQob2TcXV+3bi2u2MxE4v2x49LHk6pqKAA851megE=;
        b=lRzqiLuRgFSf5qcalDvWRL4YbaOQjHCkIkS1z5jnftIuujWTgyicIdl0B3e48B1VQc
         jxfPF2B38RxGI3M1N+8iAp8EJBK/mNFW88o9CRBomgNN3BbrS8IK5fgOjUfRWAReLCVZ
         hXzlEE7ISDIQaPItEDQ0AnroKyoMxwdSONEfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/mKQob2TcXV+3bi2u2MxE4v2x49LHk6pqKAA851megE=;
        b=BH2JHA9OicAO8eQ7BOiHtsg/oGMMU1p96ybWOH2LngFi279641nUUMO19hUmnZRQUl
         t/Skdh6L3B/RqmajB8izwaR8zrgBm4FDIBBQH9MIOyw3xPei6g51/7VewLeaVHGnxBPE
         qoW0JNT1kBJqs8ubAkt0NQJanTIkgkbLMaL4v8x+f9cgmJPT7KkZS8LINNV/ocmX6mYK
         umuZ64V2ghhZ41WFj+sSzNsJKnXELn8F9Fk8J6VXHH14/2BCYnCSvFe5XnuJGfH6D8tP
         nRIKa0mVIj79Ud3n5pFyq3WwHYY1ZwaetgoTCxZj1XdSymXiyaUXZWhq+bM0icHQub9w
         in3g==
X-Gm-Message-State: AOAM5335vUGsyV4bxIqD6FnRwmIg/0DHR6MOiyGCFBenVeExgOu60A4I
        h8i2Lmbxohc8vfsZtpHl094DML+i8sQ=
X-Google-Smtp-Source: ABdhPJywqXldepk1y7M2WFWmBJN3Ehhv5IBItC4e/JaF35y7xh8NyKc2TWW1C8OhLCxPT4s3pzRpXw==
X-Received: by 2002:a1f:a8d0:: with SMTP id r199mr16424307vke.26.1592857714113;
        Mon, 22 Jun 2020 13:28:34 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id u21sm1873127vsp.33.2020.06.22.13.28.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2020 13:28:33 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id y123so10429650vsb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 13:28:33 -0700 (PDT)
X-Received: by 2002:a67:62c4:: with SMTP id w187mr15458333vsb.109.1592857712942;
 Mon, 22 Jun 2020 13:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200622121548.27882-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20200622121548.27882-1-stanimir.varbanov@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 22 Jun 2020 13:28:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WF4Sc5yDRc0FgtkqVvDr3brXA7ttTFU6nozCNwBfSQ9w@mail.gmail.com>
Message-ID: <CAD=FV=WF4Sc5yDRc0FgtkqVvDr3brXA7ttTFU6nozCNwBfSQ9w@mail.gmail.com>
Subject: Re: [PATCH v3] venus: fix multiple encoder crash
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        "# 4.0+" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jun 22, 2020 at 5:16 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> From: Mansur Alisha Shaik <mansur@codeaurora.org>
>
> Currently we are considering the instances which are available
> in core->inst list for load calculation in min_loaded_core()
> function, but this is incorrect because by the time we call
> decide_core() for second instance, the third instance not
> filled yet codec_freq_data pointer.
>
> Solve this by considering the instances whose session has started.
>
> Cc: stable@vger.kernel.org # v5.7+
> Fixes: 4ebf969375bc ("media: venus: introduce core selection")
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>
> v3: Cc stable and add Fixes tag.
>
>  drivers/media/platform/qcom/venus/pm_helpers.c | 4 ++++
>  1 file changed, 4 insertions(+)

The code is the same, so carrying over my tested tag [1]:

Tested-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/CAD=FV=Vt8je1AtT8id-rPC3JToF_7uGKpC-uDuSpzCkwi3e4Sw@mail.gmail.com/
