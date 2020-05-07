Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74F6F1C85BD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 11:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbgEGJ3m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 05:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgEGJ3m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 05:29:42 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A64C0610D5
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2020 02:29:41 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id a5so2939896vsm.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2020 02:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P7gjP86gEOHCqOgvr3jQoxyLiI0hrsx99tJ0douroQg=;
        b=WB+y0kAOOkBKp4H9WutOLxzjhNAIQnOxbaDoD+RJVdTQ2Ef3w7Tzn2LRmG62PiPn9X
         KbLdPqTI+gXu6XDwkCW0Jg6iyZBO8MOToYZOlqy1AhJ2DuEtUpFFNQu/MriFRP6uwIlY
         cOHRJlMNA2kUKx0678PsForLueGs8Z6zDEsq98IzYHY9yNphdw3xilzpvvBuByakXAY/
         8x3pNlU/wZwZlTXwUN0gc9IKQwlbF9qmkUzxBOo9L8fw17UZquZgi+MjgkOe+xRUTWX9
         qLH5tDyUOdsS5nruz+iUuxC9ThPpeEvrUfWFMFD8/xT3FB9e04opPwpBsvbTJfNv0Cl7
         g73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P7gjP86gEOHCqOgvr3jQoxyLiI0hrsx99tJ0douroQg=;
        b=DpHdq4i5viS5MzA1rSW8X2SPnENnWpTd7PlARE6pYRO/zSlwyd3NpxbWZdnIYT8vpa
         0d07Wic3WVkHu6VvG873VBlU0tX++G+e90VdSfzmPA24/hmY0HaDCMuKURc3E7F56Acl
         xgssDjLpMVrhEpVy2+VsStkJQW0OqNMkD66buubCRkdmMF6tPmcnDtHzlKCEq4D68Arr
         HzPrnzlwUSNuwUDDgVBvYVY+y11l7gtXPU+UuKZJf4/cU87kTVjRQTRAuZimjD0zwbdh
         eHXj4uFv17gEoz/YDoZpAG3qkscLFM0jpnKeDydoxZhh3xW1BdDXM4mefI4BPeIGhQBa
         j6kw==
X-Gm-Message-State: AGi0PuZmQPh00VHNwOIItpGpBS1xUsQS20QzkO7qIgq2dUiV6Gs5dVrL
        GcbRWDlD3prtRU1DIW3L3lpeie/Z6+Br2oD8ES/G9A==
X-Google-Smtp-Source: APiQypJ7sVqhNajKxuTwChMNd4iPBm5YCjNalnxf8SJxoK2e9t1IOKoWcUixHTnvBG+MZC1V5UX4KPalsKauRKEoOMI=
X-Received: by 2002:a67:8b46:: with SMTP id n67mr11702212vsd.35.1588843780926;
 Thu, 07 May 2020 02:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <1588341189-4371-1-git-send-email-vbadigan@codeaurora.org>
In-Reply-To: <1588341189-4371-1-git-send-email-vbadigan@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 7 May 2020 11:29:04 +0200
Message-ID: <CAPDyKFr5kMGyOhn7qtqM1oGbKU4Z26RxaTmHn5zK-Cb2AcuZuw@mail.gmail.com>
Subject: Re: [PATCH V1] mmc: core: expose info about enhanced rpmb support
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Krishna Konda <kkonda@codeaurora.org>,
        Baolin Wang <baolin.wang@linaro.org>,
        Ludovic Barre <ludovic.barre@st.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Bradley Bolen <bradleybolen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 1 May 2020 at 15:54, Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
> From: Krishna Konda <kkonda@codeaurora.org>
>
> Following eMMC JEDEC JESD84-B51 standard, an enhanced form of
> rpmb is supported. What this enhanced mode supports is in addition
> to be able to write one rpmb or two rpmb frames at a time,
> 32 frames can be written at a time.
>
> Expose this information present in ext csd field so that the
> user space application that wants to make use of this can do so.
>
> Signed-off-by: Krishna Konda <kkonda@codeaurora.org>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/core/mmc.c   | 6 ++++++
>  include/linux/mmc/card.h | 1 +
>  include/linux/mmc/mmc.h  | 1 +
>  3 files changed, 8 insertions(+)
>
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index de94fbe..4203303 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -647,6 +647,9 @@ static int mmc_decode_ext_csd(struct mmc_card *card, u8 *ext_csd)
>                                  mmc_hostname(card->host),
>                                  card->ext_csd.cmdq_depth);
>                 }
> +               card->ext_csd.enhanced_rpmb_supported =
> +                                       (card->ext_csd.rel_param &
> +                                        EXT_CSD_WR_REL_PARAM_EN_RPMB_REL_WR);
>         }
>  out:
>         return err;
> @@ -786,6 +789,8 @@ static int mmc_compare_ext_csds(struct mmc_card *card, unsigned bus_width)
>                 card->ext_csd.enhanced_area_offset);
>  MMC_DEV_ATTR(enhanced_area_size, "%u\n", card->ext_csd.enhanced_area_size);
>  MMC_DEV_ATTR(raw_rpmb_size_mult, "%#x\n", card->ext_csd.raw_rpmb_size_mult);
> +MMC_DEV_ATTR(enhanced_rpmb_supported, "%#x\n",
> +       card->ext_csd.enhanced_rpmb_supported);
>  MMC_DEV_ATTR(rel_sectors, "%#x\n", card->ext_csd.rel_sectors);
>  MMC_DEV_ATTR(ocr, "0x%08x\n", card->ocr);
>  MMC_DEV_ATTR(rca, "0x%04x\n", card->rca);
> @@ -843,6 +848,7 @@ static ssize_t mmc_dsr_show(struct device *dev,
>         &dev_attr_enhanced_area_offset.attr,
>         &dev_attr_enhanced_area_size.attr,
>         &dev_attr_raw_rpmb_size_mult.attr,
> +       &dev_attr_enhanced_rpmb_supported.attr,
>         &dev_attr_rel_sectors.attr,
>         &dev_attr_ocr.attr,
>         &dev_attr_rca.attr,
> diff --git a/include/linux/mmc/card.h b/include/linux/mmc/card.h
> index cf3780a..7d46411 100644
> --- a/include/linux/mmc/card.h
> +++ b/include/linux/mmc/card.h
> @@ -48,6 +48,7 @@ struct mmc_ext_csd {
>         u8                      sec_feature_support;
>         u8                      rel_sectors;
>         u8                      rel_param;
> +       bool                    enhanced_rpmb_supported;
>         u8                      part_config;
>         u8                      cache_ctrl;
>         u8                      rst_n_function;
> diff --git a/include/linux/mmc/mmc.h b/include/linux/mmc/mmc.h
> index 4b85ef0..d9a65c6 100644
> --- a/include/linux/mmc/mmc.h
> +++ b/include/linux/mmc/mmc.h
> @@ -325,6 +325,7 @@ static inline bool mmc_ready_for_data(u32 status)
>   */
>
>  #define EXT_CSD_WR_REL_PARAM_EN                (1<<2)
> +#define EXT_CSD_WR_REL_PARAM_EN_RPMB_REL_WR    (1<<4)
>
>  #define EXT_CSD_BOOT_WP_B_PWR_WP_DIS   (0x40)
>  #define EXT_CSD_BOOT_WP_B_PERM_WP_DIS  (0x10)
> --
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
