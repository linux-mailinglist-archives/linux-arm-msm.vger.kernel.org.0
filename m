Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 309A96FF7A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 May 2023 18:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238053AbjEKQmv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 May 2023 12:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237639AbjEKQmu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 May 2023 12:42:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F15985276;
        Thu, 11 May 2023 09:42:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8584564F81;
        Thu, 11 May 2023 16:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCFF8C433EF;
        Thu, 11 May 2023 16:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683823367;
        bh=uE+kz1AYO8N2ygn2pwokeA3SP3flf+4d4hGGLmy5QeM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dKVUmkp4hEg1BL+MtZ6xanqyOZUsx/sj2pLBtZKO7hwdSwF2Af7i4ZDFTfnhlm4ys
         zCRvb7bkfmDpnr4RAP0n6fwfyUzexD07blJNxAD1dN61EROnz7aYtVCfAFyuZfhU3a
         ZytISSiLF3yAJPVTVsAF6Eun4XOsTsqYkc4PICCsPduEIzTcclRuQUgYGplO1y1p5Z
         uRC3oTxhCXjsue6JM3kG0x+gf10uvNiNXaFWpwSl/W4wBKUSpU4B5r886xm/ht/T0w
         JA5TSscjqhNyOQA8ZnuW8vrrLYnWc3XVAeUZUbuIFbDTut/HHRAQBFTwoUCkDhv7Zj
         pBK+OWm6ZOf5w==
Date:   Thu, 11 May 2023 09:46:23 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, konrad.dybcio@linaro.org,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, richardcochran@gmail.com,
        manivannan.sadhasivam@linaro.org, andy.shevchenko@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH v7 4/4] pinctrl: qcom: Add SDX75 pincontrol driver
Message-ID: <20230511164623.iaziwwwfyroextce@ripper>
References: <1683730825-15668-1-git-send-email-quic_rohiagar@quicinc.com>
 <1683730825-15668-5-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1683730825-15668-5-git-send-email-quic_rohiagar@quicinc.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 10, 2023 at 08:30:25PM +0530, Rohit Agarwal wrote:
> Add initial Qualcomm SDX75 pinctrl driver to support pin configuration
> with pinctrl framework for SDX75 SoC.
> While at it, reordering the SDX65 entry.
> 

Nice, some comment below.

> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
[..]
> diff --git a/drivers/pinctrl/qcom/pinctrl-sdx75.c b/drivers/pinctrl/qcom/pinctrl-sdx75.c
> new file mode 100644
> index 0000000..6f95c0a
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-sdx75.c
> @@ -0,0 +1,1595 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include "pinctrl-msm.h"
> +
> +#define REG_BASE 0x100000

We typically reference the inner TLMM block and omit this offset... But
I don't have a strong opinion.

[..]

> +enum sdx75_functions {
> +	msm_mux_gpio,

Please sort these alphabetically.

> +	msm_mux_eth0_mdc,
[..]
> +	msm_mux__,
> +};
> +
[..]
> +static const struct pinfunction sdx75_functions[] = {
> +	MSM_PIN_FUNCTION(gpio),
> +	MSM_PIN_FUNCTION(eth0_mdc),

Please sort these alphabetically, and please squash individual pins into
their functional group.

[..]
> +	MSM_PIN_FUNCTION(qup_se0_l0),
> +	MSM_PIN_FUNCTION(qup_se0_l1),
> +	MSM_PIN_FUNCTION(qup_se0_l2),
> +	MSM_PIN_FUNCTION(qup_se0_l3),

E.g. this forces the DT writer to write individual -pins for each
signal. Better keep it "qup_se0" and the author is free to group the
pins in their states as they need (and as you know you don't need to
specify all pins for a given function).

[..]
> +};
> +
> +/* Every pin is maintained as a single group, and missing or non-existing pin
> + * would be maintained as dummy group to synchronize pin group index with
> + * pin descriptor registered with pinctrl core.
> + * Clients would not be able to request these dummy pin groups.
> + */

Please omit this comment.

> +static const struct msm_pingroup sdx75_groups[] = {
[..]
> +	[16] = PINGROUP(16, pri_mi2s_ws, qup_se2_l2, qup_se1_l2_mirb, qdss_cti,
> +			qdss_cti, _, _, _, _, _),

Please break the rules and leave these lines unwrapped.

> +	[17] = PINGROUP(17, pri_mi2s_data0, qup_se2_l3, qup_se1_l3_mirb,
> +			qdss_cti, qdss_cti, _, _, _, _, _),
[..]
> +	[131] = PINGROUP(131, _, _, _, _, _, _, _, _, _, _),
> +	[132] =	PINGROUP(132, _, _, _, _, _, _, _, _, _, _),
> +	[133] = SDC_QDSD_PINGROUP(sdc1_rclk, 0x19A000, 16, 0),

Lowercase hex digits please.

> +	[134] = SDC_QDSD_PINGROUP(sdc1_clk, 0x19A000, 14, 6),
> +	[135] = SDC_QDSD_PINGROUP(sdc1_cmd, 0x19A000, 11, 3),
> +	[136] = SDC_QDSD_PINGROUP(sdc1_data, 0x19A000, 9, 0),
> +	[137] = SDC_QDSD_PINGROUP(sdc2_clk, 0x19B000, 14, 6),
> +	[138] = SDC_QDSD_PINGROUP(sdc2_cmd, 0x19B000, 11, 3),
> +	[139] = SDC_QDSD_PINGROUP(sdc2_data, 0x19B000, 9, 0),
> +};
[..]
> +static const struct of_device_id sdx75_pinctrl_of_match[] = {
> +	{ .compatible = "qcom,sdx75-tlmm", .data = &sdx75_pinctrl },
> +	{ }
> +};
> +
[..]
> +
> +MODULE_DESCRIPTION("QTI sdx75 pinctrl driver");
> +MODULE_LICENSE("GPL");
> +MODULE_DEVICE_TABLE(of, sdx75_pinctrl_of_match);

Keep the MODULE_DEVICE_TABLE() just below the sdx75_pinctrl_of_match
please, so future readers doesn't need to search for it.

Regards,
Bjorn
