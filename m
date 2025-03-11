Return-Path: <linux-arm-msm+bounces-51085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5138CA5D4F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 05:09:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91DBC1771C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 04:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4051D9346;
	Wed, 12 Mar 2025 04:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cwg8E6p8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57676198E76;
	Wed, 12 Mar 2025 04:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741752591; cv=none; b=BkNOMpJTg7rK18FyO+Ag9Qi0btkGpCZSRobSEeXofJAIj5pTuMOFXlPl4+gfaPXKoDY6kYgt5e8kkRPvQvxKYMF7LB/d5jLNjoPfy1zyNbZz+B7l2NwEut+nvBCMQsW5sa5BYrcrI1pAT77VbcQLoEIOvo5Bkcimw9fbf7zPpEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741752591; c=relaxed/simple;
	bh=7FqfPB0ty1BYScJ3/y5F2wHazwbUgmYWPVtY2g6yglA=;
	h=Message-ID:Date:MIME-Version:To:CC:References:Subject:From:
	 In-Reply-To:Content-Type; b=sjoHOGwYbJ2Pvu0gxA3R1pkLzZsY9auq3K+a0cOkKn0fEISOPndLUMu5HKEe1Ya5OZ6B80HCtfj7VgzfSPsFT7D1JhAfPyI6dIkiFR1E1meJwrCPFo8B4g/vO/rwlFmzeFck0lX8jehotOOt6AcSJm5+kwNMjbMBoJffR1WdQIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cwg8E6p8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BNKEcR017367;
	Wed, 12 Mar 2025 04:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pZKFNUNxB7FZPmJ/VbU/nqeENYDp3QFO7WMJpIM1ZHo=; b=Cwg8E6p8MTWwT5fQ
	2bh6uM4TY2PGF24qj7zpCe7bHaaFxzlfepSI2RCVW+lEw8MIF7/tA288ynVhwqT2
	aXbWxw0zLb17BrGSyt4fBiNkWV23Vfjx8gfJWMYHJ5Cux9wAOS2cA6XBqEZQT7U7
	d8T6j518C7jKoUEQaEgzXJ3SYgKtF9f8r8JPDN+goeMAdcRE1gruv1DHhyCAaKVD
	QCGAUCDzM3GYoK3QFVmuonoOvfGvz7sionQOYJ7aIA0F3bCO0GJ5tv3179tC/PAo
	WxuQyrtnlInYpyF7JTHVsgJvMqW/MHkiJnYRSDpYZq3vchYPohE8b0L+1idtEdWb
	IwACwA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2qh1sw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 04:09:47 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52C49kCL021108
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 04:09:46 GMT
Received: from [10.216.35.7] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Mar
 2025 21:09:43 -0700
Message-ID: <c7feb2c1-aa07-4bdf-bfa0-c5a071078a14@quicinc.com>
Date: Wed, 12 Mar 2025 03:35:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <quic_pbrahma@quicinc.com>
CC: <andersson@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <konradybcio@kernel.org>,
        <krzk+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <robh@kernel.org>
References: <20250206-qcs8300-pcie-smmu-v1-1-8eee0e3585bc@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: add the pcie smmu node
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <20250206-qcs8300-pcie-smmu-v1-1-8eee0e3585bc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: c439w7uVePmdboYR15BpqjDBg9bJB88Z
X-Authority-Analysis: v=2.4 cv=G5ccE8k5 c=1 sm=1 tr=0 ts=67d1090b cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=zReUl0LmTZ4h1ARIbA8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: c439w7uVePmdboYR15BpqjDBg9bJB88Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0
 mlxlogscore=544 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120027

Hi Everyone

Requesting your kind attention on this patch. I would highly welcome any 
feedback
on this and truly appreciate your time and consideration.

-- 
Thanks and Regards
Pratyush Brahma


