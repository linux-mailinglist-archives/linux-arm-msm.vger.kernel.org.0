Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D32211F21CF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 00:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgFHW0C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 18:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbgFHW0C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 18:26:02 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F15CC08C5C2
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2020 15:26:01 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id v13so15036954otp.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2020 15:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bc9tsjIFv/jB6QM+YnSZNZcJOlFnkdAaejqLZYVYxEA=;
        b=BLSZRjuywFEWfrzDsWBfP9L/UD63HowwitzIJ8ZQDiSGzaYpks1b2U9LlDoJlCAh1B
         7bRYKtOaOCcX+qfCaB6XxW9qtpsYVIXv/rO7pUoQsHxqBBQwuNStQYxxdUZrcY2sVEaF
         JRUw0EUxUgkG0aW2gXuz6MlGRVnC8wq/zbzOso/uojEYoGpZkJ3lkVls7CABw8X8WADe
         InLkZddLI8woa2s6PnDkQfNqc7WBwUC3zdRkcvTRJYZ00vxHgTbPq4RmVVRCVUhaua0h
         NLDvKCNa9F/wn2ffBc3CxlbvQsUPJagssMuZmOxuDDe5F4a5UBg6InhK9JLs8kq2F5Dx
         M4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bc9tsjIFv/jB6QM+YnSZNZcJOlFnkdAaejqLZYVYxEA=;
        b=P8ZIfKg6EeMTACo2dqVr/9TicplWLlnI1NngRt9TyeU7/m/48h16mm5Wo6DqX4p/+E
         fdhAUE1x9rnOHsgbl+K+NfZnI7rxF2tv1jrKX90PCkdnWQHtgLvMdffOv1dl2DMrIEiK
         qFXt0nj1TvywTnPBT/ZhYFY95j2qaNMXrHxi8T3vYC8fkHqH9xRNYqaEtBjeAoNOGvlw
         X3rcHomaA4sNBkd6wBbl6BrXmV8ym4lQjZr8ws7z1jvMluRd9bqgxB/XIVuR7Cd8Qtc/
         /2TD8CP7oO6nCxFSROpZYqDPNaxHKA3YV4sxg0lgF3MilXcp/kFzqQntPOk5wJs+oEjo
         CUlA==
X-Gm-Message-State: AOAM53096Ak07vs0Kg7WYS+ISfWZFA2hFJCyJbN0w0ZFIm3S8zvWv+ia
        O4pqyntvfkubdHEvIEEA4MYefM7CfGaMcb0BiQSJ7E8TESU=
X-Google-Smtp-Source: ABdhPJyMp64A28sOxzeSkkFqGhDUVU7DykXVmi2Ng6Irnv+4+gn54jjMjWOaLN2VKHEcZDo9gLdLayjCOhVevAod6FU=
X-Received: by 2002:a9d:26:: with SMTP id 35mr12455930ota.352.1591655160681;
 Mon, 08 Jun 2020 15:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <1585044079-358-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1585044079-358-1-git-send-email-kalyan_t@codeaurora.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 8 Jun 2020 15:25:48 -0700
Message-ID: <CALAqxLViRrga-XW2o1J1JutFdS1d-qmmgOrEP2beNygw3A7H4A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: add support for color processing blocks
 in dpu driver
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno@lists.freedesktop.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
        travitej@codeaurora.org, Doug Anderson <dianders@chromium.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>, hoegsberg@chromium.org,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 25, 2020 at 1:17 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> This change adds support to configure dspp blocks in
> the dpu driver.
>
> Macro description of the changes coming in this patch.
> 1) Add dspp definitions in the hw catalog.
> 2) Add capability to reserve dspp blocks in the display data path.
> 3) Attach the reserved block to the encoder.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>

Hey all,
  With this patch now merged upstream, I'm seeing a regression on
db845c that I bisected down to it.

When I boot up I see:
[   40.976737] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
error]failed to get dspp on lm 0
[   40.985600] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
error]failed to get dspp on lm 0
[   40.994587] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
error]failed to get dspp on lm 0
[   41.003492] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
error]failed to get dspp on lm 0
[   41.012283] [drm:_dpu_rm_make_reservation] [dpu error]unable to
find appropriate mixers
[   41.020369] [drm:dpu_rm_reserve] [dpu error]failed to reserve hw
resources: -119

Over and over, and the display doesn't start up.

I suspect we're supposed to catch the following check before the failure:

+       if (!reqs->topology.num_dspp)
+               return true;

I suspect the issue is in dpu_encoder_get_topology() we don't fully
initialize the topology structure on the stack before returning it.

Does that sound plausible or is there likely some other cause?

thanks
-john
