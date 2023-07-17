Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68D19756C5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jul 2023 20:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbjGQSpQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jul 2023 14:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbjGQSpP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jul 2023 14:45:15 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A15A1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 11:45:14 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36HHjS2Y021908;
        Mon, 17 Jul 2023 18:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=iWSq1bYD3DoW6tvSA6KzBX99cGqJ4u2o15xxCTEBkIo=;
 b=aNkVDxuObl79FYAkTUH2bt3LSwePXgOK4Bg3QIgExT+nuLbx4Y0/+PMC4GucXTVJfNLj
 353OnvfHUxvPuIdqiUcpASCDCmlzC7ueyKg6Rm7Z6KCKB+hzUtMh78y8tCdUW+ZYS/qy
 0DzjN4UI0IK1ZVkg+Q6lU6GSfx7FxSLeb14+EZr5xIEjSQ+KY/1HHQZuYqLcexDxJ/oV
 xayFLLCE5deWPRIvtD+SckjOu4WvX8v3HyYla/x2W2NiZ6/7DRsFSWUSqpXjcaWBHJoR
 xksWg4WXkzFD9AIPBkbtuiq9LbMZNWHFLAw9kbNfhO/Tj19zJVYT+n5EqG1OGsBlN10b qQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3run1evaxk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Jul 2023 18:45:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36HIj1VG000411
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Jul 2023 18:45:01 GMT
Received: from [10.110.91.201] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 17 Jul
 2023 11:45:01 -0700
Message-ID: <9c594fdb-095d-0c3f-cdd0-bd92304b42cb@quicinc.com>
Date:   Mon, 17 Jul 2023 11:45:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 02/11] drm/msm/dpu: core_perf: extract bandwidth
 aggregation function
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
References: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
 <20230712221139.313729-3-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230712221139.313729-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PhVU7Srcolx33UvKgX0alhc6d7Cw0YYN
X-Proofpoint-ORIG-GUID: PhVU7Srcolx33UvKgX0alhc6d7Cw0YYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_13,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307170171
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/12/2023 3:11 PM, Dmitry Baryshkov wrote:
> In preparation to refactoring the dpu_core_perf debugfs interface,
> extract the bandwidth aggregation function from
> _dpu_core_perf_crtc_update_bus().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Drop the core_perf tag from the subject line.

The debugfs refactor was dropped from this series if thats what you are 
referring to here.

So even this and the next patch dont serve any purpose in this series 
and should be dropped, Unless you have some reason of keeping them here.

>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 39 +++++++++++--------
>   1 file changed, 22 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 1d9d83d7b99e..333dcfe57800 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -206,33 +206,38 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>   	return 0;
>   }
>   
> -static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> -		struct drm_crtc *crtc)
> +static void dpu_core_perf_aggregate(struct drm_device *ddev,
> +				    enum dpu_crtc_client_type curr_client_type,
> +				    struct dpu_core_perf_params *perf)
>   {
> -	struct dpu_core_perf_params perf = { 0 };
> -	enum dpu_crtc_client_type curr_client_type
> -					= dpu_crtc_get_client_type(crtc);
> -	struct drm_crtc *tmp_crtc;
>   	struct dpu_crtc_state *dpu_cstate;
> -	int i, ret = 0;
> -	u64 avg_bw;
> +	struct drm_crtc *tmp_crtc;
>   
> -	drm_for_each_crtc(tmp_crtc, crtc->dev) {
> +	drm_for_each_crtc(tmp_crtc, ddev) {
>   		if (tmp_crtc->enabled &&
> -			curr_client_type ==
> -				dpu_crtc_get_client_type(tmp_crtc)) {
> +		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
>   			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
>   
> -			perf.max_per_pipe_ib = max(perf.max_per_pipe_ib,
> -					dpu_cstate->new_perf.max_per_pipe_ib);
> +			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
> +						    dpu_cstate->new_perf.max_per_pipe_ib);
>   
> -			perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
> +			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
>   
> -			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu paths:%d\n",
> -				  tmp_crtc->base.id,
> -				  dpu_cstate->new_perf.bw_ctl, kms->num_paths);
> +			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
> +					 tmp_crtc->base.id,
> +					 dpu_cstate->new_perf.bw_ctl);
>   		}
>   	}
> +}
> +
> +static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> +		struct drm_crtc *crtc)
> +{
> +	struct dpu_core_perf_params perf = { 0 };
> +	int i, ret = 0;
> +	u64 avg_bw;
> +
> +	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
>   
>   	if (!kms->num_paths)
>   		return 0;
