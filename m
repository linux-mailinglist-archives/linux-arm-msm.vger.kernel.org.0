Return-Path: <linux-arm-msm+bounces-44070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AB0A035BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 04:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C596B18847F9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 03:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727E2156968;
	Tue,  7 Jan 2025 03:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O/RBnBLx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F122594B1;
	Tue,  7 Jan 2025 03:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736219519; cv=none; b=Zfp/AZAfk+tmfFfIuDbkQ7CMEtdAzfaq10lKnX7LKIdrYf69Zz3cSfsjCWcnFbEzLjMcl+sDPglRKNIHCucQbi73jEcgkFZ+thVUE51by8Wf64GWzrayO+sHHz+lky9aiX4+UbpPbe2hoo9jPGo/dg6aPsdQN5x1bndvekYcTU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736219519; c=relaxed/simple;
	bh=6zHxHOlZg2nw6l5ZuRC39z+S7rDUnCkV8pcuOkpELnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IUEQDqeiTeMrLrniVYXpiXQ1tlRdU8yCl+0kPMedJep0vR1ZdGUcPyQj2ts9dODE0SVVbFKF9MYVCtgbtT7rkO8Io5xH8RzrQVPd+PKVK0yLPXaVf+nwtIdEoQtdy7FXd/cUhg5ouIaT8Ya2MbKwZKKypjBDwim1T/sKMgdp0Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O/RBnBLx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506I3mC9022784;
	Tue, 7 Jan 2025 03:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c88A6WZ1zjTk6jflNBKkYnC1udrelJb3rauFVe2dwhk=; b=O/RBnBLxRaRlT57v
	le9H31vEJqH7D/1PQCnxeevVUdCepJZgUYRbHs1os5kir5PnoDqmEso+/nYupCRK
	rutHZxIHsyNKOsQgNHXZ7nb+XOqGqXg9FFrjfRfLMa970ZeF9OzgEYrRtsLd7dyM
	oLYi4+LGgISywFyS8hfJIdJKL12VJG5OVGVwI5uRyDcCpQnmUWItCbGEdbIdAHV7
	jAC6JQBncPhLY3D8wYiqvYheCt5eNhfcEWLohn4moRszyXGDxFC/YDk0uVpOeyO/
	z6mVu8F/fq/l4iyYCor8fPiJkkqn+wruI0yVh9NSX2Mpe1vOfRFWX6aEexlum6Z4
	Lhn1tQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440m4a1120-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 03:11:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5073Bm7V005929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 03:11:48 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 Jan 2025
 19:11:48 -0800
Message-ID: <a6265bc6-531e-4f78-8a99-3ac97386a386@quicinc.com>
Date: Mon, 6 Jan 2025 19:11:47 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/msm/dsi: Drop unnecessary -ENOMEM message
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean
 Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
 <20250106-drm-msm-cleanups-v1-4-271ff1c00795@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250106-drm-msm-cleanups-v1-4-271ff1c00795@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: I26W1Doh121cv4BuNhXVg2kOBiDNOUUM
X-Proofpoint-ORIG-GUID: I26W1Doh121cv4BuNhXVg2kOBiDNOUUM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 mlxlogscore=939 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501070023



On 1/6/2025 12:49 AM, Krzysztof Kozlowski wrote:
> Kernel core already prints detailed report about memory allocation
> failures, so drivers should not have their own error messages.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

