Return-Path: <linux-arm-msm+bounces-45879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1265A19BDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 01:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73C3E3A1265
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 00:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D15849C;
	Thu, 23 Jan 2025 00:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CDdfpA1T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F71E629;
	Thu, 23 Jan 2025 00:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737592802; cv=none; b=W/aRFmCNc8fozKxWM2lEw2kvkV4TNrwvi2ikqhv6qdTnJf0/uukg/MBW6v9QG0XwanvHrS+Q5KVYtwneW2gpEeiRE5TPtAUTdoqOTLgJpzrY/iLbP0dth50MlMkfit4Bq76rWJXop24zbOuzbPAQpDY80TWWeQA03G+oNkIlBjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737592802; c=relaxed/simple;
	bh=uFCTTQgruk2RESTn+8SKjFe+jnpbN9c/mzkQzLa6kMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=F3eyWNh8U0KpEoojrryvksGuPLhPWB28A9KrDgTRYdjenZkXQP+D3QSz8HOjiozf6fCPupYIDsqXjVqus4xZPCY2b2rbtx7cQrA2hIF9f6V7kO+ifgVLwPOww7W0rcFS7vP5y0nvnPQR0dBP/WNYKpB/MgTH1C8GOsmXIR6tyic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CDdfpA1T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MB1X9w003796;
	Thu, 23 Jan 2025 00:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r55qBHJGtM7SiKIaWI8rli6SckSG9I54RqfWG7sjRRw=; b=CDdfpA1TxUzQZMQP
	XpA48nY50U875lbHzj9UhCelKpj3LH6rcYxNQYwj8JJtUScsH5rmfkgbpX36UrxE
	mxNZLjRXKbDS3PbyzrkMsPYL+bqwbPHjGWFcV4Ry1qc65N2gjU/WKrxQ0OZVyZhd
	KLAIn3kQfbx1XBirjNC+cJzVzkRCSJbjampSCkFJrvy2YAiI/SA3WXnakSvOSVFS
	OcoYNpDtA6LF8uLZ/g/UBIYPzm/L9THNcNrkQKG0vN6LvTjnqVg2g/Rd8QwPvWlO
	ymTJu6QBYwVOLJ6NkIYGFdQtUp0o0lBpFfY8Nvu8c0sQGgGWc7lpzFfTfiJ1EX84
	K5LAZA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ayehhqwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 00:39:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50N0dq0a013044
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 00:39:52 GMT
Received: from [10.110.95.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 16:39:51 -0800
Message-ID: <ddd47aa6-b34b-4ecd-b73f-8d7ec3173d96@quicinc.com>
Date: Wed, 22 Jan 2025 16:39:51 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/35] drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
 <20241214-dpu-drop-features-v1-12-988f0662cb7e@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241214-dpu-drop-features-v1-12-988f0662cb7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zH6rnKazv9BUblljcDflV75WoXW7m4mf
X-Proofpoint-ORIG-GUID: zH6rnKazv9BUblljcDflV75WoXW7m4mf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_11,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 impostorscore=0 mlxlogscore=903 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230002



On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
> Continue migration to the MDSS-revision based checks and replace
> DPU_CTL_FETCH_ACTIVE feature bit with the core_major_ver >= 7 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
>   3 files changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

