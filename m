Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17F7552F4CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 23:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353589AbiETVMZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 17:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241610AbiETVMY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 17:12:24 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B867DED7A1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 14:12:23 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id s23-20020a9d7597000000b0060ae566f9a1so3643536otk.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 14:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=4ZcyIGcvDMZ0Wk1DSYhTSmlkdvT7fKKWDNVZgAqDgGs=;
        b=eaQmMn+s8uRwoapg8tdT+VIW36IHFmIaLDAaqPy1SY9nmnNRwYcHAUMMdYnfIhxJS0
         WshDX+JkE8GIL74lyEXI3yqi26ADb9QFljgwiKOGJMmas/u9kUsntbKtGzi2K8NGFiPm
         igQfJRlBr7mVQ0l7n/QR8CVQVCSAzlyw+6T6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=4ZcyIGcvDMZ0Wk1DSYhTSmlkdvT7fKKWDNVZgAqDgGs=;
        b=CrvfMzhXZcbrKF+DZebmOMDXc5W/BWSBBpcxcRS2FxhxrThL5p2ByXGPu/5Tt2Igez
         8UAt8CAtRyf7AcTuFJsGtlDgV4TyJ064UN6fB5kJbWtbG4k8L8A3CTSOB3bIRuEQEh/4
         KF2YE3yF5j0Td6wbfkqVu377yo2z2w3ty/Z00mdL+wHc25st1p6oy4zkrgFMAQcSQBgz
         HQIJ5xMICvtn9rgAezqXXtIqa5ZA0d2qcywym/fKed0rgf5iUpASH+GMbvJa4eeZCvN+
         wPJ4AEcGJo5PQxL3NeU8fOTTyrCffZlCwb29VbPlkgN5CbKere3FdjsqtU1yvgO2+FlY
         tTrg==
X-Gm-Message-State: AOAM532iEu80T//LKSqg0+uZwBCVKqC62Rg20vWEveRu/b9XLnBo7kRl
        BTIl0GOOd01klSuoE0g0frVgfe7MkajxA3DjCMmlsbWKoUs=
X-Google-Smtp-Source: ABdhPJxk+2xo1hoJV75bGy29jmo3pmmEPymugHRbVngVyWNYYyVDr1T3jSaGlzrMC2H6l+67cPlv6Ov3vyOsySFzwTI=
X-Received: by 2002:a9d:63cd:0:b0:606:9e7f:79f8 with SMTP id
 e13-20020a9d63cd000000b006069e7f79f8mr4797333otl.77.1653081143110; Fri, 20
 May 2022 14:12:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 May 2022 14:12:22 -0700
MIME-Version: 1.0
In-Reply-To: <1653079257-20894-2-git-send-email-quic_khsieh@quicinc.com>
References: <1653079257-20894-1-git-send-email-quic_khsieh@quicinc.com> <1653079257-20894-2-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 20 May 2022 14:12:22 -0700
Message-ID: <CAE-0n50EUVwckogNT1ey-HP7QoMCPZPF9AyP+xw7J9o8MOk6YQ@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] phy: qcom-edp: add regulator_set_load to edp phy
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

Quoting Kuogee Hsieh (2022-05-20 13:40:55)
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..955466d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -639,6 +639,18 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> +       ret = regulator_set_load(edp->supplies[0].consumer, 21800); /* 1.2 V vdda-phy */
> +       if (ret) {
> +               dev_err(dev, "failed to set load\n");

Which supply failed to set load?

> +               return ret;
> +       }
> +
> +       ret = regulator_set_load(edp->supplies[1].consumer, 36000); /* 0.9 V vdda-pll */
> +       if (ret) {
> +               dev_err(dev, "failed to set load\n");

This printk is the same as above. I hope this print never happens or it
will not be useful enough to narrow down the issue.

> +               return ret;
> +       }
