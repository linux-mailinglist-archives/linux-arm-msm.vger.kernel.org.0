Return-Path: <linux-arm-msm+bounces-42671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FB69F654A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 12:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3F6D16C716
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 11:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2640B19D071;
	Wed, 18 Dec 2024 11:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HpIPRc0a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA551E4BE;
	Wed, 18 Dec 2024 11:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734522550; cv=none; b=MCgrddI4P/nnL5yum758I3gf2kHEAdtbQU5xoc5an8myRecsvlmkD+Mlpra6HHlwwpwAwCuP6D0I9Ru19Ugd2KPOHW8bTdSln68DMYs2h0C42vLG4vPynx17+1nyrx9fGUhYtgL3beEIid6L51BCVgT+dQL6FPBEmZf0Bloz+Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734522550; c=relaxed/simple;
	bh=dLbzEbaDHvYakW+NDZBLnAsfSIjQB/PxMuZCNUdtipg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ERzhH0i71/IPrw9e7l1+wIaT1NxT2zFi85C/1hKmpsnQkT9z9WzVbRXoMIUnh/Ru9BcOfxH4dUcM3sSPYLx0Ft4YsENYXrjZ1qtg+oGbHUrLZZZuMLrUXFGNIlvxCGG/eg59kcShv/4CDNLmxDBEXFwXuU6FdFdCdLWlbb2BI+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HpIPRc0a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI6VXOW024603;
	Wed, 18 Dec 2024 11:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iLWNx2FA/dI6UIjL/hBve/bZl8p3jRU5JhrraLwYxv4=; b=HpIPRc0atR/nqtiz
	ABRUbCw/4YVCRq1UYBwky5t2qvYb4aQcHH0Fhd6cQ2E0LYFKvMsySP+aPIBSG7nn
	DjsqgICYDGjQOLugi6IDy6dKDPbljDxg1DXOQVBrzM4KjbqT6muC6gF99Wcwfuri
	E9dw8IeRsfQhEJueIKKFUY0KbPdYG7vi8AGE3xAqp+XHgB24EtDBDD2JvQF8gwB1
	5JJf3/+/CLgkyof0c89xQsvA5R4g+KHcRJEIyvto8u5idcYu3favpiWkat+9oxiM
	ApZuLp6+8k6YI4Q5aMEWB3iN36nX9hlX2aGcteieSJ3D6mUnVYbS52HQNmE533Ao
	us2tHg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ks6ygs9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 11:48:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BIBmvbC001841
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 11:48:57 GMT
Received: from [10.218.35.239] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Dec
 2024 03:48:53 -0800
Message-ID: <e15bc97d-eef3-4e49-badf-5b3afbc113d9@quicinc.com>
Date: Wed, 18 Dec 2024 17:18:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/19] Disable USB U1/U2 entry for QC targets
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <cros-qcom-dts-watchers@chromium.org>
References: <20241218102707.76272-1-quic_prashk@quicinc.com>
 <nvhrhnfls2i4sb6rrlax2dh3hf5thfttrq54bgug2jc7ol26rj@cnk5dtampfes>
Content-Language: en-US
From: Prashanth K <quic_prashk@quicinc.com>
In-Reply-To: <nvhrhnfls2i4sb6rrlax2dh3hf5thfttrq54bgug2jc7ol26rj@cnk5dtampfes>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2eGH2wt0aY8GizL1Th3QcJGZ6IHtU5B2
X-Proofpoint-GUID: 2eGH2wt0aY8GizL1Th3QcJGZ6IHtU5B2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=2 mlxlogscore=171 mlxscore=2
 priorityscore=1501 spamscore=2 adultscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180095



On 18-12-24 04:57 pm, Dmitry Baryshkov wrote:
> On Wed, Dec 18, 2024 at 03:56:48PM +0530, Prashanth K wrote:
>> Enabling U1 and U2 power-saving states can lead to stability and
>> performance issues, particularly for latency-sensitive or high-
>> throughput applications. These low-power link states are intended
>> to reduce power consumption by allowing the device to enter partial
>> low-power modes during idle periods. However, they can sometimes
>> result in unexpected behavior. Over the years, some of the issues
>> seen are as follows:
>>
> 
> [..]
> 
>>
>> This series was earlier started by Krishna Kurapati where he disabled
>> U1/U2 on some SM targets. I'm extending this to more devices including
>> Auto, Compute and IOT platforms. On a side note, this quirk has been
>> already included on some mobile targets like SM8550/8650.
> 
> Why are you resending previous patches rather than adding another series
> on top of it?
> 
Hi Dmitry,

RFC had only one patch with quirks (to disable u1/u2) only for few
targets (SM8150, 8250, 8350, 8450). It was later decided to split it
into per-file commits as per the review comments. Hence I clubbed
Krishna's changes along with few more targets. Let me know if this needs
to be changed.

>>
>> Changes in v2:
>> - Removed the wrongly added quirks from tcsr_mutex node.
>> - Link to v2: https://lore.kernel.org/all/20241213095237.1409174-1-quic_prashk@quicinc.com/
> 
> What was changed in v3?
It was supposed to be "Changes in v3" instead of v2.
> 
>>
>> Link to RFC:
>> https://lore.kernel.org/all/20241107073650.13473-1-quic_kriskura@quicinc.com/#Z31arch:arm64:boot:dts:qcom:sm8250.dtsi
>>
> 
Regards,
Prashanth K


