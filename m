Return-Path: <linux-arm-msm+bounces-14783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C86E88638E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 23:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 028C61F21630
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 22:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7422179FE;
	Thu, 21 Mar 2024 22:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DeuSkcS1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF04F3232
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 22:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711061834; cv=none; b=dshf2AtS34s8gPvq0k7z01Zvqqo8udqdJeXPiEU5dUY5cIhN8el6fVl1HF4ruqh6db7TN77Dg0XlHlPeBzh8pI2ReuAGRo5iV6UmR0VIbgYhZMYElIowtXBDM2FOtLIQxfvus41EBwcSFRr9iLCkgz/iA+lDkxjvtft+oF0tQXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711061834; c=relaxed/simple;
	bh=5B1VDQFsRmYSHrBm8HrYkZrlKkRbq4Id/6RZHsK3ons=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tIVzuCgEnnnR0jxvsgpHSUA7BsxBje2Di7Ht0vyas2A7UB5CGwpQYqVCEYR/6yVakoyYcy46DCzjXV/2ROUag5bRYIwKI5cTkJm1eatWPxqGJ6QeTjo5AYbThEPFCwFCWZeRfYJ18JNG1kEme5uOhY//L4L+yDTkDLIN0lMStt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DeuSkcS1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42LMjT6n014599;
	Thu, 21 Mar 2024 22:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=SOVU+qUso33IqObVMBMHa6MMrqjjVDE5iN03W3bLwCk=; b=De
	uSkcS1wEfsyOAeqO+6MSV0WRpOMpO8cKcYeDhP0UVDPIJ3/GH1nRpYGh0WUzKrnh
	PPqwUegdDTU5v9UJ/Ejcd+ZozD+FAV6nYLz6c9C5n3ZPRW/74wNHY2Tl1wRSRznV
	+0eLycAfE+dKe1SvocAH4cNdBCmf+12fHL8F9dVRvvFBDGl7mfSKfyqJcEwlBwej
	t6bockyd4J0fzm3Pp6ph9sVCLX72S2MYpAlX5/wt9NX9pyVtLOO8gK1lD8SQ8fzD
	C5v9a6FY07GVq0KlwfWcNSSdQCdzuOas8D7BTb29DLyv+8rxQpivGAwv2ps5myYO
	6o/HZscsRTIAOyM9xbWw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x0wy900mw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 22:57:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42LMv2nZ024098
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 22:57:02 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 21 Mar
 2024 15:57:00 -0700
Message-ID: <5ee46d6b-f70c-93f7-99c5-dffee0c17abc@quicinc.com>
Date: Thu, 21 Mar 2024 15:56:58 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 4/5] drm/msm/dpu: rework core_perf debugfs overrides
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
 <20240314-dpu-perf-rework-v3-4-79fa4e065574@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240314-dpu-perf-rework-v3-4-79fa4e065574@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gABIyqpAdq_EiAZd-qNxvYIXwdKzxL89
X-Proofpoint-ORIG-GUID: gABIyqpAdq_EiAZd-qNxvYIXwdKzxL89
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_12,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403210174



On 3/13/2024 6:10 PM, Dmitry Baryshkov wrote:
> Currently debugfs provides separate 'modes' to override calculated
> MDP_CLK rate and interconnect bandwidth votes. Change that to allow
> overriding individual values (e.g. one can override just clock or just
> average bandwidth vote).
> 

I am not opposed to the idea of dropping modes and overriding individual 
values.

But, we cannot expect the user to know the max clock value and max BW 
value for each chipset by looking into the catalog or devicetree.

That was the whole point of the MODE_MINIMUM perf mode. User doesnt need 
to know "what values to program", just sets the "max" mode.

If you are also going to expose a "max_core_clk" and "max_bw" debugfs 
read nodes along with this along with the --help I spoke about in the 
prev patch, that will make this approach complete from my PoV.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 87 +++------------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 10 ---
>   2 files changed, 9 insertions(+), 88 deletions(-)
> 

