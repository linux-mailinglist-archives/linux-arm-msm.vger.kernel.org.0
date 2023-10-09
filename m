Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9EB97BEAF6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 21:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378468AbjJITx5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 15:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378501AbjJITx4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 15:53:56 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7179293
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 12:53:55 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 399JgFtH031449;
        Mon, 9 Oct 2023 19:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=69I0kBj1Qn0tK8jwncgaZyWmFHdBf/e0O9kYfu9879w=;
 b=UZ2psQGnOKy90uPc4xj4jgqShM6NPN22eH9FR2RHKGYpNNXLiDfvfAFuAT7uk5CzUGRF
 5ja77fyjykuye+y/cFB/W565mUV2rvA1XIYHdVXsor2kt4qAdoamBlPJ7Ejzi2MZAhaU
 ZsYKiV4/esEdZazfRIyUUYg8slTGfusJ+OdeVsK9il9sVkTtOB8XfTNLb2musCLH1m8l
 dIudqiY6nqgqsAfg2JfVeQ9B2epOo1IobEfCvjSyY8q3obak+uizUKMCdsGHzmdCfKtX
 kJ/rPJ2yO9YooLH+e8A7NN/fuTxIbt3Gx1SYDvgW++FvJ9CviDjslVLXVxNsak3J/NsU JQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tkhx2kbbt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Oct 2023 19:53:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 399JrimI010796
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 9 Oct 2023 19:53:44 GMT
Received: from [10.110.90.239] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 9 Oct
 2023 12:53:44 -0700
Message-ID: <7be14506-fef2-e72c-ac78-34bcd49b8c52@quicinc.com>
Date:   Mon, 9 Oct 2023 12:53:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 06/13] drm/msm: drop pm ops from the headless msm
 driver
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
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
 <20231009181040.2743847-7-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231009181040.2743847-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EwXjSnWMuZixKESFUaEBGRIGTYmeYolL
X-Proofpoint-ORIG-GUID: EwXjSnWMuZixKESFUaEBGRIGTYmeYolL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_17,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=849
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090160
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/9/2023 11:10 AM, Dmitry Baryshkov wrote:
> The msm_pm_prepare()/msm_pm_complete() only make sense for the
> KMS-enabled devices, they have priv->kms guards inside. Drop global
> msm_pm_ops, which were used only by the headless msm device.
> 
> Reviewed-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 6 ------
>   1 file changed, 6 deletions(-)
> 


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
