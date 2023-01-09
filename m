Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C092B663138
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 21:17:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbjAIUR3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 15:17:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237448AbjAIURV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 15:17:21 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29B2AEB0
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 12:17:19 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id bt23so14785605lfb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 12:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zsln0dRiZVimqWw/epfps+VbT8vmC86GmSAWJjVg5rM=;
        b=BVDLoIXqHRWiZN139RWtb6yB/EC2tHe50zVsDHylB/x47aoqEsebPd5PhoRiMVwV/L
         CjQMSa56vxfDhy43+/Mt+z6hT5dpU6omOoDWK0exUfUtUUSAFzxJ62HsGDe1ckzMNveP
         Z23+uM2bENqCQi4e6PnLJvpxWoCL7edgfci7uHjDDM3acnfk6owAD7G7I7F07iOMmItV
         PoYRs8t2E8k8L0D+6DtePf4ErjLSpLr7DfaqqsmJyQxeE31gAfcSBanAE8Ok8MlqtlDn
         Ax4CB7Fp9Nf1TX87LjOVNL00/yvaTmCKuv42H+IXGRIfd7DO9Pok0kqJMobneIvWEoDj
         N3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zsln0dRiZVimqWw/epfps+VbT8vmC86GmSAWJjVg5rM=;
        b=dm1h92uVHzGET99TovGnjXtawEEO0//42aRn9BRb/M6Ge/DmadrXJdesWtG/rvCjpQ
         F05IGUYa77wRRlfAC44woGx0ylAWANKRb2b6xWn1+lNTpdvLnupYuviGY8tL8ABwb1gA
         o9AwQbeEF9dazl9WCchNrhe2DfZHDp93Bu6vt2/YmpgwzDjgWHtasQlRckzGCngzb/N1
         fUmKPG9kUgObWjDbYE9eNeJ6UVtaYjBSo6QcQZe+wedgSToGAaS0yXJkRoLQq2kBaVy8
         HLWgX895AffE7XfC4JBKYk9crPFZ3SK2v5/pAwTwphn58ws8CVWCAn9pR96GO7AHsy8D
         GY3w==
X-Gm-Message-State: AFqh2kq3Bvv3BhHd7D8Zi687KTGl/TYeTohqffZZmq/jkW0fXXsPvi+S
        eWM2mQSH7o4UtofWuB7q+tr4Wg==
X-Google-Smtp-Source: AMrXdXsqTdM6J8HyUnKwHYzTAnW9efhthH7vZTJLBCtnPyAaNG/D7T0DHJxRI7iBddsLtOXI6XJj6A==
X-Received: by 2002:a05:6512:2286:b0:4b5:9891:d6ff with SMTP id f6-20020a056512228600b004b59891d6ffmr22273832lfu.46.1673295437504;
        Mon, 09 Jan 2023 12:17:17 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v23-20020ac258f7000000b004cb00bf6724sm1777870lfo.143.2023.01.09.12.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 12:17:16 -0800 (PST)
Message-ID: <b66de0ab-a31b-c86a-c1d0-c9a5f98c4f85@linaro.org>
Date:   Mon, 9 Jan 2023 22:17:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 1/4] drm/msm/mdss: convert UBWC setup to use match
 data
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
 <20221208000850.312548-2-dmitry.baryshkov@linaro.org>
 <047cd859-7141-d52f-4989-847fd2ada002@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <047cd859-7141-d52f-4989-847fd2ada002@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/01/2023 21:53, Abhinav Kumar wrote:
> 
> 
> On 12/7/2022 4:08 PM, Dmitry Baryshkov wrote:
>> To simplify adding new platforms and to make settings more obvious,
>> rewrite the UBWC setup to use the data structure to pass platform config
>> rather than just calling the functions direcly.
> 
> Why not use the catalog to store this information rather than using the 
> platform device match data?
> 
> This seems more appropriate for the catalog.

Which catalog?

If you are talking about the DPU hw catalog, it's not possible. DPU and 
MDSS are two distinct drivers even if they are built into the same module.

And if you are talking about adding mdss_catalog, I'd abstain from that 
idea. It is too easy to update one piece and forget the other one. Using 
match data is what other drivers are using (and it ensures that each new 
supported device gets its correct match data).

> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/msm_mdss.c | 158 ++++++++++++++++++++-------------
>>   1 file changed, 94 insertions(+), 64 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c 
>> b/drivers/gpu/drm/msm/msm_mdss.c
>> index 92773e0a8fda..2219c1bd59a9 100644
>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>> @@ -29,6 +29,14 @@
>>   #define MIN_IB_BW    400000000UL /* Min ib vote 400MB */
>> +struct msm_mdss_data {
>> +    u32 ubwc_version;
>> +    u32 ubwc_swizzle;
>> +    u32 ubwc_static;
>> +    u32 highest_bank_bit;
>> +    u32 macrotile_mode;
>> +};
>> +
>>   struct msm_mdss {
>>       struct device *dev;
>> @@ -40,6 +48,7 @@ struct msm_mdss {
>>           unsigned long enabled_mask;
>>           struct irq_domain *domain;
>>       } irq_controller;
>> +    const struct msm_mdss_data *mdss_data;
>>       struct icc_path *path[2];
>>       u32 num_paths;
>>   };
>> @@ -180,46 +189,40 @@ static int _msm_mdss_irq_domain_add(struct 
>> msm_mdss *msm_mdss)
>>   #define UBWC_3_0 0x30000000
>>   #define UBWC_4_0 0x40000000
>> -static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss,
>> -                       u32 ubwc_static)
>> +static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
>>   {
>> -    writel_relaxed(ubwc_static, msm_mdss->mmio + UBWC_STATIC);
>> +    const struct msm_mdss_data *data = msm_mdss->mdss_data;
>> +
>> +    writel_relaxed(data->ubwc_static, msm_mdss->mmio + UBWC_STATIC);
>>   }
>> -static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss,
>> -                       unsigned int ubwc_version,
>> -                       u32 ubwc_swizzle,
>> -                       u32 highest_bank_bit,
>> -                       u32 macrotile_mode)
>> +static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
>>   {
>> -    u32 value = (ubwc_swizzle & 0x1) |
>> -            (highest_bank_bit & 0x3) << 4 |
>> -            (macrotile_mode & 0x1) << 12;
>> +    const struct msm_mdss_data *data = msm_mdss->mdss_data;
>> +    u32 value = (data->ubwc_swizzle & 0x1) |
>> +            (data->highest_bank_bit & 0x3) << 4 |
>> +            (data->macrotile_mode & 0x1) << 12;
>> -    if (ubwc_version == UBWC_3_0)
>> +    if (data->ubwc_version == UBWC_3_0)
>>           value |= BIT(10);
>> -    if (ubwc_version == UBWC_1_0)
>> +    if (data->ubwc_version == UBWC_1_0)
>>           value |= BIT(8);
>>       writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
>>   }
>> -static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss,
>> -                       unsigned int ubwc_version,
>> -                       u32 ubwc_swizzle,
>> -                       u32 ubwc_static,
>> -                       u32 highest_bank_bit,
>> -                       u32 macrotile_mode)
>> +static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
>>   {
>> -    u32 value = (ubwc_swizzle & 0x7) |
>> -            (ubwc_static & 0x1) << 3 |
>> -            (highest_bank_bit & 0x7) << 4 |
>> -            (macrotile_mode & 0x1) << 12;
>> +    const struct msm_mdss_data *data = msm_mdss->mdss_data;
>> +    u32 value = (data->ubwc_swizzle & 0x7) |
>> +            (data->ubwc_static & 0x1) << 3 |
>> +            (data->highest_bank_bit & 0x7) << 4 |
>> +            (data->macrotile_mode & 0x1) << 12;
>>       writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
>> -    if (ubwc_version == UBWC_3_0) {
>> +    if (data->ubwc_version == UBWC_3_0) {
>>           writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
>>           writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
>>       } else {
>> @@ -232,6 +235,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>>   {
>>       int ret;
>>       u32 hw_rev;
>> +    u32 ubwc_dec_hw_version;
>>       /*
>>        * Several components have AXI clocks that can only be turned on if
>> @@ -250,53 +254,36 @@ static int msm_mdss_enable(struct msm_mdss 
>> *msm_mdss)
>>        * HW_REV requires MDSS_MDP_CLK, which is not enabled by the 
>> mdss on
>>        * mdp5 hardware. Skip reading it for now.
>>        */
>> -    if (msm_mdss->is_mdp5)
>> +    if (msm_mdss->is_mdp5 || !msm_mdss->mdss_data)
>>           return 0;
>>       hw_rev = readl_relaxed(msm_mdss->mmio + HW_REV);
>>       dev_dbg(msm_mdss->dev, "HW_REV: 0x%x\n", hw_rev);
>> +
>> +    ubwc_dec_hw_version = readl_relaxed(msm_mdss->mmio + 
>> UBWC_DEC_HW_VERSION);
>>       dev_dbg(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
>> -        readl_relaxed(msm_mdss->mmio + UBWC_DEC_HW_VERSION));
>> +        ubwc_dec_hw_version);
>>       /*
>>        * ubwc config is part of the "mdss" region which is not accessible
>>        * from the rest of the driver. hardcode known configurations here
>>        *
>>        * Decoder version can be read from the UBWC_DEC_HW_VERSION reg,
>> -     * UBWC_n and the rest of params comes from hw_catalog.
>> -     * Unforunately this driver can not access hw catalog, so we have to
>> -     * hardcode them here.
>> +     * UBWC_n and the rest of params comes from hw data.
>>        */
>> -    switch (hw_rev) {
>> -    case DPU_HW_VER_500:
>> -    case DPU_HW_VER_501:
>> -        msm_mdss_setup_ubwc_dec_30(msm_mdss, UBWC_3_0, 0, 2, 0);
>> -        break;
>> -    case DPU_HW_VER_600:
>> -        /* TODO: highest_bank_bit = 2 for LP_DDR4 */
>> -        msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
>> -        break;
>> -    case DPU_HW_VER_620:
>> -        /* UBWC_2_0 */
>> -        msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
>> +    switch (ubwc_dec_hw_version) {
>> +    case UBWC_2_0:
>> +        msm_mdss_setup_ubwc_dec_20(msm_mdss);
>>           break;
>> -    case DPU_HW_VER_630:
>> -        /* UBWC_2_0 */
>> -        msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x11f);
>> +    case UBWC_3_0:
>> +        msm_mdss_setup_ubwc_dec_30(msm_mdss);
>>           break;
>> -    case DPU_HW_VER_700:
>> -        /* TODO: highest_bank_bit = 2 for LP_DDR4 */
>> -        msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
>> +    case UBWC_4_0:
>> +        msm_mdss_setup_ubwc_dec_40(msm_mdss);
>>           break;
>> -    case DPU_HW_VER_720:
>> -        msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
>> -        break;
>> -    case DPU_HW_VER_800:
>> -        msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 2, 1);
>> -        break;
>> -    case DPU_HW_VER_810:
>> -        /* TODO: highest_bank_bit = 2 for LP_DDR4 */
>> -        msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
>> +    default:
>> +        dev_err(msm_mdss->dev, "Unuspported UBWC decoder version %x\n",
>> +            ubwc_dec_hw_version);
>>           break;
>>       }
>> @@ -487,6 +474,8 @@ static int mdss_probe(struct platform_device *pdev)
>>       if (IS_ERR(mdss))
>>           return PTR_ERR(mdss);
>> +    mdss->mdss_data = of_device_get_match_data(&pdev->dev);
>> +
>>       platform_set_drvdata(pdev, mdss);
>>       /*
>> @@ -516,20 +505,61 @@ static int mdss_remove(struct platform_device 
>> *pdev)
>>       return 0;
>>   }
>> +static const struct msm_mdss_data sc7180_data = {
>> +    .ubwc_version = UBWC_2_0,
>> +    .ubwc_static = 0x1e,
>> +};
>> +
>> +static const struct msm_mdss_data sc7280_data = {
>> +    .ubwc_version = UBWC_3_0,
>> +    .ubwc_swizzle = 6,
>> +    .ubwc_static = 1,
>> +    .highest_bank_bit = 1,
>> +    .macrotile_mode = 1,
>> +};
>> +
>> +static const struct msm_mdss_data sc8280xp_data = {
>> +    .ubwc_version = UBWC_4_0,
>> +    .ubwc_swizzle = 6,
>> +    .ubwc_static = 1,
>> +    .highest_bank_bit = 2,
>> +    .macrotile_mode = 1,
>> +};
>> +
>> +static const struct msm_mdss_data sm8150_data = {
>> +    .ubwc_version = UBWC_3_0,
>> +    .highest_bank_bit = 2,
>> +};
>> +
>> +static const struct msm_mdss_data sm6115_data = {
>> +    .ubwc_version = UBWC_2_0,
>> +    .ubwc_swizzle = 7,
>> +    .ubwc_static = 0x11f,
>> +};
>> +
>> +static const struct msm_mdss_data sm8250_data = {
>> +    .ubwc_version = UBWC_4_0,
>> +    .ubwc_swizzle = 6,
>> +    .ubwc_static = 1,
>> +    /* TODO: highest_bank_bit = 2 for LP_DDR4 */
>> +    .highest_bank_bit = 3,
>> +    .macrotile_mode = 1,
>> +};
>> +
>>   static const struct of_device_id mdss_dt_match[] = {
>>       { .compatible = "qcom,mdss" },
>>       { .compatible = "qcom,msm8998-mdss" },
>>       { .compatible = "qcom,qcm2290-mdss" },
>>       { .compatible = "qcom,sdm845-mdss" },
>> -    { .compatible = "qcom,sc7180-mdss" },
>> -    { .compatible = "qcom,sc7280-mdss" },
>> +    { .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
>> +    { .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
>>       { .compatible = "qcom,sc8180x-mdss" },
>> -    { .compatible = "qcom,sc8280xp-mdss" },
>> -    { .compatible = "qcom,sm6115-mdss" },
>> -    { .compatible = "qcom,sm8150-mdss" },
>> -    { .compatible = "qcom,sm8250-mdss" },
>> -    { .compatible = "qcom,sm8350-mdss" },
>> -    { .compatible = "qcom,sm8450-mdss" },
>> +    { .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
>> +    { .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
>> +    { .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
>> +    { .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
>> +    { .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },
>> +    { .compatible = "qcom,sm8450-mdss", .data = &sm8250_data },
>>       {}
>>   };
>>   MODULE_DEVICE_TABLE(of, mdss_dt_match);

-- 
With best wishes
Dmitry

