Return-Path: <linux-arm-msm+bounces-17128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E32388A0161
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 22:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64EF8B24B4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 20:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D59181B9F;
	Wed, 10 Apr 2024 20:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WgYXx2AJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4985817F368
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 20:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712781619; cv=none; b=hyTFWHiwWd34P6LY9aYYJkjxAHWUmkWHxvcUdCxJW+eQsmYPZHEwFInyZlnVObTy2SyUezRMSKM5ebr+hWwsdnXqbDnqJG/mwZfzbdkQUn4F05WrQ3XaG2SQqZyzrLNs5kJPBuGAwcmcX29VGs6r7L2APc1fM7IFRxLLm1Nla54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712781619; c=relaxed/simple;
	bh=bQv2TisbEeZi9A/QhxVzg7verjw2eDZs7s+V89nNaHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ux8k23bYNjr4/8eGpgeuN4pVsHrJHBP4kcjXW1iH1DNnER7giWL/1tbSp3avBk3EIGa9tJz6nB9dZXesBJLevwyxxgYHqAMqEta7LNKD+0IwdN8JaRQga0/Njgr4NS7mbxFONPgmm1sK/SPrBA1VAGuejC46UTG0P/qK5ARKpDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WgYXx2AJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43AJubqD011001;
	Wed, 10 Apr 2024 20:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ZZYUPcIeOjrC4I6LXrxxHILj/688seia6rP8gkx5jEM=; b=Wg
	YXx2AJPuZ+QCw5xOYnp3wyyadWdXkapGEkvk9T7+NRl+bTxhuvaJJz6AgVMeWP1w
	6bgaHy6hPGUTCauRtsvGBnWAUGwCZTD+5FWpUXvtonMJN4L4g5EKNYxseOnpNX7i
	+8YH0K4pw4o0Y4Q6o9HDUKt6b/LftztftTTQaAPQ2hQUdu5nHs7zfTlQ6Twl/rct
	C3xLBBaB/YzDvqvu7pTbktaBqLbZ9rqOCJZmE8A2NxomjgiKemFzjFVCKN6RzUt9
	xuERiKPo5N3PaTyBIt/vveRp1Ju+zUwp1a/+T7FOhwLIMwxjkRlgau1orEBoHBTL
	fGyLjoMS26yERfXe5zjQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xdqy7tuyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 20:40:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43AKe3eT006596
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 20:40:03 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 10 Apr
 2024 13:40:03 -0700
Message-ID: <bbc7b585-d0fe-c2db-e9d0-3acf51ab55a8@quicinc.com>
Date: Wed, 10 Apr 2024 13:40:02 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 05/12] drm/msm/dpu: in dpu_format replace bitmap with
 unsigned long field
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-6-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231202214016.1257621-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SkW9kimeiCl6PeGhhNw_O_yzrFuDmZGg
X-Proofpoint-ORIG-GUID: SkW9kimeiCl6PeGhhNw_O_yzrFuDmZGg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_05,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=639 suspectscore=0 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404100148



On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> Using bitmap for the flags results in a clumsy syntax on test_bit,
> replace it with unsigned long type and simple binary ops.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 18 +++++++++---------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 16 +++++++---------
>   2 files changed, 16 insertions(+), 18 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

