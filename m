Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7C6752E10F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 02:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343926AbiETATi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 20:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232012AbiETATh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 20:19:37 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A7116D38F
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 17:19:36 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id v22-20020a05683011d600b0060aeae0b599so1284117otq.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 17:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=irN92Flw/oZRU+x5GvQi4pA44xQS8ZN3dr1edb8S6XU=;
        b=HGmiyVOkhBJDmzZbHsBdDQPMTdh7tlbynY1O+Qm52VOxPAropp+cPDETfpDtPt48DU
         RODqSYH756xQHht++4zfJUAYHURG5zrONEB57fC7jMMRVH1lzKqL+ZLe78X8Q/kitsqq
         03/FqjDCO9oFUM9RdDZ5MiVcmYH08mkXqcoac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=irN92Flw/oZRU+x5GvQi4pA44xQS8ZN3dr1edb8S6XU=;
        b=AHW5dKME/MaiKRaXaiPt2QoUH6dfF2/T7uXAqRNCLphw0dMTbYaGUBJ100LC/SzFyo
         EWeYotwsVy5b99QmTEQYu0hmYU83oVlcwkn6A68a712qGLLEWpNkMm7jleAs2QQnLXgH
         l0istDJOY1QLkrs+KB0BlO1Tn9hAT0bJnq3Ewtmf7deSb9EXSsoJK7fxq/WWF6nf/4tS
         FlXOxHVJjK+jn6+hCGFPl5EH0CkurgOipgS9KWHcHdF39QQWkJIim+w7Rd2E3WQqZ9vc
         puRInqOQ9vYbW7rtGZk7J40AnS9HjY72zgcfqYHoR2oBcuB5awa8ffQyhEuuJupLifnk
         XnMA==
X-Gm-Message-State: AOAM531qVegHrdS4/ACZHyGdYodiDI7kuzmNTMrHpO5f1pGPq0vwYl7q
        X02aGtOSkSeo6/CiB+Ga0sMWE7HZFza8NEq2zF2KgA==
X-Google-Smtp-Source: ABdhPJym/G8+304YgHxkp02EOBkIdEUGSXWtylPSqsACNEbDFVSAvLIxO87X9cqUpNTs6/nLv8CeLcHqq7+/vchVze4=
X-Received: by 2002:a9d:63cd:0:b0:606:9e7f:79f8 with SMTP id
 e13-20020a9d63cd000000b006069e7f79f8mr2963568otl.77.1653005975978; Thu, 19
 May 2022 17:19:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 May 2022 17:19:35 -0700
MIME-Version: 1.0
In-Reply-To: <1653001902-26910-2-git-send-email-quic_khsieh@quicinc.com>
References: <1653001902-26910-1-git-send-email-quic_khsieh@quicinc.com> <1653001902-26910-2-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 19 May 2022 17:19:35 -0700
Message-ID: <CAE-0n52yT6S4TLpc2e2-kkbMB2Fu2PcZskG-ZFLo7y1YVTyazQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] phy: qcom-edp: add regulator_set_load to edp phy
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-05-19 16:11:40)
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..78b7306 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -87,14 +87,19 @@ struct qcom_edp {
>
>         struct clk_bulk_data clks[2];
>         struct regulator_bulk_data supplies[2];
> +       int enable_load[2];
>  };
>
>  static int qcom_edp_phy_init(struct phy *phy)
>  {
>         struct qcom_edp *edp = phy_get_drvdata(phy);
>         int ret;
> +       int i;
>
> -       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> +       for (i = 0; i < 2; i++)

Use ARRAY_SIZE(edp->supplies)?

> +               regulator_set_load(edp->supplies[i].consumer, edp->enable_load[i]);
> +
> +       ret = regulator_bulk_enable(2, edp->supplies);

Why is ARRAY_SIZE() usage removed?

>         if (ret)
>                 return ret;
>
