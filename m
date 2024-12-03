Return-Path: <linux-arm-msm+bounces-40142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BFC9E2C37
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 20:42:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9940165BC4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 19:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86CA1FA161;
	Tue,  3 Dec 2024 19:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YAJe7iUt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A301F9F6C;
	Tue,  3 Dec 2024 19:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733254976; cv=none; b=OPL92tdGcji2++F0D3mf+sCTP7fvXri8GXO2p3Vt/MM44Xd8lGNWTi9dzrb7NLz5yHWUUplJruthV6xJFfE4cOiq807fJ/e4P5L+PvHYh6cLRdrL0raya+sRkvO8QUNz2uWd+vKTuN/sc4WFQPGbuVewrBXgNMdgITMcSfVi2So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733254976; c=relaxed/simple;
	bh=XPvrZGB6rFhA//poGTIcqJOfXf+IxPuK8vN2qtrT8FY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KdjrV2sqnjGljNPH3/5uVbOBoSTxN3npaSptjO9l1nm1Q0JHDY+IyWgFDcbmqd0L4yWI2WAXUe+Sq63g0mfwNy5YB7egC5SD0/OR+5fyM+nEBjht2nhrE8oxxq5ARl7aMEY8m+516x9PfcInaW0OD6dgkp6ilj7wsRbyXQRoD5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YAJe7iUt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3Gi0Mu027853;
	Tue, 3 Dec 2024 19:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9EPMgjVNLChb8n92Kc2ub47qgMBtVTWQlZoZbDBRsJs=; b=YAJe7iUtIyJ/+L2f
	tjUYspVQTeKXRpZMXI6qVoJGQdOCn8CigFsag6A4bjGhneu05KggD7zNiSqpLnpc
	Wt2J5JSEWgQ/JJ4gpv0NfRDkYQ6lxSCq6lIasYucfdwxQBjfS9LkzQkUvkugf5e3
	5Q3+qsnd5iVz/6nUUxazTd0J/mAovvtvFtZXez5GvdkoEBVwKfocIAwgqnEtfre2
	3eE1aATImGoVhMqsl1ywtcvVl/qyMtmCGio7WzAmJUq+s/N2wwNJBt1RnH2aILPE
	//KGLEvRnxPRWVAC3cZzKm6eFd8zVCAE+DqQtSofdoxKWBul6rxnxtPTfcWlO23R
	tJ9Kuw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vcej41h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 19:42:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B3JgiIA008499
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 19:42:44 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 11:42:43 -0800
Message-ID: <f8bb9597-c5b3-4dbf-a65e-7bd17cd3ffc5@quicinc.com>
Date: Tue, 3 Dec 2024 11:42:42 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm/msm/dp: Fix and utilize TPG with a debugfs
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
 <lpkhftx62hbnrftzoy6zprhvir7dffz5ynwo3kr5j5obc3dcle@73ljnmpdt7ts>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <lpkhftx62hbnrftzoy6zprhvir7dffz5ynwo3kr5j5obc3dcle@73ljnmpdt7ts>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uWTxjPu4I4L3dZ9LsX6b3pNVeN4PKqB9
X-Proofpoint-ORIG-GUID: uWTxjPu4I4L3dZ9LsX6b3pNVeN4PKqB9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=832 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030163



On 12/3/2024 6:31 AM, Dmitry Baryshkov wrote:
> On Mon, Dec 02, 2024 at 12:41:57PM -0800, Abhinav Kumar wrote:
>> DP Test Patten Generator is a very useful tool to debug issues such
>> as blank screen or corruption seen on the DP monitor by isolating it
>> to whether the corruption is coming from further upstream such as DPU
>> OR from the DP controller and below. It was noted in [1] that this API
>> is unused. Rather than dropping the API, it should be fixed and used.
>>
>> Hence, this series fixes the DP Test Patten Generator API and also utilizes
>> it by adding a debugfs for it.
>>
>> [1] : https://patchwork.freedesktop.org/patch/623508/?series=141074&rev=1
> 
> I'd prefer for this to be rebased on top of [2]. The series has been
> posted a month ago.
> 
> [2] https://patchwork.freedesktop.org/series/141074/
> 

Well, the review of that series which tried dropping the tpg led to this 
one really.

I will review that one within a couple of days. Lets first agree on that 
series before deciding to rebase.

>>
>> To: Rob Clark <robdclark@gmail.com>
>> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> To: Sean Paul <sean@poorly.run>
>> To: Marijn Suijten <marijn.suijten@somainline.org>
>> To: David Airlie <airlied@gmail.com>
>> To: Simona Vetter <simona@ffwll.ch>
>> To: Stephen Boyd <swboyd@chromium.org>
>> To: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: freedreno@lists.freedesktop.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>> Abhinav Kumar (3):
>>        drm/msm/dp: account for widebus in msm_dp_catalog_panel_tpg_enable()
>>        drm/msm/dp: do not touch the MMSS_DP_INTF_CONFIG for tpg
>>        drm/msm/dp: add a debugfs node for using tpg
>>
>>   drivers/gpu/drm/msm/dp/dp_catalog.c | 15 +++++++--
>>   drivers/gpu/drm/msm/dp/dp_debug.c   | 61 +++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
>>   3 files changed, 76 insertions(+), 2 deletions(-)
>> ---
>> base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
>> change-id: 20241202-tpg-3f7543c036ac
>>
>> Best regards,
>> -- 
>> Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
> 

