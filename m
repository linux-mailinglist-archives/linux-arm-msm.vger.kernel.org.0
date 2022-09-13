Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93C4A5B7747
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 19:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232388AbiIMRGM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 13:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232391AbiIMRFq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 13:05:46 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C04DBFEA5
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 08:55:38 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DDvEt1018625;
        Tue, 13 Sep 2022 15:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3mz+DIWbAv2lJtq7oCMQc/sw/N2SOx9zzz4TQU/xQ78=;
 b=lqBW2RWSEOFTktKoaXL0hoUfOi1CwnLF1WBtDSgaNh+5QmK4WiOzRdgedCTZ5ZsMrlgc
 egUC7LUwL4dcf3iJyeCLIRTKiqAv3DXovscT0AKhzts0q/a0aRqP69fGa1nGplKaykwB
 xdoLJ+4Tf1Xuu6L2QKwEAc+M+EjLTdmKp/2p7V2Jh4N06wYFbTTPKlavXYRof9fWDQoO
 laOc96g+5JDPts3y6oDAcuGpiMmfvj/12YF7U26nrUmaJJx/gIQFHKx80LNk21gkW/rY
 Rv9NJIawOMFEfLKO9gz92DCSGfmy/pweRN0HtIisSScZPZGZnS7u65jwWTipsN7i40jb hA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jjh9tjwqh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Sep 2022 15:54:18 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28DFsHVt004993
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Sep 2022 15:54:17 GMT
Received: from [10.71.111.188] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 13 Sep
 2022 08:54:17 -0700
Message-ID: <24b05be6-1aac-a136-3746-a349b2fefa6c@quicinc.com>
Date:   Tue, 13 Sep 2022 08:54:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [Freedreno] [PATCH 0/2] Add support for HDR color formats
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <freedreno@lists.freedesktop.org>
CC:     <linux-arm-msm@vger.kernel.org>, <quic_abhinavk@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <swboyd@chromium.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>
References: <20220901203422.217-1-quic_jesszhan@quicinc.com>
 <f3083bc5-fd56-b017-5cdf-c72e730a987e@linaro.org>
Content-Language: en-US
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <f3083bc5-fd56-b017-5cdf-c72e730a987e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: korJaAmV5dj8ILBtiwhV1_qwfxEceDt2
X-Proofpoint-GUID: korJaAmV5dj8ILBtiwhV1_qwfxEceDt2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_09,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209130072
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On 9/12/2022 11:33 AM, Dmitry Baryshkov wrote:
> On 01/09/2022 23:34, Jessica Zhang wrote:
>> Add support for HDR color formats.
>>
>> XR30 linear/compressed format has been validated with null_platform_test
>> on SC7180, and P010 linear has been validated with plane_test (also on
>> SC7180).
> 
> Are they supported on sdm845? On msm8998?

Yes for both. AFAIK XR30 and P010 are supported on all DPU boards.

Thanks,

Jessica Zhang

> 
>>
>> Jessica Zhang (2):
>>    drm/msm/dpu: Add support for XR30 format
>>    drm/msm/dpu: Add support for P010 format
>>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   | 24 ++++++++++++++++++-
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  3 +++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  2 ++
>>   3 files changed, 28 insertions(+), 1 deletion(-)
>>
>> -- 
>> 2.35.1
>>
> 
> -- 
> With best wishes
> Dmitry
> 
