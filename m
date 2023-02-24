Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55ACF6A2125
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Feb 2023 19:06:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjBXSG4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Feb 2023 13:06:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjBXSGy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Feb 2023 13:06:54 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED046EB19
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Feb 2023 10:06:53 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31OGMpLB008572;
        Fri, 24 Feb 2023 18:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PeWtVErmevxOLiNXHtQR9ouAKvqza4hpGeuQPujKlTE=;
 b=IW1FBwB/qwpIs962qJzPFSKti3U1AKLuj3iE/ToFaFTUvbtnYg2qcq5mnYm9xTKuf6JC
 Rdlgxa4xINTPUwZbxhcBxUKF9wnfbzyfjItjuvCohE9WeBSzwnrypbI3flcESw0Fdl4o
 0USTk9J0iWuw3yzMOVgpWLcTG8R5DZCl2LGMHcQTp3FqZ8OB76I9yGx/OauYWnx10TQo
 mNPWAv9L9QkuA2XWCtJBf0c+6s//wmSlli4lvQ1iKIfRyBEytJL6Crw08aCjtNIniWok
 gmtorU+A+Ek1vK59lMY+2ItJOdPlIusrh6q4slOBWQ1EecoCpT2oboqWOJBXcchBf8Iw Ng== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ny0q588pt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Feb 2023 18:06:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31OI6k7O029731
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Feb 2023 18:06:46 GMT
Received: from [10.110.89.76] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 24 Feb
 2023 10:06:45 -0800
Message-ID: <39232ec0-5df1-8c10-5ae1-1d54bbc61fac@quicinc.com>
Date:   Fri, 24 Feb 2023 10:06:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 03/50] drm/msm/dpu: fix typo in in sm8550's dma_sblk_5
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
 <20230211231259.1308718-4-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230211231259.1308718-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: asWgozHDtrMwn3VvihARGdH0wykUW1PI
X-Proofpoint-ORIG-GUID: asWgozHDtrMwn3VvihARGdH0wykUW1PI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_12,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=800 clxscore=1015
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302240141
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/11/2023 3:12 PM, Dmitry Baryshkov wrote:
> Fix typo if the name of the sblk structure for the sm8550's dma_sblk_5.
> 
> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
