Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30A4436C075
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 09:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbhD0H7I convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Apr 2021 03:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbhD0H7H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Apr 2021 03:59:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27414C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Apr 2021 00:58:25 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lbIbn-0000Lk-Os; Tue, 27 Apr 2021 09:58:15 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lbIbn-00068Q-0A; Tue, 27 Apr 2021 09:58:15 +0200
Message-ID: <0c5f747fe0a3f757a4160e4fd28cc2b56a57a39d.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/5] reset: qcom: Add PDC Global reset signals for
 WPSS
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Sibi Sankar <sibis@codeaurora.org>, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, sboyd@kernel.org
Cc:     agross@kernel.org, mani@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 27 Apr 2021 09:58:14 +0200
In-Reply-To: <1619508824-14413-5-git-send-email-sibis@codeaurora.org>
References: <1619508824-14413-1-git-send-email-sibis@codeaurora.org>
         <1619508824-14413-5-git-send-email-sibis@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sibi,

On Tue, 2021-04-27 at 13:03 +0530, Sibi Sankar wrote:
> Add PDC Global reset signals for Wireless Processor Subsystem (WPSS)
> on SC7280 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> v2:
>  * place resets and num_resets adjacent to each other [Stephen]
[...] 
> +struct qcom_pdc_reset_desc {
> +	const struct qcom_pdc_reset_map *resets;
> +	size_t num_resets;
> +	unsigned int offset;
> +};
[...]

For consistency, please do the same here:

> +static const struct qcom_pdc_reset_desc sdm845_pdc_reset_desc = {
> +	.resets = sdm845_pdc_resets,
> +	.offset = RPMH_SDM845_PDC_SYNC_RESET,
> +	.num_resets = ARRAY_SIZE(sdm845_pdc_resets),
> +};
[...]

and here:

> +static const struct qcom_pdc_reset_desc sc7280_pdc_reset_desc = {
> +	.resets = sc7280_pdc_resets,
> +	.offset = RPMH_SC7280_PDC_SYNC_RESET,
> +	.num_resets = ARRAY_SIZE(sc7280_pdc_resets),
> +};

[...]
> @@ -54,19 +89,18 @@ static int qcom_pdc_control_assert(struct reset_controller_dev *rcdev,
>  					unsigned long idx)
>  {
>  	struct qcom_pdc_reset_data *data = to_qcom_pdc_reset_data(rcdev);
> +	const struct qcom_pdc_reset_map *map = &data->desc->resets[idx];
>  
> -	return regmap_update_bits(data->regmap, RPMH_PDC_SYNC_RESET,
> -				  BIT(sdm845_pdc_resets[idx].bit),
> -				  BIT(sdm845_pdc_resets[idx].bit));
> +	return regmap_update_bits(data->regmap, data->desc->offset, BIT(map->bit), BIT(map->bit));
>  }

Why not go one step further:

	u32 mask = BIT(data->desc->resets[idx].bit);

	return regmap_update_bits(data->regmap, data->desc->offset, mask, mask);

That seems to be a common pattern in other qcom drivers.
Either way, with the above reset/num_reset changes:

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Also,

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

for the whole series to go through the qcom tree, or let me know if you
want me to pick up patches 2-4 next round.

regards
Philipp
