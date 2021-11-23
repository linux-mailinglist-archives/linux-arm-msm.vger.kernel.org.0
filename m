Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0953045ADA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 21:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbhKWU6D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 15:58:03 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:31223 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229521AbhKWU6C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 15:58:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637700894; x=1669236894;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=77fnSIl5txLNdgIet3cL2IBEAHlYG5fyTR+1w8yCOuI=;
  b=Ja2WSYdeisA/r6pjNQlvvhGq51W0wtA1NZpXKLeBWqwpEtvERvOkklXn
   BW5ZTJ3+Ic/iaF7922Fw65otOnvdG4xvo6QHmJKaRkbnRhv2txmcCHzNL
   BIvOSN8ts5KN2aiqnjOoEIJejwOxcdBM+WIaRx48k4VSQ8ZTDFifkEysP
   s=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 23 Nov 2021 12:54:54 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 12:54:53 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 23 Nov 2021 12:54:53 -0800
Received: from [10.111.161.155] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 23 Nov
 2021 12:54:50 -0800
Message-ID: <d1edfe2c-87eb-ec3e-a145-8466bf0f3265@quicinc.com>
Date:   Tue, 23 Nov 2021 12:54:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Add more of the INTF interrupt
 regions
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        "Robert Foss" <robert.foss@linaro.org>,
        <freedreno@lists.freedesktop.org>
References: <20211123154050.40984-1-bjorn.andersson@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211123154050.40984-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn

On 11/23/2021 7:40 AM, Bjorn Andersson wrote:
> In addition to the other 7xxx INTF interrupt regions, SM8350 has
> additional INTF regions at 0x0ae37000, 0x0ae38000 and 0x0ae39000, define
> these. The 7xxx naming scheme of the bits are kept for consistency.
> 
More than consistency, this is because both sc7280 and SM8350 use MDP's
7x hw version.

Otherwise,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 18 ++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |  3 +++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index d2b6dca487e3..a77a5eaa78ad 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -30,6 +30,9 @@
>   #define MDP_AD4_INTR_STATUS_OFF		0x420
>   #define MDP_INTF_0_OFF_REV_7xxx             0x34000
>   #define MDP_INTF_1_OFF_REV_7xxx             0x35000
> +#define MDP_INTF_2_OFF_REV_7xxx             0x36000
> +#define MDP_INTF_3_OFF_REV_7xxx             0x37000
> +#define MDP_INTF_4_OFF_REV_7xxx             0x38000
>   #define MDP_INTF_5_OFF_REV_7xxx             0x39000
>   
>   /**
> @@ -110,6 +113,21 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>   		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_EN,
>   		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_STATUS
>   	},
> +	{
> +		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_CLEAR,
> +		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_EN,
> +		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_STATUS
> +	},
> +	{
> +		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_CLEAR,
> +		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_EN,
> +		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_STATUS
> +	},
> +	{
> +		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_CLEAR,
> +		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_EN,
> +		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_STATUS
> +	},
>   	{
>   		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_CLEAR,
>   		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_EN,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index d50e78c9f148..1ab75cccd145 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -26,6 +26,9 @@ enum dpu_hw_intr_reg {
>   	MDP_AD4_1_INTR,
>   	MDP_INTF0_7xxx_INTR,
>   	MDP_INTF1_7xxx_INTR,
> +	MDP_INTF2_7xxx_INTR,
> +	MDP_INTF3_7xxx_INTR,
> +	MDP_INTF4_7xxx_INTR,
>   	MDP_INTF5_7xxx_INTR,
>   	MDP_INTR_MAX,
>   };
> 
