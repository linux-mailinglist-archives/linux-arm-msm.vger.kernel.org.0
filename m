Return-Path: <linux-arm-msm+bounces-15848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFB3892CC3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 20:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1DD3283236
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 19:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189EF3BBDB;
	Sat, 30 Mar 2024 19:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b2cLnI2z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891D01DFD8
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 19:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711826506; cv=none; b=RfhjnfvkOaKs+39D1CmtFvmvjfgigeogCJC4haS7SXS+ESQZk2454Zw97CX8+B2J5OOgQl2LCp7Pl3DgZj9X5rwrEtA4/GDeUV0a0Ef5svkOwSL1sC7/WFbu3YPPQZyKDWjYyQJD0kw8/0JHiHYE4C3rWC2qBJbkRuK0LF+67jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711826506; c=relaxed/simple;
	bh=9p6/gJpmLPXc/bAaZvHgh0C+P/JGQwRdU+aBsL13atI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uG6foZb+3dCz4TSU3K3KwfZHYdnwl7xD8RabDJDctr1u0jqt+lHnT6QM3pb93aRdo5MiP2VNRNrN3heVv2SpMBqap0dIhda7/eo3AOyISTQqF1bJEeb5qJUHrVt013mtTekpiCCw0/nu+cN7LRzLM1gB24iWaWHF/5XjDryIwg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b2cLnI2z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42UJGR1X026992;
	Sat, 30 Mar 2024 19:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=UEo8BI5CnLeAOQtpAjK6stNodVWCUeWJPSDDOh7z9M8=; b=b2
	cLnI2zk+uQzI9KOdLQtyOWcj1gpc+Y13eo3VJJcMUwKBJMyyQ+wgSCGpQVYQWS28
	tBtrQZ1FQcoaCwIMqaArHEJnRdbkrNzflaIqtG0570BKN1LU7Gift4I2MYHuR6Fs
	y0hDYprQp+gN8t7+at0XkhSCkkxPmzMF/7vLGp3G6YdGRTdkrJvhzeCk92cp7nem
	NbF51Ddd7wkBqUtk1JHu7/04bJ8lQbk/KFdpop7PFZczYXPa/fLdz68QwpxkgUrv
	tImhOks+vr38ft6JsgqJtNTGQClCaKFekn1d8Dk4WJEkAk3TpfWNek4gnk6ygoNJ
	gySXXnkEITqdmjJTByGA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x6atwh97y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Mar 2024 19:21:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42UJLVE7019966
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Mar 2024 19:21:31 GMT
Received: from [10.110.118.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 30 Mar
 2024 12:21:29 -0700
Message-ID: <7de26846-9964-e4dc-cd1b-b6d89c77abdc@quicinc.com>
Date: Sat, 30 Mar 2024 12:21:26 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: make error messages at
 dpu_core_irq_register_callback() more sensible
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240330-dpu-irq-messages-v1-1-9ce782ae35f9@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240330-dpu-irq-messages-v1-1-9ce782ae35f9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PsNYanolSFsVau1IgQRLjvWfVIhZjwhN
X-Proofpoint-ORIG-GUID: PsNYanolSFsVau1IgQRLjvWfVIhZjwhN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-30_14,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 mlxlogscore=803
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403300158



On 3/29/2024 8:53 PM, Dmitry Baryshkov wrote:
> There is little point in using %ps to print a value known to be NULL. On
> the other hand it makes sense to print the callback symbol in the
> 'invalid IRQ' message. Correct those two error messages to make more
> sense.
> 
> Fixes: 6893199183f8 ("drm/msm/dpu: stop using raw IRQ indices in the kernel output")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

