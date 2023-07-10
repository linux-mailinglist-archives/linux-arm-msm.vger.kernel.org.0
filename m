Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD12174DBC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jul 2023 18:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbjGJQ5p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jul 2023 12:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbjGJQ5n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jul 2023 12:57:43 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E2CED7;
        Mon, 10 Jul 2023 09:57:41 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36AFe7Te025393;
        Mon, 10 Jul 2023 16:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=DKbIA33gjqsk6nz+ZEZEzCxJNQ4CzWXAhxFOzytqpJM=;
 b=VBS0Uw3Y1YedjdFlfQ1V93d29qkN6wOe6SLqBsWqYLp2aBPUjUrAJIRl+jBt1UrHK+jq
 e2vnLvJ9rY9PnzzYEBp+mRMnNCyCI614qlisbAjP60edCI0fPxF/K0UWz96KlWFutcrY
 Tyl50m9tT073Q39VN3XXBy0MrMV/XljkHJvqttUk8Z33A2B47p6ANSYg1BmqHjnjoEOV
 /Q4e8/CnBA5E/zwCLLaX9F/pjlBDZsemTxLc6hR72O81bNvlKllt7UpGJVl1n+6cbRWa
 nYnw6KNwekTMZbfEPxf2TKW/OBg5EBCeZ2XKqbNri6gknzPtF9R2Ugytwid7DKmhnR5X GA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rrfw292mk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jul 2023 16:57:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36AGvSgm004749
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jul 2023 16:57:28 GMT
Received: from [10.110.55.196] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 10 Jul
 2023 09:57:27 -0700
Message-ID: <9df52052-93fd-75a4-b54c-02ed9554e15f@quicinc.com>
Date:   Mon, 10 Jul 2023 09:57:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 4/5] drm/msm/dp: move relevant dp initialization code
 from bind() to probe()
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
        <agross@kernel.org>, <andersson@kernel.org>
CC:     <quic_abhinavk@quicinc.com>, <quic_jesszhan@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <marijn.suijten@somainline.org>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
 <1688773943-3887-5-git-send-email-quic_khsieh@quicinc.com>
 <121f82ad-9d5d-6d7f-b4ae-9a371ab49ef7@linaro.org>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <121f82ad-9d5d-6d7f-b4ae-9a371ab49ef7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4iYB8ft1qYH3bK8WHo_8s9xffwdETDSQ
X-Proofpoint-GUID: 4iYB8ft1qYH3bK8WHo_8s9xffwdETDSQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307100153
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/7/2023 5:11 PM, Dmitry Baryshkov wrote:
> On 08/07/2023 02:52, Kuogee Hsieh wrote:
>> In preparation of moving edp of_dp_aux_populate_bus() to
>> dp_display_probe(), move dp_display_request_irq(),
>> dp->parser->parse() and dp_power_client_init() to dp_display_probe()
>> too.
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 48 
>> +++++++++++++++++--------------------
>>   drivers/gpu/drm/msm/dp/dp_display.h |  1 -
>>   2 files changed, 22 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 44580c2..185f1eb 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -290,12 +290,6 @@ static int dp_display_bind(struct device *dev, 
>> struct device *master,
>>           goto end;
>>       }
>>   -    rc = dp_power_client_init(dp->power);
>> -    if (rc) {
>> -        DRM_ERROR("Power client create failed\n");
>> -        goto end;
>> -    }
>> -
>>       rc = dp_register_audio_driver(dev, dp->audio);
>>       if (rc) {
>>           DRM_ERROR("Audio registration Dp failed\n");
>> @@ -752,6 +746,12 @@ static int dp_init_sub_modules(struct 
>> dp_display_private *dp)
>>           goto error;
>>       }
>>   +    rc = dp->parser->parse(dp->parser);
>> +    if (rc) {
>> +        DRM_ERROR("device tree parsing failed\n");
>> +        goto error;
>> +    }
>> +
>>       dp->catalog = dp_catalog_get(dev, &dp->parser->io);
>>       if (IS_ERR(dp->catalog)) {
>>           rc = PTR_ERR(dp->catalog);
>> @@ -768,6 +768,12 @@ static int dp_init_sub_modules(struct 
>> dp_display_private *dp)
>>           goto error;
>>       }
>>   +    rc = dp_power_client_init(dp->power);
>> +    if (rc) {
>> +        DRM_ERROR("Power client create failed\n");
>> +        goto error;
>> +    }
>> +
>>       dp->aux = dp_aux_get(dev, dp->catalog, dp->dp_display.is_edp);
>>       if (IS_ERR(dp->aux)) {
>>           rc = PTR_ERR(dp->aux);
>> @@ -1196,26 +1202,20 @@ static irqreturn_t dp_display_irq_handler(int 
>> irq, void *dev_id)
>>       return ret;
>>   }
>>   -int dp_display_request_irq(struct msm_dp *dp_display)
>> +static int dp_display_request_irq(struct dp_display_private *dp)
>>   {
>>       int rc = 0;
>> -    struct dp_display_private *dp;
>> -
>> -    if (!dp_display) {
>> -        DRM_ERROR("invalid input\n");
>> -        return -EINVAL;
>> -    }
>> -
>> -    dp = container_of(dp_display, struct dp_display_private, 
>> dp_display);
>> +    struct device *dev = &dp->pdev->dev;
>>   -    dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
>>       if (!dp->irq) {
>> -        DRM_ERROR("failed to get irq\n");
>> -        return -EINVAL;
>> +        dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
>> +        if (!dp->irq) {
>> +            DRM_ERROR("failed to get irq\n");
>> +            return -EINVAL;
>> +        }
>>       }
>
> Use platform_get_irq() from probe() function.
>
>>   -    rc = devm_request_irq(dp_display->drm_dev->dev, dp->irq,
>> -            dp_display_irq_handler,
>> +    rc = devm_request_irq(dev, dp->irq, dp_display_irq_handler,
>>               IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
>
>
>>       if (rc < 0) {
>>           DRM_ERROR("failed to request IRQ%u: %d\n",
>> @@ -1290,6 +1290,8 @@ static int dp_display_probe(struct 
>> platform_device *pdev)
>>         platform_set_drvdata(pdev, &dp->dp_display);
>>   +    dp_display_request_irq(dp);
>> +
>
> Error checking?
> Are we completely ready to handle interrupts at this point?
not until dp_display_host_init() is called which will be called from 
pm_runtime_resume() later.
>
>>       rc = component_add(&pdev->dev, &dp_display_comp_ops);
>>       if (rc) {
>>           DRM_ERROR("component add failed, rc=%d\n", rc);
>> @@ -1574,12 +1576,6 @@ int msm_dp_modeset_init(struct msm_dp 
>> *dp_display, struct drm_device *dev,
>>         dp_priv = container_of(dp_display, struct dp_display_private, 
>> dp_display);
>>   -    ret = dp_display_request_irq(dp_display);
>> -    if (ret) {
>> -        DRM_ERROR("request_irq failed, ret=%d\n", ret);
>> -        return ret;
>> -    }
>> -
>>       ret = dp_display_get_next_bridge(dp_display);
>>       if (ret)
>>           return ret;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h 
>> b/drivers/gpu/drm/msm/dp/dp_display.h
>> index 1e9415a..b3c08de 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> @@ -35,7 +35,6 @@ struct msm_dp {
>>   int dp_display_set_plugged_cb(struct msm_dp *dp_display,
>>           hdmi_codec_plugged_cb fn, struct device *codec_dev);
>>   int dp_display_get_modes(struct msm_dp *dp_display);
>> -int dp_display_request_irq(struct msm_dp *dp_display);
>>   bool dp_display_check_video_test(struct msm_dp *dp_display);
>>   int dp_display_get_test_bpp(struct msm_dp *dp_display);
>>   void dp_display_signal_audio_start(struct msm_dp *dp_display);
>
