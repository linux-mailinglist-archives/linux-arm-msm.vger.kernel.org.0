Return-Path: <linux-arm-msm+bounces-13863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E058786D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 18:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D126281B2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 17:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9327C52F78;
	Mon, 11 Mar 2024 17:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hTyIn061"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D289A52F61;
	Mon, 11 Mar 2024 17:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710179858; cv=none; b=lIVdgYNEmvNRX8G9ivnRnc62fIGZX0GTxL2QPrfSCXq2PPlItTay1iCw1BfbjpHkWLxRsNrvKhLgs9QaGW7DEwFdvF6LhLB6RfrPKBE1N603qjq5e7cCxwQd/MNBqDib4XJ3aS87BIraXQthhYF+N+9ISzTa/tHepC5/lyNJpB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710179858; c=relaxed/simple;
	bh=nenLp6Iozx7BggIrKYWt4FxcGS4sna5rFGPPrwcIRXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OZQTGV9oDjDrb2yys4j6MS7kfaxmfZYEb8/YY8jU7Pn2uvuQr5rH6sUHUAvMB1wyq5ORRPsbSflX0cxRlTnbjGNQpclOvVly+RyzKCUAMeMnQVJ20cfx3Qf9JdlPGeAXmHeenjcAzIhp3o6Q8+H/HU2CMn6EPpDg3yCgegqqclc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hTyIn061; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42B8UEPR010665;
	Mon, 11 Mar 2024 17:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=+BdaFrwNgX3LEXWnHtSpoGJGl5G3NqlZlETyFowVpWM=; b=hT
	yIn061GCDQXqgsgtQ03x860vREnY+H0Li4pmgt+MXbm/Vq3eFrnEClYU3PB3esVA
	C7Boq4qpCXlalLIyxGVe5xaLERdTJ9YD88tBlLPutbOa/8H5C3oSlDUQjzx0N3pi
	9QZuNTwXP8brlyWoPBqwKxQkSdy7QOQDqh1Zu4aZmLTrSEAnva/aYWAtkJAjkzPM
	kXnhyM3sLjZiBmNXF9O90gM2Vj10uFbCrrGkiRrLf1wBzanMusA3EMK1RvvOrgxu
	pilsBUG2uqrA8gTMXBwH5Ayd0fVIgk7nVm4IYHThJHSDwoD9W8qxA7mJIGbb0jTy
	boSvu2SccQrwz+6iTcEA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wsx48snmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 17:57:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42BHvD2r020790
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 17:57:13 GMT
Received: from [10.110.0.139] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Mar
 2024 10:57:12 -0700
Message-ID: <1fb0d3b1-4248-f7eb-4d67-5c1b15082fc1@quicinc.com>
Date: Mon, 11 Mar 2024 10:57:03 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/msm/dp: move link_ready out of HPD event thread
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        "Marijn Suijten" <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <swboyd@chromium.org>,
        <quic_jesszhan@quicinc.com>, <quic_parellan@quicinc.com>,
        <johan@kernel.org>, <quic_bjorande@quicinc.com>,
        Rob Clark <robdclark@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240308214532.1404038-1-quic_abhinavk@quicinc.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20240308214532.1404038-1-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YqMFmqfM_C1fyOnyvSMx2GDfS3K5YZXv
X-Proofpoint-ORIG-GUID: YqMFmqfM_C1fyOnyvSMx2GDfS3K5YZXv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-11_10,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=999
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403110136


On 3/8/2024 1:45 PM, Abhinav Kumar wrote:
> There are cases where the userspace might still send another
> frame after the HPD disconnect causing a modeset cycle after
> a disconnect. This messes the internal state machine of MSM DP driver
> and can lead to a crash as there can be an imbalance between
> bridge_disable() and bridge_enable().
>
> This was also previously reported on [1] for which [2] was posted
> and helped resolve the issue by rejecting commits if the DP is not
> in connected state.
>
> The change resolved the bug but there can also be another race condition.
> If hpd_event_thread does not pick up the EV_USER_NOTIFICATION and process it
> link_ready will also not be set to false allowing the frame to sneak in.
>
> Lets move setting link_ready outside of hpd_event_thread() processing to
> eliminate a window of race condition.
>
> [1] : https://gitlab.freedesktop.org/drm/msm/-/issues/17
> [2] : https://lore.kernel.org/all/1664408211-25314-1-git-send-email-quic_khsieh@quicinc.com/
>
> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Kuogee Hsieh<quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 068d44eeaa07..e00092904ccc 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -345,8 +345,6 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>   							 dp->panel->downstream_ports);
>   	}
>   
> -	dp->dp_display.link_ready = hpd;
> -
>   	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
>   			dp->dp_display.connector_type, hpd);
>   	drm_bridge_hpd_notify(bridge, dp->dp_display.link_ready);
> @@ -399,6 +397,8 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>   		goto end;
>   	}
>   
> +	dp->dp_display.link_ready = true;
> +
>   	dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>   
>   end:
> @@ -466,6 +466,8 @@ static int dp_display_notify_disconnect(struct device *dev)
>   {
>   	struct dp_display_private *dp = dev_get_dp_display_private(dev);
>   
> +	dp->dp_display.link_ready = false;
> +
>   	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
>   
>   	return 0;
> @@ -487,6 +489,7 @@ static int dp_display_handle_port_status_changed(struct dp_display_private *dp)
>   		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
>   		if (dp->hpd_state != ST_DISCONNECTED) {
>   			dp->hpd_state = ST_DISCONNECT_PENDING;
> +			dp->dp_display.link_ready = false;
>   			dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
>   		}
>   	} else {

