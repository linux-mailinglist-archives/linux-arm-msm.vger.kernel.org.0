Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B40AF67A6DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 00:27:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbjAXX1w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 18:27:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbjAXX1v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 18:27:51 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C45F8A72
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 15:27:50 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30ONI55s018130;
        Tue, 24 Jan 2023 23:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Ak8eoKgJu40EZO+ItLp7fWxmY28Ot3xSvkGxSIPzfks=;
 b=HaHk2WPn9iAhIgjKyXiEeEx7IP7kohNTJChZIj62xAYFjvH7FvNfEAAMFW7HZbBqkbPU
 vGlCXk6o1BNoqqrdS4kTv6U4YN05mQLdGLOspqh1K7yQs2F9ss0H02HHk76PdEfhUKq8
 eniuA2UmQ56pxaPQ+bTGyQpSW2vt8EgtlGENPQ72OF3qD90vNrSPw0pCputAmmoF1hR6
 L9ukPpw+aAbVWMB1VeyVmPceqh6jHwMNMtKfVApLYHE59JnhwQGESNNCNSWHPQolc+1e
 B6xFwhdgnb2jIqntBxEWesU4xy3RSSt0h6zsnQPV77WkTbn353/2gPp2R9Hx/0wkhJHq PQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3najkh8tkq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Jan 2023 23:27:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30ONRhvt006519
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Jan 2023 23:27:43 GMT
Received: from [10.110.33.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 15:27:42 -0800
Message-ID: <ccedbc6b-fdf6-d44f-b321-818b856cf538@quicinc.com>
Date:   Tue, 24 Jan 2023 15:27:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 3/3] drm/msm/dpu: add missing ubwc_swizzle setting to
 catalog
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
 <20221207142833.204193-4-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221207142833.204193-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8tmxMTf2e57VzGeOtiCbiPKTuJkCwM3i
X-Proofpoint-GUID: 8tmxMTf2e57VzGeOtiCbiPKTuJkCwM3i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-24_17,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=828 clxscore=1015
 lowpriorityscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301240216
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/7/2022 6:28 AM, Dmitry Baryshkov wrote:
> Use the values from the vendor DTs to set ubwc_swizzle in the catalog.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I have already acked https://patchwork.freedesktop.org/patch/519662/

So this can be dropped from this series.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index a1b52b9b16f1..b80cc11a9a83 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -516,6 +516,7 @@ static const struct dpu_mdp_cfg sm6115_mdp[] = {
>   	.base = 0x0, .len = 0x494,
>   	.features = 0,
>   	.highest_bank_bit = 0x1,
> +	.ubwc_swizzle = 0x7,
>   	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
>   		.reg_off = 0x2ac, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> @@ -529,6 +530,7 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
>   	.base = 0x0, .len = 0x494,
>   	.features = 0,
>   	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
> +	.ubwc_swizzle = 0x6,
>   	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
>   			.reg_off = 0x2AC, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> @@ -558,6 +560,7 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
>   	.base = 0x0, .len = 0x494,
>   	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>   	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
> +	.ubwc_swizzle = 0x6,
>   	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
>   			.reg_off = 0x2AC, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
