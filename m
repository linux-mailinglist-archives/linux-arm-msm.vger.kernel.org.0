Return-Path: <linux-arm-msm+bounces-29346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D799095C99A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 11:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5673CB22F22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 09:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC3B16A938;
	Fri, 23 Aug 2024 09:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lSByrbPM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1E816BE14;
	Fri, 23 Aug 2024 09:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724406576; cv=none; b=jCmcECOHT8YrljWMz06Z1OKzAACFWp+QBoKnKqatafi72+loDlcPTjd6HJaQ3FSlcnG/hTPAxRbNklghAV5eIaXIxRtaq3B8xkoH4nBxUMgrd0RqG+dO1LUFRX91Q+rEp9QsK2SqIlOs2zavSwvxd1I5/aLk/h+ly2/ZSlPe3r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724406576; c=relaxed/simple;
	bh=BWC2BNE0WdULX0ket+f5Ts7vqbpY9Klk/uO7qZahgCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FGNdDhgNQi2iOc89FbHIKlY28ytBPxpekB3/1ETid+vBjvCrma7XVXxZ48Rw9ZkIo4CV0i5euLkG/lHD2cqGB+4+TggKy3tBZa/XVzxuDpfIT+bTAhPnh0DcKDW7AuKMa92KD9eiuYVQqHzxxpHWEMJLfDBsJaH5tfPFaNeKb7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lSByrbPM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47N2NBsk007469;
	Fri, 23 Aug 2024 09:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A5hD6ZsYUmPkntcLlBxGe4qafZ5/vCau/ZVh9D9Doec=; b=lSByrbPMBnfLkRv9
	S5rZ88i7VK38bfT08i+ilwyrfuzTk7OUhKyrvpUo8ZTi9E6M7DYSYjn2/UadlOmB
	k8Myo/1IX6RK3XZKVETc6/TpmQ5Zy4oQztW7CnTsNRZ0BgtRZM6S9/7jhrMIMHgY
	Kp6EWQy8uHYzOn/HguugRp8qs8/xk/rsQtAfiVafBr6SIhJX2dcxl0/t/VHfE59b
	+w4DHBqB5dGikTamqIwcnOE/24skgnX8u10RAa+++diosp2wgLPhRdB61RlVMdjM
	lcxQNqEo4NFkdKjjyYHyj8ATxuN0AcygLY/JlhYo7O5Ksp87ZwhgzMdPUdMvc0WL
	G3/oXQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 415gsd62gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 09:49:30 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47N9nThK006273
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 09:49:29 GMT
Received: from [10.151.37.150] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 23 Aug
 2024 02:49:26 -0700
Message-ID: <f0134870-7349-4e9d-80e1-d254873d5035@quicinc.com>
Date: Fri, 23 Aug 2024 15:19:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add new driver for WCSS secure PIL loading
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <krzk+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_viswanat@quicinc.com>, <quic_mmanikan@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
References: <20240820085517.435566-1-quic_gokulsri@quicinc.com>
 <4d1c0d17-20b8-4989-9757-61031e9f03a4@kernel.org>
 <807c9315-bf88-4a0a-9632-2ce471b329b6@quicinc.com>
 <2b5105c6-ccc1-47fb-b22c-010537f39681@kernel.org>
Content-Language: en-US
From: Gokul Sriram P <quic_gokulsri@quicinc.com>
In-Reply-To: <2b5105c6-ccc1-47fb-b22c-010537f39681@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0N6AiRCZ5mhR_HSI00BqgE4xPZ25DK4M
X-Proofpoint-ORIG-GUID: 0N6AiRCZ5mhR_HSI00BqgE4xPZ25DK4M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_06,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=860 clxscore=1015 lowpriorityscore=0 impostorscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408230071


On 8/22/2024 4:58 PM, Krzysztof Kozlowski wrote:
> On 22/08/2024 12:43, Gokul Sriram P wrote:
>> On 8/20/2024 4:42 PM, Krzysztof Kozlowski wrote:
>>> On 20/08/2024 10:55, Gokul Sriram Palanisamy wrote:
>>>> This series depends on q6 clock removal series [1].
>>> How? So this cannot be tested and merged?
>> Yes. Though TrustZone enables these clocks, since Linux Kernel will
>> consider these clock as unused.
>> These clock will be disabled so we cannot bring Q6 out of reset. So we
>> have the dependency set.
>> I posted this as a separate series because [1] 'remove unnecessary q6
>> clocks' series was already reviewed for some
>> versions.
> This is not a dependency in the kernel workflow. Nothing gets broken,
> nothing stops this patch from merging. Your remark is confusing and will
> either start questions or prevent applying the patchset.
>
Ok, got it. It will not break anything. Will post this series as 
independent series in v2.

thanks,

Gokul


