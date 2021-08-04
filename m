Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C487E3E05DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 18:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237469AbhHDQZK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 12:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237541AbhHDQZJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 12:25:09 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E4CC0613D5
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Aug 2021 09:24:55 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id o20so3446961oiw.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Aug 2021 09:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=hgobEeM549v3zw1Gmve9JpAQ6H4sOP2Sx9OWJYBVYX4=;
        b=anVyLESysacJzwQ9+bl8peh0mfxOGxp8tzDGJwCIQfTVHYAWhZdOshbtCAe0T7L8cj
         +oZAG/8jqr97zNrCaKibn6s6BLuZxkc8vrDXOqiGfdMTXV/xIgWGMQOtmx/HSnrUNbPp
         iC17s7ipmRXIEigvVtb0StgZ3jwxYNUY6V80M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=hgobEeM549v3zw1Gmve9JpAQ6H4sOP2Sx9OWJYBVYX4=;
        b=YFFA3RqQM4HHZq8KT0Mc2sv0kFSDRkrynX7SYh4PXrTcBBsxfl145BClhg5fVZrt3Q
         kVVkeCD6Us82c7cr6zmb2iSu46xBChkHITbuU2eN+IJjlcByiQWYu+LlD1ZXt1w6k51k
         W1qxDdghBheshaFhrsdnJpHZ7h3B7elG0VeXevJgM4ix8BzXNNTiKvj9O1Ek6UZsVe1N
         tM2zKB+P2X4X+/ypvGoWdzJMAi1P1ZtQVc2hyWNCOQ9RTRJ3L2cjCm9vetH3c/tlLWSl
         yr2+bf144EZ3Vgfwl7IJJR63z/CK+onaNvJxJuSarQJJ7A57v3aSeMkm4amx9htvki/Z
         LPEg==
X-Gm-Message-State: AOAM531kD1xY38upYn60/EtZQXM+RmgtI+/uedAFrOuqd0+nSfxIcjpa
        mjA0O0k6M8GR4WtFq2ingeHquPgsxoLY3pkgCCzXXg==
X-Google-Smtp-Source: ABdhPJxlsg2rjRmyZhJBp9eeXaZq9jGdzuh3fTxcauW/EXtGxVWy7yicyaA3pE5e2q1lh0t+yzqD8/qJzhMNPveVnf8=
X-Received: by 2002:a05:6808:619:: with SMTP id y25mr3529630oih.166.1628094295336;
 Wed, 04 Aug 2021 09:24:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Aug 2021 09:24:54 -0700
MIME-Version: 1.0
In-Reply-To: <1628092261-32346-1-git-send-email-khsieh@codeaurora.org>
References: <1628092261-32346-1-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 4 Aug 2021 09:24:54 -0700
Message-ID: <CAE-0n52e3FuhhiNqRTbDmaTM5TuLTgOsSYJab7uA1=N00uf16w@mail.gmail.com>
Subject: Re: [PATCH v4] drm/msm/dp: update is_connected status base on sink
 count at dp_pm_resume()
To:     Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-08-04 08:51:01)
> Currently at dp_pm_resume() is_connected state is decided base on hpd connection
> status only. This will put is_connected in wrongly "true" state at the scenario
> that dongle attached to DUT but without hmdi cable connecting to it. Fix this
> problem by adding read sink count from dongle and decided is_connected state base
> on both sink count and hpd connection status.
>
> Changes in v2:
> -- remove dp_get_sink_count() cand call drm_dp_read_sink_count()
>
> Changes in v3:
> -- delete status local variable from dp_pm_resume()
>
> Changes in v4:
> -- delete un necessary comment at dp_pm_resume()
>
> Fixes: d9aa6571b28ba ("drm/msm/dp: check sink_count before update is_connected status")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Tested-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
