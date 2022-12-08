Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 728616479A1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 00:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbiLHXPp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 18:15:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbiLHXPc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 18:15:32 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FE949D89F;
        Thu,  8 Dec 2022 15:15:25 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B8LnO8C026294;
        Thu, 8 Dec 2022 23:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0juxWpALFHMEgxwolf2/TDnlT83IXNhChx4eHjstmeI=;
 b=YbJznNFdQebvyhfh7Fpvk9YzAOBX0rAw7vSwJm/O6yFB1Rv7yt2PRG3iYMjT6nOPDNMN
 TEyXbhhdatpQKBF4KWeb7tM+0C5tSyaqWv0ZLFNZ6r2zAsLWK9QuJBJD/7205ZqBpMH2
 sYnotXQZpo+WGxYMamD230/Oh76EBhmiN3iarKPAO1YosccE44X+hVC3K5TT+GjSGaYJ
 OwrAYUbsZMgr4z0eSTJYZEpUq1CM2NBx6r6kmDMad12GJvXWIKaMsmG+WUaLE5gbOQE1
 Y+tbQp63PcTvpRktJWNIHtbozcAtABaGbTKyTKV0XFjfLDVHeLTY4rshSFfO0VwAuZtG +A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mbr0sr506-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Dec 2022 23:15:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B8NFKql012019
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 8 Dec 2022 23:15:20 GMT
Received: from [10.110.56.119] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 8 Dec 2022
 15:15:18 -0800
Message-ID: <c9401f15-f813-c6f8-f6e1-ac3be4a55404@quicinc.com>
Date:   Thu, 8 Dec 2022 15:15:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v5 09/12] drm/msm/dp: Implement hpd_notify()
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        "Johan Hovold" <johan+linaro@kernel.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20221207220012.16529-1-quic_bjorande@quicinc.com>
 <20221207220012.16529-10-quic_bjorande@quicinc.com>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20221207220012.16529-10-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8ymV8mv1rL2WepVHqoHKfZ95Ojuqp-rK
X-Proofpoint-ORIG-GUID: 8ymV8mv1rL2WepVHqoHKfZ95Ojuqp-rK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-08_12,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212080192
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 12/7/2022 2:00 PM, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> The DisplayPort controller's hot-plug mechanism is based on pinmuxing a
> physical signal on a GPIO pin into the controller. This is not always
> possible, either because there aren't dedicated GPIOs available or
> because the hot-plug signal is a virtual notification, in cases such as
> USB Type-C.
>
> For these cases, by implementing the hpd_notify() callback for the
> DisplayPort controller's drm_bridge, a downstream drm_bridge
> (next_bridge) can be used to track and signal the connection status
> changes.
>
> This makes it possible to use downstream drm_bridges such as
> display-connector or any virtual mechanism, as long as they are
> implemented as a drm_bridge.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> [bjorn: Drop connector->fwnode assignment and dev from struct msm_dp]
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>
> Changes since v4:
> - Look at internal_hpd now that it's introduced before this patch.
>
>   drivers/gpu/drm/msm/dp/dp_display.c | 22 ++++++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_drm.c     |  1 +
>   drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
>   3 files changed, 25 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 095adf528e43..0bee412603fe 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1792,3 +1792,25 @@ void dp_bridge_hpd_disable(struct drm_bridge *bridge)
>   
>   	dp_display->internal_hpd = false;
>   }
> +
> +void dp_bridge_hpd_notify(struct drm_bridge *bridge,
> +			  enum drm_connector_status status)
> +{
> +	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
> +	struct msm_dp *dp_display = dp_bridge->dp_display;
> +	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
> +
> +	/* Without next_bridge interrupts are handled by the DP core directly */
> +	if (dp_display->internal_hpd)
> +		return;
> +
> +	if (!dp->core_initialized) {
> +		drm_dbg_dp(dp->drm_dev, "not initialized\n");
> +		return;
> +	}
> +
> +	if (!dp_display->is_connected && status == connector_status_connected)
> +		dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> +	else if (dp_display->is_connected && status == connector_status_disconnected)
> +		dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> +}
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 9d03b6ee3c41..275370f21115 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -104,6 +104,7 @@ static const struct drm_bridge_funcs dp_bridge_ops = {
>   	.atomic_check = dp_bridge_atomic_check,
>   	.hpd_enable   = dp_bridge_hpd_enable,
>   	.hpd_disable  = dp_bridge_hpd_disable,
> +	.hpd_notify   = dp_bridge_hpd_notify,
>   };
>   
>   struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> index 1f871b555006..250f7c66201f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> @@ -34,5 +34,7 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>   			const struct drm_display_mode *adjusted_mode);
>   void dp_bridge_hpd_enable(struct drm_bridge *bridge);
>   void dp_bridge_hpd_disable(struct drm_bridge *bridge);
> +void dp_bridge_hpd_notify(struct drm_bridge *bridge,
> +			  enum drm_connector_status status);
>   
>   #endif /* _DP_DRM_H_ */
