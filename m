Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6D54E5980
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 21:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbiCWUFo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 16:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236041AbiCWUFm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 16:05:42 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE048564F
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 13:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1648065850; x=1679601850;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=m/gVPbIOUw/B6IAh4NLNKzlzl2sk9Z1Cv3s7AOPuzdg=;
  b=znsB1SoME4ejUrVrsPivORYz1A+PXaF2s2UWj8fKV3yCaAmR7rCy6+78
   sa6f6lDc1UVSAkKBsjaPfaNrcCJr0eMzDeUbJTWOCaKQMUfJm10gIV4hU
   G54HbbKYSCusxRzDjG92Yl6tGweg9owfZJD5zck6waI/nWdBYqd7gk2X1
   I=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Mar 2022 13:04:10 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2022 13:04:10 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 23 Mar 2022 13:04:09 -0700
Received: from [10.110.52.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 23 Mar
 2022 13:04:09 -0700
Message-ID: <8372aeac-3d54-44f5-8341-0f9b1b604871@quicinc.com>
Date:   Wed, 23 Mar 2022 13:04:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 11/22] drm/msm: Use drm_mode_init() for on-stack modes
Content-Language: en-US
To:     Ville Syrjala <ville.syrjala@linux.intel.com>,
        <dri-devel@lists.freedesktop.org>
CC:     <intel-gfx@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        "Sean Paul" <sean@poorly.run>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-12-ville.syrjala@linux.intel.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220218100403.7028-12-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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



On 2/18/2022 2:03 AM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Initialize on-stack modes with drm_mode_init() to guarantee
> no stack garbage in the list head, or that we aren't copying
> over another mode's list head.
> 
> Based on the following cocci script, with manual fixups:
> @decl@
> identifier M;
> expression E;
> @@
> - struct drm_display_mode M = E;
> + struct drm_display_mode M;
> 
> @@
> identifier decl.M;
> expression decl.E;
> statement S, S1;
> @@
> struct drm_display_mode M;
> ... when != S
> + drm_mode_init(&M, &E);
> +
> S1
> 
> @@
> expression decl.E;
> @@
> - &*E
> + E
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index ddd9d89cd456..e7813c6f7bd9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -248,12 +248,13 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>   	unsigned long lock_flags;
>   	struct dpu_hw_intf_cfg intf_cfg = { 0 };
>   
> +	drm_mode_init(&mode, &phys_enc->cached_mode);
> +
>   	if (!phys_enc->hw_ctl->ops.setup_intf_cfg) {
>   		DPU_ERROR("invalid encoder %d\n", phys_enc != NULL);
>   		return;
>   	}
>   
> -	mode = phys_enc->cached_mode;
>   	if (!phys_enc->hw_intf->ops.setup_timing_gen) {
>   		DPU_ERROR("timing engine setup is not supported\n");
>   		return;
> @@ -652,7 +653,9 @@ static int dpu_encoder_phys_vid_get_frame_count(
>   {
>   	struct intf_status s = {0};
>   	u32 fetch_start = 0;
> -	struct drm_display_mode mode = phys_enc->cached_mode;
> +	struct drm_display_mode mode;
> +
> +	drm_mode_init(&mode, &phys_enc->cached_mode);
>   
>   	if (!dpu_encoder_phys_vid_is_master(phys_enc))
>   		return -EINVAL;
