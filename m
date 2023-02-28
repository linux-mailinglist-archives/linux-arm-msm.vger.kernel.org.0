Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A973B6A639F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Mar 2023 00:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbjB1XFK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 18:05:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjB1XFJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 18:05:09 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D98E22694
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 15:05:08 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31SMjEtb019922;
        Tue, 28 Feb 2023 23:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=74XTXI9AJ7QJ6D+YjjT+WAkUvFKLiTpzhpkriYJ+2RE=;
 b=VWviLRZtLF2IYuhBltO9eLdyi0p5ni4GFsgGkvAikKCfnGAT0drdibjXrWqcM+79CoBy
 ZhI+PxS8Pw74N6ta4QdSuVNJhOX4X+CJRYaxs89QyJByki/8Kx1CALptIOKRZyr+cWMV
 QYMIzvHSZi+Ztaccl78p/GUEN8LtqlwELGf6nIcH1HxC7ierESzHvp6da+ByL9RHoYno
 cml9AYhqU5j2n6oiycVkz0/TOa4lP1A5brKz3GXUloztMg9Zbcpi4+Zwbuj852n5rpRv
 6gNcnOxDPCrQqapV5PSA+LYXlcMjQtDRiaRphd7zmrW1nJxtZWXEIkgq6QzrLyF8wIdP lg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p0u3jw7qk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Feb 2023 23:05:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31SN50PX000863
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Feb 2023 23:05:00 GMT
Received: from [10.110.126.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 28 Feb
 2023 15:04:59 -0800
Message-ID: <5678d184-5c90-6f98-de53-a2da4a7bf027@quicinc.com>
Date:   Tue, 28 Feb 2023 15:04:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 11/50] drm/msm/dpu: drop DPU_DIM_LAYER from
 MIXER_MSM8998_MASK
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-12-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230211231259.1308718-12-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dTyCHwDJa4ZifSAwAFSmCPFQIY-BheAN
X-Proofpoint-GUID: dTyCHwDJa4ZifSAwAFSmCPFQIY-BheAN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-02-28_17,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 mlxlogscore=866
 spamscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302280185
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/11/2023 3:12 PM, Dmitry Baryshkov wrote:
> The msm8998 doesn't seem to support DIM_LAYER, so drop it from
> the supported features mask.
> 
> Fixes: 2d8a4edb672d ("drm/msm/dpu: use feature bit for LM combined alpha check")
> Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
