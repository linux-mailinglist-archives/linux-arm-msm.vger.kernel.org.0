Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72F775A23A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 10:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbiHZI5m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 04:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245416AbiHZI5k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 04:57:40 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 398EAD5E9A
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 01:57:39 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id l1so1151057lfk.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 01:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=22eStSU9ItXlWoRnrD595PIr4R701OkoJy+fkWXSTyE=;
        b=rA+ZcQ5v1aIg1zXjq5ukDZB2TBClaxUfjELeOhnFDiyygvppat2Vadq5QCbGjf5POQ
         M+V4+1J+SOn76CACYx6F2OYdL9CETEgpy1u4uzRdAvL77l3HCIGfdkaCLVGhg5toXIaq
         033HvZUH6xXp4kdUpNmMSVjTHolgVyUpiaOSHmfV1zR7VWpq1N0ihZTQfj0zgaBShBm0
         +gyKIWsnCQg3lJLKKTEJqZHSZB3U3VQcktbDO9NQ1KrRLap0uNysz3bvtk9eaQxzOKNd
         ofFKgAXx40xLBvhyxHCguIEcUn5CkObt2P0oVW4mOJkyZRETGCEZ1E0RyHHVVQiN8pWN
         ufHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=22eStSU9ItXlWoRnrD595PIr4R701OkoJy+fkWXSTyE=;
        b=1Ue+2wOs3vvCPwieTiMPOej/ZvJnB1mQ5Uibu3FtVHWfYt6xg5MMFY9WTj0TbSiU+w
         eO5+IsKQW/dEE+xxswQH7I+k12b3KWxyoXnOYQ46ixRmN9Yh5sSGzwHEaAbNwaOYSUF7
         +4Bc5yXFqPQyT+CAlT2eGroDkQAUED9OznhHH8MskM1mFRKsJ3P0k1luCJdKrja/QJDc
         nUSNEOswXZSSTq6kJ0xYvq1BQj4LsGwf0isXY+wRzz/N7qSFnQPetxnMqd/+HDmdO14z
         nm3RF43c3eosJxlEk+s4/EL5yqBC4XFNCr4bEq0xOtneKR1wTNfRmuvCF6dmMLpar0C7
         UtJg==
X-Gm-Message-State: ACgBeo1/M/yMD3KcJeXUiKBcAerfWkk7hYMdTRhJ4MYDr4KmfMcR/ufl
        BuUhuhx4/JhB1mAquBGVUuewzQ==
X-Google-Smtp-Source: AA6agR6RayAC+v5sOQnaoJuZ+WyUJ4dXh4UUETdwa6psWLxW+EIOeGJrtg9zj7txwlimKbPC3mvJfg==
X-Received: by 2002:a05:6512:1091:b0:491:f135:4633 with SMTP id j17-20020a056512109100b00491f1354633mr2496905lfg.553.1661504257559;
        Fri, 26 Aug 2022 01:57:37 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f1-20020a05651c03c100b00261b6faab6dsm381798ljp.115.2022.08.26.01.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 01:57:36 -0700 (PDT)
Message-ID: <d2d94589-8513-c261-c5d8-b7ffa3db8616@linaro.org>
Date:   Fri, 26 Aug 2022 11:57:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 3/3] drm/msm/hdmi: move resource allocation to probe
 function
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220616075947.347888-1-dmitry.baryshkov@linaro.org>
 <20220616075947.347888-4-dmitry.baryshkov@linaro.org>
 <41ca91c6-dc38-af0a-c955-a276f5824cc8@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <41ca91c6-dc38-af0a-c955-a276f5824cc8@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/08/2022 02:58, Abhinav Kumar wrote:
> 
> 
> On 6/16/2022 12:59 AM, Dmitry Baryshkov wrote:
>> Rather than having all resource allocation happen in the _bind function
>> (resulting in possible EPROBE_DEFER returns and component bind/unbind
>> cycles) allocate and check all resources in _probe function. While we
>> are at it, use platform_get_irq() to get the IRQ rather than going
>> through the irq_of_parse_and_map().
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/hdmi/hdmi.c | 295 +++++++++++++++-----------------
>>   1 file changed, 134 insertions(+), 161 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c 
>> b/drivers/gpu/drm/msm/hdmi/hdmi.c
>> index 8dfe5690366b..429abd622c81 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
>> @@ -75,8 +75,6 @@ static void msm_hdmi_destroy(struct hdmi *hdmi)
>>       if (hdmi->i2c)
>>           msm_hdmi_i2c_destroy(hdmi->i2c);
>> -
>> -    platform_set_drvdata(hdmi->pdev, NULL);
> Do we still not need to do this in .remove?
>>   }
>>   static int msm_hdmi_get_phy(struct hdmi *hdmi)
>> @@ -116,138 +114,10 @@ static int msm_hdmi_get_phy(struct hdmi *hdmi)
>>    * we are to EPROBE_DEFER we want to do it here, rather than later
>>    * at modeset_init() time
>>    */
>> -static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
>> +static int msm_hdmi_init(struct hdmi *hdmi)
>>   {
>> -    struct hdmi_platform_config *config = pdev->dev.platform_data;
>> -    struct hdmi *hdmi = NULL;
>> -    struct resource *res;
>> -    int i, ret;
>> -
>> -    hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
>> -    if (!hdmi) {
>> -        ret = -ENOMEM;
>> -        goto fail;
>> -    }
>> -
>> -    hdmi->pdev = pdev;
>> -    hdmi->config = config;
>> -    spin_lock_init(&hdmi->reg_lock);
>> -
>> -    hdmi->mmio = msm_ioremap(pdev, "core_physical");
>> -    if (IS_ERR(hdmi->mmio)) {
>> -        ret = PTR_ERR(hdmi->mmio);
>> -        goto fail;
>> -    }
>> -
>> -    /* HDCP needs physical address of hdmi register */
>> -    res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> -        "core_physical");
>> -    if (!res) {
>> -        ret = -EINVAL;
>> -        goto fail;
>> -    }
>> -    hdmi->mmio_phy_addr = res->start;
>> -
>> -    hdmi->qfprom_mmio = msm_ioremap(pdev, "qfprom_physical");
>> -    if (IS_ERR(hdmi->qfprom_mmio)) {
>> -        DRM_DEV_INFO(&pdev->dev, "can't find qfprom resource\n");
>> -        hdmi->qfprom_mmio = NULL;
>> -    }
>> -
>> -    hdmi->hpd_regs = devm_kcalloc(&pdev->dev,
>> -                      config->hpd_reg_cnt,
>> -                      sizeof(hdmi->hpd_regs[0]),
>> -                      GFP_KERNEL);
>> -    if (!hdmi->hpd_regs) {
>> -        ret = -ENOMEM;
>> -        goto fail;
>> -    }
>> -    for (i = 0; i < config->hpd_reg_cnt; i++)
>> -        hdmi->hpd_regs[i].supply = config->hpd_reg_names[i];
>> -
>> -    ret = devm_regulator_bulk_get(&pdev->dev, config->hpd_reg_cnt, 
>> hdmi->hpd_regs);
>> -    if (ret) {
>> -        DRM_DEV_ERROR(&pdev->dev, "failed to get hpd regulator: 
>> %d\n", ret);
>> -        goto fail;
>> -    }
>> -
>> -    hdmi->pwr_regs = devm_kcalloc(&pdev->dev,
>> -                      config->pwr_reg_cnt,
>> -                      sizeof(hdmi->pwr_regs[0]),
>> -                      GFP_KERNEL);
>> -    if (!hdmi->pwr_regs) {
>> -        ret = -ENOMEM;
>> -        goto fail;
>> -    }
>> -
>> -    for (i = 0; i < config->pwr_reg_cnt; i++)
>> -        hdmi->pwr_regs[i].supply = config->pwr_reg_names[i];
>> -
>> -    ret = devm_regulator_bulk_get(&pdev->dev, config->pwr_reg_cnt, 
>> hdmi->pwr_regs);
>> -    if (ret) {
>> -        DRM_DEV_ERROR(&pdev->dev, "failed to get pwr regulator: 
>> %d\n", ret);
>> -        goto fail;
>> -    }
>> -
>> -    hdmi->hpd_clks = devm_kcalloc(&pdev->dev,
>> -                      config->hpd_clk_cnt,
>> -                      sizeof(hdmi->hpd_clks[0]),
>> -                      GFP_KERNEL);
>> -    if (!hdmi->hpd_clks) {
>> -        ret = -ENOMEM;
>> -        goto fail;
>> -    }
>> -    for (i = 0; i < config->hpd_clk_cnt; i++) {
>> -        struct clk *clk;
>> -
>> -        clk = msm_clk_get(pdev, config->hpd_clk_names[i]);
>> -        if (IS_ERR(clk)) {
>> -            ret = PTR_ERR(clk);
>> -            DRM_DEV_ERROR(&pdev->dev, "failed to get hpd clk: %s 
>> (%d)\n",
>> -                    config->hpd_clk_names[i], ret);
>> -            goto fail;
>> -        }
>> -
>> -        hdmi->hpd_clks[i] = clk;
>> -    }
>> -
>> -    hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
>> -                      config->pwr_clk_cnt,
>> -                      sizeof(hdmi->pwr_clks[0]),
>> -                      GFP_KERNEL);
>> -    if (!hdmi->pwr_clks) {
>> -        ret = -ENOMEM;
>> -        goto fail;
>> -    }
>> -    for (i = 0; i < config->pwr_clk_cnt; i++) {
>> -        struct clk *clk;
>> -
>> -        clk = msm_clk_get(pdev, config->pwr_clk_names[i]);
>> -        if (IS_ERR(clk)) {
>> -            ret = PTR_ERR(clk);
>> -            DRM_DEV_ERROR(&pdev->dev, "failed to get pwr clk: %s 
>> (%d)\n",
>> -                    config->pwr_clk_names[i], ret);
>> -            goto fail;
>> -        }
>> -
>> -        hdmi->pwr_clks[i] = clk;
>> -    }
>> -
>> -    hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", 
>> GPIOD_IN);
>> -    /* This will catch e.g. -EPROBE_DEFER */
>> -    if (IS_ERR(hdmi->hpd_gpiod)) {
>> -        ret = PTR_ERR(hdmi->hpd_gpiod);
>> -        DRM_DEV_ERROR(&pdev->dev, "failed to get hpd gpio: (%d)\n", 
>> ret);
>> -        goto fail;
>> -    }
>> -
>> -    if (!hdmi->hpd_gpiod)
>> -        DBG("failed to get HPD gpio");
>> -
>> -    if (hdmi->hpd_gpiod)
>> -        gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
>> -
>> -    devm_pm_runtime_enable(&pdev->dev);
>> +    struct platform_device *pdev = hdmi->pdev;
>> +    int ret;
> 
> What about the rest of the msm_hdmi_init() function?
> 
> msm_hdmi_i2c_init, msm_hdmi_get_phy and msm_hdmi_hdcp_init have been 
> left behind. Any reason for that?

msm_hdmi_i2c_init() allocates new adapter, so it should be part of bind().

msm_hdmi_hdcp_init() just allocates a chunk of memory (other actions are 
infallible). Also I did not want to move a piece of code that I can not 
really test.

As for the msm_hdmi_get_phy(), I don't remember why I didn't move it. 
But you are right, it makes sense to move it. I'll check it for v2.

> 
> 
>>       hdmi->workq = alloc_ordered_workqueue("msm_hdmi", 0);

-- 
With best wishes
Dmitry

