Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F060D790177
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Sep 2023 19:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350402AbjIARaW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Sep 2023 13:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjIARaW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Sep 2023 13:30:22 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 143A21BF
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Sep 2023 10:30:19 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-401da71b83cso22918755e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Sep 2023 10:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693589417; x=1694194217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ElHKg+pX3fEdOOZS1kWbQ4ja8S276wFxRNF1asSPqwQ=;
        b=ZjK3757tYtzcIggL5ITwi5MMzhztdb9qqTmbEdux9UEH1oj2DcLOnsFzf0dE4ts46B
         xKO36m5FlDsq+nQb29HC75V6NKt2bdwyae7CGcf5PuCQkvEP6Hez3qFQJENg6ZZDeSFH
         6j0OzwSpu62U7jVkFaaOA6FWX52I+dEXO76I2FsQthJEU7Kj7pa7/XyxLE8gvuCRtzap
         kf6p43zf2mRZV5dJ82m6r0cjQcC/PixvsgyN+0cKVW0ld1QSL9wzsoQ/sPpyMU0wT27F
         hWJsl4+OHlxenM4jgZkNpPVkEcJw6JPkik4+h1L74AWwG99yIJErXvwyIxmOJWV5U5zE
         O4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693589417; x=1694194217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElHKg+pX3fEdOOZS1kWbQ4ja8S276wFxRNF1asSPqwQ=;
        b=hR9S96xjHgipAswVDlCL46Vo2UXYwNILMIF0d0BJbdkKHPUa/QfElMvDQbEIUZJ9aM
         pPw2JR+383CfdG9ZEel306gw6mIuqbI6r5MlAHh8lZbfqmwRbeTmApji3r04VWD5oTpq
         X0NdDx0qr0NaOClHDVXRL+PkZQO7JUFOQF+W7T2y5e9A0eeG2IpDwBZ0NKzvnGILqQk+
         9jPxKu2HdNKMEckRaaaBayY7lyLt/kDBFHQM15CYX0ttsq6Dvo3njVtziD8sowD3kaCV
         uVJaD8rheBxwwZfwrgmEx71X+6fHVjnVNbUG9I8Up8HZBHAerCAJi4/Ju6R78g7MXZwE
         2OxQ==
X-Gm-Message-State: AOJu0Yw2/SXmzc8rbFqzbtfxFyyuJfLoDcDvCHkue141cMIpZ61LZTB+
        GIG/LA9NfSjlmKJ84gXY6r2JBg==
X-Google-Smtp-Source: AGHT+IF8OpU763whLIgLndYDsjQedtPeUvT/LnG8ROSIeLXPbR7jiGEGsm3HGrHRuDrOCdJY5kV5YQ==
X-Received: by 2002:adf:d227:0:b0:314:124f:12be with SMTP id k7-20020adfd227000000b00314124f12bemr2459722wrh.3.1693589417436;
        Fri, 01 Sep 2023 10:30:17 -0700 (PDT)
Received: from linaro.org ([84.232.191.193])
        by smtp.gmail.com with ESMTPSA id k11-20020a5d6d4b000000b0031ad2663ed0sm5803411wri.66.2023.09.01.10.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 10:30:16 -0700 (PDT)
Date:   Fri, 1 Sep 2023 20:30:15 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] phy: qcom-qmp-combo: Square out 8550
 POWER_STATE_CONFIG1
Message-ID: <ZPIfpyghcS3kS7Fb@linaro.org>
References: <20230829-topic-8550_usbphy-v1-0-599ddbfa094a@linaro.org>
 <20230829-topic-8550_usbphy-v1-1-599ddbfa094a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829-topic-8550_usbphy-v1-1-599ddbfa094a@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-08-29 22:59:04, Konrad Dybcio wrote:
> There are two instances of the POWER_STATE_CONFIG1 register: one in
> the PCS space and another one in PCS_USB.
> 
> The downstream init sequence pokes the latter one while we've been poking
> the former one (and misnamed it as the latter one, impostor!). Fix that
> up to avoid UB.
> 
> Fixes: 49742e9edab3 ("phy: qcom-qmp-combo: Add support for SM8550")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c      | 2 +-
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index cbb28afce135..843099d314bf 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -859,10 +859,10 @@ static const struct qmp_phy_init_tbl sm8550_usb3_pcs_tbl[] = {
>  	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_PCS_TX_RX_CONFIG, 0x0c),
>  	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_EQ_CONFIG1, 0x4b),
>  	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_EQ_CONFIG5, 0x10),
> -	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_POWER_STATE_CONFIG1, 0x68),
>  };
>  
>  static const struct qmp_phy_init_tbl sm8550_usb3_pcs_usb_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_USB_Q6_PCS_USB3_POWER_STATE_CONFIG1, 0x68),
>  	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
>  	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
>  	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L, 0x40),
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> index 9510e63ba9d8..b9060c242fd2 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> @@ -12,7 +12,7 @@
>  #define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG3		0xcc
>  #define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG6		0xd8
>  #define QPHY_USB_V6_PCS_REFGEN_REQ_CONFIG1		0xdc
> -#define QPHY_USB_V6_PCS_USB3_POWER_STATE_CONFIG1	0x90
> +#define QPHY_USB_V6_PCS_POWER_STATE_CONFIG1		0x90
>  #define QPHY_USB_V6_PCS_RX_SIGDET_LVL			0x188
>  #define QPHY_USB_V6_PCS_RCVR_DTCT_DLY_P1U2_L		0x190
>  #define QPHY_USB_V6_PCS_RCVR_DTCT_DLY_P1U2_H		0x194
> @@ -23,6 +23,7 @@
>  #define QPHY_USB_V6_PCS_EQ_CONFIG1			0x1dc
>  #define QPHY_USB_V6_PCS_EQ_CONFIG5			0x1ec
>  
> +#define QPHY_USB_Q6_PCS_USB3_POWER_STATE_CONFIG1	0x00
>  #define QPHY_USB_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x18
>  #define QPHY_USB_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x3c
>  #define QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x40
> 
> -- 
> 2.42.0
> 
