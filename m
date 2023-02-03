Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89A5868A39F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 21:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbjBCUgy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 15:36:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbjBCUgx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 15:36:53 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D248F276
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 12:36:51 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 313KIg0R027909;
        Fri, 3 Feb 2023 20:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=f21yKrPPHagctXccKELQVfYxYmQKFI8uWVjLFbO2WVw=;
 b=a6vi9tlGvZw/bjhC2QTjElfhgY4cRfzphl1gwqrPpCP7e48/V1cUoHXQ24aYqgrnQGVy
 XpYaqOhL5MYwtPn+HVnxM5KKy1fbx+84R5Fl+moeo64Eq+nKmZOpkIWeYiCVRIu8q/Zi
 sGv9uuGB8KMHqOigyh3JvGCRDtu1gO4992X2Janoi8faxT2/r2YOaOsdUKdN+LgUpu72
 NhHHPTqQ333jmQwD4Fm3jTgit1BHa7l9RcAvue5ryyy6EQ8ZZNjrBcTxqVtwW6rk74wO
 JhH3xTgBtoS4dcQkH1yStnIgFoIoZnaS0O11L0ooYmRHOHMJzwrj6G1ath9O4c1OjXbB Pw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ngw4p9pyf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Feb 2023 20:36:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 313Kahm4010810
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 3 Feb 2023 20:36:43 GMT
Received: from [10.110.99.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 3 Feb 2023
 12:36:42 -0800
Message-ID: <269a4a55-1ae0-ba07-348c-307bd4ae21f2@quicinc.com>
Date:   Fri, 3 Feb 2023 12:36:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 10/27] drm/msm/dpu: clean up SRC addresses when setting
 up SSPP for solid fill
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-11-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230203182132.1307834-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cL962lyab0Je3WRf4oe3iVdeyB6ZZKy0
X-Proofpoint-ORIG-GUID: cL962lyab0Je3WRf4oe3iVdeyB6ZZKy0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_19,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0
 mlxlogscore=926 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030184
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
> Set SSPP_SRCn_ADDR registers to 0 while setting up solid fill, as we can
> not be sure that the previous address is still valid.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I am yet to confirm with HW team if programming 0 stride and 0 address 
is absolutely needed for solid fill or not.

Ideally, in solid fill mode these should just be ignored by the HW.

But this change and the next wont break anything. Should just be a no-op 
for HW.

Hence,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index abf499275242..4c05f4b5e050 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -563,11 +563,16 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
>   static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
>   {
>   	struct dpu_hw_sspp *ctx = pipe->sspp;
> +	struct dpu_hw_sspp_cfg cfg;
>   	u32 idx;
>   
>   	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
>   		return;
>   
> +	/* cleanup source addresses */
> +	memset(&cfg, 0, sizeof(cfg));
> +	ctx->ops.setup_sourceaddress(pipe, &cfg);
> +
>   	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
>   	    pipe->multirect_index == DPU_SSPP_RECT_0)
>   		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR + idx, color);
