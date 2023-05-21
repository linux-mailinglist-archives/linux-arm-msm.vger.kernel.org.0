Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA9070AFD2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 21:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbjEUTWG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 15:22:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbjEUTWF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 15:22:05 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12C6CD7
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:22:03 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4effb818c37so5822482e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684696921; x=1687288921;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AGlsdK7VFpaZXyPvp1u9tGzuSMKN89bSjg/sIO77haQ=;
        b=jS4ZyZJsVHVdcfv4FnluAvdePCuqNFlsHf+pntdLd/HYnuvpnlEwxB5alHl6BA8guD
         HJN2GbQS8We9zRTbYLrxe0KT/jTzYJXIZI4VBHSQiLgAaqXGlOSg/sxMHxi5bsHpmMsm
         ImfNfc4xwb+ZzUFhPICNqj08Xl+z0by9X3oU2ckF1RCnoTDpoS/4aJKqhy0qvb+2TT/v
         3aQeRWWpZqfC82qja90719DXp/B/OBA9gqqJZptE5We+7kB68DJE0qj87V3I/aFjwYsz
         vpBASlAXNNjVf/Cz5FBhbbP5qh0o4Ee+5uLCvpLx3gMCDI0HgJcTdf9v2Zyo1XUJTxNE
         db7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684696921; x=1687288921;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AGlsdK7VFpaZXyPvp1u9tGzuSMKN89bSjg/sIO77haQ=;
        b=laOaWrL1pLqkJ+/tBr5p48CN8dxw2o2/2e7uNReXTu87V9nxXc/Why5Vl9c/5BPvPo
         Fmw58IYp2wsrBipAa+HMJp3cC3nDW48/KusXb0igB4eqYmwg5enL55jAbePwtPt/Vbfq
         PnAQVk125kmPCb3X+aMckkoMUIE1lwRoY5ZNv+i1ReGUH74v5GLHF47cxxOevHvdCUQ8
         Mfmkxmtfzy6ruF2pPM6FJCoxzdl+vnnmNEyvol/FnVdbYut4Rm61mllA8QHFK4B8fcph
         anGUwqQfcnWdtWCzphvS8FEL8+mtOHl+uqiGBZ0ozRNaypQxDsLzCrH+Xo5mHqnVUv62
         0FhA==
X-Gm-Message-State: AC+VfDxE5p3h6ZryGiWWI6SMsYZhX59FphmbUH/LN4m79+4tMEY9qqFX
        KicSS3IcueIeiQiQepkxTaRWWg==
X-Google-Smtp-Source: ACHHUZ5QQ6mAzxH0WRMkd/oEWC3lbe5u+hVyriQMqD8HE1lu9ScWmQVwq+QjdCOPltvTvDG0NSYZaw==
X-Received: by 2002:a05:6512:4d9:b0:4f3:b215:ef7c with SMTP id w25-20020a05651204d900b004f3b215ef7cmr1980760lfq.23.1684696921286;
        Sun, 21 May 2023 12:22:01 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id m6-20020a056512014600b004f38ce1cee4sm699866lfo.261.2023.05.21.12.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 May 2023 12:22:00 -0700 (PDT)
Message-ID: <a69486df-02c9-2026-e225-d2402368741b@linaro.org>
Date:   Sun, 21 May 2023 22:22:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] drm/msm/dpu: switch dpu_encoder to use
 drm_debugfs_add_file()
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230521190442.8293-1-dmitry.baryshkov@linaro.org>
 <20230521190442.8293-3-dmitry.baryshkov@linaro.org>
 <4qsldyocdlx6ddoitu76atec5ph2iijtznpbnefdrao5nuiant@v2vcnnkn2fkb>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <4qsldyocdlx6ddoitu76atec5ph2iijtznpbnefdrao5nuiant@v2vcnnkn2fkb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/05/2023 22:21, Marijn Suijten wrote:
> On 2023-05-21 22:04:42, Dmitry Baryshkov wrote:
>> Use drm_debugfs_add_file() for encoder's status file. This changes the
>> name of the status file from encoder%d/status to just encoder%d.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 40 ++++++---------------
>>   1 file changed, 11 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index af34932729db..0ac68f44ec74 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -14,6 +14,7 @@
>>   
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_crtc.h>
>> +#include <drm/drm_debugfs.h>
>>   #include <drm/drm_file.h>
>>   #include <drm/drm_probe_helper.h>
>>   
>> @@ -142,7 +143,6 @@ enum dpu_enc_rc_states {
>>    * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
>>    *				all CTL paths
>>    * @crtc_kickoff_cb_data:	Opaque user data given to crtc_kickoff_cb
>> - * @debugfs_root:		Debug file system root file node
>>    * @enc_lock:			Lock around physical encoder
>>    *				create/destroy/enable/disable
>>    * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
>> @@ -186,7 +186,6 @@ struct dpu_encoder_virt {
>>   	struct drm_crtc *crtc;
>>   	struct drm_connector *connector;
>>   
>> -	struct dentry *debugfs_root;
>>   	struct mutex enc_lock;
>>   	DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
>>   	void (*crtc_frame_event_cb)(void *, u32 event);
>> @@ -2091,7 +2090,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>>   #ifdef CONFIG_DEBUG_FS
>>   static int _dpu_encoder_status_show(struct seq_file *s, void *data)
>>   {
>> -	struct dpu_encoder_virt *dpu_enc = s->private;
>> +	struct drm_debugfs_entry *entry = s->private;
>> +	struct dpu_encoder_virt *dpu_enc = entry->file.data;
>>   	int i;
>>   
>>   	mutex_lock(&dpu_enc->enc_lock);
>> @@ -2110,48 +2110,31 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
>>   	return 0;
>>   }
>>   
>> -DEFINE_SHOW_ATTRIBUTE(_dpu_encoder_status);
>> -
>> -static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
>> +static void _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
>>   {
>>   	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>> -
>> -	char name[12];
>> +	char *name;
>>   
>>   	if (!drm_enc->dev) {
>>   		DPU_ERROR("invalid encoder or kms\n");
>> -		return -EINVAL;
>> +		return;
>>   	}
>>   
>> -	snprintf(name, sizeof(name), "encoder%u", drm_enc->base.id);
>> +	name = devm_kasprintf(drm_enc->dev->dev, GFP_KERNEL, "encoder%u", drm_enc->base.id);
>>   
>> -	/* create overall sub-directory for the encoder */
>> -	dpu_enc->debugfs_root = debugfs_create_dir(name,
>> -			drm_enc->dev->primary->debugfs_root);
>> -
>> -	/* don't error check these */
>> -	debugfs_create_file("status", 0600,
>> -		dpu_enc->debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
> 
> I still have a looping callback to late_register() here, what series
> does this depend on?

Argh, I have sent 2 patches instead of sending 3.

> 
> - Marijn
> 
>> -
>> -	return 0;
>> +	drm_debugfs_add_file(drm_enc->dev, name, _dpu_encoder_status_show, dpu_enc);
>>   }
>>   #else
>> -static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
>> +static void _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
>>   {
>> -	return 0;
>>   }
>>   #endif
>>   
>>   static int dpu_encoder_late_register(struct drm_encoder *encoder)
>>   {
>> -	return _dpu_encoder_init_debugfs(encoder);
>> -}
>> -
>> -static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
>> -{
>> -	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
>> +	_dpu_encoder_init_debugfs(encoder);
>>   
>> -	debugfs_remove_recursive(dpu_enc->debugfs_root);
>> +	return 0;
>>   }
>>   
>>   static int dpu_encoder_virt_add_phys_encs(
>> @@ -2380,7 +2363,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
>>   static const struct drm_encoder_funcs dpu_encoder_funcs = {
>>   		.destroy = dpu_encoder_destroy,
>>   		.late_register = dpu_encoder_late_register,
>> -		.early_unregister = dpu_encoder_early_unregister,
>>   };
>>   
>>   int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

