Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA415AB8BF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 21:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiIBTK1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 15:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiIBTK0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 15:10:26 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA4D5A3DD
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Sep 2022 12:10:24 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 282GGIKQ020623;
        Fri, 2 Sep 2022 19:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7dObJTN6ZS7X99FeGA/tZH0S3amjE0PO5l5SLUKQy14=;
 b=nKs1VZuhqKrGfUfPekju6wJ++XtvRhmpV24GUrc1N0/Be/xNamXQiYUpm1kYUJlhMz4p
 iomxqz/bP2c45MGmsw4Q2Heqf5u69I2hOb1T94GBQhJcKOgsr8CewCA9LDUsZiJj6FxB
 iCPrT5vT3SMDqXGK1qBxkpYaz6NEtKtk135/bNnKmE3JLswTbfUthfVr7N8wQ6OQCDh2
 Int8VDdXOkAZUDKQWp9Lm8ZPOEy3ZXR6Qiuj5/c5DVFlYTKXPkBB7djhGyww0bpmwh3Z
 Uejqvdt9DpOEE4eOIyoaQIdhE3LzNWSZCPgwx8XBAi4D4Ublli66AIhch6i+RyJg4AWB AQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jbafyaq2t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 02 Sep 2022 19:10:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 282JAI4K003720
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 2 Sep 2022 19:10:18 GMT
Received: from [10.111.173.210] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 2 Sep 2022
 12:10:16 -0700
Message-ID: <c1e045a5-eceb-7627-0643-2fe5f835bf7d@quicinc.com>
Date:   Fri, 2 Sep 2022 12:10:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v1 3/4] drm/msm/mdp4: move resource allocation
 to the _probe function
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
References: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
 <20220620213054.1872954-4-dmitry.baryshkov@linaro.org>
 <014fc43f-bee6-88eb-9d3c-69aed2fcd7c6@quicinc.com>
 <7D8A3C28-85A1-4737-B6ED-EACBF488FF70@linaro.org>
 <005fd4aa-7f7c-af98-6787-48f04fa2f166@quicinc.com>
 <CAA8EJprWr5XV9Ky1KgBdJE9gBVAUspkwg=fS5wryt-k7SPfnMA@mail.gmail.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprWr5XV9Ky1KgBdJE9gBVAUspkwg=fS5wryt-k7SPfnMA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: r5U1zfzkaAsQUkq_dKYty_xZfrGKD5Fa
X-Proofpoint-GUID: r5U1zfzkaAsQUkq_dKYty_xZfrGKD5Fa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-02_04,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 clxscore=1015 mlxscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209020085
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/2/2022 12:05 PM, Dmitry Baryshkov wrote:
> On Fri, 2 Sept 2022 at 21:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 9/1/2022 11:06 PM, Dmitry Baryshkov wrote:
>>>
>>>
>>> On 2 September 2022 03:24:17 GMT+03:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>> On 6/20/2022 2:30 PM, Dmitry Baryshkov wrote:
>>>>> To let the probe function bail early if any of the resources is
>>>>> unavailable, move resource allocattion from kms_init directly to the
>>>>> probe callback. While we are at it, replace irq_of_parse_and_map() with
>>>>> platform_get_irq().
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>     drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 107 +++++++++++------------
>>>>>     1 file changed, 51 insertions(+), 56 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>>>>> index 41dc60784847..6499713eccf6 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>>>>> @@ -139,8 +139,6 @@ static void mdp4_destroy(struct msm_kms *kms)
>>>>>              pm_runtime_disable(dev);
>>>>>              mdp_kms_destroy(&mdp4_kms->base);
>>>>> -
>>>>> -   kfree(mdp4_kms);
>>>>>     }
>>>>>       static const struct mdp_kms_funcs kms_funcs = {
>>>>> @@ -383,57 +381,27 @@ static int mdp4_kms_init(struct drm_device *dev)
>>>>>     {
>>>>>      struct platform_device *pdev = to_platform_device(dev->dev);
>>>>>      struct msm_drm_private *priv = dev->dev_private;
>>>>> -   struct mdp4_kms *mdp4_kms;
>>>>> +   struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(priv->kms));
>>>>>      struct msm_kms *kms = NULL;
>>>>>      struct iommu_domain *iommu;
>>>>>      struct msm_gem_address_space *aspace;
>>>>> -   int irq, ret;
>>>>> +   int ret;
>>>>>      u32 major, minor;
>>>>>      unsigned long max_clk;
>>>>>              /* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
>>>>>      max_clk = 266667000;
>>>>>     -        mdp4_kms = kzalloc(sizeof(*mdp4_kms), GFP_KERNEL);
>>>>> -   if (!mdp4_kms) {
>>>>> -           DRM_DEV_ERROR(dev->dev, "failed to allocate kms\n");
>>>>> -           return -ENOMEM;
>>>>> -   }
>>>>> -
>>>>>      ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
>>>>>      if (ret) {
>>>>>              DRM_DEV_ERROR(dev->dev, "failed to init kms\n");
>>>>>              goto fail;
>>>>>      }
>>>>>     -        priv->kms = &mdp4_kms->base.base;
>>>>>      kms = priv->kms;
>>>>>              mdp4_kms->dev = dev;
>>>>>     -        mdp4_kms->mmio = msm_ioremap(pdev, NULL);
>>>>> -   if (IS_ERR(mdp4_kms->mmio)) {
>>>>> -           ret = PTR_ERR(mdp4_kms->mmio);
>>>>> -           goto fail;
>>>>> -   }
>>>>> -
>>>>> -   irq = platform_get_irq(pdev, 0);
>>>>> -   if (irq < 0) {
>>>>> -           ret = irq;
>>>>> -           DRM_DEV_ERROR(dev->dev, "failed to get irq: %d\n", ret);
>>>>> -           goto fail;
>>>>> -   }
>>>>> -
>>>>> -   kms->irq = irq;
>>>>> -
>>>>> -   /* NOTE: driver for this regulator still missing upstream.. use
>>>>> -    * _get_exclusive() and ignore the error if it does not exist
>>>>> -    * (and hope that the bootloader left it on for us)
>>>>> -    */
>>>>> -   mdp4_kms->vdd = devm_regulator_get_exclusive(&pdev->dev, "vdd");
>>>>> -   if (IS_ERR(mdp4_kms->vdd))
>>>>> -           mdp4_kms->vdd = NULL;
>>>>> -
>>>>>      if (mdp4_kms->vdd) {
>>>>>              ret = regulator_enable(mdp4_kms->vdd);
>>>>>              if (ret) {
>>>>> @@ -442,24 +410,6 @@ static int mdp4_kms_init(struct drm_device *dev)
>>>>>              }
>>>>>      }
>>>>>     -        mdp4_kms->clk = devm_clk_get(&pdev->dev, "core_clk");
>>>>> -   if (IS_ERR(mdp4_kms->clk)) {
>>>>> -           DRM_DEV_ERROR(dev->dev, "failed to get core_clk\n");
>>>>> -           ret = PTR_ERR(mdp4_kms->clk);
>>>>> -           goto fail;
>>>>> -   }
>>>>> -
>>>>> -   mdp4_kms->pclk = devm_clk_get(&pdev->dev, "iface_clk");
>>>>> -   if (IS_ERR(mdp4_kms->pclk))
>>>>> -           mdp4_kms->pclk = NULL;
>>>>> -
>>>>> -   mdp4_kms->axi_clk = devm_clk_get(&pdev->dev, "bus_clk");
>>>>> -   if (IS_ERR(mdp4_kms->axi_clk)) {
>>>>> -           DRM_DEV_ERROR(dev->dev, "failed to get axi_clk\n");
>>>>> -           ret = PTR_ERR(mdp4_kms->axi_clk);
>>>>> -           goto fail;
>>>>> -   }
>>>>> -
>>>>>      clk_set_rate(mdp4_kms->clk, max_clk);
>>>>>              read_mdp_hw_revision(mdp4_kms, &major, &minor);
>>>>> @@ -474,10 +424,9 @@ static int mdp4_kms_init(struct drm_device *dev)
>>>>>      mdp4_kms->rev = minor;
>>>>>              if (mdp4_kms->rev >= 2) {
>>>>> -           mdp4_kms->lut_clk = devm_clk_get(&pdev->dev, "lut_clk");
>>>>> -           if (IS_ERR(mdp4_kms->lut_clk)) {
>>>>> +           if (!mdp4_kms->lut_clk) {
>>>>>                      DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
>>>>> -                   ret = PTR_ERR(mdp4_kms->lut_clk);
>>>>> +                   ret = -ENODEV;
>>>>>                      goto fail;
>>>>>              }
>>>>>              clk_set_rate(mdp4_kms->lut_clk, max_clk);
>>>>> @@ -560,7 +509,53 @@ static const struct dev_pm_ops mdp4_pm_ops = {
>>>>>       static int mdp4_probe(struct platform_device *pdev)
>>>>>     {
>>>>> -   return msm_drv_probe(&pdev->dev, mdp4_kms_init, NULL);
>>>>> +   struct device *dev = &pdev->dev;
>>>>> +   struct mdp4_kms *mdp4_kms;
>>>>> +   int irq;
>>>>> +
>>>>> +   mdp4_kms = devm_kzalloc(dev, sizeof(*mdp4_kms), GFP_KERNEL);
>>>>> +   if (!mdp4_kms)
>>>>> +           return dev_err_probe(dev, -ENOMEM, "failed to allocate kms\n");
>>>>> +
>>>>> +   mdp4_kms->mmio = msm_ioremap(pdev, NULL);
>>>>> +   if (IS_ERR(mdp4_kms->mmio))
>>>>> +           return PTR_ERR(mdp4_kms->mmio);
>>>>> +
>>>>> +   irq = platform_get_irq(pdev, 0);
>>>>> +   if (irq < 0)
>>>>> +           return dev_err_probe(dev, irq, "failed to get irq\n");
>>>>> +
>>>>> +   mdp4_kms->base.base.irq = irq;
>>>>> +
>>>>> +   /* NOTE: driver for this regulator still missing upstream.. use
>>>>> +    * _get_exclusive() and ignore the error if it does not exist
>>>>> +    * (and hope that the bootloader left it on for us)
>>>>> +    */
>>>>> +   mdp4_kms->vdd = devm_regulator_get_exclusive(&pdev->dev, "vdd");
>>>>> +   if (IS_ERR(mdp4_kms->vdd))
>>>>> +           mdp4_kms->vdd = NULL;
>>>>> +
>>>>> +   mdp4_kms->clk = devm_clk_get(&pdev->dev, "core_clk");
>>>>> +   if (IS_ERR(mdp4_kms->clk))
>>>>> +           return dev_err_probe(dev, PTR_ERR(mdp4_kms->clk), "failed to get core_clk\n");
>>>>> +
>>>>> +   mdp4_kms->pclk = devm_clk_get(&pdev->dev, "iface_clk");
>>>>> +   if (IS_ERR(mdp4_kms->pclk))
>>>>> +           mdp4_kms->pclk = NULL;
>>>>> +
>>>>> +   mdp4_kms->axi_clk = devm_clk_get(&pdev->dev, "bus_clk");
>>>>> +   if (IS_ERR(mdp4_kms->axi_clk))
>>>>> +           return dev_err_probe(dev, PTR_ERR(mdp4_kms->axi_clk), "failed to get axi_clk\n");
>>>>> +
>>>>> +   /*
>>>>> +    * This is required for revn >= 2. Handle errors here and let the kms
>>>>> +    * init bail out if the clock is not provided.
>>>>> +    */
>>>>> +   mdp4_kms->lut_clk = devm_clk_get_optional(&pdev->dev, "lut_clk");
>>>>> +   if (IS_ERR(mdp4_kms->lut_clk))
>>>>> +           return dev_err_probe(dev, PTR_ERR(mdp4_kms->lut_clk), "failed to get lut_clk\n");
>>>>
>>>> I can see that you have moved this from init to probe and only rev >=2 needs it.
>>>>
>>>> But, your check here will end up returning from probe because you have a return. So I guess you means just having dev_err_probe without the return and let the init fail if the clk is not found because we have the hw_rev only in init.
>>>
>>> No. The function called here is the devm_clk_get_optional(). So the driver will get NULL if the clock is not present in the DT and an error only in an error case (e.g. EINVAL, EPROBE_DEFER).
>>>
>>> Later on the mdp4_kms_init() will check hw_rev and return -ENODEV if the clock is required, but is set to NULL (not present in DT).
>>>
>>
>> Ok, I have understood. But dont you think this is too much convolution
>> just for this check? Why not leave the lut_clk in the init instead of
>> trying to move it to probe and add all this?
> 
> No, I don't. I saw no point in leaving the lut_clk getter unconverted.
> Having everything handled in a similar way is a neat bonus from my
> point of view.
> 
> 
Alright, its a small enough change and you have left a comment too, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
