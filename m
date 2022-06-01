Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5D453AC14
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jun 2022 19:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352260AbiFARiQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jun 2022 13:38:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236698AbiFARiO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jun 2022 13:38:14 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEA218B09A
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jun 2022 10:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654105093; x=1685641093;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=R9phcJhHYHil5pwv4M/T8DcP7iWtWNJr4ym7oTY12qs=;
  b=HciWUn6DE+dHlWt06IV0P+H9579C/1trXCUyHg41JPKAWCKNrxKEi1zW
   OXdpIYgRqforNaEOCf6F3ikm2DrkKG+mUTDRuG6L+OR8ewSpsX4E2ijlR
   W2wjA1dAcO3dSHmVQlUu05o0YIsjhzIdeKfGa/l73wgkkO1NcQ7s4ruj9
   0=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Jun 2022 10:38:13 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 10:38:12 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 1 Jun 2022 10:37:41 -0700
Received: from [10.38.242.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 1 Jun 2022
 10:37:39 -0700
Message-ID: <80c1da0f-0006-6602-ec86-ebdf71c3037a@quicinc.com>
Date:   Wed, 1 Jun 2022 10:37:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH] drm/msm: less magic numbers in
 msm_mdss_enable
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        "Sean Paul" <sean@poorly.run>
References: <20220531121825.1126204-1-dmitry.baryshkov@linaro.org>
 <d7084452-ea90-3a8b-d39a-b09d9f45f839@quicinc.com>
 <CAA8EJprW7xnYJaeqh4vozSTx04DcQ20MMRrzLaEJPJTC3dV30w@mail.gmail.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprW7xnYJaeqh4vozSTx04DcQ20MMRrzLaEJPJTC3dV30w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/1/2022 2:46 AM, Dmitry Baryshkov wrote:
> On Wed, 1 Jun 2022 at 01:01, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>> On 5/31/2022 5:18 AM, Dmitry Baryshkov wrote:
>>> Replace magic register writes in msm_mdss_enable() with version that
>>> contains less magic and more variable names that can be traced back to
>>> the dpu_hw_catalog or the downstream dtsi files.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/msm_mdss.c | 79 ++++++++++++++++++++++++++++++----
>>>    1 file changed, 71 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
>>> index 0454a571adf7..2a48263cd1b5 100644
>>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>>> @@ -21,6 +21,7 @@
>>>    #define HW_REV                              0x0
>>>    #define HW_INTR_STATUS                      0x0010
>>>
>>> +#define UBWC_DEC_HW_VERSION          0x58
>>>    #define UBWC_STATIC                 0x144
>>>    #define UBWC_CTRL_2                 0x150
>>>    #define UBWC_PREDICTION_MODE                0x154
>>> @@ -132,9 +133,63 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
>>>        return 0;
>>>    }
>>>
>>> +#define UBWC_1_0 0x10000000
>>> +#define UBWC_2_0 0x20000000
>>> +#define UBWC_3_0 0x30000000
>>> +#define UBWC_4_0 0x40000000
>>> +
>>> +static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss,
>>> +                                    u32 ubwc_static)
>>> +{
>>> +     writel_relaxed(ubwc_static, msm_mdss->mmio + UBWC_STATIC);
>>> +}
>>> +
>>> +static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss,
>>> +                                    unsigned int ubwc_version,
>>> +                                    u32 ubwc_swizzle,
>>> +                                    u32 highest_bank_bit,
>>> +                                    u32 macrotile_mode)
>>> +{
>>> +     u32 value = (ubwc_swizzle & 0x1) |
>>> +                 (highest_bank_bit & 0x3) << 4 |
>>> +                 (macrotile_mode & 0x1) << 12;
>>> +
>>> +     if (ubwc_version == UBWC_3_0)
>>> +             value |= BIT(10);
>>> +
>>> +     if (ubwc_version == UBWC_1_0)
>>> +             value |= BIT(8);
>>> +
>>> +     writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
>>> +}
>>> +
>>> +static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss,
>>> +                                    unsigned int ubwc_version,
>>> +                                    u32 ubwc_swizzle,
>>> +                                    u32 ubwc_static,
>>> +                                    u32 highest_bank_bit,
>>> +                                    u32 macrotile_mode)
>>> +{
>>> +     u32 value = (ubwc_swizzle & 0x7) |
>>> +                 (ubwc_static & 0x1) << 3 |
>>> +                 (highest_bank_bit & 0x7) << 4 |
>>> +                 (macrotile_mode & 0x1) << 12;
>>> +
>>> +     writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
>>> +
>>> +     if (ubwc_version == UBWC_3_0) {
>>> +             writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
>>> +             writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
>>> +     } else {
>>> +             writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
>>> +             writel_relaxed(1, msm_mdss->mmio + UBWC_PREDICTION_MODE);
>>> +     }
>>> +}
>>> +
>>
>> Is it possible to unify the above functions by having the internal
>> ubwc_version checks?
> 
> Note, it's not the ubwc_version, it is the ubwc_dec_hw_version. And
> also different functions take different sets of arguments.
> 
>> It seems like msm_mdss_setup_ubwc_dec_xxx can keep growing.
>>
>> I have not looked into each bit programming but from the top level so
>> feel free to correct if wrong but it seems both do write UBWC_STATIC
>> (different values based on different UBWC versions) and write some extra
>> registers based on version
> 
> This is what both the current code and the downstream do. See
> https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/zeus-s-oss/techpack/display-drivers/msm/sde/sde_hw_top.c#L312
> 

Thanks for pointing to the downstream method for this,

This is exactly what i was also suggesting to do when I mentioned 
unifying the above functions.

So instead of having a separate function for each version why not handle 
all the versions in the same function like what the link you have shown 
does.

>>
>>>    static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>>>    {
>>>        int ret;
>>> +     u32 hw_rev;
>>>
>>>        ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
>>>        if (ret) {
>>> @@ -149,26 +204,34 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>>>        if (msm_mdss->is_mdp5)
>>>                return 0;
>>>
>>> +     hw_rev = readl_relaxed(msm_mdss->mmio + HW_REV);
>>> +     dev_info(msm_mdss->dev, "HW_REV: 0x%x\n", hw_rev);
>>> +     dev_info(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
>>> +             readl_relaxed(msm_mdss->mmio + UBWC_DEC_HW_VERSION));
>>
>> we are already printing the HW version here
>>
>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c#L1096
>>
>> Do you want to remove that print then? May be. Let me take a look.
> 
> [skipped]
> 
