Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73AAE515969
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 02:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347277AbiD3Aou (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 20:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235155AbiD3Aou (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 20:44:50 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE8A60A87
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 17:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1651279290; x=1682815290;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LSTCoZqI9/QZBt+9Buh0Y9OOyer1bIfs9SMrjNp56KI=;
  b=IV4GIWVmBa6de5GzRfR0EfF4pXLmiLKqSjS/NS0i1dwDmjdFacDtJUmN
   EPG7bGfuYhO/89zaqPNXtm1TEEL+id9/Y9OWOU15USI8GcdOC4eDRuoJH
   W8VdQ1HIaHluuhSyXCWXvkM8AcO5UEsErEz7nFsYxjZXgYYw2B94EDXqr
   g=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Apr 2022 17:41:30 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2022 17:41:30 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 29 Apr 2022 17:41:30 -0700
Received: from [10.38.245.205] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 29 Apr
 2022 17:41:27 -0700
Message-ID: <ee50adbc-7b39-e586-53f6-3102b3b8c7ff@quicinc.com>
Date:   Fri, 29 Apr 2022 17:41:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: Clean up CRC debug logs
Content-Language: en-US
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <freedreno@lists.freedesktop.org>
CC:     <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_aravindh@quicinc.com>,
        <dmitry.baryshkov@linaro.org>
References: <20220430003917.132-1-quic_jesszhan@quicinc.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220430003917.132-1-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jessica

Please add reported by for dmitry and suggested-by for Rob.

Thanks

Abhinav

On 4/29/2022 5:39 PM, Jessica Zhang wrote:
> Currently, dpu_hw_lm_collect_misr returns EINVAL if CRC is disabled.
> This causes a lot of spam in the DRM debug logs as it's called for every
> vblank.
> 
> Instead of returning EINVAL when CRC is disabled in
> dpu_hw_lm_collect_misr, let's return ENODATA and add an extra ENODATA check
> before the debug log in dpu_crtc_get_crc.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # RB5  (qrb5165)
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 3 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 2 +-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 7763558ef566..16ba9f9b9a78 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -204,7 +204,8 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>   		rc = m->hw_lm->ops.collect_misr(m->hw_lm, &crcs[i]);
>   
>   		if (rc) {
> -			DRM_DEBUG_DRIVER("MISR read failed\n");
> +			if (rc != -ENODATA)
> +				DRM_DEBUG_DRIVER("MISR read failed\n");
>   			return rc;
>   		}
>   	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index 86363c0ec834..462f5082099e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -138,7 +138,7 @@ static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
>   	ctrl = DPU_REG_READ(c, LM_MISR_CTRL);
>   
>   	if (!(ctrl & LM_MISR_CTRL_ENABLE))
> -		return -EINVAL;
> +		return -ENODATA;
>   
>   	if (!(ctrl & LM_MISR_CTRL_STATUS))
>   		return -EINVAL;
