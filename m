Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8338A5538E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 19:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353772AbiFUR3Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 13:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353724AbiFUR3N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 13:29:13 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E59BA1707E;
        Tue, 21 Jun 2022 10:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1655832553; x=1687368553;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=sPVAYqaPJFR/Z0gzjofpTzSyW3DOh5RTZIFv+zTXtgI=;
  b=fQ7iswdvBUt3NeHNbX4OTRmBJ2PyJSnJO6QPVR2ahAvJQTWjOd6ViPSt
   TmQsdRanScFq2sA0sNPsNuVNL4H0RMeep2rMBl/e/Yw1F1pIPIMAAGZrT
   amopytQghE38GtYbKP3iECe3v3c4EItdx3tQSF4ziwngQ2MN5C4nteAwD
   A=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 21 Jun 2022 10:29:13 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 10:29:12 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 21 Jun 2022 10:29:11 -0700
Received: from [10.38.247.150] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 21 Jun
 2022 10:29:09 -0700
Message-ID: <a9d3568d-bf0d-ee01-7e8a-b35466c963b4@quicinc.com>
Date:   Tue, 21 Jun 2022 10:29:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm: Use div64_ul instead of do_div
Content-Language: en-US
To:     Wan Jiabing <wanjiabing@vivo.com>, Rob Clark <robdclark@gmail.com>,
        "Sean Paul" <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20220426132126.686447-1-wanjiabing@vivo.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220426132126.686447-1-wanjiabing@vivo.com>
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



On 4/26/2022 6:21 AM, Wan Jiabing wrote:
> Fix following coccicheck warning:
> drivers/gpu/drm/msm/msm_gpu_devfreq.c:72:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.
> 
> Use div64_ul instead of do_div to avoid a possible truncation.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index d2539ca78c29..c2ea978c8921 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -69,7 +69,7 @@ static void get_raw_dev_status(struct msm_gpu *gpu,
>   	df->time = time;
>   
>   	busy_time *= USEC_PER_SEC;
> -	do_div(busy_time, sample_rate);
> +	busy_time = div64_ul(busy_time, sample_rate);
>   	if (WARN_ON(busy_time > ~0LU))
>   		busy_time = ~0LU;
>   
