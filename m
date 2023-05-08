Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD7DA6F9EA9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 06:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbjEHE0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 00:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbjEHE0E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 00:26:04 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 765BE72BE;
        Sun,  7 May 2023 21:26:01 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3483tkhV010768;
        Mon, 8 May 2023 04:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xM9aJ3QMYI2jjSHFnPeXdxLTxmpqEH4m6OdKBd6a4jw=;
 b=Z53fIorsfOd/a5CfYh4YR40eH4/zl/8i43oFqmhz8TA3IcgjNqTxlyPwN1b5u+B5d9S/
 H2A1S+pHvVQqUXYCjqdXk+rMYusZyT+/zuUacZsIN5O9fdpT04NIOz67D9kQ4ep34/VS
 y/CogXYhe2KP+RAEMnePBTVYfHKUdJYnSKAxRbXOiNSb5TkVQCwmRFKWZJsnn83X/aFP
 EbJ7/0kBfPQQtvq19l4tRdMSB2DGpVgBOBJSC1Ju67Zc0/r4kgnmnn4H2fwtFzgJ7tJQ
 xvRjAUIoNDmX4ClfZUXDfK5uNHRmjWmArfiOMf9parl4SM0xMl1OvbvMuRgTMhq+biRd zw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qddv0as7t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 May 2023 04:25:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3484PLaF024967
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 8 May 2023 04:25:21 GMT
Received: from [10.110.53.190] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Sun, 7 May 2023
 21:25:20 -0700
Message-ID: <b0cc40d5-6de1-91cc-e2cd-f47cc53551e4@quicinc.com>
Date:   Sun, 7 May 2023 21:25:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] Revert "drm/msm/dp: Remove INIT_SETUP delay"
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>,
        Leonard Lausen <leonard@lausen.nl>
CC:     <regressions@lists.linux.dev>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        "Kuogee Hsieh" <quic_khsieh@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Nikita Travkin <nikita@trvn.ru>
References: <ebbcd56ac883d3c3d3024d368fab63d26e02637a@lausen.nl>
 <20230508021536.txtamifw2vkfncnx@ripper>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230508021536.txtamifw2vkfncnx@ripper>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CPo0I43eNuQT6fj1KBtBGXpp7wBGxqkl
X-Proofpoint-ORIG-GUID: CPo0I43eNuQT6fj1KBtBGXpp7wBGxqkl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_02,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305080029
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/7/2023 7:15 PM, Bjorn Andersson wrote:
> On Mon, May 08, 2023 at 01:06:13AM +0000, Leonard Lausen wrote:
>> This reverts commit e17af1c9d861dc177e5b56009bd4f71ace688d97.
>>
>> Removing the delay of 100 units broke hot plug detection for USB-C displays on
>> qcom sc7180 lazor devices. Lazor uses mdss for hot plug detection and declares
>> dp_hot_plug_det in the dts. Other sc7180 based devices like aspire1 were not
>> affected by the regression, as they do not rely on mdss and dp_hot_plug_det for
>> hot plug detection.
>>
>> Signed-off-by: Leonard Lausen <leonard@lausen.nl>
>> Tested-by: Leonard Lausen <leonard@lausen.nl> # Trogdor (sc7180)
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index bde1a7ce442f..db9783ffd5cf 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1506,7 +1506,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>>          dp = container_of(dp_display, struct dp_display_private, dp_display);
>>   
>>          if (!dp_display->is_edp)
>> -               dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 0);
>> +               dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
> 
> When booting with the cable connected on my X13s, 100 is long enough for
> my display to time out and require me to disconnect and reconnect the
> cable again.
> 
> Do we have any idea of why the reduction to 0 is causing an issue when
> using the internal HPD?
> 
> Regards,
> Bjorn

Yes, we do know why this is causing an issue. The cleaner patch for this 
will be posted this week.

There is no need to add the 100ms delay back yet.

thanks for posting this but NAK on this patch till we post the fix this 
week.

Appreciate a bit of patience till then.

> 
>>   }
>>   
>>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>> -- 
>> 2.30.2
