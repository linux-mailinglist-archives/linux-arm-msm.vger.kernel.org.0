Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A545140C47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2020 15:19:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgAQOTh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jan 2020 09:19:37 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53435 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbgAQOTh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jan 2020 09:19:37 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1isSTF-0006eE-5w; Fri, 17 Jan 2020 15:19:33 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1isSTE-0007Jv-BR; Fri, 17 Jan 2020 15:19:32 +0100
Message-ID: <e839f09ce459cb374184ac1871db6e0be24f2418.camel@pengutronix.de>
Subject: Re: [PATCH 1/4] remoteproc: qcom: q6v5-mss: Use
 regmap_read_poll_timeout
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org
Cc:     ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org
Date:   Fri, 17 Jan 2020 15:19:32 +0100
In-Reply-To: <20200117135130.3605-2-sibis@codeaurora.org>
References: <20200117135130.3605-1-sibis@codeaurora.org>
         <20200117135130.3605-2-sibis@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 2020-01-17 at 19:21 +0530, Sibi Sankar wrote:
> Replace the loop for HALT_ACK detection with regmap_read_poll_timeout.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 51f451311f5fc..f20b39c6ff0ed 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -73,6 +73,7 @@
>  #define NAV_AXI_IDLE_BIT		BIT(2)
>  
>  #define HALT_ACK_TIMEOUT_MS		100
> +#define NAV_HALT_ACK_TIMEOUT_US		200
>  
>  /* QDSP6SS_RESET */
>  #define Q6SS_STOP_CORE			BIT(0)
> @@ -746,7 +747,6 @@ static void q6v5proc_halt_nav_axi_port(struct q6v5 *qproc,
>  				       struct regmap *halt_map,
>  				       u32 offset)
>  {
> -	unsigned long timeout;
>  	unsigned int val;
>  	int ret;
>  
> @@ -760,15 +760,11 @@ static void q6v5proc_halt_nav_axi_port(struct q6v5 *qproc,
>  			   NAV_AXI_HALTREQ_BIT);
>  
>  	/* Wait for halt ack*/
> -	timeout = jiffies + msecs_to_jiffies(HALT_ACK_TIMEOUT_MS);
> -	for (;;) {
> -		ret = regmap_read(halt_map, offset, &val);
> -		if (ret || (val & NAV_AXI_HALTACK_BIT) ||
> -		    time_after(jiffies, timeout))
> -			break;
> -
> -		udelay(5);
> -	}
> +	ret = regmap_read_poll_timeout(halt_map, offset, val,
> +				       (val & NAV_AXI_HALTACK_BIT),
> +				       5, NAV_HALT_ACK_TIMEOUT_US);
> +	if (ret)
> +		dev_err(qproc->dev, "nav halt ack timeout\n");
>  
>  	ret = regmap_read(halt_map, offset, &val);
>  	if (ret || !(val & NAV_AXI_IDLE_BIT))

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
