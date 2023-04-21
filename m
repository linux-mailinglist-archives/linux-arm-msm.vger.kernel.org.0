Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4AB6EB110
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 19:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233395AbjDURrV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Apr 2023 13:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233306AbjDURrN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Apr 2023 13:47:13 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38F09902A
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 10:46:56 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33LDM7ew019380;
        Fri, 21 Apr 2023 17:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=dWK6Duc4/q1THWZFuXOghER6/w33Awx6ysMcPoJxwPU=;
 b=n3NIIGUmwAZpgEGQ3Hx3O18h6giZ8ETzHoBCMMYxn+dxtiinvArNjoEvNb/QfD0h6mto
 T61yVvXU84FyP9nUFnE7k2upHF0mFLg1texKJoS22UhvptJcPGwQk27Qt9j9v30N1mKF
 KNpy149ohMYRJu2obnQ1e2CtLwJb2H0Ue6sutXIE5ajyu6ZxRHh9jCwQgzdxVA6nsw9Q
 gj8ZOoQ0w3tUaA+G8sXp1RSAvxJvQ6MxKDOH5g5F4T1zvvt70yzsqcQPiukoPe3/Y2Lk
 nYCAe6Fr71AyvKlbtISnci7jL04kkVo3Cl06GWiU+Duta2Mj868MAp+W2yeEmPN+fT4n 2w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q3ewh245g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Apr 2023 17:46:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33LHkh0S003070
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Apr 2023 17:46:43 GMT
Received: from [10.110.74.190] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 21 Apr
 2023 10:46:42 -0700
Message-ID: <911e0a6e-eae4-8f98-8247-f6b2e8a0aeb9@quicinc.com>
Date:   Fri, 21 Apr 2023 10:46:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: drop the regdma configuration
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230420222558.1208887-1-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230420222558.1208887-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: w6Yci5GPE5d2V36-lsORhT5EfN9QjpFj
X-Proofpoint-GUID: w6Yci5GPE5d2V36-lsORhT5EfN9QjpFj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_08,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 mlxlogscore=725 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304210156
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/20/2023 3:25 PM, Dmitry Baryshkov wrote:
> The regdma is currently not used by the current driver. We have no way
> to practically verify that the regdma is described correctly. Drop it
> now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

As Marijn noted, perhaps we can drop even DPU_CLK_CTRL_REG_DMA. But you 
can add that separately, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
