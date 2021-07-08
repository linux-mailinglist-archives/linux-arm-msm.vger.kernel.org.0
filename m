Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 203393C1ABD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 22:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbhGHU7n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 16:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbhGHU7m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 16:59:42 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A3DC061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 13:56:59 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id z12so5957549qtj.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 13:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=txIBa7izt4FT4BE1+BkMaR3RCAXYErSxPttMfK5CXlI=;
        b=faOfPE42FMx2/m3f1QlT02pCHNK9sLreFKyjuOGb3tFGZWwE2u9n8c/m01lIAh4ZOK
         EnmFa0gKFLxLThifMO9hhFhEQ4otXF6Oz60t2oagtPcqwMmWE6MpBNGY7PQqbM+PnszO
         57ZF/9M4sfs2AV0fc381Kc/3WufCncVrAupIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=txIBa7izt4FT4BE1+BkMaR3RCAXYErSxPttMfK5CXlI=;
        b=R7zbiiikr1/8AwHzlPPDbEI+ywYxE6QQPzxj/dj0lpWgpqGuDoXvS45feJn4GhgyWT
         wBK/f8Qt3dN5fES4WPf/o/3QUUvxudAFE8id5sEbgRU+5z4shGYifCPMZjJfNmw7EpXc
         bnsElEn/+bFD8KOA/qB1o9iqEeLn4ygeZfXExsYrPXRB8AVPFQzgp9dl0DEVdfoODYhR
         czRQ2eaOHIOG1BvTGXq9h0T0BOFVPp3e4eavUAHpZExKQYWL6s4PODVBU8rYeFQyTIn1
         B4rVsMmiSaP6JitUIOqzLv75nR4v4kRO4SFcj4A6ge3/hXDkL/RDCsmTH6lVN+3/5PdY
         6dhQ==
X-Gm-Message-State: AOAM530cHVUwxf+/VF68wwGb4KFAW/WshD6Ny5q8uRMo59FsRMEScVIo
        3yj8Q1F3woP0MpTyT4M/ChI6BNxt3lbydnTJ56mDCg==
X-Google-Smtp-Source: ABdhPJy01WzZkz2fmE/A+D4JFf/YjrN+FkodfFEoNH/4qM6i1zp4YmjJ7cZ+I4HUiGMQweSEOpnYAwyEvPRnI/WHXdM=
X-Received: by 2002:a05:622a:1051:: with SMTP id f17mr30357847qte.226.1625777819121;
 Thu, 08 Jul 2021 13:56:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Jul 2021 13:56:58 -0700
MIME-Version: 1.0
In-Reply-To: <1625592020-22658-5-git-send-email-khsieh@codeaurora.org>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org> <1625592020-22658-5-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 8 Jul 2021 13:56:58 -0700
Message-ID: <CAE-0n53EtG=Kd-i+q-Yg-GNNAkXwPnOOgFE_zG249OH5=i-f6w@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/msm/dp: replug event is converted into an unplug
 followed by an plug events
To:     Kuogee Hsieh <khsieh@codeaurora.org>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-07-06 10:20:17)
> Remove special handling of replug interrupt and instead treat replug event
> as a sequential unplug followed by a plugin event. This is needed to meet
> the requirements of DP Link Layer CTS test case 4.2.1.3.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

This needs a Fixes tag of some kind.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
