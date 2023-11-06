Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98A567E2C25
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 19:39:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231800AbjKFSjc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 13:39:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbjKFSjb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 13:39:31 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8835AF
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 10:39:28 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A6HsOej026196;
        Mon, 6 Nov 2023 18:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5v9Ozv28xqt7xzsIePHRUig9LVHYUIs4aWLRgkev1js=;
 b=dV4EKrzcMuFlQi1m0flRL8K1XCSr1iWhW+lH6STd5xuf8NYpQqW4fe+N8qbQaXQ7ar6w
 ob5yagczUumAp0mBT0HU9/hwHR5tneTVNy/YTBgLsKwtRC4nxFlHeTfHr6uUxRWBo5mK
 yS/yhpL+o37FITjTodqLYKB3f8hAakoVo5fKhK8mG37+rIiYLUe/KJw3XcRPx36jaIRL
 aVt98kkiWzUcTnVVEEoKypKBxOzQCrqOvAYc5Fvf54wj8gk6TorDLi9ZZ0MvOEjSA/Aw
 /ywUO9olO1akgcoxZvsv6lS4tehZP8DXuD8IBQFipNHUhTj8LQvaMIVjN26/ekPXnvAx Vw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u5efyn5a6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Nov 2023 18:39:16 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A6IdFCf030479
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 6 Nov 2023 18:39:15 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 6 Nov
 2023 10:39:13 -0800
Message-ID: <e4c94f9d-773a-e894-d655-41afeb01dae1@quicinc.com>
Date:   Mon, 6 Nov 2023 10:38:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: correct clk bit for WB2 block
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20231009171139.2691218-1-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231009171139.2691218-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Q0kYKXlBu7GBLw7oZ4gZjbDzmM1V0c93
X-Proofpoint-ORIG-GUID: Q0kYKXlBu7GBLw7oZ4gZjbDzmM1V0c93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_14,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 mlxscore=0 clxscore=1015
 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311060154
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sorry for the delay in getting back on this. There was quite a bit of 
history digging I had to do myself to give a certain response.


On 10/9/2023 10:11 AM, Dmitry Baryshkov wrote:
> On sc7280 there are two clk bits for WB2: control and status. While
> programming the VBIF params of WB, the driver should be toggling the
> former bit, while the sc7280_mdp struct lists the latter one.
> 

No, this is not correct. Both are control bits. But for the context of 
where this is being used today, that is setting the VBIF OT limit, we 
should be using the VBIF_CLI one. So the below change itself is correct 
but not the commit text.

We need to make the same change on sm8250 WB2 as well as this register 
is present there too. In fact, anything >=msm8994 for setting VBIF OT 
for WB2 we should be using VBIF_CLI bits of register MDP_CLK_CTRL2 
(offset 0x2bc).

For anything >=sm8550, we need to use WB_2_CLK_CTRL present within the 
WB block and not the one in the top.

Hence for this change, we can do below:

-> update the commit text to indicate both are control bits but for the 
vbif ot context we should using the corrected one
-> if you can also add sm8250 in the same change i can ack it and pick it up

Have you re-validated WB with this change? If not, let me know I shall 
while picking this up for -fixes.

> Correct that to ensure proper programming sequence for WB2 on sc7280.
> 
> Fixes: 3ce166380567 ("drm/msm/dpu: add writeback support for sc7280")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 3b5061c4402a..9195cb996f44 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -25,7 +25,7 @@ static const struct dpu_mdp_cfg sc7280_mdp = {
>   		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
>   		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
>   		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
> -		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
> +		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
>   	},
>   };
>   
