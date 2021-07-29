Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13D4E3DA891
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 18:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232650AbhG2QL3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 12:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234812AbhG2QKP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 12:10:15 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B4BC0619C2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 09:08:04 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id f22so6453181qke.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 09:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7rnfNZ1smkd3MOn2QE94nhDLg5Z3RCUAAhAiNnfRCE4=;
        b=JO+Wc0xx+6zrqWzU8d5m29orUQfNIbr+4Or7rVWWlQ13j9DpUSX3xkJWhtz51wsxdG
         tiaNwM9js+uKQYNP4kt6zhVkU0DN/T9JgTXJUdHwFpFSunFwYIvk03BdYsklBUrYxQ4P
         oCjMOKJ1XcklPD/WBBqk1Xe2qXRuH5g8oUFpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7rnfNZ1smkd3MOn2QE94nhDLg5Z3RCUAAhAiNnfRCE4=;
        b=sf8T+Bps9z8Th4ViVyzsZFXMUJtezcuAxgdwGIxlEHuLmJFbL2YCYoejFFDHcezYAw
         eIb2zmCSAKK0eyuRfNfWo80RZxeJbtJbiWVKUgb8BXr84mOVcjBEX0ppUrYd4RBnxEkR
         OocBvt+4sMx7wk8c34T/4K9ddwEuQj6YPza7ucX3wBs4qe3evwLTcwgUhD0J2MkMDrtP
         axWELs/OSiRCBQPHLGDTCsDoYHaS+7/V44bHB5BsX+N9iNT/svNwzaNslXt+AU7sxIvM
         v6+GN9vNux57LvdyjwbU5izyypQiR2eNO+gQSokLNj/3MGBbTB6q1f8CSqLGxkFMMnA2
         I6cQ==
X-Gm-Message-State: AOAM532kw7phU9KVP6eK7kklIaHJsCrDaTD7ypnmo9oyOiiHyQt6YSWv
        mZqgi5+wefnBjRQF8JA3FFXU6Aqie9weOg==
X-Google-Smtp-Source: ABdhPJykXfS77JzFfoXwZsMfrVXlFEd9U7rqjy4AlUP+npu1LYaFm/QMPr2DBhzWg1LqyKD3IQ6dDg==
X-Received: by 2002:ae9:ed56:: with SMTP id c83mr5884664qkg.101.1627574883368;
        Thu, 29 Jul 2021 09:08:03 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id f15sm1386493qtv.60.2021.07.29.09.08.01
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 09:08:02 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id a201so10979336ybg.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 09:08:01 -0700 (PDT)
X-Received: by 2002:a25:b845:: with SMTP id b5mr7441639ybm.343.1627574881505;
 Thu, 29 Jul 2021 09:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <1627560036-1626-1-git-send-email-rnayak@codeaurora.org> <1627560036-1626-3-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1627560036-1626-3-git-send-email-rnayak@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 29 Jul 2021 09:07:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wy6iyrty0tmygY42GJdWSNqby9XePjpg6pKpce-9A7fg@mail.gmail.com>
Message-ID: <CAD=FV=Wy6iyrty0tmygY42GJdWSNqby9XePjpg6pKpce-9A7fg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] nvmem: qfprom: sc7280: Handle the additional
 power-domains vote
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        "Ravi Kumar Bokka (Temp)" <rbokka@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jul 29, 2021 at 5:01 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> On sc7280, to reliably blow fuses, we need an additional vote
> on max performance state of 'MX' power-domain.
> Add support for power-domain performance state voting in the
> driver.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/nvmem/qfprom.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
> index 81fbad5..b5f27df 100644
> --- a/drivers/nvmem/qfprom.c
> +++ b/drivers/nvmem/qfprom.c
> @@ -12,6 +12,8 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/nvmem-provider.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/property.h>
>  #include <linux/regulator/consumer.h>
>
> @@ -139,6 +141,9 @@ static void qfprom_disable_fuse_blowing(const struct qfprom_priv *priv,
>  {
>         int ret;
>
> +       dev_pm_genpd_set_performance_state(priv->dev, 0);
> +       pm_runtime_put(priv->dev);

To me it feels as if this should be at the end of the function rather
than the beginning. I guess it doesn't matter (?), but it feels wrong
that we have writes to the register space after we're don't a
pm_runtime_put().


> @@ -420,6 +440,12 @@ static int qfprom_probe(struct platform_device *pdev)
>                         econfig.reg_write = qfprom_reg_write;
>         }
>
> +       ret = devm_add_action_or_reset(dev, qfprom_runtime_disable, dev);
> +       if (ret)
> +               return ret;
> +
> +       pm_runtime_enable(dev);
> +

Swap the order of the two. IOW first pm_runtime_enable(), then
devm_add_action_or_reset(). Specifically the "_or_reset" means that if
you fail to add the action (AKA devm_add_action() fails to allocate
the tiny amount of memory it needs) it will actually _call_ the
action. That means that in your code if the memory allocation fails
you'll call pm_runtime_disable() without the corresponding
pm_runtime_enable().


Other than those two issues this looks good to me. Feel free to add my
Reviewed-by when you fix them.

-Doug
