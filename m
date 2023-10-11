Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 714CF7C5514
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 15:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234871AbjJKNPj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 09:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232105AbjJKNPi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 09:15:38 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B9648F
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 06:15:36 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32799639a2aso6543359f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 06:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697030134; x=1697634934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BT1k6Pf/Q2yCNNkO/Sr9brdIQ26LcFmw0UjhN1wtKyM=;
        b=mRjdP4FkswD/QKVHC2cjJrWA/rQ851pWYelgWxsjZzpeI00vY7Wsf8l+Cyd01QmQsc
         gjUFG893S+E8pS4/nPAsSfgqglUkUdoAomb4WkBtMLlJ/W+2kZnDTePkQ730BqDo+JlJ
         9h5ZjvJcufXj+J/YvGiMcdJlit8n+cW7hQL7N5pTlLaU/GgI8d9DzvXp8jMTICMUztFM
         c2aYfY+gTlXuMqtL5XfHzNeM/nhykQWNlJHxy9VzdjObAaRz2joTGG/xuh7W+OuYptwz
         gKiPj7vWZUIyXevaRZ/X1Rc2EVCmm1v6lV/x7OSpuj9O9gs0esafPe78F+2MPTyVYas9
         jBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697030134; x=1697634934;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BT1k6Pf/Q2yCNNkO/Sr9brdIQ26LcFmw0UjhN1wtKyM=;
        b=Eh4+bBdOmp8u/cKjdMg9ZAQrB5ClQKlxYFaMB+kwglJ+zbTcHSKNXEx4n55je1Nmn0
         iqQ/dN9y8OTUjbW+tXD/v8cPXbJEi6JR8/T1wmx3neS8GeQxJ58fNEUS3GOVIo59C1zq
         EsMyNYeK/AAR6HJFoMFou3U9+nTo6MzcQDA0PaAN4qSuz5E1W4cznZTZWi1MiIudsaT1
         Kk7w8kUJ6vzQsw6qEeB3+SkKX+1Ue61BIAayTtIBpwFMNJmeOBZsnCLJz08/CQ+IE3Ed
         myjuURhIWFX/R1SgeUcrefg5fuVuAz4W2ZE8LgyeU2Yz++TJmM195iUZwdsXZ8YmGQBH
         quGg==
X-Gm-Message-State: AOJu0YxfJVbecxNN9e3deZAie/g1JTqAGFSl7dhxXfnkRMCiPS8yMK4o
        UZ236AFoIUdydIj/am+1XOCRTw==
X-Google-Smtp-Source: AGHT+IGe4qV78pHa8hNP1o15tk4LEM3P0n8kN0icoakeGltU/rXLSWpoHErPMEJCqXA/TCfv9c5l/Q==
X-Received: by 2002:a05:6000:12cd:b0:315:9676:c360 with SMTP id l13-20020a05600012cd00b003159676c360mr19186938wrx.25.1697030134399;
        Wed, 11 Oct 2023 06:15:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:19fd:97da:696:10f? ([2a01:e0a:982:cbb0:19fd:97da:696:10f])
        by smtp.gmail.com with ESMTPSA id q8-20020adff508000000b003200c918c81sm15578337wro.112.2023.10.11.06.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 06:15:33 -0700 (PDT)
Message-ID: <cfc98b1d-37fa-435e-bf54-0ce01c754adf@linaro.org>
Date:   Wed, 11 Oct 2023 15:15:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/5] drm/msm/dpu: add setup_clk_force_ctrl() op to sspp
 & wb
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-0-b219c945df53@linaro.org>
 <20231011-topic-sm8550-graphics-sspp-split-clk-v2-2-b219c945df53@linaro.org>
 <CAA8EJpps7g6LWFUS87j2oGwMW6He=MDSm_GaR_zOyQPHUvGReg@mail.gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <CAA8EJpps7g6LWFUS87j2oGwMW6He=MDSm_GaR_zOyQPHUvGReg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/10/2023 14:45, Dmitry Baryshkov wrote:
> On Wed, 11 Oct 2023 at 14:59, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> Starting from SM8550, the SSPP & WB clock controls are moved
>> the SSPP and WB register range, as it's called "VBIF_CLK_SPLIT"
>> downstream.
>>
>> Implement setup_clk_force_ctrl() only starting from major version 9
>> which corresponds to SM8550 MDSS.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> With two minor issues below fixed:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 21 ++++++++++++++++++---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 12 +++++++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c   | 20 +++++++++++++++++---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h   |  7 ++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  4 ++--
>>   5 files changed, 54 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> index f2192de93713..5fd213ed6491 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> @@ -69,6 +69,7 @@
>>   #define SSPP_EXCL_REC_XY_REC1              0x188
>>   #define SSPP_EXCL_REC_SIZE                 0x1B4
>>   #define SSPP_EXCL_REC_XY                   0x1B8
>> +#define SSPP_CLK_CTRL                      0x330
>>
>>   /* SSPP_SRC_OP_MODE & OP_MODE_REC1 */
>>   #define MDSS_MDP_OP_DEINTERLACE            BIT(22)
>> @@ -581,8 +582,18 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
>>          dpu_setup_cdp(&ctx->hw, cdp_cntl_offset, fmt, enable);
>>   }
>>
>> +static bool dpu_hw_sspp_setup_clk_force_ctrl(struct dpu_hw_sspp *ctx, bool enable)
>> +{
>> +       struct dpu_clk_ctrl_reg sspp_clk_ctrl = {
> 
> Nit: static const?

Yep will add

> 
>> +               .reg_off = SSPP_CLK_CTRL,
>> +               .bit_off = 0
>> +       };
>> +
>> +       return dpu_hw_clk_force_ctrl(&ctx->hw, &sspp_clk_ctrl, enable);
>> +}
>> +
>>   static void _setup_layer_ops(struct dpu_hw_sspp *c,
>> -               unsigned long features)
>> +               unsigned long features, const struct dpu_mdss_version *mdss_rev)
>>   {
>>          c->ops.setup_format = dpu_hw_sspp_setup_format;
>>          c->ops.setup_rects = dpu_hw_sspp_setup_rects;
>> @@ -612,6 +623,9 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
>>
>>          if (test_bit(DPU_SSPP_CDP, &features))
>>                  c->ops.setup_cdp = dpu_hw_sspp_setup_cdp;
>> +
>> +       if (mdss_rev->core_major_ver >= 9)
>> +               c->ops.setup_clk_force_ctrl = dpu_hw_sspp_setup_clk_force_ctrl;
>>   }
>>
>>   #ifdef CONFIG_DEBUG_FS
>> @@ -672,7 +686,8 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
>>   #endif
>>
>>   struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
>> -               void __iomem *addr, const struct msm_mdss_data *mdss_data)
>> +               void __iomem *addr, const struct msm_mdss_data *mdss_data,
>> +               const struct dpu_mdss_version *mdss_rev)
>>   {
>>          struct dpu_hw_sspp *hw_pipe;
>>
>> @@ -690,7 +705,7 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
>>          hw_pipe->ubwc = mdss_data;
>>          hw_pipe->idx = cfg->id;
>>          hw_pipe->cap = cfg;
>> -       _setup_layer_ops(hw_pipe, hw_pipe->cap->features);
>> +       _setup_layer_ops(hw_pipe, hw_pipe->cap->features, mdss_rev);
>>
>>          return hw_pipe;
>>   }
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> index cbf4f95ff0fd..f93969fddb22 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> @@ -271,6 +271,14 @@ struct dpu_hw_sspp_ops {
>>          void (*setup_qos_ctrl)(struct dpu_hw_sspp *ctx,
>>                                 bool danger_safe_en);
>>
>> +       /**
>> +        * setup_clk_force_ctrl - setup clock force control
>> +        * @ctx: Pointer to pipe context
>> +        * @enable: enable clock force if true
>> +        */
>> +       bool (*setup_clk_force_ctrl)(struct dpu_hw_sspp *ctx,
>> +                                    bool enable);
>> +
>>          /**
>>           * setup_histogram - setup histograms
>>           * @ctx: Pointer to pipe context
>> @@ -334,9 +342,11 @@ struct dpu_kms;
>>    * @cfg:  Pipe catalog entry for which driver object is required
>>    * @addr: Mapped register io address of MDP
>>    * @mdss_data: UBWC / MDSS configuration data
>> + * @mdss_rev: dpu core's major and minor versions
>>    */
>>   struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
>> -               void __iomem *addr, const struct msm_mdss_data *mdss_data);
>> +               void __iomem *addr, const struct msm_mdss_data *mdss_data,
>> +               const struct dpu_mdss_version *mdss_rev);
>>
>>   /**
>>    * dpu_hw_sspp_destroy(): Destroys SSPP driver context
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
>> index ebc416400382..374c2c64c9e4 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
>> @@ -43,6 +43,7 @@
>>   #define WB_MUX                                0x150
>>   #define WB_CROP_CTRL                          0x154
>>   #define WB_CROP_OFFSET                        0x158
>> +#define WB_CLK_CTRL                           0x178
>>   #define WB_CSC_BASE                           0x260
>>   #define WB_DST_ADDR_SW_STATUS                 0x2B0
>>   #define WB_CDP_CNTL                           0x2B4
>> @@ -175,8 +176,18 @@ static void dpu_hw_wb_bind_pingpong_blk(
>>          DPU_REG_WRITE(c, WB_MUX, mux_cfg);
>>   }
>>
>> +static bool dpu_hw_wb_setup_clk_force_ctrl(struct dpu_hw_wb *ctx, bool enable)
>> +{
>> +       struct dpu_clk_ctrl_reg wb_clk_ctrl = {
> 
> And here too, static const. We can even move them away from the function.

Since it's only used on the function, let's let it here in static const

Neil

> 
>> +               .reg_off = WB_CLK_CTRL,
>> +               .bit_off = 0
>> +       };
>> +
>> +       return dpu_hw_clk_force_ctrl(&ctx->hw, &wb_clk_ctrl, enable);
>> +}
>> +
>>   static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
>> -               unsigned long features)
>> +               unsigned long features, const struct dpu_mdss_version *mdss_rev)
>>   {
>>          ops->setup_outaddress = dpu_hw_wb_setup_outaddress;
>>          ops->setup_outformat = dpu_hw_wb_setup_format;
>> @@ -192,10 +203,13 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
>>
>>          if (test_bit(DPU_WB_INPUT_CTRL, &features))
>>                  ops->bind_pingpong_blk = dpu_hw_wb_bind_pingpong_blk;
>> +
>> +       if (mdss_rev->core_major_ver >= 9)
>> +               ops->setup_clk_force_ctrl = dpu_hw_wb_setup_clk_force_ctrl;
>>   }
>>
>>   struct dpu_hw_wb *dpu_hw_wb_init(const struct dpu_wb_cfg *cfg,
>> -               void __iomem *addr)
>> +               void __iomem *addr, const struct dpu_mdss_version *mdss_rev)
>>   {
>>          struct dpu_hw_wb *c;
>>
>> @@ -212,7 +226,7 @@ struct dpu_hw_wb *dpu_hw_wb_init(const struct dpu_wb_cfg *cfg,
>>          /* Assign ops */
>>          c->idx = cfg->id;
>>          c->caps = cfg;
>> -       _setup_wb_ops(&c->ops, c->caps->features);
>> +       _setup_wb_ops(&c->ops, c->caps->features, mdss_rev);
>>
>>          return c;
>>   }
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
>> index 2d7db2efa3d0..88792f450a92 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
>> @@ -29,6 +29,7 @@ struct dpu_hw_wb_cfg {
>>    *  @setup_outformat: setup output format of writeback block from writeback job
>>    *  @setup_qos_lut:   setup qos LUT for writeback block based on input
>>    *  @setup_cdp:       setup chroma down prefetch block for writeback block
>> + *  @setup_clk_force_ctrl: setup clock force control
>>    *  @bind_pingpong_blk: enable/disable the connection with ping-pong block
>>    */
>>   struct dpu_hw_wb_ops {
>> @@ -48,6 +49,9 @@ struct dpu_hw_wb_ops {
>>                            const struct dpu_format *fmt,
>>                            bool enable);
>>
>> +       bool (*setup_clk_force_ctrl)(struct dpu_hw_wb *ctx,
>> +                                    bool enable);
>> +
>>          void (*bind_pingpong_blk)(struct dpu_hw_wb *ctx,
>>                                    const enum dpu_pingpong pp);
>>   };
>> @@ -74,10 +78,11 @@ struct dpu_hw_wb {
>>    * dpu_hw_wb_init() - Initializes the writeback hw driver object.
>>    * @cfg:  wb_path catalog entry for which driver object is required
>>    * @addr: mapped register io address of MDP
>> + * @mdss_rev: dpu core's major and minor versions
>>    * Return: Error code or allocated dpu_hw_wb context
>>    */
>>   struct dpu_hw_wb *dpu_hw_wb_init(const struct dpu_wb_cfg *cfg,
>> -               void __iomem *addr);
>> +               void __iomem *addr, const struct dpu_mdss_version *mdss_rev);
>>
>>   /**
>>    * dpu_hw_wb_destroy(): Destroy writeback hw driver object.
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index f9215643c71a..f363bcfdfd70 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -175,7 +175,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>>                  struct dpu_hw_wb *hw;
>>                  const struct dpu_wb_cfg *wb = &cat->wb[i];
>>
>> -               hw = dpu_hw_wb_init(wb, mmio);
>> +               hw = dpu_hw_wb_init(wb, mmio, cat->mdss_ver);
>>                  if (IS_ERR(hw)) {
>>                          rc = PTR_ERR(hw);
>>                          DPU_ERROR("failed wb object creation: err %d\n", rc);
>> @@ -231,7 +231,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>>                  struct dpu_hw_sspp *hw;
>>                  const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
>>
>> -               hw = dpu_hw_sspp_init(sspp, mmio, mdss_data);
>> +               hw = dpu_hw_sspp_init(sspp, mmio, mdss_data, cat->mdss_ver);
>>                  if (IS_ERR(hw)) {
>>                          rc = PTR_ERR(hw);
>>                          DPU_ERROR("failed sspp object creation: err %d\n", rc);
>>
>> --
>> 2.34.1
>>
> 
> 

