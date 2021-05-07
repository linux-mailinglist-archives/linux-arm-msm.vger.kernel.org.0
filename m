Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 972D7375DDC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 May 2021 02:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233545AbhEGAUw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 20:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233539AbhEGAUv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 20:20:51 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E0BC061574;
        Thu,  6 May 2021 17:19:52 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id l13so7344922wru.11;
        Thu, 06 May 2021 17:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Ly8LRPF0H1aWdKEb+5WRQF77SY7lze0cxVlaDbFegM=;
        b=Vifuxsq8ikahBtP4UaxvPzuwVbrtZJO8ayF/h1nNURzvnZdT8RPR598yvD2VRY86DC
         2dIgcOeWx45v5fLlZFs3uEqbpxUX2BWPvhu1YtNokLX3Cuov1UBRAHZxlN04hg3sY6nl
         0gFrYDP8GjGLvQ4CfaAiebk3uugXlJbho7TmenFZqi9pElZKW0Qr15ybfTpFsHb5eu70
         devYrpJDnGEXZzRW9HaJCaHSnfJuAYdhfGqwikoIBScINq5f4M7e7LxIvw7ViEpm67s4
         rlrOSNGVoH+Zvq23nUWnjHCRZsOM1MeYbAvJO4lo/zI2sm1tC1v37TQIFvcJBmANzYW2
         nR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Ly8LRPF0H1aWdKEb+5WRQF77SY7lze0cxVlaDbFegM=;
        b=YuDbgO7FNkADnyw236e5fLuDWEsZUvLuxmMOJ1apzbU98jAUblwxvLWwB94X9+Cqnz
         Ijvc1Ew87l0fqlxb+oHERsz/D+GeMyGM2JIrvHhHmr9vEqf8IKkWeXOjctLFohBZgj2w
         eD7E9veQ7Q5K0tWZfmT21bcjUQCUxaQXpeVteQwBN8UGJJW4eOXq/3mcQwTtdtS604Eu
         bwhjPnT1O0GvSiujDbBJSAhCD8mZXUi5KLlnt6cEGEu1bB/xzvrOmWMcqAiE+NYuTA0R
         0ApnHxw4+bvZUKXjYWquoz/eRLNGsPfUfFDd28HV25fwE+5o4vB6lW67gxGf9lIeZnYd
         WjkQ==
X-Gm-Message-State: AOAM530uPAVxU6FaAiiD3zUtK0P0hT3/N9fv7bBPbtgYBkPc06+biSHR
        S2gC/loTHnrRmCiJ/80ovbOZTxKs/GIAxsu1Wxs=
X-Google-Smtp-Source: ABdhPJwApwq00cS0zUI9fX5pkWZKlLTrCmBiM6HCuq5FMtpKcHyw3B+qomvmNznEzUh2vYSRLKLwyBvpWhWLWX4hTgg=
X-Received: by 2002:a5d:64cf:: with SMTP id f15mr8260301wri.327.1620346791614;
 Thu, 06 May 2021 17:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org>
In-Reply-To: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 6 May 2021 17:23:32 -0700
Message-ID: <CAF6AEGvJEThHFvMt34fAnOVhHkHxwtDyC8=g3CFEd16A4p8W8g@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] check sink_count before update is_connected status
To:     Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     Sean Paul <sean@poorly.run>, Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        aravindh@codeaurora.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 21, 2021 at 4:38 PM Kuogee Hsieh <khsieh@codeaurora.org> wrote:
>
> 1) check sink_count before update is_connected status
> 2) initialize audio_comp when audio starts
> 3) check main link status before start aux read
> 4) dp_link_parse_sink_count() return immediately if aux read failed
>
> Kuogee Hsieh (4):
>   drm/msm/dp: check sink_count before update is_connected status
>   drm/msm/dp: initialize audio_comp when audio starts
>   drm/msm/dp: check main link status before start aux read
>   drm/msm/dp: dp_link_parse_sink_count() return immediately if aux read
>     failed

I've picked up these two in msm-next for an upcoming -fixes pull req:

  drm/msm/dp: initialize audio_comp when audio starts
  drm/msm/dp: check sink_count before update is_connected status

BR,
-R


>
>  drivers/gpu/drm/msm/dp/dp_audio.c   |  1 +
>  drivers/gpu/drm/msm/dp/dp_aux.c     |  5 +++++
>  drivers/gpu/drm/msm/dp/dp_display.c | 38 +++++++++++++++++++++++++------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_link.c    | 20 ++++++++++++++-----
>  5 files changed, 48 insertions(+), 17 deletions(-)
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
