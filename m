Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16FF666A36B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 20:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbjAMTeA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 14:34:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbjAMTdi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 14:33:38 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 085678A23A
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 11:31:52 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id c124so23546702ybb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 11:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3w2TiU+Lm4nUzsmAN2R9y6Z1pBbZIeSZTFy+e+i1Wk=;
        b=wwkkD/BbYvU5NuTiZHjqY6R/O+FRehpJ86yRYqvetizP1k1TrxND2a8wx5XckTHlAR
         +bzA9nNbrS8Hi2ckThe8kGGYkIxYsP9CReFyV5gT9J4XPS8UJ7Cp7zUobVzaDAxHL+Rd
         29Xk+FkVcheDmHH0IhvWxzPdfRREwBTEbwmN6Ssd+33B7k+QEHeUedzmqn7VIvFFSw6U
         AAohESqAXJJNdAOFkDqC6I6VRaxf8qWA+GveIBguZcE+sk92sku8QQdQbLOh1pjKaXnI
         0L2eTI4kOu03otfB272qaDnq8eASvQfg2uFIuIMEzYAv724TEzM12sAWMNa1wrw3XOtu
         Q6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3w2TiU+Lm4nUzsmAN2R9y6Z1pBbZIeSZTFy+e+i1Wk=;
        b=ts/KIe8JBsoxYHGbyZdObB4hwta1eS7WITzenmy9hd4YfWnCofvsxH8JYVsAQw8EtR
         47C9GVKaS/e7QkY7paWFcQHednKFSGasSmQp0AZd8iLS3BIkriQg6DLHcDryX3lh2xNi
         vliBXXosgKHAo3GLZ8CDNCI/3P8ABX6+p9tTM6PIW946+2Egl7Ee2ygrusGqUBDgg2Wg
         Ujkb3ViAYJuSiitAlKmtbAP2wghZiZpMEHXIHZSdZrGmD4+ZgGI94PZAmdWtYs+lSzt3
         44Ts5AgnZBD8L7g0kvOo1i62YU+7zmbAPyxbyoFJOz3vDLdHSPy2G+51O10khhdcm6Se
         BOVw==
X-Gm-Message-State: AFqh2kqBHQcuhG/GFjpE3bIf/VqbMW8xK4WfePAFfLIPkKoK1px29W0Y
        yWDewyGgtpws+IlXT9cr2+gzEMcSuwLmaDNRdllPzQ==
X-Google-Smtp-Source: AMrXdXtimzxWwdAam5pUjv6lnc370dF1DqEq+lHlc6Ucv3r0ITCLyfKNu6YkXfF2piMkkorsB+TRlnbtQAkbkc0H55Q=
X-Received: by 2002:a25:cc7:0:b0:6e0:c7d3:f026 with SMTP id
 190-20020a250cc7000000b006e0c7d3f026mr8920588ybm.275.1673638311180; Fri, 13
 Jan 2023 11:31:51 -0800 (PST)
MIME-Version: 1.0
References: <20230108195336.388349-1-they@mint.lgbt> <20230108195336.388349-4-they@mint.lgbt>
In-Reply-To: <20230108195336.388349-4-they@mint.lgbt>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 13 Jan 2023 21:31:40 +0200
Message-ID: <CAA8EJpp-RwPOv61MtoXYb3Tuy5LDWWBCvYSrGUOvg8vWhid_tw@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] phy: qcom-qmp: Add SM6125 UFS PHY support
To:     Lux Aliaga <they@mint.lgbt>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, alim.akhtar@samsung.com,
        avri.altman@wdc.com, bvanassche@acm.org, keescook@chromium.org,
        tony.luck@intel.com, gpiccoli@igalia.com,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, martin.botka@somainline.org,
        marijn.suijten@somainline.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 8 Jan 2023 at 21:54, Lux Aliaga <they@mint.lgbt> wrote:
>
> The SM6125 UFS PHY is compatible with the one from SM6115. Add a
> compatible for it and modify the config from SM6115 to make them
> compatible with the SC8280XP binding
>
> Signed-off-by: Lux Aliaga <they@mint.lgbt>
> Reviewed-by: Martin Botka <martin.botka@somainline.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index 318eea35b972..f33c84578940 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -693,6 +693,8 @@ static const struct qmp_phy_cfg sdm845_ufsphy_cfg = {
>  static const struct qmp_phy_cfg sm6115_ufsphy_cfg = {
>         .lanes                  = 1,
>
> +       .offsets                = &qmp_ufs_offsets_v5,

Please don't randomly reuse generation-specific structures. This
structure is clearly related to v5, while the PHY is from the v2
generation.

> +
>         .serdes_tbl             = sm6115_ufsphy_serdes_tbl,
>         .serdes_tbl_num         = ARRAY_SIZE(sm6115_ufsphy_serdes_tbl),
>         .tx_tbl                 = sm6115_ufsphy_tx_tbl,
> @@ -1172,6 +1174,9 @@ static const struct of_device_id qmp_ufs_of_match_table[] = {
>         }, {
>                 .compatible = "qcom,sm6115-qmp-ufs-phy",
>                 .data = &sm6115_ufsphy_cfg,
> +       }, {
> +               .compatible = "qcom,sm6125-qmp-ufs-phy",
> +               .data = &sm6115_ufsphy_cfg,
>         }, {
>                 .compatible = "qcom,sm6350-qmp-ufs-phy",
>                 .data = &sdm845_ufsphy_cfg,
> --
> 2.39.0
>


-- 
With best wishes
Dmitry
