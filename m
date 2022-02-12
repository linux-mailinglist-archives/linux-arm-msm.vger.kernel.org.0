Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1958C4B3236
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Feb 2022 01:59:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354491AbiBLA7X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 19:59:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240377AbiBLA7W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 19:59:22 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14AA338D;
        Fri, 11 Feb 2022 16:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644627560; x=1676163560;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lrdbTAyuNTktcI/9KK3WYqc1e2pwKG/qREA8mu+zOsU=;
  b=WRnf8m4brne9kdD1tCkgMZRGIMdVP2wuE29zpXFemalQMsLvAxUyQV7c
   AtJDo0cXBC3d+qVdsysIeA5dAkIoX37uilwYm1ZrABonbOg+gxavUB8Me
   z9MpnS800yhGqDQkXJRAnOBi4+XDcCFEu4zX6sYgVMOy7zoKG6DR52WRr
   I=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 11 Feb 2022 16:59:19 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 16:59:16 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 11 Feb 2022 16:59:15 -0800
Received: from [10.38.246.233] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Fri, 11 Feb
 2022 16:59:12 -0800
Message-ID: <f86504ba-835a-6e30-6c30-8bb89b1359c4@quicinc.com>
Date:   Fri, 11 Feb 2022 16:59:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] drm/msm: populate intf_audio_select() base on hardware
 capability
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
        <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>
CC:     <quic_aravindh@quicinc.com>, <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1644621822-25407-1-git-send-email-quic_khsieh@quicinc.com>
 <d77140f5-73b3-b9a4-aa4b-b240105eb5d4@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <d77140f5-73b3-b9a4-aa4b-b240105eb5d4@linaro.org>
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



On 2/11/2022 4:08 PM, Dmitry Baryshkov wrote:
> On 12/02/2022 02:23, Kuogee Hsieh wrote:
>> intf_audio_select() callback function use to configure
>> HDMI_DP_CORE_SELECT to decide audio output routes to HDMI or DP
>> interface. HDMI is obsoleted at newer chipset. To keep supporting
>> legacy hdmi application, intf_audio_select call back function have
>> to be populated base on hardware chip capability where legacy
>> chipsets have has_audio_select flag set to true.
> 
> So, after thinking more about the patch, I have a bunch of questions:
> 
> You are enabling this callback only for sdm845 and sm8150.
> 
> Does this register exist on other (newer) platforms (but just defaults 
> to DP)?

The register itself exists but there is no logic associated with it. Its 
a no-op.

> 
> Neither sdm845 nor sm8150 support INTF_HDMI. What's the purpose of the 
> register on these platforms?

Yes we also had a similar thought earlier that this register has meaning 
only on chipsets which have HDMI and DP but our hardware team suggested
sm8250 and its derivatives should be the cut-off point to stop using 
this register. So we are just following that.

> 
> Does that mean that we should program the register for HDMI (e.g. on 8998)?
> 
Yes, we should program this for HDMI 8998 ( although the default value 
of the register is 0 for HDMI ).

> And, as you are touching this piece of code, how do we control audio 
> routing on newer platforms which have several hardware DP interfaces?
> 
Thats unrelated to this register because on newer chipsets which have 
two DPs there is no HDMI and hence this register remains a no-op.

But coming to the overall question on multi-DP audio.

This is not a new question. I had first asked about this to Bjorn for 
sc8180x. The current hdmi-codec interface which is used for single DP 
audio will have to be extended to support this to support which stream
to pass the audio on. This is an open item which was left to be done 
later on because the only chipset which has multi-DP in upstream is 
sc8180x. We dont have that hardware with us for development. When we 
start working on that, we will have to implement what I just mentioned.

Thanks

Abhinav

> 
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c     | 9 ++++++---
>>   3 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 272b14b..23680e7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -201,6 +201,7 @@ static const struct dpu_caps sdm845_dpu_caps = {
>>       .has_dim_layer = true,
>>       .has_idle_pc = true,
>>       .has_3d_merge = true,
>> +    .has_audio_select = true,
>>       .max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>       .max_hdeci_exp = MAX_HORZ_DECIMATION,
>> @@ -229,6 +230,7 @@ static const struct dpu_caps sm8150_dpu_caps = {
>>       .has_dim_layer = true,
>>       .has_idle_pc = true,
>>       .has_3d_merge = true,
>> +    .has_audio_select = true,
>>       .max_linewidth = 4096,
>>       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>       .max_hdeci_exp = MAX_HORZ_DECIMATION,
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index e5a96d6..b33f91b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -357,6 +357,7 @@ struct dpu_caps {
>>       bool has_dim_layer;
>>       bool has_idle_pc;
>>       bool has_3d_merge;
>> +    bool has_audio_select;
>>       /* SSPP limits */
>>       u32 max_linewidth;
>>       u32 pixel_ram_size;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>> index 282e3c6..e608f4d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>> @@ -261,14 +261,17 @@ static void dpu_hw_intf_audio_select(struct 
>> dpu_hw_mdp *mdp)
>>   }
>>   static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
>> -        unsigned long cap)
>> +        unsigned long cap,
>> +        const struct dpu_mdss_cfg *m)
>>   {
>>       ops->setup_split_pipe = dpu_hw_setup_split_pipe;
>>       ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
>>       ops->get_danger_status = dpu_hw_get_danger_status;
>>       ops->setup_vsync_source = dpu_hw_setup_vsync_source;
>>       ops->get_safe_status = dpu_hw_get_safe_status;
>> -    ops->intf_audio_select = dpu_hw_intf_audio_select;
>> +
>> +    if (m->caps->has_audio_select)
>> +        ops->intf_audio_select = dpu_hw_intf_audio_select;
>>   }
>>   static const struct dpu_mdp_cfg *_top_offset(enum dpu_mdp mdp,
>> @@ -320,7 +323,7 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp 
>> idx,
>>        */
>>       mdp->idx = idx;
>>       mdp->caps = cfg;
>> -    _setup_mdp_ops(&mdp->ops, mdp->caps->features);
>> +    _setup_mdp_ops(&mdp->ops, mdp->caps->features, m);
>>       return mdp;
>>   }
> 
> 
