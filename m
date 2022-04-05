Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95C534F4BF8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 03:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1575471AbiDEXHt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Apr 2022 19:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1457665AbiDEQbF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 12:31:05 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29DFABBE39
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 09:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649176145; x=1680712145;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=sgkmuD5Q/bXwbmH1VXjyWtRp1MnQCr2LuBfHrrC73qI=;
  b=xfeIQx+vRMobHyWLeDi/n7sGBMoRjY5NMwmg6m29E0H72hE1uxloJmHV
   vMJSBVu5YJu7qsvsmgC7/gElgB5T3ehb4sbB+OvOsjtfqWicnn9fJ7g1L
   IDjPJhnEMZGOfWWCB/qEbpGManjZ01Fl65s8fOLyB2YptCgEeRE126LWn
   Y=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 05 Apr 2022 09:29:03 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 09:29:03 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 5 Apr 2022 09:29:03 -0700
Received: from [10.38.244.111] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 5 Apr 2022
 09:29:01 -0700
Message-ID: <2a276e9b-c1d1-ab75-4aaf-e5475143bb07@quicinc.com>
Date:   Tue, 5 Apr 2022 09:28:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dsi: fix error checks and return values for DSI
 xmit functions
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>,
        "Dan Carpenter" <dan.carpenter@oracle.com>
References: <20220401231104.967193-1-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220401231104.967193-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/1/2022 4:11 PM, Dmitry Baryshkov wrote:
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

Looks reasonable to me,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++++-------
>   1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index d51e70fab93d..8925f60fd9ec 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1341,10 +1341,10 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
>   			dsi_get_bpp(msm_host->format) / 8;
>   
>   	len = dsi_cmd_dma_add(msm_host, msg);
> -	if (!len) {
> +	if (len < 0) {
>   		pr_err("%s: failed to add cmd type = 0x%x\n",
>   			__func__,  msg->type);
> -		return -EINVAL;
> +		return len;
>   	}
>   
>   	/* for video mode, do not send cmds more than
> @@ -1363,10 +1363,14 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
>   	}
>   
>   	ret = dsi_cmd_dma_tx(msm_host, len);
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
>   	}
>   
>   	return len;
> @@ -2092,9 +2096,12 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *host,
>   		}
>   
>   		ret = dsi_cmds2buf_tx(msm_host, msg);
> -		if (ret < msg->tx_len) {
> +		if (ret < 0) {
>   			pr_err("%s: Read cmd Tx failed, %d\n", __func__, ret);
>   			return ret;
> +		} else if (ret < msg->tx_len) {
> +			pr_err("%s: Read cmd Tx failed, too short: %d\n", __func__, ret);
> +			return -ECOMM;
>   		}
>   
>   		/*
