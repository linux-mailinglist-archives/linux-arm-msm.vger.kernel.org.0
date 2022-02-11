Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5733D4B1C30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 03:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347269AbiBKC00 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 21:26:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240448AbiBKC00 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 21:26:26 -0500
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8624ABAB
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 18:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644546387; x=1676082387;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gPqCmztRkjWq1aj/0t4iHE11Dy8U2EJdueHDddtYRQs=;
  b=CPpNNmCBUnttjqRz+q+RoVmBJcgTXnjUhcHico4oHQJKWgvPQ33rhLx+
   5ph7Krtz/ydgCEMl/sJ7lhiDkh5yb5KGAA6nm4zH8YrX8IXGXK6quX3Jw
   otMes9O+xn/J9H55+rY0ps1C9ByNv6CcrmVq48Xkp8yGjDXAqt2Xo2S1q
   4=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 10 Feb 2022 18:26:26 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 18:26:27 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 10 Feb 2022 18:26:25 -0800
Received: from [10.111.162.111] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 10 Feb
 2022 18:26:22 -0800
Message-ID: <9e36946d-523f-9650-4de8-8695b4cf0284@quicinc.com>
Date:   Thu, 10 Feb 2022 18:26:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 3/3] drm/msm/dpu: Update function parameter documentation
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
CC:     <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Kuogee Hsieh" <quic_khsieh@quicinc.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "Kalyan Thota" <quic_kalyant@quicinc.com>,
        Mark Yacoub <markyacoub@google.com>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220210114106.290669-1-vkoul@kernel.org>
 <20220210114106.290669-3-vkoul@kernel.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220210114106.290669-3-vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/10/2022 3:41 AM, Vinod Koul wrote:
> dpu_core_irq_callback_handler() function comments seem to have become
> stale and emit a warning:
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:147:
> warning: Function parameter or member 'dpu_kms' not described in 'dpu_core_irq_callback_handler'
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:147:
> warning: Excess function parameter 'arg' description in 'dpu_core_irq_callback_handler'
> 
> Fix by updating the documentation
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 9341c88a336f..27073fd49fee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -140,7 +140,7 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>   
>   /**
>    * dpu_core_irq_callback_handler - dispatch core interrupts
> - * @arg:		private data of callback handler
> + * @dpu_kms:		Pointer to DPU's KMS structure
>    * @irq_idx:		interrupt index
>    */
>   static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
