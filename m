Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56B016F8760
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 19:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbjEERR4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 13:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbjEERRz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 13:17:55 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3667AD02
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 May 2023 10:17:54 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 345EWrHw026158;
        Fri, 5 May 2023 17:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Tp4NIWjmur/lez2Xv/kTxCHDFtOuYmK5dwTAjr3DR7A=;
 b=gqrBCTZuHp2CG5VPwrHwAy6zdI3FaO2xO9DjiewKWf9JjQeBNUL8KHQsfg5vUNvXqtpF
 v0K5F6Id/VpDXuB88SS72Vb/oacWMIm3T2R6n3qIIhC0g/WoF6hXbqZm+fPFv/BZF/Y8
 os0kDtt8R3QMLSGONaL15HcXdBf2QwCnNs5jDwimXAMMEKkIC0xZukVIWdih+59h/orI
 Kzzm+MbGmUv81OFOxAWXS34TbN7BUF4OD8D9QGkE3kL+mZ+y39rvpOWt9kuhGJB440/T
 uqdG7q6+PgLush5MB4AW4gampwrOfB7U6kD5nJOMPoB8wIGYiI+FLIQbASG6ppFANqdj YQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qckf72a0h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 05 May 2023 17:17:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 345HHbjL011868
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 5 May 2023 17:17:37 GMT
Received: from [10.110.37.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 5 May 2023
 10:17:37 -0700
Message-ID: <563f4a16-fd10-1131-a30b-dda4f67cbbb2@quicinc.com>
Date:   Fri, 5 May 2023 10:17:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [PATCH v2 4/9] drm/msm/dpu: rearrange QoS setting
 code
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        "Stephen Boyd" <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
 <20230502150533.3672840-5-dmitry.baryshkov@linaro.org>
From:   Jeykumar Sankaran <quic_jeykumar@quicinc.com>
In-Reply-To: <20230502150533.3672840-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ESKZ0SwEDYh6UCIjBTOgpixqbAuTWDpr
X-Proofpoint-ORIG-GUID: ESKZ0SwEDYh6UCIjBTOgpixqbAuTWDpr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_23,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050142
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/2/2023 8:05 AM, Dmitry Baryshkov wrote:
> Slightly rearrainge code in dpu_plane_sspp_update_pipe() to group
> QoS/LUT related functions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index b8ed7247a6af..586f089756fa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1079,10 +1079,10 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
>   		pipe->sspp->ops.setup_sourceaddress(pipe, layout);
>   	}
>   
> -	_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
> -
>   	/* override for color fill */
>   	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
> +		_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
> +
>   		/* skip remaining processing on color fill */
>   		return;
>   	}
> @@ -1125,12 +1125,14 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
>   
>   	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
>   	_dpu_plane_set_danger_lut(plane, pipe, fmt);
> +	_dpu_plane_set_qos_ctrl(plane, pipe,
> +				pipe->sspp->idx != SSPP_CURSOR0 &&
> +				pipe->sspp->idx != SSPP_CURSOR1,
> +				DPU_PLANE_QOS_PANIC_CTRL);
>   
>   	if (pipe->sspp->idx != SSPP_CURSOR0 &&
> -	    pipe->sspp->idx != SSPP_CURSOR1) {
> -		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
> +	    pipe->sspp->idx != SSPP_CURSOR1)
>   		_dpu_plane_set_ot_limit(plane, pipe, pipe_cfg, frame_rate);
> -	}
>   
>   	if (pstate->needs_qos_remap)
>   		_dpu_plane_set_qos_remap(plane, pipe);
Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
