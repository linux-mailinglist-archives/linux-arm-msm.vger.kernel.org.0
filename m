Return-Path: <linux-arm-msm+bounces-14418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A456687EFAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 19:20:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DE7D1F23CED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 18:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FECD57885;
	Mon, 18 Mar 2024 18:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L9olPd8X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB0457865;
	Mon, 18 Mar 2024 18:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710785923; cv=none; b=CoT6eAHvOnymJfgKR5hg9h1Kv+6v91bcv9vFvULxZkKdK9qS++vWiKwWvzw0lWGjlKIPsAhDWzVyiRxW471r3kUIv7OulA/+NXQx6beGjKTjTSxmHV3MIlXZuLd8ly0k70DEFbq8t1dOsxr+d14e9h17oSzauQOMw3ryVdYYXHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710785923; c=relaxed/simple;
	bh=iiibzrV8LQ6C/ZWBt8VK3kdKsWLecvZ86arm8PrZY5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cji0fyiu1Nv2E/XYvLOrcOSAKtKcEKPHXUUcHbkKfCbb993jctJNweI/oZQdVx+/r7cPRBxhci4PGSweVyBUpR6hoOeA0WAuV+AuAUordvrr4x+LZMQ7XpLla/tl3daSUB0W6hcjLzIRLnJg0NYnpFbPypQqj56Sbdh3VyhY1Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L9olPd8X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42I9FIvM020548;
	Mon, 18 Mar 2024 18:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=SMNngnuJsZLJ+dd0//3akRS33tpd5A8neDgHEFnWG9I=; b=L9
	olPd8XTdRdgPV2TC7HmQHCv7d9BTg0ZjPVA0eZ83llMUkFhLkMTDCEpTM2mTQ/Uj
	uH+mB61IrppZe8aKTVKtx2OXdNCRZYT6D6Snfe/bwqTTuwMBBinI/8nJZhF+1jX2
	C6rmiUTwC9ZMr8ZT6VawuolL8Zaiag6qkgIzQJoMAhJy4JtXG22nZChDksLKj2mx
	YC1arAFEt5IlaZULjt7MeBxIieuBhp+6jhZKNXPG6yqgErt8y6I4Za76v2VlxNKj
	jpPvhvt6tTnW9zZXEjBHvK5EuSjAH/XchoWJNKs25MLZgXIAJS8AvQRsRxVGshVL
	ZKL1U0r2frAkgOBDFiMg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wxjt4s7fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 18:18:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42IIIXqD021947
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 18:18:33 GMT
Received: from [10.110.10.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 18 Mar
 2024 11:18:29 -0700
Message-ID: <19f0941c-9d8a-4f27-bfa9-109f4c43337e@quicinc.com>
Date: Mon, 18 Mar 2024 11:18:27 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/4] drm/msm/dp: Account for the timeout in
 wait_hpd_asserted() callback
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
        "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240315213717.1411017-1-dianders@chromium.org>
 <20240315143621.v2.2.I7758d18a1773821fa39c034b16a12ef3f18a51ee@changeid>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240315143621.v2.2.I7758d18a1773821fa39c034b16a12ef3f18a51ee@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1LZj9pmiA_1_C81E-EPZCxOeWs7jXe-A
X-Proofpoint-ORIG-GUID: 1LZj9pmiA_1_C81E-EPZCxOeWs7jXe-A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-18_12,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403180138



On 3/15/2024 2:36 PM, Douglas Anderson wrote:
> The DP wait_hpd_asserted() callback is passed a timeout which
> indicates how long we should wait for HPD. This timeout was being
> ignored in the MSM DP implementation and instead a hardcoded 500 ms
> timeout was used. Fix it to use the proper timeout.
> 
> As part of this we move the hardcoded 500 ms number into the AUX
> transfer function, which isn't given a timeout. The wait in the AUX
> transfer function will be removed in a future commit.
> 
> Fixes: e2969ee30252 ("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>   drivers/gpu/drm/msm/dp/dp_aux.c     | 5 +++--
>   drivers/gpu/drm/msm/dp/dp_catalog.c | 7 ++++---
>   drivers/gpu/drm/msm/dp/dp_catalog.h | 3 ++-
>   3 files changed, 9 insertions(+), 6 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

