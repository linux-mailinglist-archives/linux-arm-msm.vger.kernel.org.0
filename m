Return-Path: <linux-arm-msm+bounces-15632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42516890C6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 22:21:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECA25282064
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 21:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39316651B7;
	Thu, 28 Mar 2024 21:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oEHKJdhS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1CA2BAE7;
	Thu, 28 Mar 2024 21:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711660895; cv=none; b=SfGvEzRXflarlpftHZWUpmoKXrVSkhc+gWb7s1LozfEcI4TZiz1yCb+oNcWme/NI3H8Lb/6O+/5O3UT0OHxC/4Abo9u5+cA+P0+wSNmRoa0RKVUn31UdBDh4ppsmEu0Oif52WHnu0UNlhpsJmc+Tq+L4V1GyZRVdVnfhkaWfZ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711660895; c=relaxed/simple;
	bh=Zj9xVaW5VxIj77MDr1gWeh7JZ6hMmrUu9YoKUpzwMWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tPG27DUAQad+avKXNiR+U6EXE7aEImKnzxCQrkmGW2uLqru/uV/n/TkZs2z7RsJjpKBB2phKrRWXYR4qSAp7R3u384xHz4OPWN4GyRsykvfObvwRYr8Z0bOmR6zl/TmXTmYQgJcp9Gd8sv3PftlQ3/aFXSI7/ioaXI2w2HSG6Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oEHKJdhS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42SLLN0e030916;
	Thu, 28 Mar 2024 21:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=YqluI44oCwIMb2uPkFQarghRCXAwIcfSImWcvajff8o=; b=oE
	HKJdhSQh3m7dimSMxiQTnAeQomAIRnhX5E2tYs1ZZAaNew9QOsq+nbxKbbiFGjpG
	417lUfoVUeheW6K3CLdhDCOe7SvGyOVA6fmxfLSKleG+A5sk8q5eDBgVafa0T4PN
	kyNgj1T/Fkt89wOfXCnlYDzE8xGzbxV35Fpxzk8mZYhrtRNcTnpvZD4oLNceP6Pm
	zl9fqkEPrV3tyKSqoVgHvSPLavVP2nEbH87wR0UmNNxeVo4Txv8Gn9Auj6unh3r+
	SbzEDSvWu0Q0WKbAjW9qGDcu864R4lu0AOYFfIVcualX/jmJXAGYvnQtjOJW3hIb
	Ebt0HhTkNo424Ky3O2NQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x562rhuew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 21:21:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42SLLMEF005080
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 21:21:22 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 28 Mar
 2024 14:21:17 -0700
Message-ID: <23de89e9-3ef3-c52d-7abf-93dc2dbb51a4@quicinc.com>
Date: Thu, 28 Mar 2024 14:21:14 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1] drm/msm/dp: use dp_hpd_plug_handle() and
 dp_hpd_unplug_handle() directly
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Kuogee Hsieh
	<quic_khsieh@quicinc.com>, <abel.vesa@linaro.org>,
        <agross@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <dianders@chromium.org>, <dmitry.baryshkov@linaro.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <vkoul@kernel.org>
CC: <quic_jesszhan@quicinc.com>, <quic_sbillaka@quicinc.com>,
        <marijn.suijten@somainline.org>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1711656246-3483-1-git-send-email-quic_khsieh@quicinc.com>
 <1711656246-3483-2-git-send-email-quic_khsieh@quicinc.com>
 <55debb0a-c7af-ef71-c49a-414c7ab4f59d@quicinc.com>
 <CAE-0n503FwcwreZ14MMKgdzu8QybWYtMdLOKasiCwmE8pCJOSw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n503FwcwreZ14MMKgdzu8QybWYtMdLOKasiCwmE8pCJOSw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xSN-cC30vJQgqcjGx3Mjnt0ZAam_B0JM
X-Proofpoint-GUID: xSN-cC30vJQgqcjGx3Mjnt0ZAam_B0JM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_17,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403280153



On 3/28/2024 1:58 PM, Stephen Boyd wrote:
> Quoting Abhinav Kumar (2024-03-28 13:24:34)
>> + Johan and Bjorn for FYI
>>
>> On 3/28/2024 1:04 PM, Kuogee Hsieh wrote:
>>> For internal HPD case, hpd_event_thread is created to handle HPD
>>> interrupts generated by HPD block of DP controller. It converts
>>> HPD interrupts into events and executed them under hpd_event_thread
>>> context. For external HPD case, HPD events is delivered by way of
>>> dp_bridge_hpd_notify() under thread context. Since they are executed
>>> under thread context already, there is no reason to hand over those
>>> events to hpd_event_thread. Hence dp_hpd_plug_handle() and
>>> dp_hpd_unplug_hanlde() are called directly at dp_bridge_hpd_notify().
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>    drivers/gpu/drm/msm/dp/dp_display.c | 5 +++--
>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>
>> Fixes: 542b37efc20e ("drm/msm/dp: Implement hpd_notify()")
> 
> Is this a bug fix or an optimization? The commit text doesn't tell me.
> 

I would say both.

optimization as it avoids the need to go through the hpd_event thread 
processing.

bug fix because once you go through the hpd event thread processing it 
exposes and often breaks the already fragile hpd handling state machine 
which can be avoided in this case.

>>
>> Looks right to me,
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

