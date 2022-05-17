Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 085D852AA6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 May 2022 20:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348585AbiEQSSX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 May 2022 14:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbiEQSSW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 May 2022 14:18:22 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7FE8506EA
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 11:18:20 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id c10so2339707edr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 11:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qH8JUwLx+nM2xLEZwshDyeOy6cvrct0hZrP49LTkuDM=;
        b=EY9f44uXKvLkOY8iZd14BHawAhNUN5U4GqSLHNYuqKHcKS0Qke1+e4dR2Lr2q+pgtm
         PuNJGHYdn8j0Q/PHfKAhuitiiKnVmprU51irprKmrChcHh4UC7xaOLSS3bNfv3rRF2Ws
         I6aoIAW3INBzIFcGpdp5JQMEl5AHmprHor3Xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qH8JUwLx+nM2xLEZwshDyeOy6cvrct0hZrP49LTkuDM=;
        b=NVZTEtKaxBYLECOtIb3XPsQjiALTTVy/NXHo8HfjpxCHEOla1S3GJX9zlXeVjJrOB9
         8c3v8PzNCwY8kD+h6wKonAy1eK22Fpyy4GuUdv0nyBWShkvC7N6OqOdzXKAh9q6uSDb6
         tDTlCXqNAJgOWb/KfHzed93jVIcyIx35ZjSEeY+bJe7m+nNkkzWImMAkPiJDIekElp+a
         pAkZJ9EXfA4bN+J/3B/YJmK7v8w0btoGewOupE6cx89mkLP3+MzARDsdxjZ2bGSlC0VJ
         hAFEMr2s1wPRnUNRT2A+09vW3dhLKuNw/6UvcAfks03Vp4INMvRl6xuYwSy+JAeVvgaj
         BXYA==
X-Gm-Message-State: AOAM531fs7XT/TcwaY6bx/piYqMKjNLaGi1N6P9uWA+/HrUoGqiZ87fw
        s+b5a4FrMotz5UHaYmlCh75BzXor1V9v5A==
X-Google-Smtp-Source: ABdhPJyyqaCGcdeOuXY8Euxa8Cz3peTc/pQLD6E/awrApEp/ZN7OoIZca90paDZ7cndmgsC2rxTF3Q==
X-Received: by 2002:a50:ef09:0:b0:42a:a617:9cdb with SMTP id m9-20020a50ef09000000b0042aa6179cdbmr16352495eds.188.1652811499091;
        Tue, 17 May 2022 11:18:19 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id qx16-20020a170907b59000b006f3ef214e4csm1324589ejc.178.2022.05.17.11.18.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 11:18:18 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id t6so25853228wra.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 11:18:17 -0700 (PDT)
X-Received: by 2002:a5d:5009:0:b0:20d:846:f4da with SMTP id
 e9-20020a5d5009000000b0020d0846f4damr10202605wrt.301.1652811497320; Tue, 17
 May 2022 11:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <1652808360-9830-1-git-send-email-quic_khsieh@quicinc.com> <1652808360-9830-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1652808360-9830-2-git-send-email-quic_khsieh@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 17 May 2022 11:18:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U0Ba0th-jmF+3t9BPEisXU2ZmjiahV7YFUqC0fbUrvJQ@mail.gmail.com>
Message-ID: <CAD=FV=U0Ba0th-jmF+3t9BPEisXU2ZmjiahV7YFUqC0fbUrvJQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] phy/qcom: add regulator_set_load to edp/dp phy
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, May 17, 2022 at 10:26 AM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> This patch add regulator_set_load() to both eDP and DP phy driver
> to have totally control regulators.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 25 +++++++++++++++++++++----
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 24 ++++++++++++++++++++++++
>  2 files changed, 45 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..9b55095 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -87,17 +87,24 @@ struct qcom_edp {
>
>         struct clk_bulk_data clks[2];
>         struct regulator_bulk_data supplies[2];
> +       int enable_load[2];
> +       int disable_load[2];
>  };
>
>  static int qcom_edp_phy_init(struct phy *phy)
>  {
>         struct qcom_edp *edp = phy_get_drvdata(phy);
>         int ret;
> +       int num_consumers = ARRAY_SIZE(edp->supplies);
> +       int i;
>
> -       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> +       ret = regulator_bulk_enable(num_consumers, edp->supplies);
>         if (ret)
>                 return ret;
>
> +       for (i = num_consumers - 1; i >= 0; --i)
> +               regulator_set_load(edp->supplies[i].consumer, edp->enable_load[i]);
> +
>         ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
>         if (ret)
>                 goto out_disable_supplies;
> @@ -425,9 +432,15 @@ static int qcom_edp_phy_power_off(struct phy *phy)
>  static int qcom_edp_phy_exit(struct phy *phy)
>  {
>         struct qcom_edp *edp = phy_get_drvdata(phy);
> +       int num_consumers = ARRAY_SIZE(edp->supplies);
> +       int i;
>
>         clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
> -       regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> +
> +       for (i = num_consumers - 1; i >= 0; --i)
> +               regulator_set_load(edp->supplies[i].consumer, edp->disable_load[i]);
> +
> +       regulator_bulk_disable(num_consumers, edp->supplies);
>
>         return 0;
>  }
> @@ -633,8 +646,12 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> -       edp->supplies[0].supply = "vdda-phy";
> -       edp->supplies[1].supply = "vdda-pll";
> +       edp->supplies[0].supply = "vdda-1p2";
> +       edp->supplies[1].supply = "vdda-0p9";
> +       edp->enable_load[0] = 21800;    /* 1.2 V */
> +       edp->enable_load[1] = 36000;    /* 1.2 V */
> +       edp->disable_load[0] = 4;       /* 0.9 V */
> +       edp->disable_load[1] = 4;       /* 10.9V */

10.9V? That's a lot!


>         ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(edp->supplies), edp->supplies);
>         if (ret)
>                 return ret;
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index b144ae1..c589231 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -3130,6 +3130,8 @@ struct qmp_phy_cfg {
>         int num_resets;
>         /* regulators to be requested */
>         const char * const *vreg_list;
> +       const unsigned int *vreg_enable_load;
> +       const unsigned int *vreg_disable_load;
>         int num_vregs;
>
>         /* array of registers with different offsets */
> @@ -3346,6 +3348,14 @@ static const char * const qmp_phy_vreg_l[] = {
>         "vdda-phy", "vdda-pll",
>  };
>
> +static const unsigned int qmp_phy_vreg_enable_load[] = {
> +       21800, 36000
> +};
> +
> +static const unsigned int qmp_phy_vreg_disable_load[] = {
> +       4, 32
> +};
> +
>  static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
>         .type                   = PHY_TYPE_USB3,
>         .nlanes                 = 1,
> @@ -4072,6 +4082,8 @@ static const struct qmp_phy_cfg sm8250_usb3phy_cfg = {
>         .reset_list             = msm8996_usb3phy_reset_l,
>         .num_resets             = ARRAY_SIZE(msm8996_usb3phy_reset_l),
>         .vreg_list              = qmp_phy_vreg_l,
> +       .vreg_enable_load       = qmp_phy_vreg_enable_load,
> +       .vreg_disable_load      = qmp_phy_vreg_disable_load,
>         .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
>         .regs                   = qmp_v4_usb3phy_regs_layout,
>
> @@ -4139,6 +4151,8 @@ static const struct qmp_phy_cfg sm8250_dpphy_cfg = {
>         .reset_list             = msm8996_usb3phy_reset_l,
>         .num_resets             = ARRAY_SIZE(msm8996_usb3phy_reset_l),
>         .vreg_list              = qmp_phy_vreg_l,
> +       .vreg_enable_load       = qmp_phy_vreg_enable_load,
> +       .vreg_disable_load      = qmp_phy_vreg_disable_load,
>         .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
>         .regs                   = qmp_v4_usb3phy_regs_layout,
>
> @@ -5015,6 +5029,11 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
>                 goto err_reg_enable;
>         }
>
> +       if (cfg->vreg_enable_load) {
> +               for (i = cfg->num_vregs - 1; i >= 0; --i)
> +                       regulator_set_load(qmp->vregs[i].consumer, cfg->vreg_enable_load[i]);
> +       }
> +
>         for (i = 0; i < cfg->num_resets; i++) {
>                 ret = reset_control_assert(qmp->resets[i]);
>                 if (ret) {
> @@ -5116,6 +5135,11 @@ static int qcom_qmp_phy_com_exit(struct qmp_phy *qphy)
>
>         clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
>
> +       if (cfg->vreg_disable_load[i]) {
> +               for (i = cfg->num_vregs - 1; i >= 0; --i)
> +                       regulator_set_load(qmp->vregs[i].consumer, cfg->vreg_disable_load[i]);
> +       }
> +
>         regulator_bulk_disable(cfg->num_vregs, qmp->vregs);

You don't haven't needed the regulator_set_load() on
regulator_bulk_disable() for many years now. See commit 5451781dadf8
("regulator: core: Only count load for enabled consumers")

...so the only place you should set the load is in qcom_edp_phy_init()

-Doug
