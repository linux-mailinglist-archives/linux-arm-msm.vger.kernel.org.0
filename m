Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36CDA70CE03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 00:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233801AbjEVWdb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 18:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjEVWdb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 18:33:31 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E539FE
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 15:33:23 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34MMVBVG024700;
        Mon, 22 May 2023 22:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=j4dG57iCboESc8JEF4XbuRwva+0MsHiFJYyZcPoKCeY=;
 b=AiS0r8ORdZh23i/ozjIHtJ1KNsJpqOfNH8T+PmaXaE2hM/Sv9/VxmJHrvmo85eWIzxmB
 n23hDuRz2Dtn9SJzs/B1BmP40eQHKBxSr1feNZ0ac+ZtkOpvTsbgfkvS+PkWY8zTfzBy
 pARCkHfTmao/coC116IbJhayOjSNViQjv2HVLHOyJpiAkqk0lT4DEweeE4XuFinPWVwt
 zPqykgPtUD6Be7IbETCvA1CsmqhPEtyT0TRsnRcxtKZ9QYfARIfniIHtkhSTUv8IHFW9
 LPU+ho8JeJGZTV5gWh4YE95CX18fT8u1I7c1lebA3E9ttG2GfXWVeHYyjWg0KnMomTbt Ig== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qraasrvr3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 May 2023 22:33:14 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34MMXDVh020892
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 May 2023 22:33:13 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 22 May
 2023 15:33:13 -0700
Message-ID: <b00ec9ff-475e-0fe9-179b-304edbb14203@quicinc.com>
Date:   Mon, 22 May 2023 15:33:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] drm/msm/dsi: remove extra call to
 dsi_get_pclk_rate()
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
CC:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230520200103.4019607-1-dmitry.baryshkov@linaro.org>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230520200103.4019607-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MFgfBBGXD7KukFynQTxuVTcoOWWqCowt
X-Proofpoint-ORIG-GUID: MFgfBBGXD7KukFynQTxuVTcoOWWqCowt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_16,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220190
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/20/2023 1:01 PM, Dmitry Baryshkov wrote:
> In dsi_calc_clk_rate_v2() there is no need to call dsi_get_pclk_rate().
> This function has just been called (from dsi_calc_pclk()) and its
> result is stored at msm_host->pixel_clk_rate. Use this variable
> directly.

Hi Dmitry,

LGTM.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Changes since v1:
>   - Fix typos in commit message (Marijn)
> 
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 961689a255c4..2b257b459974 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -633,7 +633,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   
>   	dsi_calc_pclk(msm_host, is_bonded_dsi);
>   
> -	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) * bpp;
> +	pclk_bpp = (u64)msm_host->pixel_clk_rate * bpp;
>   	do_div(pclk_bpp, 8);
>   	msm_host->src_clk_rate = pclk_bpp;
>   
> -- 
> 2.39.2
> 
