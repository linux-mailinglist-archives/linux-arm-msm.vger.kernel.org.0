Return-Path: <linux-arm-msm+bounces-17126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6620B8A0129
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 22:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9773A1C2206E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 20:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD0017B4FA;
	Wed, 10 Apr 2024 20:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A+Ab6VUm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2391E877
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 20:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712780338; cv=none; b=AaCd8uHN7/7WPgPQSdIwel7UZQ1pG07cm+8UUD7A4LTOmPdyRavX4vo/9HATs5UpP6iUs1H/TcRiywK0AC5ueli8Tl629suONtKGOHuwY785mDUkrvdEinMiCFPG7BnAKz7bpgIBxb9gnDZsiHPqqSk2yo3gN6L1HJJbpsDRMYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712780338; c=relaxed/simple;
	bh=kzisUWLcqRG0PmeUyGOsOyrvd1NnLwqseW8OgBllz0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VcPFv3lMl7HeMRTprDEB+I/HmTlfY3+3ZpPqYA7+ydbmzvYeAzXZGbMK1mYy4+k5s7xFQfZ5DjnJ1smvjupioOhBqKFAb20y4c1UI6yQds9isN9S19LYZ4zHZ2TmHjxcVmUHbL5FOWWzy2ilnixMZyDuJ6BaAI7w/QvhIcKZRX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A+Ab6VUm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43AJUHVb012607;
	Wed, 10 Apr 2024 20:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=54q0PWWHwnBwPLnPjMHx3wvCrOzacLFWxrdKSsC6Opk=; b=A+
	Ab6VUmc1pfiX+AI8D0TvdHQMw/n2CFSjkRdUyFIpJiWUrMVhKRxDh7dHqXVFWq++
	AP0sOemT0ehOQGqY/4B+Pej6YoZoSDgGxlfrEVMl6VRN9VWLh92Ixtc+SGsxjmIk
	Vv++lWpDfMe5kwWAJsFgiL1qpEETQ6G42RENRYvl68g3x12T9ebgI5T0zIf5cbFC
	CrOd2T7wKmK2TAfX7GdQlOWWyJ9gSYm6r0fVnl10yFLbvyLY3iBQpF8Wg8kJ432X
	r4OBMexTctkGa6BPjkCCCZJ+pbkHk3fPg9aCEScHLaLhFmpHWX8R+btuCmIqmxl2
	BthbRMA8+78/GegFLBIQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xdnqtkm5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 20:18:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43AKIiHI018573
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 20:18:44 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 10 Apr
 2024 13:18:43 -0700
Message-ID: <83b45b20-fb7e-564b-4e32-2b6a12c4dc6d@quicinc.com>
Date: Wed, 10 Apr 2024 13:18:42 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 03/12] drm/msm/dpu: use format-related definitions from
 mdp_common.xml.h
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn
 Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-4-dmitry.baryshkov@linaro.org>
 <bb448864-b974-55ac-4709-ea89bbd2694f@quicinc.com>
 <CAA8EJpqnjY35RF52yJ8gFRKHoh1ArnnviacDtfntSYZdALD3bQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqnjY35RF52yJ8gFRKHoh1ArnnviacDtfntSYZdALD3bQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: is-6BHw23MenTxHzSB1ASAJKZywu4yPC
X-Proofpoint-GUID: is-6BHw23MenTxHzSB1ASAJKZywu4yPC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_05,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 impostorscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404100147



On 4/10/2024 1:16 PM, Dmitry Baryshkov wrote:
> On Wed, 10 Apr 2024 at 23:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
>>> Instead of having DPU-specific defines, switch to the definitions from
>>> the mdp_common.xml.h file. This is the preparation for merged of DPU and
>>> MDP format tables.
>>>
>>
>> Adding MDP_***__ usages in DPU driver is quite confusing.
>>
>> Can we align to a common naming scheme such as DISP_***?
> 
> No, it's not something display-generic. It is specific to MDP
> platforms. In the end DPU is a continuation of the MDP lineup, isn't
> it?
> 

No some aspects of the hw are completely different as you already know 
between MDP4/MDP5 and DPU. Bringing back MDP usages into DPU does not 
seem right.

