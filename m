Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B012A724DF7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 22:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238464AbjFFU0L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 16:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238434AbjFFU0J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 16:26:09 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4464EB0
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 13:26:08 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356JSORK007294;
        Tue, 6 Jun 2023 20:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=CegxSuHefz46CWRO8MRgykdBbSbVpU0IqieXNCZEbQI=;
 b=p4qnybvdprfWJ3QUrtGs+JtxLsQiSw8YY5qfVc1UTcpm2I8PIl7ikheJZl66BqltbWNZ
 ZjjrPt5OVMIDPtBjzk/pN/haS5yLcCJ3G32RBgw73LPKH/jTaBiHbqRQ7j8+fSXq2qVO
 x8sNOdnfX/X0bITt93YLzR+0KDk0c54UA3NZbVihfK+HPRJZ6VNL2bxlebzNo9uX/YQZ
 7E2P5Hfhcv20eJESfHj2tNBmDeJcTnVSd1jGYEDRNfd6MKNT/bPKJ2Uxjhl1q55CPW+d
 zzeJdQu92zJa50XJYpUvjFl9r4OCuO9FuPg1JSHmIZ9jybSNDo1UylMQ57nfrniBHaRO Og== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r2a7206m9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Jun 2023 20:26:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 356KQ0QK031821
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 6 Jun 2023 20:26:00 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 6 Jun 2023
 13:25:58 -0700
Message-ID: <94d7d0bf-ad61-628b-f10e-2d676ebe3838@quicinc.com>
Date:   Tue, 6 Jun 2023 13:25:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [RFC PATCH v2 04/13] drm/msm/dpu: remove unused
 fields from dpu_encoder_virt
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-5-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230321011821.635977-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WwxZITezK2AlhvYiHINRJypf0SppZEw9
X-Proofpoint-GUID: WwxZITezK2AlhvYiHINRJypf0SppZEw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_15,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306060173
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
> Remove historical fields intfs_swapped and topology fields from struct
> dpu_encoder_virt and also remove even more historical docs.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ----------
>   1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 28729c77364f..4ee708264f3b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -130,18 +130,12 @@ enum dpu_enc_rc_states {
>    *			pingpong blocks can be different than num_phys_encs.
>    * @hw_dsc:		Handle to the DSC blocks used for the display.
>    * @dsc_mask:		Bitmask of used DSC blocks.
> - * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
> - *			for partial update right-only cases, such as pingpong
> - *			split where virtual pingpong does not generate IRQs
>    * @crtc:		Pointer to the currently assigned crtc. Normally you
>    *			would use crtc->state->encoder_mask to determine the
>    *			link between encoder/crtc. However in this case we need
>    *			to track crtc in the disable() hook which is called
>    *			_after_ encoder_mask is cleared.
>    * @connector:		If a mode is set, cached pointer to the active connector
> - * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
> - *				all CTL paths
> - * @crtc_kickoff_cb_data:	Opaque user data given to crtc_kickoff_cb

no concerns with the above 3

>    * @enc_lock:			Lock around physical encoder
>    *				create/destroy/enable/disable
>    * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
> @@ -160,7 +154,6 @@ enum dpu_enc_rc_states {
>    * @delayed_off_work:		delayed worker to schedule disabling of
>    *				clks and resources after IDLE_TIMEOUT time.
>    * @vsync_event_work:		worker to handle vsync event for autorefresh
> - * @topology:                   topology of the display

As we are still going to go ahead with encoder based allocation for now, 
we should keep this topology and start using it for DP DSC's 1:1:1 topology.

>    * @idle_timeout:		idle timeout duration in milliseconds
>    * @wide_bus_en:		wide bus is enabled on this interface
>    * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
> @@ -180,8 +173,6 @@ struct dpu_encoder_virt {
>   
>   	unsigned int dsc_mask;
>   
> -	bool intfs_swapped;
> -
>   	struct drm_crtc *crtc;
>   	struct drm_connector *connector;
>   
> @@ -201,7 +192,6 @@ struct dpu_encoder_virt {
>   	enum dpu_enc_rc_states rc_state;
>   	struct delayed_work delayed_off_work;
>   	struct kthread_work vsync_event_work;
> -	struct msm_display_topology topology;
>   
>   	u32 idle_timeout;
>   
