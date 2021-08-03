Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 724783DF624
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 22:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239102AbhHCUNX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Aug 2021 16:13:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240407AbhHCUNX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Aug 2021 16:13:23 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14EB3C061764
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Aug 2021 13:13:11 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id o185so132594oih.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Aug 2021 13:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=mL66p7hWwJs0uODfuoDP6bwn2OF6cA0CzfTBUWUkGg4=;
        b=XS7RdH1UoHVjTZIVBMtzi7boDGmgd74mV5qkzXfTgWhhlsz3FFJTEDA96jM66q0qkf
         tnVqs4HREXO3oXmdzKpEJ5QPLD/vrXJKcTd6Abto1Wzs2Ai81iJHcmfPEb236VbvNpzy
         yXHQfuIRGFlXCLBAiYSqYmJ9UCVCi1qrG8OYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=mL66p7hWwJs0uODfuoDP6bwn2OF6cA0CzfTBUWUkGg4=;
        b=DdCzRekmDs2t6MaJ6OEGghbMfD+wsBQSoiR4zXM7cee9aftrEf2/3rdTm8SKj0DrPF
         mp7H67y35NpiXPumQ8adI2pwzg7v5csIJkjq9yTrq6f/3j205Z8qxvJ8BxsU2TJ1zvto
         +Bu0wmc8hY5r3tntXiCn2ap6y6RZY7xbBeF8Jk0lPlAkp6rH0oshLpX5GcmhXcpdTsVr
         wTVxKCILlJOr/n6dqbA8FLHsZGfS62yIOZIsev7I0h2PHl9i/GkL9AiSma73Wk0yyfZ+
         xxtfOcjFfK5IcEQEWOR2ZZ2DWd+DQAnh//y243LhH9xkYsFERUspqbY/a8JhUoG3+q1j
         aC2Q==
X-Gm-Message-State: AOAM530ss+eC+yX4z5EbvTwIHb4aeCYV+9qp4d9+qQ8gL2Hi5vL4pm4N
        n0OtWD5/5zeo9rDVl0fuy6GyUKV6qsNyEQxa8dzHTQ==
X-Google-Smtp-Source: ABdhPJwHzCEof57wa5MwJlj+OLIE4A4DUTjhh66InjV2cvQnN4ABaOQLvHRfB7a7K2brpMYq1WkI3dr6mVq+wsZF35c=
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr16109374oiu.19.1628021590448;
 Tue, 03 Aug 2021 13:13:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Aug 2021 15:13:10 -0500
MIME-Version: 1.0
In-Reply-To: <1627987307-29347-1-git-send-email-kalyan_t@codeaurora.org>
References: <1627987307-29347-1-git-send-email-kalyan_t@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 3 Aug 2021 15:13:10 -0500
Message-ID: <CAE-0n52+PvNpz5uqf3O_NsfQ4q2taeZmdSdoM3fGDLp5aQVj-A@mail.gmail.com>
Subject: Re: [v2] drm/msm/disp/dpu1: add safe lut config in dpu driver
To:     Kalyan Thota <kalyan_t@codeaurora.org>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, mkrishn@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, rnayak@codeaurora.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kalyan Thota (2021-08-03 03:41:47)
> Add safe lut configuration for all the targets in dpu
> driver as per QOS recommendation.
>
> Issue reported on SC7280:
>
> With wait-for-safe feature in smmu enabled, RT client
> buffer levels are checked to be safe before smmu invalidation.
> Since display was always set to unsafe it was delaying the
> invalidaiton process thus impacting the performance on NRT clients
> such as eMMC and NVMe.
>
> Validated this change on SC7280, With this change eMMC performance
> has improved significantly.
>
> Changes in v1:
> - Add fixes tag (Sai)
> - CC stable kernel (Dimtry)
>
> Fixes: cfacf946a464d4(drm/msm/disp/dpu1: add support for display for SC7280 target)

This is wrong format and commit hash

Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for
SC7280 target")

> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org> (sc7280, sc7180)
