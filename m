Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3621672F009
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 01:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235958AbjFMXhy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 19:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231341AbjFMXhx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 19:37:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF731727;
        Tue, 13 Jun 2023 16:37:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3F62A617D6;
        Tue, 13 Jun 2023 23:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B39B3C433C8;
        Tue, 13 Jun 2023 23:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686699470;
        bh=/vTpNtYTVMrmNhEt3E4HPuxmQCh3bGs/cYI8jwBQ0eE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gtMwib4h0SuyJv2eAMAZqUOvdZeeNOiaPtusyCIFcBO2oOS+9NOQ4YcUCI9dM4s9o
         coVtGDFdIc126eERDssztiF+LQhhYT6EwzZOM8LS4mQAqKcenxV1299RoNcZTd8Opo
         Hkyke9+tUfHiqUmZ6LvnTiS/5kPLsFAh6JsOMS/KL4Wf/Jlkc9Kncjepjuo0xAHAZg
         t1i/N8j3yi6qt0KZcNwpY0uVWPTbAI/qQzI3C/uyp4gb/o93Gh7DeLeOgaF8Ae/HdZ
         b/cNuLqKDuX20Cu/fgLfbwSZVGsNghLNWXR+/Gv2RPK2OXd70HbiuVDOnxL23kpVSa
         Qj9kL18fv+7PA==
Date:   Tue, 13 Jun 2023 16:41:13 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 08/10] clk: qcom: gcc-mdm9615: drop the cxo clock
Message-ID: <20230613234113.tnzjgfbyhj5zokgl@ripper>
References: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
 <20230512211727.3445575-9-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512211727.3445575-9-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, May 13, 2023 at 12:17:25AM +0300, Dmitry Baryshkov wrote:
> The gcc and lcc devices have been switched to the DT-defined cxo_board
> clock. Now we can drop the manually defined cxo clock.
> 

Perhaps I'm reading this incorrectly, but don't you introduce that clock
in DT in the next commit? It would be nice to allow for at least some
overlap between existing dtb and the new scheme.

Regards,
Bjorn

> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/gcc-mdm9615.c | 17 -----------------
>  1 file changed, 17 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
> index 458c18b639db..64d4f508e43a 100644
> --- a/drivers/clk/qcom/gcc-mdm9615.c
> +++ b/drivers/clk/qcom/gcc-mdm9615.c
> @@ -26,17 +26,6 @@
>  #include "clk-branch.h"
>  #include "reset.h"
>  
> -static struct clk_fixed_factor cxo = {
> -	.mult = 1,
> -	.div = 1,
> -	.hw.init = &(struct clk_init_data){
> -		.name = "cxo",
> -		.parent_names = (const char *[]){ "cxo_board" },
> -		.num_parents = 1,
> -		.ops = &clk_fixed_factor_ops,
> -	},
> -};
> -
>  enum {
>  	DT_CXO,
>  	DT_PLL4,
> @@ -1623,10 +1612,6 @@ static struct clk_branch ebi2_aon_clk = {
>  	},
>  };
>  
> -static struct clk_hw *gcc_mdm9615_hws[] = {
> -	&cxo.hw,
> -};
> -
>  static struct clk_regmap *gcc_mdm9615_clks[] = {
>  	[PLL0] = &pll0.clkr,
>  	[PLL0_VOTE] = &pll0_vote,
> @@ -1736,8 +1721,6 @@ static const struct qcom_cc_desc gcc_mdm9615_desc = {
>  	.num_clks = ARRAY_SIZE(gcc_mdm9615_clks),
>  	.resets = gcc_mdm9615_resets,
>  	.num_resets = ARRAY_SIZE(gcc_mdm9615_resets),
> -	.clk_hws = gcc_mdm9615_hws,
> -	.num_clk_hws = ARRAY_SIZE(gcc_mdm9615_hws),
>  };
>  
>  static const struct of_device_id gcc_mdm9615_match_table[] = {
> -- 
> 2.39.2
> 
