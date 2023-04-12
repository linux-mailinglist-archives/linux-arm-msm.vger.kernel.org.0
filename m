Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8892D6E01F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 00:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjDLWkT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 18:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjDLWkS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 18:40:18 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7D19E40
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 15:40:17 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33CMVjRh020429;
        Wed, 12 Apr 2023 22:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WU05MOsk2wSfX5QdiSB6Uozd+gpzLd2xB92PrIRKaSQ=;
 b=KyBXTnyalW9UWmG1ljBbzszzwAf2Uholzn40qb1I7TyPsZYu2+UyIG3QLEfUpIpa99Lf
 14Xdgnw10quHTuzEje7JghXnBwnnm6wOGqnHDCCjtUDeawOnCSq/+YxBV/0XZKpBINU+
 gjnPAzvW337bYed9d+znPNebd01Pj0VUdVio9/zhnvGcvXiKJ80dUSNa4ta1WW5F7mHg
 Yuqbv5LtI4tR1dkVJvNrJ0l0L09Cy0qE2b04ep1VTb6kCWVCfpfYlkbTafn95939PTae
 lZJPq/60PYWINFfPpSX4jxiP2EIF10aS44uEkiZWIPL1Jw9fpkzSjm3ejY4zvoGla/4w HQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pwqensy2k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Apr 2023 22:40:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33CMeAnP014386
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Apr 2023 22:40:10 GMT
Received: from [10.110.73.215] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 12 Apr
 2023 15:40:09 -0700
Message-ID: <e72a1e24-72e1-aad4-bc8f-f23dc84780dc@quicinc.com>
Date:   Wed, 12 Apr 2023 15:40:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 6/8] drm/msm/dsi: Add check for slice_width in
 dsi_timing_setup
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        <freedreno@lists.freedesktop.org>
CC:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>
References: <20230329-rfc-msm-dsc-helper-v5-0-0108401d7886@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v5-6-0108401d7886@quicinc.com>
 <c829ff2f-f676-8c6d-2681-1b5da4f9ede7@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <c829ff2f-f676-8c6d-2681-1b5da4f9ede7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1h0YPVtGmvcxDqtVwbdeUjXCMQmk25hd
X-Proofpoint-ORIG-GUID: 1h0YPVtGmvcxDqtVwbdeUjXCMQmk25hd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_12,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 mlxlogscore=691 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120193
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/12/2023 12:24 PM, Dmitry Baryshkov wrote:
> On 12/04/2023 22:09, Jessica Zhang wrote:
>> Add a check for valid dsc->slice_width value in dsi_timing_setup.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 508577c596ff..6a6218a9655f 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -937,6 +937,12 @@ static void dsi_timing_setup(struct msm_dsi_host 
>> *msm_host, bool is_bonded_dsi)
>>               return;
>>           }
>> +        if (!dsc->slice_width || (mode->hdisplay < dsc->slice_width)) {
> 
> This is an erroneous condition, correct. Can we move it to a better 
> place, where we can return an error instead of ignoring it?
> 
> I'd say that we should validate dsc->slice_width at the 
> dsi_host_attach(). It well might be a good idea to add a helper that 
> validates required dsc properties (e.g. version, bpp/bpc, slice_width, 
> slice_height, slice_count).
> 
> As for the mode->hdisplay, we have the following code in 
> msm_dsi_host_check_dsc() (where pic_width = mode->hdisplay):
> 
> if (pic_width % dsc->slice_width) {...}
> 
> This way the only way how mode->hdisplay can be less than 
> dsc->slice_width is if mode->hdisplay is 0 (which is forbidden if I 
> remember correctly). So the second part of the check is useless.
> 

Lets drop this from this series and come up with a better approach to 
validate dsc params. We will take it up once dsc over dsi and dp lands.

>> +            pr_err("DSI: invalid slice width %d (pic_width: %d)\n",
>> +                   dsc->slice_width, mode->hdisplay);
>> +            return;
>> +        }
>> +
>>           dsc->pic_width = mode->hdisplay;
>>           dsc->pic_height = mode->vdisplay;
>>           DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
>>
> 
