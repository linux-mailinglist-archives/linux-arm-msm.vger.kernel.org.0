Return-Path: <linux-arm-msm+bounces-42419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFC89F3E20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 00:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE38B16DE33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 23:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D234A1D5178;
	Mon, 16 Dec 2024 23:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YpRr3oEa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B4381ACA;
	Mon, 16 Dec 2024 23:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734390965; cv=none; b=YLvV829Nlz045+n+Y9QLUhqYQXNhEPxds4qUg6xDZcMKkHEArlS5w2PsB4w9XMhZ0+M5Q5Sr33mENgLz3kFHQR5gLmL4edhKDwcKt9tTxmh6TGt776svF7rRdGXtUn3kDo6J+E/r58XqxGzztbyCuo6IYhjEqmeIyaY/O+4b8lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734390965; c=relaxed/simple;
	bh=Yxp9dnI6llKcQvkHicLeQ8awAJIKCtfSuuX57CBwpss=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iqmHjxohEw+VnmKko2jDOftniYYiC9y2g8ngDt0+fDVkk57xqDbnguJwudPv8UDdxjRiqkrLtzH5/E+3M49dL+gaueB/rYJGIMS0q/KrGfuGHB87TjYR4+Z8ElwjosyB+ckQKavq8X8sq6lAM/0+6vrogWfafrNsNScWgfxBgTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YpRr3oEa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGKtPMW012689;
	Mon, 16 Dec 2024 23:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C6if4xr6MsuydTIX9/EohnHTK91u3Ps3oBFjjYhkPwk=; b=YpRr3oEaX5vyGVR5
	XazwAZkmFMNhZnD2bro3PxLlYf1C8hANRycsvKNRVlb1/SiUbPky3lYcnNzIGabk
	OFrJdF2VOkSs6IUVAzv4Vf0s+8IxSQtKDmHpW6M508Lm5y5TVmHCqjJne+Jl2Mje
	1YufEq+s5XBHJJqMwn4dgh7taQzO8xbKrIb6+Bke6TlogpL+55Bpp3fKerDTFOIH
	0nge8vdFCyoxJl4J9BX/KXI7HAdE4KXZll3Le0poEPSelhmuUEqgmP660D5bLW5w
	Gs76tKm3eBZFsumlAYGH7jKZqZ6J7ZhjoXFOQOzKsa9Zfc3aQiXLKkMZKJGiLpXq
	kRpJiA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43junjg8aa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 23:15:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGNFsaW031816
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 23:15:54 GMT
Received: from [10.110.119.169] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 15:15:53 -0800
Message-ID: <f47fb29b-ae6a-4f6c-acc8-79f436560808@quicinc.com>
Date: Mon, 16 Dec 2024 15:15:52 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/16] drm/msm/dp: use msm_dp_utils_pack_sdp_header()
 for audio packets
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Paloma Arellano <quic_parellan@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
 <20241216-fd-dp-audio-fixup-v4-2-f8d1961cf22f@linaro.org>
 <0cbe48cd-b830-444a-8de0-529343d86192@quicinc.com>
 <wfgn4oomnlsgckazp6z2cqoj5lk76gd5wmphrg6kwiomfvo2j2@rinnzg2ml7is>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <wfgn4oomnlsgckazp6z2cqoj5lk76gd5wmphrg6kwiomfvo2j2@rinnzg2ml7is>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KxcEQAIwMY25EuhGXjoA_HgnJ-p2zP9p
X-Proofpoint-GUID: KxcEQAIwMY25EuhGXjoA_HgnJ-p2zP9p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=739 clxscore=1015 suspectscore=0 malwarescore=0
 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160190



On 12/16/2024 2:24 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 16, 2024 at 11:32:57AM -0800, Abhinav Kumar wrote:
>>
>>
>> On 12/15/2024 2:44 PM, Dmitry Baryshkov wrote:
>>> Use msm_dp_utils_pack_sdp_header() and call msm_dp_write_link() directly
>>> to program audio packet data. Use 0 as Packet ID, as it was not
>>> programmed earlier.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/dp/dp_audio.c   | 268 ++++++------------------------------
>>>    drivers/gpu/drm/msm/dp/dp_catalog.c |  71 ++++++++++
>>>    drivers/gpu/drm/msm/dp/dp_catalog.h |  10 ++
>>>    3 files changed, 122 insertions(+), 227 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
>>> index 5cbb11986460d1e4ed1890bdf66d0913e013083c..46fbf8601eea8e43a152049dfd1dc1d77943d922 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
>>> @@ -14,6 +14,7 @@
>>>    #include "dp_catalog.h"
>>>    #include "dp_audio.h"
>>>    #include "dp_panel.h"
>>> +#include "dp_reg.h"
>>
>> This change still does reg writes through catalog. Why do you need to
>> include dp_reg.h here?
> 
> A leftover from the previous patchset.

Feel free to add my

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Once this include is dropped.

> 
>>
>>>    #include "dp_display.h"
>>>    #include "dp_utils.h"
> 

