Return-Path: <linux-arm-msm+bounces-10362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EFD84FBFC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 19:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63DD41C22A76
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 18:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB2657337;
	Fri,  9 Feb 2024 18:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CTsFPTsC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D94D54F85
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 18:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707503867; cv=none; b=nS6Sq+QsIji0gfXL6s3ykkOwE0xX1Vjzpm2wrXqQDQtQhPPJveSXFP677Ry4lM4egz+bh+i2VRLScW8PmjQ5o9djTImzwhrQPWQxYPDZ1IQTxsVOXFnnIounWuTIgqFRbvag44dPHzjM3M4K47IrzYvyhiJVaUvHY9BQCqG443I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707503867; c=relaxed/simple;
	bh=NCdS5hWRdVgeeaZxJSolTfpIqfGKNr6XexJD4r22ilg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=b7biXYYKQxBT9Zjp42MLFlAEEJo0c1VCuh6Lesp8JtnbPWS9VL5lG8eCM9EEB5QwrIv2dLJDf9/ziAiLgfzmT1M5YAgZ6Myd62WQj0PFT82yA1d6ixyKrvJAGV6zWXu4upDVi/lndQBDVdefgoG1A72MyxvSxUTnx9oVUbvJ+mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CTsFPTsC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 419IUrp1021848;
	Fri, 9 Feb 2024 18:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=NCdS5hWRdVgeeaZxJSolTfpIqfGKNr6XexJD4r22ilg=; b=CT
	sFPTsCDuSqajFTB+nILoVQ+cPzePSj8qVuyUmKn1nMt0QdxYC+vKZ/GaCxwc43Zk
	NnE036ErpUkYcZDoZIVsLaAAWctX8bcEFPgtfTfzjS4vleSusHIks+9DWkp6Z7ie
	E0BR9dmJcaMRouogtWJreUifzJworOmqAMUFP+0ZfpX2gftgqlm9JvdMV4ADtGG6
	zBLqqh/yyP/nASCfhG2Gwa3JsvMdRxG37v5q7AwGZWKgtfoI8jVtc3bqX9uPJA5p
	aFtIT0/MCI/6zWz/ARqSqzYQH1pQTZQWWhth90uYA2zIOKTKx+dHkFgAuzq8mr6d
	r9yYq+6MRtmzXSqSu9gQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5ann1wrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 18:37:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 419IbbdT008374
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Feb 2024 18:37:37 GMT
Received: from [10.110.105.190] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 9 Feb
 2024 10:37:37 -0800
Message-ID: <a4d87f2f-3ef1-0bae-40f2-eb230be653b5@quicinc.com>
Date: Fri, 9 Feb 2024 10:37:36 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/5] drm/msm/dpu: split irq_control into irq_enable and
 _disable
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
 <20240208-fd_remove_phys_ops_atomic_mode_set-v4-1-caf5dcd125c0@linaro.org>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-1-caf5dcd125c0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LhmBtAZ5A86rtf73DtePYlQ4GOTYFQ9e
X-Proofpoint-GUID: LhmBtAZ5A86rtf73DtePYlQ4GOTYFQ9e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_16,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=332
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402090135


On 2/8/2024 7:20 AM, Dmitry Baryshkov wrote:
> The single helper for both enable and disable cases is too complicated,
> especially if we start adding more code to these helpers. Split it into
> irq_enable and irq_disable cases.
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Tested-by: Paloma Arellano <quic_parellan@quicinc.com>



