Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7074B7DE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 03:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238231AbiBPClq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 21:41:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240774AbiBPClp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 21:41:45 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B08EDEC1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644979294; x=1676515294;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xQhWzKv1B3Ac0nI8tJX11olH1oATHHXzId9Lg72vWUU=;
  b=PBjPzJVzdntu8kmlO7HddhZ32NdNVb910ioyeJ0Y5fZ1uSI7lYNFPFfJ
   pQYhsjtwP3lB/CN0uvgeC6tRsshZiEe+A8lnwsIBF6UHXlEr48L7O3xlx
   UCqa6+MNzxKLKUBIdBNA6d61fJ+PRbo0mPmAJ/rT6SXaDiS2ES3mFhglv
   M=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Feb 2022 18:41:33 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 18:41:33 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Feb 2022 18:41:33 -0800
Received: from [10.111.168.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 15 Feb
 2022 18:41:30 -0800
Message-ID: <8119d2c5-88a8-5dc1-cce7-7835f7f32553@quicinc.com>
Date:   Tue, 15 Feb 2022 18:41:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] drm/msm/dpu: drop unused access macros
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220215145306.3470924-1-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220215145306.3470924-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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



On 2/15/2022 6:53 AM, Dmitry Baryshkov wrote:
> The access macros BLK_foo are not used by the code, drop them.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 16 ----------------
>   1 file changed, 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index cac0298aeb52..975ff3a4ae3d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -778,22 +778,6 @@ struct dpu_mdss_cfg {
>   	unsigned long mdss_irqs;
>   };
>   
> -/*
> - * Access Macros
> - */
> -#define BLK_MDP(s) ((s)->mdp)
> -#define BLK_CTL(s) ((s)->ctl)
> -#define BLK_VIG(s) ((s)->vig)
> -#define BLK_RGB(s) ((s)->rgb)
> -#define BLK_DMA(s) ((s)->dma)
> -#define BLK_CURSOR(s) ((s)->cursor)
> -#define BLK_MIXER(s) ((s)->mixer)
> -#define BLK_PINGPONG(s) ((s)->pingpong)
> -#define BLK_INTF(s) ((s)->intf)
> -#define BLK_AD(s) ((s)->ad)
> -#define BLK_DSPP(s) ((s)->dspp)
> -#define BLK_MERGE3d(s) ((s)->merge_3d)
> -
>   /**
>    * dpu_hw_catalog_init - dpu hardware catalog init API retrieves
>    * hardcoded target specific catalog information in config structure
