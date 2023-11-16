Return-Path: <linux-arm-msm+bounces-824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA25E7EE6C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 19:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EA8F281112
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 18:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1538C48CF1;
	Thu, 16 Nov 2023 18:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="FEpgr13I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54BD81AD
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 10:31:30 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-672096e0e89so5812486d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 10:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1700159489; x=1700764289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rU0Onv3SuE+K6mh1ouNAPCMkOiMWIv4TJL2AZdCOGUw=;
        b=FEpgr13I4lf5olLZ6fPewqkKKewApFWUXmidHRFSApK5SQBzO58hT43u4K/MfGVF/F
         hgDNYGnNU6sYFdzfF8fND16AOdgGhb2sxxAZGrwS9dBvcya8iEymlYDosnCUApLHwLa7
         qXKnNRzD1uG3nEQHNKShh9EwU9Fxk1WLfcq7vcdWEWpuToYq2s0AvGO+vJ9SViP0reJl
         u9Tz43US7oBw51RQJKw4iwsq2sIP7VugNbHbkhHketfBmAUxIr3MwuCggjA+lBoukrcH
         sdv9KzuTozyeiIv5KLVoLL2RRLEvP61g85HxKymu0ITGR51teqRjytPcJ1GtgOx4+ddr
         EF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700159489; x=1700764289;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rU0Onv3SuE+K6mh1ouNAPCMkOiMWIv4TJL2AZdCOGUw=;
        b=vlJrvavzJ6RRtuDcaGHu3ItVkpydhPhq1KW/IYzKC3D1+yWdgBOpmqZg/A/v6dQZhu
         BrZlzxgYt96KyoJBH6rsY5bFwcyS8Q+ExVGY98b8nFXJwJFcbd89NjEFlcawuBvvpRrM
         vu8X0J8vTdmMgbUnrTBm2SwyO7y0ImpstLkI6BMrl5ze0fqC07HOQj7XJXybeThIuUQA
         Ni/nyGwkBv0h1OH/jUAsOy3d4VaLDJ/S6YiLy4OtvTesPDlyOd8LdongxsZ9wFtJ7Fym
         z2t0L8RyWjLNivrgR/AEaqU94if6VBQZYpBndaV251ZZIMGHKr//UGnCamtTx+LHTqO8
         Cw1A==
X-Gm-Message-State: AOJu0Yxs2hk5rGO4lZzBZCQfwRZvbVS1Y1s9fV+ywM+xyC1uvTwZRvkt
	UXhR83xJw1uTW+kilPZSEvrQJVTM4xOiywz43C8=
X-Google-Smtp-Source: AGHT+IG1dtT861g2sp4EuKubGCs2MqPMYXbAKW0AsBqZnVTbe7Dwjir9T3SG6Z6PX3ZoTrHqa61+GQ==
X-Received: by 2002:a05:6214:1255:b0:66d:42d9:fc83 with SMTP id r21-20020a056214125500b0066d42d9fc83mr13813746qvv.10.1700159489365;
        Thu, 16 Nov 2023 10:31:29 -0800 (PST)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id k13-20020a0cebcd000000b00670c15033aesm1528608qvq.144.2023.11.16.10.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 10:31:29 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v2 1/6] drm/msm/dpu: fix video mode DSC for DSI
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Arnaud Vrac <rawoul@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20231114225857.19702-1-jonathan@marek.ca>
 <20231114225857.19702-2-jonathan@marek.ca>
 <CAA8EJpp0OGkgf0P6LcwE-H6BVN9kbtF_eRCsef+7NgDFmJOZfA@mail.gmail.com>
Message-ID: <d93a7c6f-a798-c9ec-6c10-08e4e5a70f4d@marek.ca>
Date: Thu, 16 Nov 2023 13:30:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAA8EJpp0OGkgf0P6LcwE-H6BVN9kbtF_eRCsef+7NgDFmJOZfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/15/23 3:53 AM, Dmitry Baryshkov wrote:
> On Wed, 15 Nov 2023 at 01:00, Jonathan Marek <jonathan@marek.ca> wrote:
>>
>> Add necessary DPU changes for DSC to work with DSI video mode.
>>
>> Note this changes the logic to enable HCTL to match downstream, it will
>> now be enabled for the no-DSC no-widebus case.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         |  2 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h    |  2 +-
>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    | 11 +++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c         | 13 ++++++++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h         |  1 +
>>   5 files changed, 26 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 1cf7ff6caff4..d745c8678b9d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -2477,7 +2477,7 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
>>          return INTF_MODE_NONE;
>>   }
>>
>> -unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
>> +unsigned int dpu_encoder_helper_get_dsc(const struct dpu_encoder_phys *phys_enc)
> 
> Why?
> 

drm_mode_to_intf_timing_params has "phys_enc" pointer declared as const, 
so one of them needs to change to call dpu_encoder_helper_get_dsc

>>   {
>>          struct drm_encoder *encoder = phys_enc->parent;
>>          struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> index 6f04c3d56e77..7e27a7da0887 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> @@ -332,7 +332,7 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>>    *   used for this encoder.
>>    * @phys_enc: Pointer to physical encoder structure
>>    */
>> -unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
>> +unsigned int dpu_encoder_helper_get_dsc(const struct dpu_encoder_phys *phys_enc);
>>
>>   /**
>>    * dpu_encoder_helper_split_config - split display configuration helper function
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> index a01fda711883..df10800a9615 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> @@ -100,6 +100,8 @@ static void drm_mode_to_intf_timing_params(
>>          }
>>
>>          timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
>> +       if (dpu_encoder_helper_get_dsc(phys_enc))
>> +               timing->compression_en = true;
>>
>>          /*
>>           * for DP, divide the horizonal parameters by 2 when
>> @@ -112,6 +114,15 @@ static void drm_mode_to_intf_timing_params(
>>                  timing->h_front_porch = timing->h_front_porch >> 1;
>>                  timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
>>          }
>> +
>> +       /*
>> +        * for DSI, if compression is enabled, then divide the horizonal active
>> +        * timing parameters by compression ratio.
>> +        */
>> +       if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
>> +               timing->width = timing->width / 3; /* XXX: don't assume 3:1 compression ratio */
> 
> Is this /3 from bpp / compressed_bpp?
> 

It is the compression ratio of DSC for 8bpc (24bpp) compressed to 8bpp. 
DSI driver doesn't support any other cases so this assumption should be 
OK for now (the other common ratio is 3.75 for 10bpc compressed to 8bpp 
- from downstream driver it appears this would mean a division by 3.75 
here).

>> +               timing->xres = timing->width;
>> +       }
>>   }
>>
>>   static u32 get_horizontal_total(const struct dpu_hw_intf_timing_params *timing)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> index e8b8908d3e12..d6fe45a6da2d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> @@ -166,10 +166,21 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>           * video timing. It is recommended to enable it for all cases, except
>>           * if compression is enabled in 1 pixel per clock mode
>>           */
>> +       if (!p->compression_en || p->wide_bus_en)
>> +               intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
>> +
>>          if (p->wide_bus_en)
>> -               intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
>> +               intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
>>
>>          data_width = p->width;
>> +       if (p->wide_bus_en && !dp_intf)
>> +               data_width = p->width >> 1;
>> +
>> +       if (p->compression_en)
>> +               intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
>> +
>> +       if (p->compression_en && dp_intf)
>> +               DPU_ERROR("missing adjustments for DSC+DP\n");
>>
>>          hsync_data_start_x = hsync_start_x;
>>          hsync_data_end_x =  hsync_start_x + data_width - 1;
> 
> This should go into a separate commit with the proper justification.
> 

All of it? setting the INTF_CFG2_DCE_DATA_COMPRESS flag at least doesn't 
make sense to make a separate patch. And DSI widebus is only used with 
DSC (and always used when available), so IMO also in the scope of this 
commit.

>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> index c539025c418b..15a5fdadd0a0 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> @@ -33,6 +33,7 @@ struct dpu_hw_intf_timing_params {
>>          u32 hsync_skew;
>>
>>          bool wide_bus_en;
>> +       bool compression_en;
>>   };
>>
>>   struct dpu_hw_intf_prog_fetch {
>> --
>> 2.26.1
>>
> 
> 

