Return-Path: <linux-arm-msm+bounces-36633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2C49B8631
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 23:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E88D0283FEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 22:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDF31953AD;
	Thu, 31 Oct 2024 22:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NcVclYxr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017C01E481;
	Thu, 31 Oct 2024 22:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730414526; cv=none; b=NrlvAwbU236ae1JRYMexopypCXNTfUxfQc/IiEirIL4017kL13W4CLalbaE0tT2vlcif79up2cpVH4Z8Ra+TCUkEy3jvrFS/zhALdebZbOz2ymE+lfKmimkcbY5vfyV6uKBRyAAHe6KXnLkL9dUFC4lNZwQYrprLpte7mFMqH+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730414526; c=relaxed/simple;
	bh=PaXya/KkrbpTtMwz4J1J4JKtx9fXnp2fS3VoW+8dpo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eGT4EV1EAcb4MNrIMqzI7XaL1BOTbZbEWMPuE1JpI+yBDIyz+z3Yqt1Eke8ztE8ZyH/JKTDWYRjf22Dm8ZB6EXyeI+AwlpnDItnzDVFYHM5d4dGB/B47q8CSqKRmmQLQCQL7wrWwNYu4UwUS7BSa605yhC3cF/2+zANSHFax+lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NcVclYxr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VCMxqI020980;
	Thu, 31 Oct 2024 22:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VWM5C3U31ChxFRxKbOzd93Cd/Q8iUF4CX5qj6C0QHWw=; b=NcVclYxreMveIF2z
	IAG2WiuvB7e70yCiaM9r7Qq7ck5pUCs3ZJ5QRSpEYnebzu1cdsLht8kC0Mp3OJVQ
	Di2xD9KO79vkcrnoUb6eDkMUZJCXI1wI3vlhPQGt1mV0C7nAen4W5kkMp/he7O4Z
	4+9XAqTk/+SjkXHLMtPlio5EFbDH1EKHr3MzSjMC5WxNnzaRajMpYu8mSDbj80bA
	JuuTfmbsrwU4hGhxP3UOGG1w1MPOemyjA+TWhZr8gZLMF9vF+YGBdKyr0yX3al+W
	YbeWHeNokq2kBesy7Ckf23nE6BJd32FSrwyAxKVVwflk7dIXMSHuvFZU3KkOueBb
	RNYRmw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kmp0n6a0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 22:41:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49VMfpMI031944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 22:41:51 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 31 Oct
 2024 15:41:50 -0700
Message-ID: <0f1322de-24f3-49fa-b619-faa2599334af@quicinc.com>
Date: Thu, 31 Oct 2024 15:41:49 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/msm: drop MAX_BRIDGES define
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241031-dpu-move-topology-v1-0-8ffa8122d3b6@linaro.org>
 <20241031-dpu-move-topology-v1-3-8ffa8122d3b6@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241031-dpu-move-topology-v1-3-8ffa8122d3b6@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cuiNnrkYtSIdHjVXRGeHx4Jbe_S8C_oC
X-Proofpoint-ORIG-GUID: cuiNnrkYtSIdHjVXRGeHx4Jbe_S8C_oC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 mlxlogscore=691
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310171



On 10/31/2024 2:44 PM, Dmitry Baryshkov wrote:
> The const MAX_BRIDGES is unused after the commit 4d1a1e4686bd ("drm/msm:
> remove msm_drm_private::bridges field"), drop it now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_drv.h | 1 -
>   1 file changed, 1 deletion(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

