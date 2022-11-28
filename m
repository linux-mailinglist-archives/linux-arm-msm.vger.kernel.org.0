Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE3C63B269
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 20:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233721AbiK1TkQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 14:40:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233230AbiK1TkO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 14:40:14 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADEE92CC9D
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 11:40:12 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id u27so8046992lfc.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 11:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1X++ZaligKAG6LkPIexjBiKopBxcNHqsvb5zqb0R6nA=;
        b=iNMVlHUsjwLrJrks1vvhHe/Geot63a1ksPxeCQISSqZ5aiG1tgo4oa/KdGa57JHE/I
         eijJCwMYSV0g3fUD/A5aYsouMPOtpihSAoBEes0tXXhJESjomdESVMMuNeSegOkWGIJS
         vlh/kTi5uVAuV119WsBjOQuIPe0NIRmODt3Ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1X++ZaligKAG6LkPIexjBiKopBxcNHqsvb5zqb0R6nA=;
        b=d4g3S/cf1tLwOOGrqmQDgpeZz9tUzjiPJi3fdsi5AvSq+7QWsKtEeGSQLzjgf4yFLh
         lwIzBYiA7JlkoRvj/7XcFUuPpUUOm6saNxSwuibCJC7bG+ZYbs9jts/UcOpAc6Z3tnTH
         jWRiZQQl/MMdyL/uilDUAO/z6ondn4hvdIbTU0LfCv0ivIRE3v0VZ+jsfixgHLmtq/pO
         huRaPEBMgEGFT/Y0BdamW4lWx022JpMkOp1OXhVvlUgUJ/y5TJnJUpcifVtM/fuJWGwt
         ADXqqBrWmtu+PD+u4pUcqJJetdGwtmgsKyzYj+UnibgL2A2fQBazKbbqeTgu3L/F8wgd
         wM7Q==
X-Gm-Message-State: ANoB5pnc4KvnznSn+PsCYfkhliO2HwJjeDrC+scONYeTQAEPaFflREw5
        haupJj1zRjMg1jBrHr5dDTe4GE+4HdxEyE3etBbEEQ==
X-Google-Smtp-Source: AA0mqf6V3sD0dfIeXkvuFyXVlvYnyFq1swuenyPZM4OvYIuywP3NvLESQNKs2ZpfMxSP9GcQI9ETNaPM19XxIazd1VA=
X-Received: by 2002:a05:6512:33d1:b0:4b5:1c86:9267 with SMTP id
 d17-20020a05651233d100b004b51c869267mr1501925lfg.297.1669664410971; Mon, 28
 Nov 2022 11:40:10 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Nov 2022 14:40:10 -0500
MIME-Version: 1.0
In-Reply-To: <1669621742-28524-1-git-send-email-quic_srivasam@quicinc.com>
References: <1669621742-28524-1-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 28 Nov 2022 14:40:10 -0500
Message-ID: <CAE-0n519fURgt4x-4maBGBEm-OWk7rbfRgNJNzR-XDcMB5b4jA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-sc7180: Add system suspend/resume PM ops
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        andersson@kernel.org, bgoswami@quicinc.com, broonie@kernel.org,
        devicetree@vger.kernel.org, judyhsiao@chromium.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz,
        quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-11-27 23:49:02)
> Update lpass sc7180 platform driver with PM ops, such as
> system supend and resume callbacks.
> This update is required to disable clocks during supend and
> avoid XO shutdown issue.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Rahul Ajmeriya <quic_rajmeriy@quicinc.com>
> ---
>  sound/soc/qcom/lpass-sc7180.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
> index 77a556b..6ad1c5b 100644
> --- a/sound/soc/qcom/lpass-sc7180.c
> +++ b/sound/soc/qcom/lpass-sc7180.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>

Why is this include needed? Did you mean to include linux/pm.h?

>  #include <dt-bindings/sound/sc7180-lpass.h>
>  #include <sound/pcm.h>
>  #include <sound/soc.h>
> @@ -156,10 +157,34 @@ static int sc7180_lpass_exit(struct platform_device *pdev)
>         struct lpass_data *drvdata = platform_get_drvdata(pdev);
>
>         clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
> +       return 0;
> +}
> +
> +static int sc7180_lpass_dev_resume(struct device *dev)
> +{
> +       int ret = 0;

Please don't assign ret and then assign it again. It hides use before
true assignment bugs.

> +       struct lpass_data *drvdata = dev_get_drvdata(dev);
>
> +       ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
> +       if (ret) {
> +               dev_err(dev, "sc7180 clk prepare and enable failed\n");
> +               return ret;
> +       }
> +       return ret;

This could be simplified to

	ret = clk_bulk_prepare_enable(...);
	if (ret)
		dev_err(dev, ...);

	return ret;
