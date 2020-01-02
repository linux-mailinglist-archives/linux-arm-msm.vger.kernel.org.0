Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC18312E6B5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2020 14:26:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728298AbgABN0T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jan 2020 08:26:19 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42389 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728323AbgABN0S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jan 2020 08:26:18 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1in0UQ-0002De-UR; Thu, 02 Jan 2020 14:26:14 +0100
Message-ID: <4a3c80a0b616d54c5d4b465688034e19694c18c0.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] remoteproc: mss: q6v5-mss: Add modem support on
 SC7180
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org
Date:   Thu, 02 Jan 2020 14:26:14 +0100
In-Reply-To: <20191219054506.20565-3-sibis@codeaurora.org>
References: <20191219054506.20565-1-sibis@codeaurora.org>
         <20191219054506.20565-3-sibis@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 2019-12-19 at 11:15 +0530, Sibi Sankar wrote:
> Add the out of reset sequence support for modem sub-system on SC7180
> SoCs. It requires access to an additional halt nav register to put
> the modem back into reset.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 199 ++++++++++++++++++++++++++++-
>  1 file changed, 198 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 164fc2a53ef11..51f451311f5fc 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
[...]
> @@ -396,6 +409,18 @@ static int q6v5_reset_assert(struct q6v5 *qproc)
>  		reset_control_assert(qproc->pdc_reset);
>  		ret = reset_control_reset(qproc->mss_restart);
>  		reset_control_deassert(qproc->pdc_reset);
> +	} else if (qproc->has_halt_nav) {
> +		/* SWAR using CONN_BOX_SPARE_0 for pipeline glitch issue */
> +		reset_control_assert(qproc->pdc_reset);
> +		regmap_update_bits(qproc->conn_map, qproc->conn_box,
> +				   BIT(0), BIT(0));
> +		regmap_update_bits(qproc->halt_nav_map, qproc->halt_nav,
> +				   NAV_AXI_HALTREQ_BIT, 0);
> +		reset_control_assert(qproc->mss_restart);
> +		reset_control_deassert(qproc->pdc_reset);
> +		regmap_update_bits(qproc->conn_map, qproc->conn_box,
> +				   BIT(0), 0);
> +		ret = reset_control_deassert(qproc->mss_restart);
>  	} else {
>  		ret = reset_control_assert(qproc->mss_restart);
>  	}

Without knowing anything about the hardware this does look a bit weird,
but I assume there is a good reason for every step.

Is the function name still describing its behaviour correctly, or would
it make sense to rename q6v5_reset_assert/deassert to something else?

[...]
> @@ -667,6 +742,39 @@ static void q6v5proc_halt_axi_port(struct q6v5 *qproc,
>  	regmap_write(halt_map, offset + AXI_HALTREQ_REG, 0);
>  }
>  
> +static void q6v5proc_halt_nav_axi_port(struct q6v5 *qproc,
> +				       struct regmap *halt_map,
> +				       u32 offset)
> +{
[...]
> +	/* Wait for halt ack*/
> +	timeout = jiffies + msecs_to_jiffies(HALT_ACK_TIMEOUT_MS);
> +	for (;;) {
> +		ret = regmap_read(halt_map, offset, &val);
> +		if (ret || (val & NAV_AXI_HALTACK_BIT) ||
> +		    time_after(jiffies, timeout))
> +			break;
> +
> +		udelay(5);
> +	}

This does look like a candidate for using regmap_read_poll_timeout().

regards
Philipp

