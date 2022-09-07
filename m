Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9345B0D36
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 21:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbiIGT1q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 15:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbiIGT1m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 15:27:42 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6589A9BB72
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 12:27:40 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 287AZ87A010063;
        Wed, 7 Sep 2022 19:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=sjhTSJwyIaFxgPvK2KaJfTj9k1q7Kaz//1wBv/t4Ci8=;
 b=O/ryoNwdjTusqlaDCVm1FxrouK0PGpMuSlVA05xsQhDCiL+ZqgfeCs/ZqoKWDH7Py2PF
 10wOwAJhgRKeElqotBryIVYdqHM4DpsmnQj+v1vje0nqq01hmPM+QiQqGAo9y1AAzFix
 NSWy7ZkquMU3/xZSNahJ6H3ATJDqYNicI6jJXkTcx8Ir2j9Q25EckgS+hIGUNLuS6NdC
 YO6gLOCXOpajq1nKaLyR7qInK3qAz+a+cUdnMamVsXbaMd0WAbWqHMhGH1u15qIPAleF
 f1beVOJHyRWWirW/Y8NM2JMmmNwRx4ej1F1UhSU8pIl4rsOvzM/W1oqtkI7IhqC8i0mW Aw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jeahhchum-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 07 Sep 2022 19:27:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 287JRYmF001018
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 7 Sep 2022 19:27:34 GMT
Received: from [10.111.169.242] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 7 Sep 2022
 12:27:31 -0700
Message-ID: <e48da369-f048-da43-8d58-828efbccd40e@quicinc.com>
Date:   Wed, 7 Sep 2022 12:27:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v2 3/5] drm/msm/hdmi: move resource allocation
 to probe function
Content-Language: en-US
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     David Airlie <airlied@linux.ie>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <freedreno@lists.freedesktop.org>
References: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
 <20220826093927.851597-4-dmitry.baryshkov@linaro.org>
 <b1b6ba61-10a6-ba9e-ac79-8b4182d348d9@quicinc.com>
 <c379132c-e0b5-51d7-8b9a-708ef4c1d7b3@quicinc.com>
In-Reply-To: <c379132c-e0b5-51d7-8b9a-708ef4c1d7b3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Bg_l6_Xr8dbeFlIoVOUVDRDC2NeDJRE3
X-Proofpoint-ORIG-GUID: Bg_l6_Xr8dbeFlIoVOUVDRDC2NeDJRE3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_10,2022-09-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209070072
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/7/2022 12:09 PM, Abhinav Kumar wrote:
> 
> 
> On 9/7/2022 11:54 AM, Abhinav Kumar wrote:
>>
>>
>> On 8/26/2022 2:39 AM, Dmitry Baryshkov wrote:
>>> Rather than having all resource allocation happen in the _bind function
>>> (resulting in possible EPROBE_DEFER returns and component bind/unbind
>>> cycles) allocate and check all resources in _probe function. While we
>>> are at it, use platform_get_irq() to get the IRQ rather than going
>>> through the irq_of_parse_and_map().
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
The change itself LGTM, so with some change log added, this is
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/hdmi/hdmi.c | 303 +++++++++++++++-----------------
>>>   1 file changed, 138 insertions(+), 165 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c 
>>> b/drivers/gpu/drm/msm/hdmi/hdmi.c
>>> index 4a364d8f4c0b..c298a36f3b42 100644
>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
>>> @@ -76,8 +76,6 @@ static void msm_hdmi_destroy(struct hdmi *hdmi)
>>>       if (hdmi->i2c)
>>>           msm_hdmi_i2c_destroy(hdmi->i2c);
>>> -
>>> -    platform_set_drvdata(hdmi->pdev, NULL);
>>>   }
>>>   static int msm_hdmi_get_phy(struct hdmi *hdmi)
>>
>> Between v1 and v2, it just seems like a rebase to me on top of the 6.1 
>> MR. But what about moving msm_hdmi_get_phy() to probe(). I thought you 
>> were going to check that as well for v2.
> 
> Please ignore this part of the comment, I see that moving 
> msm_hdmi_get_phy() to probe() is in the patch 5 of this series.
> 
> Thanks for making that change.
> 
> The below comment still holds true.
> 
>>
>> A change log would have been nice here. Because as part of the rebase 
>> looks like we even migrate to using panel bridge for hdmi driver.
>>
>> Usage of drm_of_find_panel_or_bridge was not present in v1 and wasnt 
>> obvious from the commit text either.
>>
>>> @@ -117,142 +115,10 @@ static int msm_hdmi_get_phy(struct hdmi *hdmi)
>>>    * we are to EPROBE_DEFER we want to do it here, rather than later
>>>    * at modeset_init() time
>>>    */
>>> -static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
>>> +static int msm_hdmi_init(struct hdmi *hdmi)
>>>   {
>>> -    struct hdmi_platform_config *config = pdev->dev.platform_data;
>>> -    struct hdmi *hdmi = NULL;
>>> -    struct resource *res;
>>> -    int i, ret;
>>> -
>>> -    hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
>>> -    if (!hdmi) {
>>> -        ret = -ENOMEM;
>>> -        goto fail;
>>> -    }
>>> -
>>> -    hdmi->pdev = pdev;
>>> -    hdmi->config = config;
>>> -    spin_lock_init(&hdmi->reg_lock);
>>> -
>>> -    ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, 0, NULL, 
>>> &hdmi->next_bridge);
>>> -    if (ret && ret != -ENODEV)
>>> -        goto fail;
>>> -
>>> -    hdmi->mmio = msm_ioremap(pdev, "core_physical");
>>> -    if (IS_ERR(hdmi->mmio)) {
>>> -        ret = PTR_ERR(hdmi->mmio);
>>> -        goto fail;
>>> -    }
>>> -
>>> -    /* HDCP needs physical address of hdmi register */
>>> -    res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>>> -        "core_physical");
>>> -    if (!res) {
>>> -        ret = -EINVAL;
>>> -        goto fail;
>>> -    }
>>> -    hdmi->mmio_phy_addr = res->start;
>>> -
>>> -    hdmi->qfprom_mmio = msm_ioremap(pdev, "qfprom_physical");
>>> -    if (IS_ERR(hdmi->qfprom_mmio)) {
>>> -        DRM_DEV_INFO(&pdev->dev, "can't find qfprom resource\n");
>>> -        hdmi->qfprom_mmio = NULL;
>>> -    }
>>> -
>>> -    hdmi->hpd_regs = devm_kcalloc(&pdev->dev,
>>> -                      config->hpd_reg_cnt,
>>> -                      sizeof(hdmi->hpd_regs[0]),
>>> -                      GFP_KERNEL);
>>> -    if (!hdmi->hpd_regs) {
>>> -        ret = -ENOMEM;
>>> -        goto fail;
>>> -    }
>>> -    for (i = 0; i < config->hpd_reg_cnt; i++)
>>> -        hdmi->hpd_regs[i].supply = config->hpd_reg_names[i];
>>> -
>>> -    ret = devm_regulator_bulk_get(&pdev->dev, config->hpd_reg_cnt, 
>>> hdmi->hpd_regs);
>>> -    if (ret) {
>>> -        DRM_DEV_ERROR(&pdev->dev, "failed to get hpd regulator: 
>>> %d\n", ret);
>>> -        goto fail;
>>> -    }
>>> -
>>> -    hdmi->pwr_regs = devm_kcalloc(&pdev->dev,
>>> -                      config->pwr_reg_cnt,
>>> -                      sizeof(hdmi->pwr_regs[0]),
>>> -                      GFP_KERNEL);
>>> -    if (!hdmi->pwr_regs) {
>>> -        ret = -ENOMEM;
>>> -        goto fail;
>>> -    }
>>> -
>>> -    for (i = 0; i < config->pwr_reg_cnt; i++)
>>> -        hdmi->pwr_regs[i].supply = config->pwr_reg_names[i];
>>> -
>>> -    ret = devm_regulator_bulk_get(&pdev->dev, config->pwr_reg_cnt, 
>>> hdmi->pwr_regs);
>>> -    if (ret) {
>>> -        DRM_DEV_ERROR(&pdev->dev, "failed to get pwr regulator: 
>>> %d\n", ret);
>>> -        goto fail;
>>> -    }
>>> -
>>> -    hdmi->hpd_clks = devm_kcalloc(&pdev->dev,
>>> -                      config->hpd_clk_cnt,
>>> -                      sizeof(hdmi->hpd_clks[0]),
>>> -                      GFP_KERNEL);
>>> -    if (!hdmi->hpd_clks) {
>>> -        ret = -ENOMEM;
>>> -        goto fail;
>>> -    }
>>> -    for (i = 0; i < config->hpd_clk_cnt; i++) {
>>> -        struct clk *clk;
>>> -
>>> -        clk = msm_clk_get(pdev, config->hpd_clk_names[i]);
>>> -        if (IS_ERR(clk)) {
>>> -            ret = PTR_ERR(clk);
>>> -            DRM_DEV_ERROR(&pdev->dev, "failed to get hpd clk: %s 
>>> (%d)\n",
>>> -                    config->hpd_clk_names[i], ret);
>>> -            goto fail;
>>> -        }
>>> -
>>> -        hdmi->hpd_clks[i] = clk;
>>> -    }
>>> -
>>> -    hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
>>> -                      config->pwr_clk_cnt,
>>> -                      sizeof(hdmi->pwr_clks[0]),
>>> -                      GFP_KERNEL);
>>> -    if (!hdmi->pwr_clks) {
>>> -        ret = -ENOMEM;
>>> -        goto fail;
>>> -    }
>>> -    for (i = 0; i < config->pwr_clk_cnt; i++) {
>>> -        struct clk *clk;
>>> -
>>> -        clk = msm_clk_get(pdev, config->pwr_clk_names[i]);
>>> -        if (IS_ERR(clk)) {
>>> -            ret = PTR_ERR(clk);
>>> -            DRM_DEV_ERROR(&pdev->dev, "failed to get pwr clk: %s 
>>> (%d)\n",
>>> -                    config->pwr_clk_names[i], ret);
>>> -            goto fail;
>>> -        }
>>> -
>>> -        hdmi->pwr_clks[i] = clk;
>>> -    }
>>> -
>>> -    hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", 
>>> GPIOD_IN);
>>> -    /* This will catch e.g. -EPROBE_DEFER */
>>> -    if (IS_ERR(hdmi->hpd_gpiod)) {
>>> -        ret = PTR_ERR(hdmi->hpd_gpiod);
>>> -        DRM_DEV_ERROR(&pdev->dev, "failed to get hpd gpio: (%d)\n", 
>>> ret);
>>> -        goto fail;
>>> -    }
>>> -
>>> -    if (!hdmi->hpd_gpiod)
>>> -        DBG("failed to get HPD gpio");
>>> -
>>> -    if (hdmi->hpd_gpiod)
>>> -        gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
>>> -
>>> -    devm_pm_runtime_enable(&pdev->dev);
>>> +    struct platform_device *pdev = hdmi->pdev;
>>> +    int ret;
>>>       hdmi->workq = alloc_ordered_workqueue("msm_hdmi", 0);
>>> @@ -276,13 +142,13 @@ static struct hdmi *msm_hdmi_init(struct 
>>> platform_device *pdev)
>>>           hdmi->hdcp_ctrl = NULL;
>>>       }
>>> -    return hdmi;
>>> +    return 0;
>>>   fail:
>>>       if (hdmi)
>>>           msm_hdmi_destroy(hdmi);
>>> -    return ERR_PTR(ret);
>>> +    return ret;
>>>   }
>>>   /* Second part of initialization, the drm/kms level modeset_init,
>>> @@ -332,13 +198,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>>>       drm_connector_attach_encoder(hdmi->connector, hdmi->encoder);
>>> -    hdmi->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
>>> -    if (!hdmi->irq) {
>>> -        ret = -EINVAL;
>>> -        DRM_DEV_ERROR(dev->dev, "failed to get irq\n");
>>> -        goto fail;
>>> -    }
>>> -
>>>       ret = devm_request_irq(&pdev->dev, hdmi->irq,
>>>               msm_hdmi_irq, IRQF_TRIGGER_HIGH,
>>>               "hdmi_isr", hdmi);
>>> @@ -358,8 +217,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>>>       priv->bridges[priv->num_bridges++]       = hdmi->bridge;
>>> -    platform_set_drvdata(pdev, hdmi);
>>> -
>>>       return 0;
>>>   fail:
>>> @@ -387,7 +244,7 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>>>   static const char *hpd_reg_names_8960[] = {"core-vdda"};
>>>   static const char *hpd_clk_names_8960[] = {"core", "master_iface", 
>>> "slave_iface"};
>>> -static struct hdmi_platform_config hdmi_tx_8960_config = {
>>> +const static struct hdmi_platform_config hdmi_tx_8960_config = {
>>>           HDMI_CFG(hpd_reg, 8960),
>>>           HDMI_CFG(hpd_clk, 8960),
>>>   };
>>> @@ -397,7 +254,7 @@ static const char *pwr_clk_names_8x74[] = 
>>> {"extp", "alt_iface"};
>>>   static const char *hpd_clk_names_8x74[] = {"iface", "core", 
>>> "mdp_core"};
>>>   static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
>>> -static struct hdmi_platform_config hdmi_tx_8974_config = {
>>> +const static struct hdmi_platform_config hdmi_tx_8974_config = {
>>>           HDMI_CFG(pwr_reg, 8x74),
>>>           HDMI_CFG(pwr_clk, 8x74),
>>>           HDMI_CFG(hpd_clk, 8x74),
>>> @@ -512,23 +369,12 @@ static int 
>>> msm_hdmi_register_audio_driver(struct hdmi *hdmi, struct device *dev)
>>>   static int msm_hdmi_bind(struct device *dev, struct device *master, 
>>> void *data)
>>>   {
>>>       struct msm_drm_private *priv = dev_get_drvdata(master);
>>> -    struct hdmi_platform_config *hdmi_cfg;
>>> -    struct hdmi *hdmi;
>>> -    struct device_node *of_node = dev->of_node;
>>> +    struct hdmi *hdmi = dev_get_drvdata(dev);
>>>       int err;
>>> -    hdmi_cfg = (struct hdmi_platform_config *)
>>> -            of_device_get_match_data(dev);
>>> -    if (!hdmi_cfg) {
>>> -        DRM_DEV_ERROR(dev, "unknown hdmi_cfg: %pOFn\n", of_node);
>>> -        return -ENXIO;
>>> -    }
>>> -
>>> -    dev->platform_data = hdmi_cfg;
>>> -
>>> -    hdmi = msm_hdmi_init(to_platform_device(dev));
>>> -    if (IS_ERR(hdmi))
>>> -        return PTR_ERR(hdmi);
>>> +    err = msm_hdmi_init(hdmi);
>>> +    if (err)
>>> +        return err;
>>>       priv->hdmi = hdmi;
>>>       err = msm_hdmi_register_audio_driver(hdmi, dev);
>>> @@ -561,6 +407,133 @@ static const struct component_ops msm_hdmi_ops = {
>>>   static int msm_hdmi_dev_probe(struct platform_device *pdev)
>>>   {
>>> +    const struct hdmi_platform_config *config;
>>> +    struct device *dev = &pdev->dev;
>>> +    struct hdmi *hdmi;
>>> +    struct resource *res;
>>> +    int i, ret;
>>> +
>>> +    config = of_device_get_match_data(dev);
>>> +    if (!config)
>>> +        return -EINVAL;
>>> +
>>> +    hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
>>> +    if (!hdmi)
>>> +        return -ENOMEM;
>>> +
>>> +    hdmi->pdev = pdev;
>>> +    hdmi->config = config;
>>> +    spin_lock_init(&hdmi->reg_lock);
>>> +
>>> +    ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, 0, NULL, 
>>> &hdmi->next_bridge);
>>> +    if (ret && ret != -ENODEV)
>>> +        return ret;
>>> +
>>> +    hdmi->mmio = msm_ioremap(pdev, "core_physical");
>>> +    if (IS_ERR(hdmi->mmio))
>>> +        return PTR_ERR(hdmi->mmio);
>>> +
>>> +    /* HDCP needs physical address of hdmi register */
>>> +    res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>>> +        "core_physical");
>>> +    if (!res)
>>> +        return -EINVAL;
>>> +    hdmi->mmio_phy_addr = res->start;
>>> +
>>> +    hdmi->qfprom_mmio = msm_ioremap(pdev, "qfprom_physical");
>>> +    if (IS_ERR(hdmi->qfprom_mmio)) {
>>> +        DRM_DEV_INFO(&pdev->dev, "can't find qfprom resource\n");
>>> +        hdmi->qfprom_mmio = NULL;
>>> +    }
>>> +
>>> +    hdmi->irq = platform_get_irq(pdev, 0);
>>> +    if (hdmi->irq < 0)
>>> +        return hdmi->irq;
>>> +
>>> +    hdmi->hpd_regs = devm_kcalloc(&pdev->dev,
>>> +                      config->hpd_reg_cnt,
>>> +                      sizeof(hdmi->hpd_regs[0]),
>>> +                      GFP_KERNEL);
>>> +    if (!hdmi->hpd_regs)
>>> +        return -ENOMEM;
>>> +
>>> +    for (i = 0; i < config->hpd_reg_cnt; i++)
>>> +        hdmi->hpd_regs[i].supply = config->hpd_reg_names[i];
>>> +
>>> +    ret = devm_regulator_bulk_get(&pdev->dev, config->hpd_reg_cnt, 
>>> hdmi->hpd_regs);
>>> +    if (ret)
>>> +        return dev_err_probe(dev, ret, "failed to get hpd 
>>> regulators\n");
>>> +
>>> +    hdmi->pwr_regs = devm_kcalloc(&pdev->dev,
>>> +                      config->pwr_reg_cnt,
>>> +                      sizeof(hdmi->pwr_regs[0]),
>>> +                      GFP_KERNEL);
>>> +    if (!hdmi->pwr_regs)
>>> +        return -ENOMEM;
>>> +
>>> +    for (i = 0; i < config->pwr_reg_cnt; i++)
>>> +        hdmi->pwr_regs[i].supply = config->pwr_reg_names[i];
>>> +
>>> +    ret = devm_regulator_bulk_get(&pdev->dev, config->pwr_reg_cnt, 
>>> hdmi->pwr_regs);
>>> +    if (ret)
>>> +        return dev_err_probe(dev, ret, "failed to get pwr 
>>> regulators\n");
>>> +
>>> +    hdmi->hpd_clks = devm_kcalloc(&pdev->dev,
>>> +                      config->hpd_clk_cnt,
>>> +                      sizeof(hdmi->hpd_clks[0]),
>>> +                      GFP_KERNEL);
>>> +    if (!hdmi->hpd_clks)
>>> +        return -ENOMEM;
>>> +
>>> +    for (i = 0; i < config->hpd_clk_cnt; i++) {
>>> +        struct clk *clk;
>>> +
>>> +        clk = msm_clk_get(pdev, config->hpd_clk_names[i]);
>>> +        if (IS_ERR(clk))
>>> +            return dev_err_probe(dev, PTR_ERR(clk),
>>> +                         "failed to get hpd clk: %s\n",
>>> +                         config->hpd_clk_names[i]);
>>> +
>>> +        hdmi->hpd_clks[i] = clk;
>>> +    }
>>> +
>>> +    hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
>>> +                      config->pwr_clk_cnt,
>>> +                      sizeof(hdmi->pwr_clks[0]),
>>> +                      GFP_KERNEL);
>>> +    if (!hdmi->pwr_clks)
>>> +        return -ENOMEM;
>>> +
>>> +    for (i = 0; i < config->pwr_clk_cnt; i++) {
>>> +        struct clk *clk;
>>> +
>>> +        clk = msm_clk_get(pdev, config->pwr_clk_names[i]);
>>> +        if (IS_ERR(clk))
>>> +            return dev_err_probe(dev, PTR_ERR(clk),
>>> +                         "failed to get pwr clk: %s\n",
>>> +                         config->pwr_clk_names[i]);
>>> +
>>> +        hdmi->pwr_clks[i] = clk;
>>> +    }
>>> +
>>> +    hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", 
>>> GPIOD_IN);
>>> +    /* This will catch e.g. -EPROBE_DEFER */
>>> +    if (IS_ERR(hdmi->hpd_gpiod))
>>> +        return dev_err_probe(dev, PTR_ERR(hdmi->hpd_gpiod),
>>> +                     "failed to get hpd gpio\n");
>>> +
>>> +    if (!hdmi->hpd_gpiod)
>>> +        DBG("failed to get HPD gpio");
>>> +
>>> +    if (hdmi->hpd_gpiod)
>>> +        gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
>>> +
>>> +    ret = devm_pm_runtime_enable(&pdev->dev);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    platform_set_drvdata(pdev, hdmi);
>>> +
>>>       return component_add(&pdev->dev, &msm_hdmi_ops);
>>>   }
