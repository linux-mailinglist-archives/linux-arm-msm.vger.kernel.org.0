Return-Path: <linux-arm-msm+bounces-40148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 059CC9E2DB0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 21:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C332516657D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 20:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92E7205E28;
	Tue,  3 Dec 2024 20:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="na7BNXZM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006931B21AA
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 20:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733259323; cv=none; b=UL4bYqdzyZbsGvXP3dEU6EX4fEygVsYB2DB+ckzy1MfpN0WdNvGKVFRD6HGmnFipSA3R6cDZPogY4XHbwmroFeSVbUEFzsSH5ZxJi2w69vrGuVxX2oUT7CSMzebnwxraS6qWhg48jUS/bfM2kQHt+96U1Pw/HJhxB9pF0gn0EiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733259323; c=relaxed/simple;
	bh=oamZBH2H4QuG33NsI/TqmSVy+AEJPns6auZzoTfaCK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WB9zA57eI/gLtVprjJ0VSLwRyfAKckSPYeCJNAfZsOPwa0TvBCa19bV1zPyLBQRh9bR5uDFABfVzqiKEiEQPTAMu2MkqO3BnlpHxyrZlDz/8aKrRygsN8Mf7w6W+reutvmoO939fZNZMlPazq0fWvKJ6XkbcmEyHIf45GPIGKPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=na7BNXZM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B39rB3E026498;
	Tue, 3 Dec 2024 20:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VVUPHY8nifO9ntO5Hub7md6TS/E5E2TzeudH7y4R28M=; b=na7BNXZMasrClCrT
	+vMjwU4FaUfoXFe5nkKXQnAkbygRh689rdA2mMix7ZfyhWyJ2t/gGq9t7IHIAEH/
	V5HOA684+V+9WTQU6mwrKMzv/yiGZn0FPsnzsMSmUoF/X94E3v4bs/uQxkTHv2ia
	THXMSxN6Feuda3pZCtCSyxD4G5z3PtSYg+tUnjv5JooaxcxibND0cDErb6SXz8fY
	VIHADFrHyP/7urzHSF40menOniyMYLEzrB+mav32cwDGCpNKlQ3nK5AZg7h7poLW
	28jYdG+izreETVNU4bt9Vv3rfcV5C5orVWY/+zjH02RYwqNwUWLZphlah0Ai998R
	AamQ4w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439yr9hn82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 20:55:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B3KtA2Q005013
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 20:55:10 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 12:55:10 -0800
Message-ID: <fadcaf5d-df41-4b04-b4b5-cd40edf94537@quicinc.com>
Date: Tue, 3 Dec 2024 12:55:09 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/msm/dp: ST_DISPLAY_OFF hpd cleanup
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
 <pzj44gbpadhmfbausv2swkzvh6fhbwxj5a6uw6f3orstjqcmnq@jpdhvdthfkju>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <pzj44gbpadhmfbausv2swkzvh6fhbwxj5a6uw6f3orstjqcmnq@jpdhvdthfkju>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 81B2JQOG7te9OxoCrNbhl1Reo-uHQiEf
X-Proofpoint-GUID: 81B2JQOG7te9OxoCrNbhl1Reo-uHQiEf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030173



On 12/3/2024 5:45 AM, Dmitry Baryshkov wrote:
> On Mon, Dec 02, 2024 at 04:38:59PM -0800, Abhinav Kumar wrote:
>> HPD state machine in msm dp display driver manages the state transitions
>> between various HPD events and the expected state of driver to make sure
>> both match up.
>>
>> Although originally done with the intent of managing userspace interactions
>> and interactions with compliance equipment, over period of time,
>> changes to this piece of code has become quite difficult to manage.
>>
>> Although, unwinding this logic will take some time and will be spread over
>> various changes, to start things, this series tries to get rid of the
>> ST_DISPLAY_OFF state as firstly, its really not an hpd state but a state
>> of the display overall. Coupled with this, there are quite a few checks
>> in the current code, the origins of which need to be re-visited OR are unclear
>> which seem unlikely or redundant. With DP controller on newer chipsets supporting
>> multiple streams, this has become increasingly difficult to work with.
>>
>> This series removes the redundant state checks and simplifies the logic as an
>> attempt to get rid of this ST_DISPLAY_OFF state.
>>
>> Note: This series has been tested with sa8775p and sc7180 devices with multiple
>> monitors and also multiple dongles with no noticeable regressions.
>> Both of these devices use native DP PHY though. Hence, if this series can
>> be verified on some devices with USBC-DP combo PHY with the help of the other
>> developers, that will be great.
> 

Thanks for the review.

> Don't you also have an RB5 (for pmic-typec) and SM83(?)50-HDK for
> pmic-glink?
> 

We have a sm8350HDK (RB5 is busy for CI use), but as usual have not 
being having a great run with setting it up. Hence if you or anyone from 
your side has it already setup, it will be helpful. We will keep trying 
to make our sm8350hdk work meanwhile.

> What kind of userspace were you testing with? Have you tested pure fbcon
> / drm_client?
> 

Yes, the sc7180 was with CrOS userspace.

the sa8775p was with linux-next and pure fbcon. I only made sure 
hotplugs worked and display showed correctly. If something else needs 
validation, let me know.

>>
>> To: Rob Clark <robdclark@gmail.com>
>> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> To: Sean Paul <sean@poorly.run>
>> To: Marijn Suijten <marijn.suijten@somainline.org>
>> To: David Airlie <airlied@gmail.com>
>> To: Simona Vetter <simona@ffwll.ch>
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: freedreno@lists.freedesktop.org
>> Cc: Stephen Boyd <swboyd@chromium.org>
>> Cc: Doug Anderson <dianders@chromium.org>
>> Cc: Johan Hovold <johan@kernel.org>
>> Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>> Abhinav Kumar (4):
>>        drm/msm/dp: remove redundant checks related to ST_DISPLAY_OFF in plug/irq_ipd handlers
>>        drm/msm/dp: remove redundant ST_DISPLAY_OFF checks in msm_dp_bridge_atomic_enable()
>>        drm/msm/dp: replace ST_DISPLAY_OFF with power_on in msm_dp_hpd_unplug_handle()
>>        drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state
>>
>>   drivers/gpu/drm/msm/dp/dp_display.c | 23 ++---------------------
>>   1 file changed, 2 insertions(+), 21 deletions(-)
>> ---
>> base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
>> change-id: 20241202-hpd_display_off-6051aa510f23
>>
>> Best regards,
>> -- 
>> Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
> 

