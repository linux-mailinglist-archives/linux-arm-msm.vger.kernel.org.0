Return-Path: <linux-arm-msm+bounces-49101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFD4A413CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 03:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C76718945E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 02:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0411A3153;
	Mon, 24 Feb 2025 02:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mfc0WSEN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A98F1A2545
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 02:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740365648; cv=none; b=bJI2ZgUJ3ffLis7l114ik9PVCrzPFVkjAwd5HKJZPRGeuSahnhCp3cbRCJLEJttuAsmdRvM++uswG4XM9RJT/GrnxdxdiB98BYNTIbcVSz48qTFid9kAO1xNTaJUjVD0UbKRX4G+oBaqdN41KUcMg5JBW/z0BkgE03YcAJPYbZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740365648; c=relaxed/simple;
	bh=69RKJLKpG/7bwloHx7xcNWh7W4YM2DnmtcstBInYjzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SZmGMHilt0IDu1gbttUYLL4+hVPF8ahfw/sqfvNKA/FYgEVflmfAA/eyb6RK711MvPxJFyCDSF8HUSZoieuBLQDteCdpxTD5od3S5nQ9JNzjEtVIQkqCAOxD39STc8u7BS1kXXOvuTSJjRT1az2pQ/jpicHd5JUQ0Ou3VsN9jCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mfc0WSEN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51NNrhAc020772;
	Mon, 24 Feb 2025 02:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L2ErAeTCXh1BSkWCZv77bSJfnXRytcM3lAP8vKDKRQg=; b=mfc0WSEN5VcdZ/7f
	ns8o+3KO5E5/iwZDigC7hFTxOKd1kcNCWEH/tSHMi3mDG2bFbkXoKX34uvsZTxj4
	Gm0K3LSM2Lt9uIDlcV/AwI2hJxdzWBp6SNnxwGJmUG1ebMRReT9BGnXFI1buwW/7
	Fur6+Csh97/ccZsKEbHsFq6lq7cOQy+5LSfMTFww/SHQnVqXbpmo7XV6mO090lGR
	naKnRbjyLgWw2gICpQoDBzpbTtlZuD3Q2yzXwiE9DNVAFIZbNWOmCnMXKSNbWh5w
	Lc78qZHMb+Lky9Mzo2zqoPfP41kiEsIEkuLubs2wr4i7mJyfKnvMLyVk7Oqy0uH3
	Mmr8oA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5k63dqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 02:53:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51O2rwAZ032692
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 02:53:58 GMT
Received: from [10.110.85.197] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 23 Feb
 2025 18:53:57 -0800
Message-ID: <765050d8-9606-4e27-b1ea-3c3273641d08@quicinc.com>
Date: Sun, 23 Feb 2025 18:53:56 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/8] drm/msm/dpu: drop core_clk_rate overrides from
 _dpu_core_perf_calc_crtc
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Stephen
 Boyd <swboyd@chromium.org>,
        Simona Vetter <simona.vetter@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
 <20250209-dpu-perf-rework-v5-7-87e936cf3004@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250209-dpu-perf-rework-v5-7-87e936cf3004@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jECsfwHs92Jkgbev0MOJIPXSoNwTBhNx
X-Proofpoint-GUID: jECsfwHs92Jkgbev0MOJIPXSoNwTBhNx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-23_11,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240020



On 2/8/2025 7:21 PM, Dmitry Baryshkov wrote:
> core_clk_rate override is handled in _dpu_core_perf_get_core_clk_rate().
> Drop imperfect duplicating code from _dpu_core_perf_calc_crtc().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

