Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13B8E67A446
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 21:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234337AbjAXUuB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 15:50:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234486AbjAXUuA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 15:50:00 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A5E950859
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 12:49:59 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30OJGbu5013560;
        Tue, 24 Jan 2023 20:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=H8XZKS/rOKSyASNPB+8qCF6wuAsfgIzgrS5PM6dAFe8=;
 b=f1DQCFa5p2GQ4w2L//tujcvloqPpH36bkiyOavopT6d3DLahqaxCTs5Klo4Rwk5idORg
 LMxrlg86CKUwQJvIutej5M8fPr92R9ODnog0byUClEgrtDdgUYzjN4fjKdeRUCfQEt4D
 ZrodqjhzCyiTH2TYvAxDY1WoESmeYvDSQ2RF2RDgIoted3JhfkQIl/NbsiW3Qo0Jvuut
 /2MgfCmSbO7sGjnmVTsGFTL1ysYSPSTJdaUhzrKOGMCEP0ag3jUIFbGVfQefSyI5FJxz
 xYlCmXeQq75fjTm5Nq/7GmSqMd9qHbfoYh0p0CRd69X5G3DcxsaS6/vnck70stBy0iXg Ww== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nanb684uw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Jan 2023 20:49:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30OKnpu6019940
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Jan 2023 20:49:51 GMT
Received: from [10.110.33.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 12:49:50 -0800
Message-ID: <c6d99a2d-4dcc-b7a9-3bf3-01cd6f563635@quicinc.com>
Date:   Tue, 24 Jan 2023 12:49:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dsi: properly handle the case of empty OPP table
 in dsi_mgr_bridge_mode_valid
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230124203600.3488766-1-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230124203600.3488766-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: H8koFr1UVfvHc2H-YUMNRPv_WLlepY2P
X-Proofpoint-GUID: H8koFr1UVfvHc2H-YUMNRPv_WLlepY2P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-24_15,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301240192
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/24/2023 12:36 PM, Dmitry Baryshkov wrote:
> It was left unnoticed during the review that even if there is no OPP
> table in device tree, one will be created by a call to the function
> devm_pm_opp_set_clkname(). This leads to dsi_mgr_bridge_mode_valid()
> rejecting all modes if DT contains no OPP table for the DSI host.
> 
> Rework dsi_mgr_bridge_mode_valid() to handle this case by actually
> checking that the table is populated with frequency entries before
> returning an error.
> 
> Fixes: 8328041b8c82 ("drm/msm/dsi: implement opp table based check for dsi_mgr_bridge_mode_valid()")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index b20fddb534a7..1bbac72dad35 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -456,18 +456,19 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
>   
>   	byte_clk_rate = dsi_byte_clk_get_rate(host, IS_BONDED_DSI(), mode);
>   
> -	/*
> -	 * fail all errors except -ENODEV as that could mean that opp
> -	 * table is not yet implemented
> -	 */
>   	opp = dev_pm_opp_find_freq_ceil(&pdev->dev, &byte_clk_rate);
> -	if (IS_ERR(opp)) {
> -		if (PTR_ERR(opp) == -ERANGE)
> +	if (!IS_ERR(opp)) {
> +		dev_pm_opp_put(opp);
> +	} else if (PTR_ERR(opp) == -ERANGE) {
> +		/*
> +		 * An empty table is created by devm_pm_opp_set_clkname() even
> +		 * if there is none. Thus find_freq_ceil will still return
> +		 * -ERANGE in such case.
> +		 */
> +		if (dev_pm_opp_get_opp_count(&pdev->dev) != 0)
>   			return MODE_CLOCK_RANGE;
> -		else if (PTR_ERR(opp) != -ENODEV)
> -			return MODE_ERROR;
>   	} else {
> -		dev_pm_opp_put(opp);
> +			return MODE_ERROR;
>   	}
>   
>   	return msm_dsi_host_check_dsc(host, mode);
