Return-Path: <linux-arm-msm+bounces-40167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD85B9E3178
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 03:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72DD1285AED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 02:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D7F42A97;
	Wed,  4 Dec 2024 02:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ew5hCMAB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841BD29415
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 02:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733279820; cv=none; b=MxfFcLDPxfgfCChZ2L5uts0DQzUJ4syNslhKmsqGTUyENSKHdStxVFrwc4yXHC++Y9enXNMRFrEri3Wqwxr5oqaaRWVmZFzJgG7/oAlVyp/Vq6mArWGP2nvDicfPr61wZWCWxPrvmCtGX62SqFLpfcFa+MQ2VNl64faa6LwwQqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733279820; c=relaxed/simple;
	bh=y2Mc665t8a3BBdgF9oXThUZp4tPTcUL4caGYm3fBsbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nrp9dyUWzkzvdKw2qNOByawIGYxnqOQbmEIqy8hc3N8TdoRtOY//Amdnd2Rarc5zWKVg0KkAGU1AyCCMzV3jNxSkS3UpzLvyjuyrnKBfCuw4UP9To3ZAcTtLd0k0pxjjqA0/bXPHo1py1ushDt+leXzDw3p8XCAgGqtn6IlFfxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ew5hCMAB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3H9kZ9006043;
	Wed, 4 Dec 2024 02:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3T0mqUa9sTQWb1BXIXhHaYCIxwf//4VB0Ss4dGNzvs=; b=Ew5hCMABEvwYzzbU
	74j3SZx5pp+lAcmq/K8Ac8OJ8uVHT4jCX+N0M2ZpQemiUg/1PnxfScxekAR2XSL8
	dpGhq8pe0G48DX1/twuLoYUy/En56CVsrEi0azWtLauxNrfSUii6TcAXBYD09kC2
	27/tQ7Etu3hM877lWKTEX8vWI6+6ZEp2e71BuzA3Y+DbwJp61KZGqCi1NVhuPjcy
	moJC690cIX5F9HW6se2ZQzk1bOLFlaSesEkj9JuY99eJ/KAH+IHGv/4Tr2RHnYOJ
	JUjL1cMgVknLp/jIJue+NgJ13Wmze/jYbibOCWUQv4FfvZU/VoyPEBD//BzAGpzg
	kO8QPg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w3ejs79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 02:36:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B42akfb029027
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 02:36:46 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 18:36:45 -0800
Message-ID: <41725f98-5c23-47d2-966b-ebd5f4e1c532@quicinc.com>
Date: Tue, 3 Dec 2024 18:36:45 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/msm/dp: remove redundant checks related to
 ST_DISPLAY_OFF in plug/irq_ipd handlers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>,
        "Stephen Boyd" <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        "Johan Hovold" <johan@kernel.org>,
        Bjorn Andersson
	<quic_bjorande@quicinc.com>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
 <20241202-hpd_display_off-v1-1-8d0551847753@quicinc.com>
 <pa3jwxpnipj7lcusioqnjesz4cpgc2oyqgspqqvk2i5kb6ud4k@fi4grx6w5k7d>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <pa3jwxpnipj7lcusioqnjesz4cpgc2oyqgspqqvk2i5kb6ud4k@fi4grx6w5k7d>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: L2e5QloQhN0dgRPNSNM_BHnx-bVK-6QN
X-Proofpoint-ORIG-GUID: L2e5QloQhN0dgRPNSNM_BHnx-bVK-6QN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040021



On 12/3/2024 5:50 AM, Dmitry Baryshkov wrote:
> On Mon, Dec 02, 2024 at 04:39:00PM -0800, Abhinav Kumar wrote:
>> In commit 8ede2ecc3e5ee ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets"),
>> checks were introduced to avoid handling any plug or irq hpd events in
>> ST_DISPLAY_OFF state.
>>
>> Even if we do get hpd events, after the bridge was disabled,
>> it should get handled. Moreover, its unclear under what circumstances
>> these events will fire because ST_DISPLAY_OFF means that the link was
>> still connected but only the bridge was disabled. If the link was untouched,
>> then interrupts shouldn't fire.
> 
> What about the link being untouched, but the monitor being toggled
> somehow, which might generate HPD / attention events?
> 

To confirm my understanding of this, I tested this case again with and 
without a dongle on sc7180.

Without a dongle - When the monitor is powered off and powered on, 
without physically disturbing the cable, it still generates a hotplug 
disconnect event when powered off and hotplug connect event when its 
powered on again.

It gets handled the same way as a user would hotplug it using the cable.

With a dongle - When the monitor is powered off , nothing happens and it 
stays in connected state. When the monitor is powered back on, it 
generates a hotplug disable followed by hotplug enable event. This 
behavior is consistent with or without this series with this dongle.

So from the DP driver point of view, for both these cases, its just 
another hotlplug disconnect/connect.

Both these cases still work fine with these changes.

>>
>> Even in the case of the DP compliance equipment, it should be raising these
>> interrupts during the start of the test which is usually accompanied with either
>> a HPD pulse or a IRQ HPD but after the bridge is disabled it should be fine
>> to handle these anyway. In the absence of a better reason to keep these checks,
>> drop these and if any other issues do arise, it should be handled in a different
>> way.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 10 ----------
>>   1 file changed, 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index aba925aab7ad..992184cc17e4 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -562,11 +562,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
>>   	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>>   			dp->msm_dp_display.connector_type, state);
>>   
>> -	if (state == ST_DISPLAY_OFF) {
>> -		mutex_unlock(&dp->event_mutex);
>> -		return 0;
>> -	}
>> -
>>   	if (state == ST_MAINLINK_READY || state == ST_CONNECTED) {
>>   		mutex_unlock(&dp->event_mutex);
>>   		return 0;
>> @@ -689,11 +684,6 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
>>   	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>>   			dp->msm_dp_display.connector_type, state);
>>   
>> -	if (state == ST_DISPLAY_OFF) {
>> -		mutex_unlock(&dp->event_mutex);
>> -		return 0;
>> -	}
>> -
>>   	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
>>   		/* wait until ST_CONNECTED */
>>   		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
>>
>> -- 
>> 2.34.1
>>
> 

