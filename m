Return-Path: <linux-arm-msm+bounces-10426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A106850029
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 23:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73A6AB2E260
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 22:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DB839AE9;
	Fri,  9 Feb 2024 22:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TdhtEpqe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACA03984A
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 22:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707518057; cv=none; b=UzrRIvmxyuKdGSaXFGa1D1XQe2NdjmNCPZZsJedA8hlJCDcFweLoIGLylf2r5pSC0vTqshPTJzyAIAIq4FNerSkzjONeQh420d/TxNbK819cehZg9rUR2YmxWPgK5l433LAkQstNDWFNxiYkXBfTYDMzcjzddtrL+jCk+o3tf6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707518057; c=relaxed/simple;
	bh=ZTV94rSHcEOPx5FSZhcO5/47gLM6XDguaFHohNbCBvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YI2xtn+65+bUMy4G37lK/IomOFwbwsnvjEE2R5mbXJNUGD2CnehfWLCtQ4mEH7DhFMWA+Wo0CXItj2r+VXIb12gI+4fYQ74NPeW0CEk57XQkPvV5OV+ymjKIdU6/JoX6yDewhr+jc6PzcqzsPXXrTvsQ/fLWGi5KSleknDlzvjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TdhtEpqe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 419JuNWQ031033;
	Fri, 9 Feb 2024 22:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=8aYcf0/lEWQpUtSVosm8sdwIEHo2Cg6uI32YoDhsPUg=; b=Td
	htEpqezVmZvQQ1tlb6hCl7Uf62arY/830PVCwYDGSR1lY3/BHMRyseprSAGubzow
	VD64PJ6LSHFi7VkE4lX8+GxGsCFQonz+flUj87sKPeeQXuWK17nXYNPbj1Hftj/H
	gp62dvo1tlC4kaICM3DVw5lC9lYM1xSfBqujqrR8xoepumuRHnP+EYTRnH7WmaTn
	bDx/boO2k7JXUQFd3xUG2fttNnw1fIOr0x9a7ompt4Z9nG8a8QSj+lD8b8VdRJOb
	7tZyDW6WK6DP7W47u63/k/6woyWbtdMIGS1gxsmvjfcQigzV1+pZ9lFsZjMRSxwS
	jhyac7EdrXBb42fWQfnw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5m1596h6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 22:34:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 419MY4rv021929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Feb 2024 22:34:04 GMT
Received: from [10.110.104.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 9 Feb
 2024 14:34:03 -0800
Message-ID: <b4637aa9-5b07-6b9e-b47b-c9822ce18063@quicinc.com>
Date: Fri, 9 Feb 2024 14:34:02 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RESEND 4/5] drm/msm/mdp5: migrate SMP dumping to using
 atomic_print_state
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>
References: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
 <20231203000532.1290480-5-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231203000532.1290480-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d03bkIbx6nY7ZNBJpoaO31G7rRF-g2ag
X-Proofpoint-ORIG-GUID: d03bkIbx6nY7ZNBJpoaO31G7rRF-g2ag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_18,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=695 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402090165



On 12/2/2023 4:05 PM, Dmitry Baryshkov wrote:
> The Shared Memory Pool (SMP) state is a part of the MDP5's private
> object state. Use existing infrastructure, atomic_print_state()
> callback, to dump SMP state (which also makes it included into
> debugfs/dri/N/state). This allows us to drop the custom debugfs file
> too.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c |  2 --
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 46 ++++++------------------
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c | 12 ++-----
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h |  4 ++-
>   4 files changed, 15 insertions(+), 49 deletions(-)
> 

Nice cleanup !

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

