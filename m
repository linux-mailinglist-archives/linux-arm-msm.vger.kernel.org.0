Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB1E75625A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 23:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237201AbiF3Vw4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 17:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237682AbiF3Vwv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 17:52:51 -0400
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B324E564CB;
        Thu, 30 Jun 2022 14:52:50 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id s17so504407iob.7;
        Thu, 30 Jun 2022 14:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Pd9YdFtXTAdBiVjUKDDX58WMS8bfFXnbd3z8gjNaxBk=;
        b=N3tnr01hGnDDKhkDHnF1qdAd7BIi31y4uLcC0etck5z04cLWguyvIYNvsm+XslrlJf
         0HW+3pd4HaZ2W4K5iitU/tpGDI8yVV6PRICQ7uwRT3Z2/nzbQtMYxjBhb+tCgbgxtn/B
         RMz/N1TdZ05Ff1v88gmYK1sXVYuhM+8FDmlguYuCdf1RHPh2zqCwAn0UwHztCXx4IOlK
         KP0vbfydBXfiz1lU2SsWNJjpoUHgc8O/JCpAsN3gjDKzHwA6YXhzh4bBaDW1C79MAlSB
         MtX6tbZnnEI91VRRMu912HXltyxGold4KuSPYt7bnkKgFIYqLIpHaFZ4h6U6PD7EsU02
         h6wg==
X-Gm-Message-State: AJIora/HshpnIsmDauLKhyk1L21w63H5Cop9Vb0c1ZlNXZpIRMZbK2cP
        iweG4laJe5pPdAEo8HC3QA==
X-Google-Smtp-Source: AGRyM1vdhQs6rgNjn7lJf44FBibULmBK9NHhdmaES6lxuj5OVArNTesjPyjy4bFZssm+xslv86uMzg==
X-Received: by 2002:a05:6638:3d83:b0:33c:805a:77eb with SMTP id ci3-20020a0566383d8300b0033c805a77ebmr6840964jab.237.1656625969978;
        Thu, 30 Jun 2022 14:52:49 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id e2-20020a5d9242000000b006758cc4aa76sm2155836iol.29.2022.06.30.14.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 14:52:49 -0700 (PDT)
Received: (nullmailer pid 3380142 invoked by uid 1000);
        Thu, 30 Jun 2022 21:52:47 -0000
Date:   Thu, 30 Jun 2022 15:52:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v1 2/4] clk: qcom: Add support for Display Clock
 Controller on SM8450
Message-ID: <20220630215247.GA3375216-robh@kernel.org>
References: <20220623114737.247703-1-dmitry.baryshkov@linaro.org>
 <20220623114737.247703-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623114737.247703-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 23, 2022 at 02:47:35PM +0300, Dmitry Baryshkov wrote:
> Add support for the dispcc on Qualcomm SM8450 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig                      |    9 +
>  drivers/clk/qcom/Makefile                     |    1 +
>  drivers/clk/qcom/dispcc-sm8450.c              | 1806 +++++++++++++++++
>  .../dt-bindings/clock/qcom,dispcc-sm8450.h    |  103 +

This belongs in binding patch.

>  4 files changed, 1919 insertions(+)
>  create mode 100644 drivers/clk/qcom/dispcc-sm8450.c
>  create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8450.h


> diff --git a/include/dt-bindings/clock/qcom,dispcc-sm8450.h b/include/dt-bindings/clock/qcom,dispcc-sm8450.h
> new file mode 100644
> index 000000000000..653ce8d47fe6
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,dispcc-sm8450.h
> @@ -0,0 +1,103 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Dual license.

> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.

It's 2022.

> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SM8450_H
> +#define _DT_BINDINGS_CLK_QCOM_DISP_CC_SM8450_H
> +
> +/* DISP_CC clocks */
> +#define DISP_CC_MDSS_AHB1_CLK					0
> +#define DISP_CC_MDSS_AHB_CLK					1
> +#define DISP_CC_MDSS_AHB_CLK_SRC				2
> +#define DISP_CC_MDSS_BYTE0_CLK					3
> +#define DISP_CC_MDSS_BYTE0_CLK_SRC				4
> +#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				5
> +#define DISP_CC_MDSS_BYTE0_INTF_CLK				6
> +#define DISP_CC_MDSS_BYTE1_CLK					7
> +#define DISP_CC_MDSS_BYTE1_CLK_SRC				8
> +#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC				9
> +#define DISP_CC_MDSS_BYTE1_INTF_CLK				10
> +#define DISP_CC_MDSS_DPTX0_AUX_CLK				11
> +#define DISP_CC_MDSS_DPTX0_AUX_CLK_SRC				12
> +#define DISP_CC_MDSS_DPTX0_CRYPTO_CLK				13
> +#define DISP_CC_MDSS_DPTX0_LINK_CLK				14
> +#define DISP_CC_MDSS_DPTX0_LINK_CLK_SRC				15
> +#define DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC			16
> +#define DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			17
> +#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK				18
> +#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			19
> +#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK				20
> +#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			21
> +#define DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK		22
> +#define DISP_CC_MDSS_DPTX1_AUX_CLK				23
> +#define DISP_CC_MDSS_DPTX1_AUX_CLK_SRC				24
> +#define DISP_CC_MDSS_DPTX1_CRYPTO_CLK				25
> +#define DISP_CC_MDSS_DPTX1_LINK_CLK				26
> +#define DISP_CC_MDSS_DPTX1_LINK_CLK_SRC				27
> +#define DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC			28
> +#define DISP_CC_MDSS_DPTX1_LINK_INTF_CLK			29
> +#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK				30
> +#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC			31
> +#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK				32
> +#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC			33
> +#define DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK		34
> +#define DISP_CC_MDSS_DPTX2_AUX_CLK				35
> +#define DISP_CC_MDSS_DPTX2_AUX_CLK_SRC				36
> +#define DISP_CC_MDSS_DPTX2_CRYPTO_CLK				37
> +#define DISP_CC_MDSS_DPTX2_LINK_CLK				38
> +#define DISP_CC_MDSS_DPTX2_LINK_CLK_SRC				39
> +#define DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC			40
> +#define DISP_CC_MDSS_DPTX2_LINK_INTF_CLK			41
> +#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK				42
> +#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC			43
> +#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK				44
> +#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC			45
> +#define DISP_CC_MDSS_DPTX3_AUX_CLK				46
> +#define DISP_CC_MDSS_DPTX3_AUX_CLK_SRC				47
> +#define DISP_CC_MDSS_DPTX3_CRYPTO_CLK				48
> +#define DISP_CC_MDSS_DPTX3_LINK_CLK				49
> +#define DISP_CC_MDSS_DPTX3_LINK_CLK_SRC				50
> +#define DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC			51
> +#define DISP_CC_MDSS_DPTX3_LINK_INTF_CLK			52
> +#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK				53
> +#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC			54
> +#define DISP_CC_MDSS_ESC0_CLK					55
> +#define DISP_CC_MDSS_ESC0_CLK_SRC				56
> +#define DISP_CC_MDSS_ESC1_CLK					57
> +#define DISP_CC_MDSS_ESC1_CLK_SRC				58
> +#define DISP_CC_MDSS_MDP1_CLK					59
> +#define DISP_CC_MDSS_MDP_CLK					60
> +#define DISP_CC_MDSS_MDP_CLK_SRC				61
> +#define DISP_CC_MDSS_MDP_LUT1_CLK				62
> +#define DISP_CC_MDSS_MDP_LUT_CLK				63
> +#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				64
> +#define DISP_CC_MDSS_PCLK0_CLK					65
> +#define DISP_CC_MDSS_PCLK0_CLK_SRC				66
> +#define DISP_CC_MDSS_PCLK1_CLK					67
> +#define DISP_CC_MDSS_PCLK1_CLK_SRC				68
> +#define DISP_CC_MDSS_ROT1_CLK					69
> +#define DISP_CC_MDSS_ROT_CLK					70
> +#define DISP_CC_MDSS_ROT_CLK_SRC				71
> +#define DISP_CC_MDSS_RSCC_AHB_CLK				72
> +#define DISP_CC_MDSS_RSCC_VSYNC_CLK				73
> +#define DISP_CC_MDSS_VSYNC1_CLK					74
> +#define DISP_CC_MDSS_VSYNC_CLK					75
> +#define DISP_CC_MDSS_VSYNC_CLK_SRC				76
> +#define DISP_CC_PLL0						77
> +#define DISP_CC_PLL1						78
> +#define DISP_CC_SLEEP_CLK					79
> +#define DISP_CC_SLEEP_CLK_SRC					80
> +#define DISP_CC_XO_CLK						81
> +#define DISP_CC_XO_CLK_SRC					82
> +
> +/* DISP_CC resets */
> +#define DISP_CC_MDSS_CORE_BCR					0
> +#define DISP_CC_MDSS_CORE_INT2_BCR				1
> +#define DISP_CC_MDSS_RSCC_BCR					2
> +
> +/* DISP_CC GDSCR */
> +#define MDSS_GDSC				0
> +#define MDSS_INT2_GDSC				1
> +
> +#endif
> -- 
> 2.35.1
> 
> 
