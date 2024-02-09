Return-Path: <linux-arm-msm+bounces-10361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C8F84FBF9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 19:37:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0CFC1F29227
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 18:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC4F57339;
	Fri,  9 Feb 2024 18:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SZMwiDL+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9833D53398
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 18:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707503851; cv=none; b=sw3npDkOjQhsd1wpHXIBUyU7ut8vOaVqfMiy0hVLqbSlVoNI+riR6iL/ntQgGAaDQQeGM0ffskwer/TA+Ef1FxCAc95iKBSDPKNuwaFEFkT8SJ83Q0yxU+K6CAqGKh3SRWyeg+V6q81DojN6knR2REbh+ppOvDhI4lLDeg+5D60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707503851; c=relaxed/simple;
	bh=sfFDrhDn4Bbv33xCfHo/CRv1o3bmhS7JIp51pInLIGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=agx2B4WZucb8N6rzIvtvYNK5UxQ7iN3VF5dHOJPgBnWZzuFl67Kl/22yKVHpIypM7l0iWqEd7QniO9SgBFALV1eVUbVF4OLJlA5P/EZdh9PJpLvs1OVrATOvuTAKeGZk5E19uTgNKghO5pUBeLnM+Nfq0s9ajuTXRSCfj+iT+Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SZMwiDL+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 419I8UwB015260;
	Fri, 9 Feb 2024 18:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=sfFDrhDn4Bbv33xCfHo/CRv1o3bmhS7JIp51pInLIGE=; b=SZ
	MwiDL+5Ng5auZWaTCozzGbVEIVNN/1dDhRFGqcNgtvfoL3bmP7thiHytItHcqZSr
	PXmUWaWMfMT3IUH12CZmuQR/lHbaE8sBFFQoUMGKjBNil5pQCa8+bqu70QPh7caJ
	fqpKXEvsnuN1NfswHM2spiDvFTmlCKmOYaWxZt27tG57H96BhqIQnk2jcjEYDrwZ
	8pbeJKcEumyE+pVAJD5CstZ+yH13pbtUNVuiGx6KqJv+X5i9pnScZYuiaP+3T6FK
	2PZj1nNWFH1A3F63UBZFNRBCS74h4MGepJfV9YLj/7sRB4dJ4F4YbxG9atvM0ngg
	1TezPbF91ncnw3TcYzvQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w4uphv3j6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 18:37:23 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 419IamCm003562
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Feb 2024 18:36:48 GMT
Received: from [10.110.105.190] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 9 Feb
 2024 10:36:47 -0800
Message-ID: <36533dc6-630d-0612-6409-4e8adcedcbf1@quicinc.com>
Date: Fri, 9 Feb 2024 10:36:46 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 3/5] drm/msm/dpu: drop
 dpu_encoder_phys_ops.atomic_mode_set
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
 <20240208-fd_remove_phys_ops_atomic_mode_set-v4-3-caf5dcd125c0@linaro.org>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-3-caf5dcd125c0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 50d6twWOAzyweXMOWpt8GvAyEkXJCEjq
X-Proofpoint-GUID: 50d6twWOAzyweXMOWpt8GvAyEkXJCEjq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_16,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxlogscore=724
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402090136


On 2/8/2024 7:20 AM, Dmitry Baryshkov wrote:
> The atomic_mode_set() callback only sets the phys_enc's IRQ data. As the
> INTF and WB are statically allocated to each encoder/phys_enc, drop the
> atomic_mode_set callback and set the IRQs during encoder init.
>
> For the CMD panel usecase some of IRQ indexes depend on the selected
> resources. Move setting them to the irq_enable() callback.
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Tested-by: Paloma Arellano <quic_parellan@quicinc.com>



