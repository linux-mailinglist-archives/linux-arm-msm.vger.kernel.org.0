Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 101B356BA82
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 15:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237847AbiGHNSW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 09:18:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231890AbiGHNSV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 09:18:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBAE0E17;
        Fri,  8 Jul 2022 06:18:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 43C0B62785;
        Fri,  8 Jul 2022 13:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929ADC341C0;
        Fri,  8 Jul 2022 13:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657286297;
        bh=LFNYBD49AwA/Cv/jTTpxa7Y0w3Pr54JyGI0tMbAHhIU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sZbYpQNed89IdBLutAcpl80Qev+MeZE87xu9Joqmi+MPv0iHMiNk4gkATCSO4W3Pd
         eGWbgwu1CiJ0t3ZauzZhg093YFr/32OzADaFiIPtnsM5t+3EirejZzj8f0chrRyeug
         p0DPghwreutxvXQLk5dorXSgL+SCa8be5x0pC7JvhmZZYpEUbm1bJJko2WbVn54Zrr
         DHjvlkNCJWlouCvWQnPkHr0Spm1pgnb8tilCBVmBF70Xgci7nrYKSXT+wEabUPHvHo
         A9ClTHXE56ojDO3c8z/+wzwJM8OxuvD5+7Zqw2oZAl4pS5dnyirx0V6Hm/TwCCpqE+
         FLtZfsL9v0gfw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1o9nsC-0001Ui-Pj; Fri, 08 Jul 2022 15:18:20 +0200
Date:   Fri, 8 Jul 2022 15:18:20 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 3/3] phy: qcom-qmp-ufs: provide symbol clocks
Message-ID: <YsgunOdx6D5HVNzY@hovoldconsulting.com>
References: <20220708131333.2836900-1-dmitry.baryshkov@linaro.org>
 <20220708131333.2836900-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708131333.2836900-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 08, 2022 at 04:13:33PM +0300, Dmitry Baryshkov wrote:
> Register three UFS symbol clocks (ufs_rx_symbol_0_clk_src,
> ufs_rx_symbol_1_clk_src ufs_tx_symbol_0_clk_src). Register OF clock
> provider to let other devices link these clocks through the DT.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 56 +++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> +static int phy_symbols_clk_register(struct qcom_qmp *qmp, struct device_node *np)
> +{
> +	struct clk_hw_onecell_data *clk_data;
> +	struct clk_hw *hw;
> +	char name[64];
> +	int ret;
> +
> +	clk_data = devm_kzalloc(qmp->dev, struct_size(clk_data, hws, UFS_SYMBOL_CLOCKS), GFP_KERNEL);

Error handling still missing.

> +	clk_data->num = UFS_SYMBOL_CLOCKS;

Johan
