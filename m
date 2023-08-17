Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2D077F3D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Aug 2023 11:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349787AbjHQJr2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Aug 2023 05:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349807AbjHQJrC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Aug 2023 05:47:02 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B322B2D79
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 02:46:57 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-bcb6dbc477eso5896292276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 02:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692265617; x=1692870417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rcn/KTuReJUUECbqQYVa4AGe2SO0zMa0Wa8ILwEYZYE=;
        b=J2/aPzXtc1Qi88z+4IMaGFg41uvpYG5tBv4k2GMG70yEXj2qWog1sf9wll8ZO+RN1w
         M7LVOUkyREWWnR82dWIbGTyvjWlYyChSTQ6ugLufpYzsR2p3dkMb0J18+vR5pO3Kl//v
         Rbc6eIYHg2rDIMrXOjP2y/WQRv1SH/y9FazujezddBfXdlUjDNBkqjR7FlsYKGlPZMtp
         AIMc9WdHacca/YcbRV/FdlNTilgp6ufzforD6ZaTGpW6JtTT/g+WVnmpwyp+hQ3Ay3m+
         OgsRtxlngaunXYniXLR3l8+BaAJq1YbB9f2mbxgL7QmQmmw9vQeUqI7+sf4Jwmq0mMp0
         lhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692265617; x=1692870417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rcn/KTuReJUUECbqQYVa4AGe2SO0zMa0Wa8ILwEYZYE=;
        b=Ie37LxxU0wI/h3DYE5KItMhMvTqBn8ynQrrIb+8fMUdGbWzYBLRaA2ELSWWE3yMEzi
         7OHQY3V9p1SthaTTkwU68FI8wgCjYM9d9pd97HSPKu46bMTGdmoMLKh60OX1ybyE9N5z
         H/3hDvMs6H2ZZBHHu8yav3gGre+QYO+Dhd5YgHVoYJLMjp2OaAjBgx3kqycHWGz7IF0c
         nTiZPx+1hbkLHfdJLuo+vIsD6b7QNFnzNAsTflm+05f98JBg+XeEvAKuzTarAqMjlgiL
         Yw0AS/bS5eiOkFHLuoxKypqECet00NpOdPO8tyRz/TK8s0bS7fO8fuGWy45wcvKNLTLX
         oEuw==
X-Gm-Message-State: AOJu0Yy2PZNSPXjivytCCsT9ui/RMwllsIi68xY2RYicTbf9V3ZFcQxd
        xVlSedEozTcfeIHN13g3lh6B9tgg8T2bm7qGGGJPrA==
X-Google-Smtp-Source: AGHT+IGpgEe+rlkEYGtvZFK1qgf4SUdj+qvtkUlpg59vHt4pyd+8lHWESZDBK3Qt1gGnMrBWFHEKn6nw3T0PnUQ3KuM=
X-Received: by 2002:a0d:e3c2:0:b0:586:9c4b:95fb with SMTP id
 m185-20020a0de3c2000000b005869c4b95fbmr4064499ywe.19.1692265616856; Thu, 17
 Aug 2023 02:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230816145741.1472721-1-abel.vesa@linaro.org> <20230816145741.1472721-3-abel.vesa@linaro.org>
In-Reply-To: <20230816145741.1472721-3-abel.vesa@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 17 Aug 2023 11:46:21 +0200
Message-ID: <CAPDyKFrZCKUfJcY3XR-nPPeyDLZ3spZeVXvtD9oGJwzrzrCCLw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] PM: domains: Add the domain HW-managed mode to the summary
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Len Brown <len.brown@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@qti.qualcomm.com>, linux-pm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 16 Aug 2023 at 16:57, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Now that domains support being managed by the HW, lets add that
> information to the genpd summary.

To avoid confusion, would you mind re-phrasing the above to something
along the lines of:

Now that genpd supports dynamically switching the control for an
attached device between hardware- and software-mode,  let's add this
information to the genpd summary in debugfs.

>
> Suggested-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Kind regards
Uffe

> ---
>  drivers/base/power/domain.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> index dfb4f1de540d..053b7b510825 100644
> --- a/drivers/base/power/domain.c
> +++ b/drivers/base/power/domain.c
> @@ -3171,6 +3171,15 @@ static void rtpm_status_str(struct seq_file *s, struct device *dev)
>         seq_printf(s, "%-25s  ", p);
>  }
>
> +static void mode_status_str(struct seq_file *s, struct device *dev)
> +{
> +       struct generic_pm_domain_data *gpd_data;
> +
> +       gpd_data = to_gpd_data(dev->power.subsys_data->domain_data);
> +
> +       seq_printf(s, "%20s", gpd_data->hw_mode ? "HW_Mode" : "SW_Mode");
> +}
> +
>  static void perf_status_str(struct seq_file *s, struct device *dev)
>  {
>         struct generic_pm_domain_data *gpd_data;
> @@ -3229,6 +3238,7 @@ static int genpd_summary_one(struct seq_file *s,
>                 seq_printf(s, "\n    %-50s  ", kobj_path);
>                 rtpm_status_str(s, pm_data->dev);
>                 perf_status_str(s, pm_data->dev);
> +               mode_status_str(s, pm_data->dev);
>                 kfree(kobj_path);
>         }
>
> @@ -3245,8 +3255,9 @@ static int summary_show(struct seq_file *s, void *data)
>         int ret = 0;
>
>         seq_puts(s, "domain                          status          children                           performance\n");
> -       seq_puts(s, "    /device                                             runtime status\n");
> -       seq_puts(s, "----------------------------------------------------------------------------------------------\n");
> +       seq_puts(s, "    /device                                             runtime status                           mode\n");
> +       seq_puts(s, "------------------------------------------------------------------------------------------------------------\n");
> +
>
>         ret = mutex_lock_interruptible(&gpd_list_lock);
>         if (ret)
> --
> 2.34.1
>
