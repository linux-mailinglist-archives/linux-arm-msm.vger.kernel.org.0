Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 645E74B9528
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 01:56:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbiBQA47 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 19:56:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiBQA46 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 19:56:58 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF557656
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 16:56:44 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id o6so5937352ljp.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 16:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LA7U+9hlXGRM7PgTwedT+MmKNscZbMsNehQWGbZQgCo=;
        b=bosoVBt+D9fdiz0RWzH0HHxF/1hxJFwp3zHS3tezFG1YehH9IyEe7cnaKQ1ob2ZI3R
         MLwbdbE48ZuzKduG6hn2wSunG+ncfZkqIZfEDln0QucuV41vmp0KIypFpBRR3wyAtH1p
         HBT9QILUVw8+8Ruumi+v/KXjsWhBPM2vVNWXHnGTjJZCJr1lpbPJfrRJfBegeYX16atD
         1Utap4+r1ubws5AquKX4ClpF3LJBS1DtlBY8fY8WqazwtBiA/6kwDA7ReRQbpFATbinB
         5zVWiZ/TWpiJQS1CKIv82eRxe4koo2oXz/VN7X42hpfGZcYs+UPkx2op83/gFyAxv/eh
         4ktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LA7U+9hlXGRM7PgTwedT+MmKNscZbMsNehQWGbZQgCo=;
        b=Rbm98PeGdTU4nRTru1lbUUXV670U1n1NwrJgTqsnw2k+dbLy8kkuudN1xkh1zOWrgv
         0CmR1eOzLtsY+6WuFPL0Gsg2oIvuiv2yUtJuk86sbb0R57YIo4L114waoOfLSjOYg4x5
         jvP1HkNSCL4hL2bED/5RIiQrMstr/c0rjF6wohOQC+vubPMAF83iN5fjp+WKzwJ3L1XU
         ajhGMQQ/ajCYO2vwvV2I3WLOt1MitH2sGrlyyvrk3Op3wV/XF3Pu/0IDar0TblS3U2nG
         xpfqXfv4qtCAGcwJwOwlQzvC1wFl4VJzRTyrBjTVTTcTtpp5rlZJH5e+sRSnH8cuiRWV
         baiw==
X-Gm-Message-State: AOAM531pxbDIDhGI5dK8pqd9Nh/S+4jB8CoqyrhdmULPg2lGXbaHtXnG
        FqPwZT409+S99eXc/9d+se4VTw==
X-Google-Smtp-Source: ABdhPJxlaIA0WgMv5LDDbdfMGCq0lXWMTomaYfBi31K2aiaiHxEKbjEzvx2GwrlmRD92hLRhh4s+ig==
X-Received: by 2002:a2e:bf09:0:b0:241:8f3:f50 with SMTP id c9-20020a2ebf09000000b0024108f30f50mr484048ljr.155.1645059402792;
        Wed, 16 Feb 2022 16:56:42 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t4sm932607ljh.67.2022.02.16.16.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 16:56:42 -0800 (PST)
Message-ID: <6982788e-f363-1563-2404-8bf1f3fe00eb@linaro.org>
Date:   Thu, 17 Feb 2022 03:56:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 2/2] drm/msm/dp: rewrite dss_module_power to use bulk
 clock functions
Content-Language: en-GB
To:     Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220131210513.2177652-1-dmitry.baryshkov@linaro.org>
 <20220131210513.2177652-3-dmitry.baryshkov@linaro.org>
 <CAE-0n52Z3fX1Q=Hi0zFp6U7+gQd_A4t_KhtmrVQ9GBN2Oxj5ZQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n52Z3fX1Q=Hi0zFp6U7+gQd_A4t_KhtmrVQ9GBN2Oxj5ZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/02/2022 05:35, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-01-31 13:05:13)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
>> index 094b39bfed8c..f16072f33cdb 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
>> @@ -10,7 +10,6 @@
>>   #include <linux/phy/phy.h>
>>   #include <linux/phy/phy-dp.h>
>>
>> -#include "dp_clk_util.h"
>>   #include "msm_drv.h"
>>
>>   #define DP_LABEL "MDSS DP DISPLAY"
>> @@ -106,6 +105,22 @@ struct dp_regulator_cfg {
>>          struct dp_reg_entry regs[DP_DEV_REGULATOR_MAX];
>>   };
>>
>> +enum dss_clk_type {
>> +       DSS_CLK_AHB, /* no set rate. rate controlled through rpm */
>> +       DSS_CLK_PCLK,
>> +};
>> +
>> +struct dss_clk {
>> +       enum dss_clk_type type;
>> +       unsigned long rate;
>> +};
>> +
>> +struct dss_module_power {
>> +       unsigned int num_clk;
>> +       struct clk_bulk_data *clocks;
>> +       struct dss_clk *clk_config;
>> +};
>> +
>>   /**
>>    * struct dp_parser - DP parser's data exposed to clients
>>    *
>> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
>> index b48b45e92bfa..318e1f8629cb 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_power.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
>> @@ -105,59 +105,40 @@ static int dp_power_clk_init(struct dp_power_private *power)
>>          ctrl = &power->parser->mp[DP_CTRL_PM];
>>          stream = &power->parser->mp[DP_STREAM_PM];
>>
>> -       rc = msm_dss_get_clk(dev, core->clk_config, core->num_clk);
>> +       rc = devm_clk_bulk_get(dev, core->num_clk, core->clocks);
> 
> Could we go further and devm_clk_bulk_get_all() and then either have
> some new clk API that goes through the bulk list and finds the one named
> something and hands over a pointer to it, think "clk_get() on top of
> clk_bulk_data", or just get the clk again that you want to set a rate on
> and have two pointers but otherwise it's a don't care. Then we wouldn't
> need to do much at all here to store the rate settable clk and find it
> in a loop.

The clocks are stored in three different structures, because dp_power 
enables and disables them separately. See dp_power_clk_enable() and 
dp_ctrl.c. This devm_clk_bulk_get_all is out of question.

On the other hand, we can call set_rate on disabled clocks. Let me see 
if we can get this into manageble state.


> 
>>          if (rc) {
>>                  DRM_ERROR("failed to get %s clk. err=%d\n",
>>                          dp_parser_pm_name(DP_CORE_PM), rc);
>>                  return rc;
>>          }
>>
>> -       rc = msm_dss_get_clk(dev, ctrl->clk_config, ctrl->num_clk);
>> +       rc = devm_clk_bulk_get(dev, ctrl->num_clk, ctrl->clocks);
>>          if (rc) {
>>                  DRM_ERROR("failed to get %s clk. err=%d\n",
>>                          dp_parser_pm_name(DP_CTRL_PM), rc);
>> -               msm_dss_put_clk(core->clk_config, core->num_clk);
>>                  return -ENODEV;
>>          }
>>
>> -       rc = msm_dss_get_clk(dev, stream->clk_config, stream->num_clk);
>> +       rc = devm_clk_bulk_get(dev, stream->num_clk, stream->clocks);
>>          if (rc) {
>>                  DRM_ERROR("failed to get %s clk. err=%d\n",
>>                          dp_parser_pm_name(DP_CTRL_PM), rc);
>> -               msm_dss_put_clk(core->clk_config, core->num_clk);
>>                  return -ENODEV;
>>          }
>>
>>          return 0;
>>   }
>>
>> -static int dp_power_clk_deinit(struct dp_power_private *power)
>> -{
>> -       struct dss_module_power *core, *ctrl, *stream;
>> -
>> -       core = &power->parser->mp[DP_CORE_PM];
>> -       ctrl = &power->parser->mp[DP_CTRL_PM];
>> -       stream = &power->parser->mp[DP_STREAM_PM];
>> -
>> -       if (!core || !ctrl || !stream) {
>> -               DRM_ERROR("invalid power_data\n");
>> -               return -EINVAL;
>> -       }
>> -
>> -       msm_dss_put_clk(ctrl->clk_config, ctrl->num_clk);
>> -       msm_dss_put_clk(core->clk_config, core->num_clk);
>> -       msm_dss_put_clk(stream->clk_config, stream->num_clk);
>> -       return 0;
>> -}
>> -
>>   static int dp_power_clk_set_link_rate(struct dp_power_private *power,
>> -                       struct dss_clk *clk_arry, int num_clk, int enable)
>> +                       struct dss_module_power *mp, int enable)
>>   {
>> +       struct dss_clk *clk_arry = mp->clk_config;
>> +       int num_clk = mp->num_clk;
>>          u32 rate;
>>          int i, rc = 0;
>>
>>          for (i = 0; i < num_clk; i++) {
>> -               if (clk_arry[i].clk) {
>> +               if (mp->clocks[i].clk) {
>>                          if (clk_arry[i].type == DSS_CLK_PCLK) {
>>                                  if (enable)
>>                                          rate = clk_arry[i].rate;
>> @@ -168,9 +149,49 @@ static int dp_power_clk_set_link_rate(struct dp_power_private *power,
>>                                  if (rc)
>>                                          break;
>>                          }
>> +               } else {
>> +                       DRM_ERROR("%pS->%s: '%s' is not available\n",
>> +                               __builtin_return_address(0), __func__,
>> +                               mp->clocks[i].id);
>> +                       rc = -EPERM;
>> +                       break;
>> +               }
>> +       }
>> +       return rc;
>> +}
>> +
>> +static int dp_clk_set_rate(struct dss_module_power *mp)
>> +{
>> +       struct dss_clk *clk_arry = mp->clk_config;
>> +       int num_clk = mp->num_clk;
>> +       int i, rc = 0;
>>
>> +       for (i = 0; i < num_clk; i++) {
>> +               if (mp->clocks[i].clk) {
>> +                       if (clk_arry[i].type != DSS_CLK_AHB) {
> 
> This loops is gross.

Yep. Tried to keep the origin code here.

> 
>> +                               DRM_DEBUG("%pS->%s: '%s' rate %ld\n",
>> +                                       __builtin_return_address(0), __func__,
>> +                                       mp->clocks[i].id,
>> +                                       clk_arry[i].rate);
>> +                               rc = clk_set_rate(mp->clocks[i].clk,
>> +                                       clk_arry[i].rate);
>> +                               if (rc) {
>> +                                       DRM_ERROR("%pS->%s: %s failed. rc=%d\n",
>> +                                               __builtin_return_address(0),
>> +                                               __func__,
>> +                                               mp->clocks[i].id, rc);
>> +                                       break;
>> +                               }
>> +                       }
>> +               } else {
>> +                       DRM_ERROR("%pS->%s: '%s' is not available\n",
>> +                               __builtin_return_address(0), __func__,
>> +                               mp->clocks[i].id);
>> +                       rc = -EPERM;
>> +                       break;
>>                  }
>>          }
>> +
>>          return rc;
>>   }
>>


-- 
With best wishes
Dmitry
