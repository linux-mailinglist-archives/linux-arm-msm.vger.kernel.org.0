Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66A643E854E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 23:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234075AbhHJVcm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 17:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233625AbhHJVcl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 17:32:41 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D5F6C061765
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 14:32:19 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id a7-20020a9d5c870000b029050333abe08aso754604oti.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 14:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=2TEOQGiAQW3LJuAkSRtxbwnZcRI4cSybco52ZSAwzug=;
        b=WVkAnSE/ZGx5+Eaqx1oMrPKB2m9ZEuZle+H2fzP31C8LKJ7blO9okOvrJLCQngLMh1
         AYEXnqpEZNMcpoVL3zyjTy+UEMJ3ccQBkrS02f0R78bJPpVcVDwPjIUFcZFhCKtFnaMy
         x8wkpt8HDoL6UpxGKAo7IzrZcHaADNQahWkyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=2TEOQGiAQW3LJuAkSRtxbwnZcRI4cSybco52ZSAwzug=;
        b=OudoMqrwq+sW7GBMHZJFNAIpOZIaP+dIRE+M8bTknTgsGPD5LejRYuAB/ygCYkmWlT
         f4TZwcfOM+eKyQsNNgkH7H1pl295HO8NoawTpuLSycqJJmht+N1nUrLU61WmmUEeTkX8
         w/o52jkA45zcBDjxsLAFCNJ0WMjgLCI2acvWMvtO8p+E5/MvcaT6b4XiXAGjQKpB+N5/
         BlQdN2dogGHHfxbZSTdU2ZGvSJ1nAUmjKX5rgBqwVm2qbO6A57bekWza0Xk/cTSE9YZ/
         /y7f6wDZsCUHxm8mJbqqtmDzhF52tq7l5ywIC9V63L6Me3C9BCf7Ios9pJPSpxMwPuRB
         gWwg==
X-Gm-Message-State: AOAM530HFZ8CjycNDI278LQG+GSuZFOrGBTyhQFlob+8PJ+uTHS+Z515
        8iNGcKDQG8DuDeCf4m/RoeaFzMCZmer+Ds2QvO1CFQ==
X-Google-Smtp-Source: ABdhPJzKuHGG5SEuOgiuv6zSynYUbXFakY1O5WFVDqIOV8i6nqaif26ZzTNpPcImURd0czHpta4tzT+W1oQ71p7UW1g=
X-Received: by 2002:a05:6830:44a7:: with SMTP id r39mr22526030otv.25.1628631138739;
 Tue, 10 Aug 2021 14:32:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 14:32:18 -0700
MIME-Version: 1.0
In-Reply-To: <1628196295-7382-3-git-send-email-khsieh@codeaurora.org>
References: <1628196295-7382-1-git-send-email-khsieh@codeaurora.org> <1628196295-7382-3-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 10 Aug 2021 14:32:18 -0700
Message-ID: <CAE-0n52xzaGKd=5fdXFnqixekRYHf8pfvcp+K3eEZk=+siPH1w@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] drm/msm/dp: reduce link rate if failed at link
 training 1
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

Quoting Kuogee Hsieh (2021-08-05 13:44:51)
> Reduce link rate and re start link training if link training 1
> failed due to loss of clock recovery done to fix Link Layer
> CTS case 4.3.1.7.  Also only update voltage and pre-emphasis
> swing level after link training started to fix Link Layer CTS
> case 4.3.1.6.
>
> Changes in V2:
> -- replaced cr_status with link_status[DP_LINK_STATUS_SIZE]
> -- replaced dp_ctrl_any_lane_cr_done() with dp_ctrl_colco_recovery_any_ok()
> -- replaced dp_ctrl_any_ane_cr_lose() with !drm_dp_clock_recovery_ok()
>
> Changes in V3:
> -- return failed if lane_count <= 1
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
