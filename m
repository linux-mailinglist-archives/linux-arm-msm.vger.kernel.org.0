Return-Path: <linux-arm-msm+bounces-3014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EC7801988
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 02:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BE6C281C63
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 01:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C562138D;
	Sat,  2 Dec 2023 01:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xboy6nBA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E76116
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 17:34:09 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B21DZNC030119;
	Sat, 2 Dec 2023 01:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=SSLTIQcGQ1pdAOqiZJ/2aRqYuOT51p1NgTlcKFEcBeM=;
 b=Xboy6nBA3WqyoH5ZZODxa/WhNfGCfQuRNNgZnpGg2jRSQ3Mt092EZO3Icz57bFJJnxk3
 EnOobHgPXTbimw1vmiD2c/mWkujMKiCUCRxo7VKZc8aQ/7Hfy5QiRif3xxHIoVUm9tu+
 yb1FI/OS1hPMwFryBwpAN1RlW/rG0be90JYFSK7YlkW582nPyTAHcVrq8vWvu2y09kfn
 dIks7WfxPiI9D8TWPI3As1udAeDNDNGn5pa2TKw+BnqFEbQZ9JG+bkMV4CcTEvQWGuJk
 wvTJd0TpO7vD1HWi9GCAYyS6vtudB5gn8yKRuNSX0PccEWkUeAp6lsBo5tKIKG7SEWjS BA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq3r2kb5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Dec 2023 01:33:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B21XtU6006096
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 2 Dec 2023 01:33:55 GMT
Received: from [10.110.73.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 17:33:55 -0800
Message-ID: <5a53b8b9-bd8a-0bbe-2641-8983509e8a7a@quicinc.com>
Date: Fri, 1 Dec 2023 17:33:54 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 17/17] drm/msm: drop mdp_get_formats()
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        <dri-devel@lists.freedesktop.org>, Stephen
 Boyd <swboyd@chromium.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
 <20230708010407.3871346-18-dmitry.baryshkov@linaro.org>
 <47e95721-3113-3444-44e9-b162ac08c0e5@quicinc.com>
In-Reply-To: <47e95721-3113-3444-44e9-b162ac08c0e5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BxbkFOB6ndTBCbS4dyn3s4re2smFszAP
X-Proofpoint-ORIG-GUID: BxbkFOB6ndTBCbS4dyn3s4re2smFszAP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxlogscore=742 bulkscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020008



On 12/1/2023 5:25 PM, Abhinav Kumar wrote:
> 
> 
> On 7/7/2023 6:04 PM, Dmitry Baryshkov wrote:
>> Drop the function mdp_get_formats(), which became unused after
>> converting both MDP4 and MDP5 planes to use static formats arrays.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/mdp_format.c | 24 ------------------------
>>   drivers/gpu/drm/msm/disp/mdp_kms.h    |  1 -
>>   2 files changed, 25 deletions(-)
>>
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Actually, I have one concern with patch 1 and patch 17 of this series.

You cannot get rid of static const struct mdp_format formats[] because 
mdp_get_format() still uses it.

Now, we end up having to maintain two arrays to hold the formats, the 
already existing formats[] one and newly added  mdp_rgb_formats[] and 
mdp_rgb_yuv_formats[].

This is an overkill.

I am fine with overall migrating to drmm-managed APIs but I think patch 
1 and this one are not necessary.

