Return-Path: <linux-arm-msm+bounces-64349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3393FB00013
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 13:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 457867BEC2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 11:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F41215F53;
	Thu, 10 Jul 2025 11:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G4km2LB+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41D61E8333;
	Thu, 10 Jul 2025 11:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752145426; cv=none; b=pSMaXm9KOkKuONSpKXNSpXwAVxbi1YvxpUIrtm67pROiqyGPx0oytQ15RuNYUj8gtJRc/2x8Dfz3qKLF7F7qUAaH+HRP5MFLMNQbt2pPKv9pG95riEoYyr486TYCQe1GEj5pWn31hImkeM1pxxrZ3d1rwwfV28HsgBU0fh/pSm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752145426; c=relaxed/simple;
	bh=20ZP8OdhAyD+gpnm8qdeCwBF2oSi37pL+zMNWOxJcyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GfhdSSg0cvvnKe0KOpkb8fthZWvN/gPSXr3YrSvhnjgG3hLLTl2tcBKQRHdp5vuOx+4hSLnFAGcseSqnCIfbCLx4HTQPK0pmSsvqZ+LntDqr/Q1EnudwE7xNeMa7z8o6j+qkZkyKoGpUQZHPb7twFwfnokLrlCv9eKHBzKNsf4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G4km2LB+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A8FGRs002166;
	Thu, 10 Jul 2025 11:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wnL5YbMxSPSCfxzFYvbsE5MYDIzNe44c0R0LoWDUaW4=; b=G4km2LB+jPUaqiSb
	ZdyBxreb9JXvCUx7+hh0FKR1a5wX7TYvTW7srRsfVCxTA3pVBatB2ABtnYE3n43W
	LlB+LFY9hzxRVbBjHwJAeBgg0zzbXmuAb90JmYO2EtErnwbNJML4w6isLX7kuGCG
	MOwkOWVb64Cnvd2aM/94H9q5XUVvzSKMg3UGaq73tMcggv8BWa0T9N8Ia4VlYntT
	z7+c06yctqQI4xlmKEpV4hSi+lMRh8NZQmQhZJ+2ZJzVZXnj5VE8FaJxuHw5IGng
	ZVbGlaZpW4WZK55oIS76ldWKYGhOqUv3HruJzL3P2Was/RHVD0JYh40ugJfyYUgp
	fGuNRg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap4pyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 11:03:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56AB3UIv010622
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 11:03:30 GMT
Received: from [10.239.133.49] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 10 Jul
 2025 04:03:26 -0700
Message-ID: <aae21139-a4cd-4c5d-8147-56c2352ae195@quicinc.com>
Date: Thu, 10 Jul 2025 19:03:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: arm: Add CoreSight QMI component
 description
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark
	<james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
 <20250424115854.2328190-2-quic_jinlmao@quicinc.com>
 <6b286132-1c56-43c1-a61e-0e067a73b615@oss.qualcomm.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <6b286132-1c56-43c1-a61e-0e067a73b615@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=686f9e03 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=AF4Fs5PTzvYx14FSdpIA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CB1oC-9VWWKmjzPlSedjzmHG81GMqJcW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA5NCBTYWx0ZWRfX52zLSLsHsSBY
 OJaAhhYeS3iaYRfC5uvTaxajjcZCyGguADkYMi0IHKzRn9/3nem6dAz29lauf+RRUF6RSxpCWDw
 PDdGzrMm96xvioMAmkpK0cCDiZQ1ZxhieIuMuBdSxBLGju59UNg0QkHvvH41hEUG+XV6s1w7bG8
 8v6vFKGov5+zDjHCvkzMiG9YGyhk4q8MWKrWBxM9x+1IQTjoj2j9dsc5z5SFhHIpag3izDDru/+
 MPobh6jLsM5Hr4BvGLumEqprPxjF06vg46xSgw+aP4nz4oSGFqTmPg5RbtnsTuqPA5hyMNfZUve
 vSKaqYG1ghuRTjKv1YZIbhvcmRlCZSeJCV5MI2JG/JJD5Tpd/Bo+cNcDY+NGp98BbgjGQyiO8sa
 QnZ0hOaq+tmSDOy3YI1Uy/LLgHCWSQEeZZP8brEPsNi7/tN7OPrnXcbpNJ7PzjuOaP0djw9h
X-Proofpoint-GUID: CB1oC-9VWWKmjzPlSedjzmHG81GMqJcW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=878 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100094



On 2025/4/25 4:30, Konrad Dybcio wrote:
> On 4/24/25 1:58 PM, Mao Jinlong wrote:
>> Add new coresight-qmi.yaml file describing the bindings required
>> to define qmi node in the device trees.
>>
>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>> ---
> 
> Is the service-id hardcoded/well-known? If so, we can drop
> this devicetree node and create a new platform device (& probe the
> related driver) based on the presence of qcom,qmi-id that you add
> in patch 3
> 
> Konrad

service-id is not hardcoded. Different qmi connections will have
different service ids.

> 


