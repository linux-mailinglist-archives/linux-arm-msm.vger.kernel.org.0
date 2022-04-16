Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29ABC503591
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Apr 2022 11:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbiDPJPH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Apr 2022 05:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbiDPJPG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Apr 2022 05:15:06 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB245F5A
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Apr 2022 02:12:34 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4F2AC3F66F;
        Sat, 16 Apr 2022 11:12:31 +0200 (CEST)
Date:   Sat, 16 Apr 2022 11:12:29 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drm/msm/dsi: fix error checks and return values for DSI xmit
 functions
Message-ID: <20220416091229.pwek4wblroaabhio@SoMainline.org>
References: <20220401231104.967193-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401231104.967193-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On 2022-04-02 02:11:04, Dmitry Baryshkov wrote:
> As noticed by Dan ([1] an the followup thread) there are multiple issues
> with the return values for MSM DSI command transmission callback. In
> the error case it can easily return a positive value when it should
> have returned a proper error code.
> 
> This commits attempts to fix these issues both in TX and in RX paths.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20211001123617.GH2283@kili/
> 
> Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Thank you for your patience waiting for the requested tests; this patch
seems to have no adverse effect on our cmdmode panels.

Tested-by: Marijn Suijten <marijn.suijten@somainline.org>

On the following devices:
- Sony Xperia X (Loire Suzu, MSM8976), on Linux 5.17;
- Sony Xperia 10 II (Seine PDX201, SM6125), on -next 20220318;
- Sony Xperia XA2 Ultra (Nile Discovery, SDM630), on Linux 5.16.

Apologies for the older kernel versions, that's what happens when having
too many patches to dig through and too little hobby time to send them.
Let me know if there's a patch dependency that you like to be included.

- Marijn

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index d51e70fab93d..8925f60fd9ec 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1341,10 +1341,10 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
>  			dsi_get_bpp(msm_host->format) / 8;
>  
>  	len = dsi_cmd_dma_add(msm_host, msg);
> -	if (!len) {
> +	if (len < 0) {
>  		pr_err("%s: failed to add cmd type = 0x%x\n",
>  			__func__,  msg->type);
> -		return -EINVAL;
> +		return len;
>  	}
>  
>  	/* for video mode, do not send cmds more than
> @@ -1363,10 +1363,14 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
>  	}
>  
>  	ret = dsi_cmd_dma_tx(msm_host, len);
> -	if (ret < len) {
> -		pr_err("%s: cmd dma tx failed, type=0x%x, data0=0x%x, len=%d\n",
> -			__func__, msg->type, (*(u8 *)(msg->tx_buf)), len);
> -		return -ECOMM;
> +	if (ret < 0) {
> +		pr_err("%s: cmd dma tx failed, type=0x%x, data0=0x%x, len=%d, ret=%d\n",
> +			__func__, msg->type, (*(u8 *)(msg->tx_buf)), len, ret);
> +		return ret;
> +	} else if (ret < len) {
> +		pr_err("%s: cmd dma tx failed, type=0x%x, data0=0x%x, ret=%d len=%d\n",
> +			__func__, msg->type, (*(u8 *)(msg->tx_buf)), ret, len);
> +		return -EIO;
>  	}
>  
>  	return len;
> @@ -2092,9 +2096,12 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *host,
>  		}
>  
>  		ret = dsi_cmds2buf_tx(msm_host, msg);
> -		if (ret < msg->tx_len) {
> +		if (ret < 0) {
>  			pr_err("%s: Read cmd Tx failed, %d\n", __func__, ret);
>  			return ret;
> +		} else if (ret < msg->tx_len) {
> +			pr_err("%s: Read cmd Tx failed, too short: %d\n", __func__, ret);
> +			return -ECOMM;
>  		}
>  
>  		/*
