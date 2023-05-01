Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 946ED6F3636
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbjEAStV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbjEAStT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:49:19 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E456CB6
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 11:49:18 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 341IRmJs031077;
        Mon, 1 May 2023 18:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=hVjorRTiAEpDUw9YlIjeJau77bm6NcDSrvcvnTirApI=;
 b=j7G8UEev4t3SKmrgMqsXSWXGdyL1z7MigHsmi/NCUENY7YY90av0wu1trAUd3ZRSWh1H
 8cuGHEf3hHfT4EGMEARviRrf5ccD4itlNqondpHE8FE+A+oylkBDyGY0D3+skyQcV0ff
 LMMkJmf4tYF0Tj9rPTHAh1n9vs0ITvWvCY12WzTSTC8bdpgwPDPFZIcGWyA1/N74Fu6F
 LrYyDr1m53FpQtIu7fEINOk7tHe0xVqCV1IxbxNJq52iVRAXbdiLgGhseEqpPgeJze67
 qzFo03sJN4+sS8RJTiplmAAdo/Yu1+guVc+cHtQURaa8kbnpu9GcgKFYKUPEDYa913Ow pQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q8vhgvbcc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 01 May 2023 18:49:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 341In72v027951
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 1 May 2023 18:49:07 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 1 May 2023
 11:49:06 -0700
Message-ID: <61997e7e-1a4f-8b1d-1a7d-a1ed802ae83d@quicinc.com>
Date:   Mon, 1 May 2023 11:49:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3] drm/msm/dpu: drop unused SSPP sub-block information
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230429212512.2947245-1-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230429212512.2947245-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NC9Q3yfR6IHhs_jEX9wx-fQ6oAS1skly
X-Proofpoint-ORIG-GUID: NC9Q3yfR6IHhs_jEX9wx-fQ6oAS1skly
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-01_11,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305010154
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/29/2023 2:25 PM, Dmitry Baryshkov wrote:
> The driver  doesn't support hsic/memcolor and pcc SSPP subblocks.
> Drop corresponding definitions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Changes since v2:
> - Fixed commit message to remove igc block mention.
> 
> Changes since v1:
>   - Rebased on top of https://patchwork.freedesktop.org/patch/534725/?series=117130&rev=1
> 
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 69d1f1e59db1..b2831b45ac64 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -380,9 +380,6 @@ struct dpu_caps {
>    * @qseed_ver: qseed version
>    * @scaler_blk:
>    * @csc_blk:
> - * @hsic:
> - * @memcolor:
> - * @pcc_blk:

pcc_blk is still there. So this should be dropped. Once that is fixed,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

>    * @format_list: Pointer to list of supported formats
>    * @num_formats: Number of supported formats
>    * @virt_format_list: Pointer to list of supported formats for virtual planes
> @@ -399,9 +396,6 @@ struct dpu_sspp_sub_blks {
>   	u32 qseed_ver;
>   	struct dpu_scaler_blk scaler_blk;
>   	struct dpu_pp_blk csc_blk;
> -	struct dpu_pp_blk hsic_blk;
> -	struct dpu_pp_blk memcolor_blk;
> -	struct dpu_pp_blk pcc_blk;
>   
>   	const u32 *format_list;
>   	u32 num_formats;
