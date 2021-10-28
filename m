Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95A3743DB4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 08:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbhJ1Gky (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 02:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbhJ1Gkw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 02:40:52 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17CD5C061745
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 23:38:26 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id l10-20020a056830154a00b00552b74d629aso7248391otp.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 23:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Q0aPYShzUHQahtTa1rDM0UEGu5hh3TXopg752neKMGg=;
        b=KruDRqjhoLjx+sYOUpcq3sXk+XjHwJCdCH64uMmttuPc0A1Ta8HjzGKGqfQturSuV4
         eJC8zMQU25XhO1/5qaLQ9Z4UUuhozYFk6zA47U4yYRH/7RQDkdwNLZ0B9O5Nm8wv8ldd
         /jFaUIShVutNM8YxnxPYE1zdvlfpCnyPyxfxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Q0aPYShzUHQahtTa1rDM0UEGu5hh3TXopg752neKMGg=;
        b=JzTIEjEYdwhLnaoDke3RPS0kTKA64CvlyQF4G4HgytEniAYQC47+rtphKEkJMcfK/5
         YAIfOBqE/BxWkjKIdf3XLCfud9Ej7jz9F+pqCpnccp6jPWXAm1EEuI3vPdJu9WRtAmCl
         Kjy9Jj7xN9GXDfkuS6dMQlWU1o0Tt5vcfDgO53g9JSK8wh1zTSpBH4DS6zn2I/URGYGF
         /FoQcHHz/WzUoiRuUFbZVsp0AUx7vzagbv+eFSj8KumpayqjUjOJsFwW8dlx0t9xa5T9
         lR9FW4h5cesEm5yh3mDJ+I6OP1rScmBViYfz5F2GcEnZ5mABGthRHiDys71H2V/rdrm2
         HPfA==
X-Gm-Message-State: AOAM532LOo9j7ZNe1ArPIppPGFmFUosGz/+ZwjrywW3g1/ZSVZQqK12a
        5zPzjCdktRa+a4NgyqeVAvEOuT8k+150RO/W+NylLw==
X-Google-Smtp-Source: ABdhPJy5II9bUKXp0PmXN9iZD0uyK1uwYoFfurzgzrVy+zidgimkf19uyPDV0C7OcPK1KlpMppshRp1NEBWVvR6ePUk=
X-Received: by 2002:a9d:7655:: with SMTP id o21mr1932382otl.126.1635403105338;
 Wed, 27 Oct 2021 23:38:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Oct 2021 23:38:25 -0700
MIME-Version: 1.0
In-Reply-To: <1635386088-18089-7-git-send-email-quic_sbillaka@quicinc.com>
References: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com> <1635386088-18089-7-git-send-email-quic_sbillaka@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 27 Oct 2021 23:38:24 -0700
Message-ID: <CAE-0n50YcX6sCoTR0bUy_GrZM7=UdHPAGYNwE3Nvj6GL4iTmMg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] drm/msm/dp: Remove the hpd init delay for eDP
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     robdclark@gmail.com, seanpaul@chromium.org,
        kalyan_t@codeaurora.org, abhinavk@codeaurora.org,
        dianders@chromium.org, khsieh@codeaurora.org,
        mkrishn@codeaurora.org, sbillaka@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sankeerth Billakanti (2021-10-27 18:54:48)
> DP driver needs a 10 second delay before phy_init so that
> the usb combo phy initializes and sets up the necessary
> clocks for usb devices such as keyboard and mouse.
>
> eDP controller uses a standalone phy and need not wait for
> phy initialization from any other component. This change
> will remove the delay for eDP controller.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 61385d6..de6a1fd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1438,7 +1439,15 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>
>         dp_hpd_event_setup(dp);
>
> -       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
> +       if (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP) {
> +               /* eDP does not need any delay before phy init */
> +               delay = 0;
> +       } else {
> +               /* DP needs 10 second delay to let usb combo phy initialize */

This seems to be a different approach to the patch Kuogee sent a week or
two ago. Can we figure out what's wrong with the DP phy starting before
the USB phy? I suppose this patch is OK as a temporary hack to keep
moving with eDP, but we really need to figure out what's wrong with DP
so this delay can be removed entirely. Has any progress been made on
that?

> +               delay = 100;
> +       }
> +
> +       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, delay);
