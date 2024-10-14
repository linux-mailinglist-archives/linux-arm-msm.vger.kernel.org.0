Return-Path: <linux-arm-msm+bounces-34367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8058999D6F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 21:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B24CD1C23FDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 19:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EBB91CACF9;
	Mon, 14 Oct 2024 19:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IT2kcs3n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35951A76CC;
	Mon, 14 Oct 2024 19:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728932641; cv=none; b=P8wlHp5dVZi3JR7tL6+2QCyI7bW9R0iSSoEpQWgsfCwnE5Y3M95FcxJnumqlklGLmh/cT9H48/fywoeXa6kXUzJPXk/V9XkLwDpwjWLC0BXzwmNVNk5Ll0o5CDalD024QGU+GN3oiMhLlvptutcVdJyLD9S2AWzIm5/kOPMVqRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728932641; c=relaxed/simple;
	bh=9e2hYNLywjOWeFJ0WHZk9iLKrRaST5u2oLfrrP2GoL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oDHHVQVtMr3z4IJW/EYO5hydau0tyY5LWNok344I5ZKzqwgEPQQfpzwxwFVDjBfxrhhNUUJIal2KIOwqJYVctdClBT166UuLS/+f0BMINvE3JYpDgVeI9oMPsG4KDStfI+mtCk4UWehTLCdUWglBzfvisafTq5DrCkK/KtK/8pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IT2kcs3n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EATAia026495;
	Mon, 14 Oct 2024 19:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xPl4lOsNhgzQCNqIfqBryfiD9tLINPrt6hg/yuZUG9Q=; b=IT2kcs3n5+FSujX3
	JrGqsMP7VlmcnInpIBcBX+7+zwA/V/3SWpjdcGP1Qtq79LX22xwFeLcfUGKnc3T7
	TDZTRn/NStusCBpYKPnWAJpn9YLoc79mgskqkN0e1mcRW1tWdOdH9bLL/VCNmTLz
	P+nMs1thnLCBzXhFFw/4cf8RH8b6eI93iDsLBwQWZ6UAq0m7gSUjdjwM20hpxu3v
	93z41jbBjl7tQ9zLrpMZM4Ewfcz51NN2q9o9OcKx8JDGtUsOWUQC1bu87IL5JFDa
	JJqBbii3/CXvIk5ipq2AJ47z8LL7D31jRwM7MQ6jbaYtHKW92wvVlKTkRhzXgSiC
	J+o49A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427h6twee0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 19:03:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49EJ3pTs020266
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 19:03:51 GMT
Received: from [10.110.109.95] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Oct
 2024 12:03:50 -0700
Message-ID: <2e544299-b40a-4cbe-86b8-6bcbd0ce25b9@quicinc.com>
Date: Mon, 14 Oct 2024 12:03:50 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/msm: Simplify NULL checking in
 msm_disp_state_dump_regs()
To: Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241014093605.1.Ia1217cecec9ef09eb3c6d125360cc6c8574b0e73@changeid>
 <20241014093605.3.I66049c2c17bd82767661f0ecd741b20453da02b2@changeid>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241014093605.3.I66049c2c17bd82767661f0ecd741b20453da02b2@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2KkXxTtiq3C7LM4EHNeP0Y6SvD2gSL6H
X-Proofpoint-ORIG-GUID: 2KkXxTtiq3C7LM4EHNeP0Y6SvD2gSL6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140135



On 10/14/2024 9:36 AM, Douglas Anderson wrote:
> The msm_disp_state_dump_regs():
> 
> - Doesn't allocate if the caller already allocated. ...but there's one
>    caller and it doesn't allocate so we don't need this check.
> - Checks for allocation failure over and over even though it could
>    just do it once right after the allocation.
> 
> Clean this up.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>   .../gpu/drm/msm/disp/msm_disp_snapshot_util.c | 19 ++++++++-----------
>   1 file changed, 8 insertions(+), 11 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

