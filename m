Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA0679C1CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 03:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236145AbjILBmw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 21:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236025AbjILBmp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 21:42:45 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 682FF1F992F
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 18:19:11 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38BNIOUq015413;
        Mon, 11 Sep 2023 23:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=VkRaopVEX/DP3e9b/4nnuaT4G9CYo3ylaFZZ2kDUjAA=;
 b=MGpLRfeSrljgt0bYgrIPc62xnMdwJpGo3ypYKo6PLQiIszoQ0g5W3M1+c3uTg8gSIEu+
 Q+gxTdWapttOZLH4RBKnh4C1L5ICNCzS7c+AuCWc8YItJZYjAFvqrYin6ybXE67Q76TC
 eWNQeWWQ1Rnbfi06nZM5l4cOy6BEu9ejnZBm8SGWVzf5Q6myEeP1s61Q4ElGwOtaFamq
 5gB3Zp4J86SVthqHgdsP1GDcPopEaQG/ItM/frPqwW7v/lcH/E5n+Z+fVLhNeNajs8Xj
 tRqAvf7PhxF6WiHZ0sYdgPjtmUKdEGkGfHEAuBNMNmDaAASK5BcU41gVS4MF1sVKlU1W 4A== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t1xjmt1h9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 23:26:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38BNQkUj024990
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 23:26:46 GMT
Received: from [10.71.110.104] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 11 Sep
 2023 16:26:44 -0700
Message-ID: <b3f8c1d7-0830-e46b-81da-e1927e2f68df@quicinc.com>
Date:   Mon, 11 Sep 2023 16:26:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 5/9] drm/msm/dpu: drop the `smart_dma_priority' field
 from struct dpu_sspp_sub_blks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230911214521.787453-1-dmitry.baryshkov@linaro.org>
 <20230911214521.787453-6-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230911214521.787453-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AND2oahaCW80OAGE3l8lw2JRHQ-XWoAo
X-Proofpoint-GUID: AND2oahaCW80OAGE3l8lw2JRHQ-XWoAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_19,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=938
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110215
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/11/2023 2:45 PM, Dmitry Baryshkov wrote:
> In preparation to deduplicating SSPP subblocks, drop the (unused)
> `smart_dma_priority' field from struct dpu_sspp_sub_blks. If it is
> needed later (e.g. for SmartDMA v1), it should be added to the SSPP
> declarations themselves.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 112 +++++++-----------
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 -
>   2 files changed, 40 insertions(+), 74 deletions(-)
> 

Alright, if we need it later, we can add it to the SSPP itself

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

