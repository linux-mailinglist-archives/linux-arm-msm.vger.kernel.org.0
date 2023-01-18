Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19C9F670F47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 02:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjARBBN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 20:01:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbjARBAs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 20:00:48 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7E431E07
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 16:51:19 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30I0DXvu021609;
        Wed, 18 Jan 2023 00:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0oFNSgobXUUM9oCz8KRauApQw3OnJ2oFQ86MrqoAyjg=;
 b=PLkGdo8rMtpYLSDNMIA/4doRTjwzZmQf8cDwR4KdTxtTL1JhDfpso5exUraZ/cuL7s3K
 tIVvCPFhUKOUDZb1OTlIBMIgQCRsA5ULB1XHIFsH/M0s0xGnf0nADki8vo7fXfrDW/OC
 VnJXtOHtNdmK0yrdtNGCpHTiFrJVUt9hWSsC//87+/lRJL16DM3hg6D1p6nwO+JxQr/a
 C9P3XQzYwZWr+MqhDiEiifylT9XzJYsyk5dtMvSQiEykAZhpuRIH0FU7v7TP86kXjJDW
 WTP2bXOF88iwnB/SregWRvl5x7zYXb/Bxgb5JGJqwlbzuKY0vu2kV6lG/wRDnp8Cu8h1 gQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n5ws6h534-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 Jan 2023 00:51:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30I0p4QT026483
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 Jan 2023 00:51:04 GMT
Received: from [10.110.108.90] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 17 Jan
 2023 16:51:03 -0800
Message-ID: <1f816962-6adf-f798-462a-5629e8eab47a@quicinc.com>
Date:   Tue, 17 Jan 2023 16:51:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: merge two CRTC debugfs dirs
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230112053659.1361298-1-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230112053659.1361298-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LJI62U7f3SlCC2ZFd4xPyEEobQl29W5x
X-Proofpoint-ORIG-GUID: LJI62U7f3SlCC2ZFd4xPyEEobQl29W5x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_11,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 mlxscore=0
 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301180003
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/11/2023 9:36 PM, Dmitry Baryshkov wrote:
> For each CRTC we are creating two different debugfs directories one
> using crtc index (created automatically for the CRC files) and another
> one using CRTC name/object ID (for state and status files).
> 
> This can be confusing, so move our custom files to crtc->debugfs_entry,
> effetively merging two debugfs dirs.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Makes sense to me and also verified it on my chromebook.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 7f0f467dbabd..659fdfec5346 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1380,16 +1380,12 @@ DEFINE_SHOW_ATTRIBUTE(dpu_crtc_debugfs_state);
>   static int _dpu_crtc_init_debugfs(struct drm_crtc *crtc)
>   {
>   	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> -	struct dentry *debugfs_root;
> -
> -	debugfs_root = debugfs_create_dir(dpu_crtc->name,
> -			crtc->dev->primary->debugfs_root);
>   
>   	debugfs_create_file("status", 0400,
> -			debugfs_root,
> +			crtc->debugfs_entry,
>   			dpu_crtc, &_dpu_debugfs_status_fops);
>   	debugfs_create_file("state", 0600,
> -			debugfs_root,
> +			crtc->debugfs_entry,
>   			&dpu_crtc->base,
>   			&dpu_crtc_debugfs_state_fops);
>   
