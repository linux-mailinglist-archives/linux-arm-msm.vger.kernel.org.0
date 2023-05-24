Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6CC71019F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 01:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjEXXUY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 19:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbjEXXUX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 19:20:23 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66CC399
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 16:20:22 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34OMijPi024054;
        Wed, 24 May 2023 23:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=sHWbWoYD+U4m60gnl29hh9XhYZBWFwXBKJId6kvSg40=;
 b=HxbQXMjq3PLHb4yedhkAmDQw53507V/n+dosDK/w09/dlfwgIBkaxV3zl0UQ5QTxpEox
 AJeik7bn+m0vyk2k39JNDDOPyn1UnIgTT+w8HHSVZjq1gPT0Xbakf5pIajKEpS5PNyRp
 ldj/N5z6iV0SBv5ebli3H8y3U7bLTQyfWD17wobDupfz+lmCq0xQaHh2aJqlj4a8DsRu
 nNKzTR+jJOOmng1qFJU/1BWAxye9DArtSeSoXsQYqAaHSCXxE9Q0y40TUi3jaa7MNFgf
 7CqAxhxNH9TMx8jS2x22m1LsON6eGzXIJMTmlNDDBqNQECtzRrwnRiscHXkz3AcBC1oD 6w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qscgmj813-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 May 2023 23:20:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34ONKDML011609
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 May 2023 23:20:13 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 24 May
 2023 16:20:12 -0700
Message-ID: <9142b3b4-9f19-d187-ac06-4db9780ba194@quicinc.com>
Date:   Wed, 24 May 2023 16:20:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 11/13] drm/msm/dpu: add a field describing inline
 rotation to dpu_caps
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-12-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230321011821.635977-12-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Mu_1aw6aEv12hpQT2CZ3RT8SUaW8ZEQZ
X-Proofpoint-ORIG-GUID: Mu_1aw6aEv12hpQT2CZ3RT8SUaW8ZEQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_16,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=669 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240195
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
> We need to know if the platform supports inline rotation on any of the
> SSPP blocks or not. Add this information to struct dpu_caps in a form of
> the boolean field has_inline_rot.
> 

So even for this one, will a helper to detect it from the list of sspps 
be better?

We are now duplicating information from sspp to dpu caps for convenience 
and nothing wrong with it if the helper will get called like every 
atomic check .

But looking at the next patch, it seems we use this information only 
once during dpu_plane_init(), so why not add a helper to find this out?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
>   2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 2d6944a9679a..33527ec7c938 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -489,6 +489,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
>   	.ubwc_version = DPU_HW_UBWC_VER_30,
>   	.has_dim_layer = true,
>   	.has_idle_pc = true,
> +	.has_inline_rot = true,
>   	.max_linewidth = 2400,
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   	.format_list = plane_formats_yuv,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 4847aae78db2..cc64fb2e815f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -400,6 +400,7 @@ struct dpu_rotation_cfg {
>    * @has_dim_layer      dim layer feature status
>    * @has_idle_pc        indicate if idle power collapse feature is supported
>    * @has_3d_merge       indicate if 3D merge is supported
> + * @has_inline_rot     indicate if inline rotation is supported
>    * @max_linewidth      max linewidth for sspp
>    * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
>    * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
> @@ -416,6 +417,7 @@ struct dpu_caps {
>   	bool has_dim_layer;
>   	bool has_idle_pc;
>   	bool has_3d_merge;
> +	bool has_inline_rot;
>   	/* SSPP limits */
>   	u32 max_linewidth;
>   	u32 pixel_ram_size;
