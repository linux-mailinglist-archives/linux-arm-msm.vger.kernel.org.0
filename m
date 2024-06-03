Return-Path: <linux-arm-msm+bounces-21501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F578D89DA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 21:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8D1C1C23ACB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 19:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24D4208C4;
	Mon,  3 Jun 2024 19:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i+FCyIJQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4398413B791
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 19:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717442227; cv=none; b=qAsHP71ArN5X9DBu6A47KDIhXFb0EFSdgHtkjw3FNahLZY7objBNUxCYKJOdyzB5P7YWvN1Aew8akmuflZUwJoIIuXhcgmQITk5ku3+r2xY+DJjq6jZChjDUTRa97s9PRw3CUNX/uAD3GOXPNR36X/x7pO5lI8ClXnZ8uBUYThY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717442227; c=relaxed/simple;
	bh=jw1UkAgl3cOgWkOIgsXQK4/l0KwQesYX+BrUlWLO0Es=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Xk3BdVum6SOOVGVHdcniUl7brgaNwaij9KcgDVLyzuq9umgXGBtufmDkBKqVjZhRXwUv6r81ZIS2D3S54l5r60Yb620ynD1JlMMqPqPgtMpLhWdTaQjip+aNFaQuDMBlQYNytIrQvHfd9oomq00AsCNzNW1t5iNdV3cKrjKFans=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i+FCyIJQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453Ce3F1014637;
	Mon, 3 Jun 2024 19:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7U874bTyVI6rV0F4P2N9O8uRv/YFWGVMibPVdJP6e8k=; b=i+FCyIJQSaQGoCU2
	kgiiN6BRdWTsJDw07MdhYO+ta4o83h4DO4XU1+EaB0F6GWnkdd3YN7UJDwLVmrYS
	E1VJjNd+wNXcdJUpvR+Wz8M2S4D45O4kkKsK59wekpxghPnk4SYT7MLWXrtqbU11
	gPyZF/uEBSZRBZJ7B5PBeGVkgz55rQ/cbQZB4Otj1rfy7ktWGBACx9EX6sFn8a0S
	vFxjrVUIIW4SYuQOmIRfKKpgIFfFzFKYCjGWW9YkX0tgWV5ihtB4a+7IyhNlBU4/
	83jqQfWKy3HPVP1RQo205SPOTs12zA2TO+VtiZDFSuCaODl2FQe6inkTnJ1g0eFQ
	Z7nKNg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw4bcsbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 19:16:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453JGsGB002029
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 19:16:54 GMT
Received: from [10.110.31.89] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 12:16:49 -0700
Message-ID: <538c2ed8-87e5-43d2-6b3b-0e6070d070e6@quicinc.com>
Date: Mon, 3 Jun 2024 12:16:46 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/9] drm/msm/dpu: drop dpu_format_populate_layout from
 dpu_plane_sspp_atomic_update
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
 <20240603-dpu-mode-config-width-v2-2-16af520575a6@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240603-dpu-mode-config-width-v2-2-16af520575a6@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iGsrXNfPOLV4xfvn3PhfZTGW0LaTHglB
X-Proofpoint-GUID: iGsrXNfPOLV4xfvn3PhfZTGW0LaTHglB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_15,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406030156



On 6/2/2024 2:39 PM, Dmitry Baryshkov wrote:
> The dpu_plane_prepare_fb() already calls dpu_format_populate_layout().
> Store the generated layour in the plane state and drop this call from
> dpu_plane_sspp_update().
> 

noticed a small typo (missed it in v1),

layour --> layout.

No need to resend, you can fix it up while applying if no other changes 
in other patches.

> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 19 ++++---------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  3 +++
>   2 files changed, 7 insertions(+), 15 deletions(-)
> 

