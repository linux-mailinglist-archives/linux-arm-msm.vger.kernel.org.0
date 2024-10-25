Return-Path: <linux-arm-msm+bounces-35977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF3D9B1318
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 01:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 805281F217D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 23:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3FF1B85CD;
	Fri, 25 Oct 2024 23:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fRE/Gx2m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D1C217F3B;
	Fri, 25 Oct 2024 23:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729898148; cv=none; b=X4uuGfilTyNxhSKz5QUppC9gWIYVrLrb+ej9WHUwLzV9USMJ/3raOyVDbmUBIpMkvbsAsBUTqLHyNQz89shAj4MlnApuYhz+t+bnJTFuBocW+ZU1Ej8cEGgcZGTvoY0aNo1gBCupjPTQTN0unDrrGa9PkoRCiwQ5wcGLISMvjqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729898148; c=relaxed/simple;
	bh=sT8y9xAYc+hfFJY1Q/eLI2uFB8t5X1Zd1syqG4Gt4s8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XshNGnsZIRrC8ru3F5Ltkng0o0blNiWX7hOig+l50bHj/mEFviuuuu0h+maGwXhxQnJXQz9SqIl0O/nMZyOu5gDTjd+rXFUfNR0mp61O3JeilmaXdRehZbmwibHujRss0Z0g0xzCYkJu6SL7xeQE9LaXJ40zeXyWYrcZL2fIHQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fRE/Gx2m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PB20de000928;
	Fri, 25 Oct 2024 23:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gE5N6RfKGRBoFRMqc8IV5IFBtpi2aL9h4mYY1D6HTxg=; b=fRE/Gx2mlWd5dI6x
	A3dGjKup2Uk6Ft3EfLHEbRgxhVC08nqQ50lvfULCBUXkuAwI9hMIDUQE+5+UOSos
	rUOt2b6BlACciPb3aKq6QJN9qOx/J2GJjTbTwpfvSWZGgW9KhUT07gfIg1d0oVCP
	l4v+L2huHmqnio8jqmnwomKPrGSVYSdZmEyPPAba5J3JkoyQ8FGcxX0HplN6l657
	n+Df3gTtzIhxmf+NFlfa4FbbQwgw7qYoTwzw4s19zfFrQkVhWd06xK4D3JlZIYyH
	rdJin4gH5WSzqOSD5C0Sp5DNgTSCjFAuwnK7XBZMJcnvku+uO52djiI4idntVcf1
	vOQosA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ga3s1s7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 23:15:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PNFam4004593
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 23:15:36 GMT
Received: from [10.110.83.151] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 16:15:35 -0700
Message-ID: <be14550e-506b-4126-aa13-e983492d3cd3@quicinc.com>
Date: Fri, 25 Oct 2024 16:15:34 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/9] drm/msm/dpu: move scaling limitations out of the
 hw_catalog
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
 <20241025-dpu-virtual-wide-v6-4-0310fd519765@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241025-dpu-virtual-wide-v6-4-0310fd519765@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yCBnnVSLKfS1WwVFXVLLQV5cWGSXU2wE
X-Proofpoint-GUID: yCBnnVSLKfS1WwVFXVLLQV5cWGSXU2wE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250179



On 10/24/2024 5:20 PM, Dmitry Baryshkov wrote:
> Max upscale / downscale factors are constant between platforms. In
> preparation to adding support for virtual planes and allocating SSPP
> blocks on demand move max scaling factors out of the HW catalog and
> handle them in the dpu_plane directly. If any of the scaling blocks gets
> different limitations, this will have to be handled separately, after
> the plane refactoring.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 16 ----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 16 +++++++++++++---
>   3 files changed, 13 insertions(+), 23 deletions(-)
> 


This was also R-bed in v5 and I dont see anything changed, LGTM anyway

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

