Return-Path: <linux-arm-msm+bounces-59433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFF4AC3F7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 14:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96A181894FD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 12:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221181D90A5;
	Mon, 26 May 2025 12:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ckYGNGO+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854DD29CEB;
	Mon, 26 May 2025 12:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748263688; cv=none; b=OQcM+MqYKlidj2cMk9i22+Pw4YTRVDM1844EaT3BuYcit+Zs62tG575dDrngdySNDvAIrijkaltek3M5pdL4k1Ds21/NsjLef9B20DKOXuC1XbGSQTtvpcTanDJHSmNUMBrPj9fl2fDKX0afrU0XkV730dTJ2qhwEKZOezNEjdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748263688; c=relaxed/simple;
	bh=CtLxNGRJ+zvaJ+iL09cI4mvYObV3vDSfpZqsKAL7WZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k8T1TkBwJNhts1QuieaC9a19vfzYTpxUJUlIZw3kDA4BRtzgEus0mYPZxxKIb9of3NnXmry4nHvCHK59iDQfV+x29v8Cc5NWKoSgjnQuQyYXsMA12nas/zAhC1NX3Z22nBKhIPqYhlAPuAfamNGK31imnJnuc+LxG0MzHsopmQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ckYGNGO+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q9j2NH003435;
	Mon, 26 May 2025 12:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oCr/CPKf8U1UzPqdxs6MBqbYJuhYSc+YD9gbt7fVooQ=; b=ckYGNGO+RtcIMoY7
	Nnuf6vBbVXMCP8nMarf8WmaTD7w9qjXGJx5b0bYHUaZxlJMj/1kZLpdDtKq2hN2z
	Fv2UdKxfxzRjZDlwF4VZokZZlIeDrEGZU2kdYTqf1cyeNv2ArXFgyHiAMkEMJAHq
	Cd8zRymkI7Jvx/d8j1T7bN+gzCJv8f1ZAdL8uROJasfeJAVMj3RgXE28BOf/U8ku
	STmwQWwJMww+uF9bpe/9Xb7Id5WC9kF3COOCUCMLb7ByHnMSJ1TY37WCyvapm/u0
	FYR3viQXDtSw67o9k0RGU9dgBubU9KFmN4xjPFy59y7otMOVloB+qSS8hNvgoQ+b
	hW3VJQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vnxa0ean-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 12:47:32 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54QClVFO009444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 12:47:31 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 26 May
 2025 05:47:25 -0700
Message-ID: <3992e14b-7a5c-4787-9bd9-71a2190c1e64@quicinc.com>
Date: Mon, 26 May 2025 20:47:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/45] drm/msm/dp: split dp_ctrl_off() into stream and
 link parts
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        "Chandan
 Uddaraju" <chandanu@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Vara Reddy <quic_varar@quicinc.com>,
        Rob Clark
	<robdclark@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-11-f8618d42a99a@quicinc.com>
 <iplgkmgma3li3jirsxlwr6mrbaepcfhqg2kuz44utvm56vwgpb@4ayjjqehmgw2>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <iplgkmgma3li3jirsxlwr6mrbaepcfhqg2kuz44utvm56vwgpb@4ayjjqehmgw2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tG4sAPLHSz7x2DT2KXGrqE00-hGiiv-x
X-Authority-Analysis: v=2.4 cv=HvJ2G1TS c=1 sm=1 tr=0 ts=683462e4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=GjGlpgBoUSRT_fdPFuAA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tG4sAPLHSz7x2DT2KXGrqE00-hGiiv-x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDEwOCBTYWx0ZWRfX20cJpFM8zIwP
 b/ZEzgN14p9GpaXsZeY5IV5oAiARwYYUH4cTxy2WqNlS+kBCtoUZAjmOJhe3vlxArejYzlRn3AB
 ExZhwEmjLWFXLObrL/OPkj29sVsXd0/uUg0FDkx/7/t+gvpr2qKNQk7ANNIRxupSGDdS79ey+0r
 O8dN/jBF/pI2RziAjejCieHAuOIvkaW91zPf92vLwIKHAwlDG6thys32GOJAYwkIumdJ9ShC3gG
 sO4I+eFoHxuQPN8i1eUfCgKLiZ75qdWlzdguKBiXbunzlrY9+6gmE8vT6M/apgTDf33EmXJb2tB
 eyw7rWn25/kpdOrecZhnzU80DffrSRmseOQO5lJr5k7g0BSFfaAqx7rfWUZ8vKU1ypEuCtxI/4M
 Iijb++3QF2IX+FpTc+aPcrMeapto5kyd92V8t+wQfh+vQCnPGtZSdLXXaQDXXag9var6pFPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_06,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260108



On 2024/12/6 17:14, Dmitry Baryshkov wrote:
> On Thu, Dec 05, 2024 at 08:31:42PM -0800, Abhinav Kumar wrote:
>> Split dp_ctrl_off() into stream and link parts so that for MST
>> cases we can control the link and pixel parts separately.
> 
> Please start by describing the problem.
Got it.
> 
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 29 +++--------------------------
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>>   drivers/gpu/drm/msm/dp/dp_display.c |  4 +++-
>>   3 files changed, 7 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 118f5ed83e464f9f27f813eb39624f9c3189f5ac..485339eb998cc6c8c1e8ab0a88b5c5d6ef300a1f 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1739,7 +1739,8 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>>   	 * running. Add the global reset just before disabling the
>>   	 * link clocks and core clocks.
>>   	 */
>> -	msm_dp_ctrl_off(&ctrl->msm_dp_ctrl);
>> +	msm_dp_ctrl_stream_clk_off(&ctrl->msm_dp_ctrl);
>> +	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);
> 
> Huh? What happened with the rest of the msm_dp_ctrl_off() code sequence?
> It got dropped, but the commit message tells nothing about it.
> 
The function msm_dp_ctrl_off has been split into two parts, 
stream_clk_off and off_link, so it got dropped. This part is a bit 
confusing, will make it clearer.
>>   
>>   	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
>>   	if (ret) {
>> @@ -2042,7 +2043,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>>   	return ret;
>>   }
>>   
>> -static void msm_dp_ctrl_stream_clk_off(struct msm_dp_ctrl *msm_dp_ctrl)
>> +void msm_dp_ctrl_stream_clk_off(struct msm_dp_ctrl *msm_dp_ctrl)
>>   {
>>   	struct msm_dp_ctrl_private *ctrl;
>>   
>> @@ -2110,30 +2111,6 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
>>   		phy, phy->init_count, phy->power_count);
>>   }
>>   
>> -void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
>> -{
>> -	struct msm_dp_ctrl_private *ctrl;
>> -	struct phy *phy;
>> -
>> -	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>> -	phy = ctrl->phy;
>> -
>> -	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
>> -
>> -	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>> -
>> -	msm_dp_catalog_ctrl_reset(ctrl->catalog);
>> -
>> -	msm_dp_ctrl_stream_clk_off(msm_dp_ctrl);
>> -
>> -	dev_pm_opp_set_rate(ctrl->dev, 0);
>> -	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
>> -
>> -	phy_power_off(phy);
>> -	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
>> -			phy, phy->init_count, phy->power_count);
>> -}
>> -
>>   irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
>>   {
>>   	struct msm_dp_ctrl_private *ctrl;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> index 547155ffa50fbe2f3a1f2c2e1ee17420daf0f3da..887cf5a866f07cb9038887a0634d3e1a0375879c 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> @@ -22,7 +22,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>>   int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
>>   void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
>>   void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
>> -void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
>> +void msm_dp_ctrl_stream_clk_off(struct msm_dp_ctrl *msm_dp_ctrl);
>>   void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
>>   irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
>>   void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index c059f749c1f204deac9dfb0c56f537f5545d9acb..b0458bbc89e934ca33ed5af3f2a8ebca30b50824 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -911,7 +911,9 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>>   	if (dp->link->sink_count == 0)
>>   		msm_dp_ctrl_psm_config(dp->ctrl);
>>   
>> -	msm_dp_ctrl_off(dp->ctrl);
>> +	msm_dp_ctrl_stream_clk_off(dp->ctrl);
>> +
>> +	msm_dp_ctrl_off_link(dp->ctrl);
>>   
>>   	/* re-init the PHY so that we can listen to Dongle disconnect */
>>   	if (dp->link->sink_count == 0)
>>
>> -- 
>> 2.34.1
>>
> 


