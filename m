Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D40ED59EBF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 21:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbiHWTNi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 15:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232838AbiHWTNK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 15:13:10 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EF19A3D3C
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 10:50:44 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27NGlEB4004228;
        Tue, 23 Aug 2022 17:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=k1NIuwJb8Bc7Jstx4pOkKGt4ZSLf99T5LKLOsvq9sKc=;
 b=FZH4Opakd7r7/RecenmdCcrOVLn7oDkduBxkHhP06HyhA7XABrpeQHHQZdHYKP0y3pNS
 //vdHuHkJ6O9r5cYWG7GPDAKuhiD7/qiNDictma4awQhrwFs1OrOYNPj4ASAgsNZPvZT
 OBezeK8yCeAyATIRpU4kugiQqBzgDxQahGT5Qsh6TGiMSX/mYIxCY2svRYrEgP8fZwhk
 oGU7dCOMivTAn/VeAprDjxMwCiM7jGM/H8j2iyKhhzrt990qTQaIe+/neBq+WVXaCAqK
 yAWLnSrahl67hkpCW6OODawWMMl0ClqWJCXGJ+d85sFsJxUSq1hS+8AZXxQUU2zevwhV TQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j52pkr6tj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 Aug 2022 17:39:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27NHdjKK009904
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 Aug 2022 17:39:45 GMT
Received: from [10.111.161.24] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 23 Aug
 2022 10:39:43 -0700
Message-ID: <3990712a-004e-8cf1-67a6-970c2020dd73@quicinc.com>
Date:   Tue, 23 Aug 2022 10:39:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/3] drm/msm/hdmi: use devres helper for runtime PM
 management
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220616075947.347888-1-dmitry.baryshkov@linaro.org>
 <20220616075947.347888-2-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220616075947.347888-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: c-bEJgRScnhtIpDOc3xleCkNnNNq051g
X-Proofpoint-GUID: c-bEJgRScnhtIpDOc3xleCkNnNNq051g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_07,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208230069
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/16/2022 12:59 AM, Dmitry Baryshkov wrote:
> Use devm_pm_runtime_enable() to enable runtime PM. This way its effect
> will be reverted on device unbind/destruction.
> 
> Fixes: 6ed9ed484d04 ("drm/msm/hdmi: Set up runtime PM for HDMI")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 6acc17e0efc1..9ff9a68b201b 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -247,7 +247,7 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
>   	if (hdmi->hpd_gpiod)
>   		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
>   
> -	pm_runtime_enable(&pdev->dev);
> +	devm_pm_runtime_enable(&pdev->dev);
>   
>   	hdmi->workq = alloc_ordered_workqueue("msm_hdmi", 0);
>   
