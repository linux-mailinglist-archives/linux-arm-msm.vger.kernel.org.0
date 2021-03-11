Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D065C336D52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 08:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbhCKHxG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 02:53:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhCKHwi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 02:52:38 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 696C6C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 23:52:37 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id y67so14006151pfb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 23:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bbvG2jg5LoX38yY8nsi4YuVDKo5of66ulU0IdFyWgeE=;
        b=Nz06HTZjorE3au1oxZpGqAnkDTZ/Ur+mWCRkyp0wKtvCEl3h1k97WtRuxMiH5o7R3o
         6o+WyQN3DKUbHR8nqwddXRdk5QYyQH2O1mFnJvoWRRAp+ruq/hbpx6+7PnbBoIk7M7fA
         kWwBDCNIvFzMvTHE/hH7PgsmO3+fL0a2N7IpStkY0des6uiSc91A/Gll2q6qevNtbbSj
         aq5fb+Jrpb2jwxyaS08hyGkJyDjyKO3rDZ51IHpBNodSV24aX4meDWankTnGx/kEOVvy
         0uxRDL+NkmrsDqHXy3799iLV/xO7T8WWa74sI0WFJZiB/mDEtxUinWX7AFZ8yH7xXrER
         3FmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bbvG2jg5LoX38yY8nsi4YuVDKo5of66ulU0IdFyWgeE=;
        b=Iidq/tOpuUFQ3aLzj58Q1O7sX2X5UmOTb4uFAszavD2r7q1upP5miLh1B8wI+ksuu2
         Pj6k0AxTYjBcjublG/HL3S+DG7jI8Z42mAxu9RHYuHYj3MvlHUGS6xpMecwqZBK4HK/L
         lWiwVtvpbesEZzQr2j6sHPJRfg7C3YUAkMYRKbhNCGczPO7/B9E2OzweCSHANa9jE07j
         ioamz5UTE0VH8PFiDSSCoKmwJM20Ur2ZYFA6EEVscvhECyXeej7tDigz3con17jfSfCc
         uzOzl++D8cR5Ned7zo5VDficzUByXmreR2E3HxmvgN1Qc6RwHTCGqCM1UUn6zaWGhROQ
         L1Iw==
X-Gm-Message-State: AOAM53363JhsTOpaHtLoS4cnwWL7xiQE0YMa6e0cKs4gOe3lXrQyy95z
        mQCc66mbT0ckh24IPTsOcBXsiqJdbPudM0qdE8EocA==
X-Google-Smtp-Source: ABdhPJzU0JnzWK7jNW0OYzUdLDcaqsiWQOn7ToGTiWQ4q0wsZLh+ID7ged7f9s2NopMOZ7jOgs/CvUToq2FgD1le/ME=
X-Received: by 2002:a62:7a09:0:b029:1f1:5cf4:3fd7 with SMTP id
 v9-20020a627a090000b02901f15cf43fd7mr6554831pfc.66.1615449156648; Wed, 10 Mar
 2021 23:52:36 -0800 (PST)
MIME-Version: 1.0
References: <1615419080-26540-1-git-send-email-bbhatt@codeaurora.org> <1615419080-26540-2-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1615419080-26540-2-git-send-email-bbhatt@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 11 Mar 2021 09:00:36 +0100
Message-ID: <CAMZdPi8CHCVT8G60zOEn0n43vPJW0xx+fufnBFzb7aPXSoMQOw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] bus: mhi: core: Introduce internal register poll
 helper function
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?Q2FybCBZaW4o5q635byg5oiQKQ==?= <carl.yin@quectel.com>,
        Naveen Kumar <naveen.kumar@quectel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhaumik,

On Thu, 11 Mar 2021 at 00:31, Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:
>
> Introduce helper function to allow MHI core driver to poll for
> a value in a register field. This helps reach a common path to
> read and poll register values along with a retry time interval.
>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/internal.h |  3 +++
>  drivers/bus/mhi/core/main.c     | 23 +++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
>
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 6f80ec3..005286b 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -643,6 +643,9 @@ int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
>  int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
>                                     void __iomem *base, u32 offset, u32 mask,
>                                     u32 shift, u32 *out);
> +int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
> +                                   void __iomem *base, u32 offset, u32 mask,
> +                                   u32 shift, u32 val, u32 delayus);
>  void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
>                    u32 offset, u32 val);
>  void mhi_write_reg_field(struct mhi_controller *mhi_cntrl, void __iomem *base,
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 4e0131b..7c7f41a 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -4,6 +4,7 @@
>   *
>   */
>
> +#include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/dma-direction.h>
>  #include <linux/dma-mapping.h>
> @@ -37,6 +38,28 @@ int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
>         return 0;
>  }
>
> +int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
> +                                   void __iomem *base, u32 offset,
> +                                   u32 mask, u32 shift, u32 val, u32 delayus)
> +{
> +       int ret;
> +       u32 out, retry = (mhi_cntrl->timeout_ms * 1000) / delayus;
> +
> +       while (retry--) {
> +               ret = mhi_read_reg_field(mhi_cntrl, base, offset, mask, shift,
> +                                        &out);
> +               if (ret)
> +                       return ret;
> +
> +               if (out == val)
> +                       return 0;
> +
> +               udelay(delayus);

Have you read my previous comment?
Do you really want to risk hogging the CPU for several seconds? we
know that some devices take several seconds to start/boot.
Why not using msleep variant here?

Regards,
Loic
