Return-Path: <linux-arm-msm+bounces-61654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 586E4ADE160
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 04:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26FCB3A8FB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 02:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7021A5BAF;
	Wed, 18 Jun 2025 02:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j2UXFJCE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A23191F66;
	Wed, 18 Jun 2025 02:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750215342; cv=none; b=jd2qbBIOBWJ+G0+YfWpJ0d9V9eFfH3mQWn4XycIZU7+QwZUqKmTBUm4Xxf6PqaPIjROeECjfJLpi0uRU6gwwgi4Jb9ITyEoFcPo0zwbsIrng7LpJwrDh8WFS5Mqga3D/0aY1iujvy9DTDvHHG4ZBi9FIKW3eKsOCzDnzg4tokM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750215342; c=relaxed/simple;
	bh=etmVRHcVDk2/UUoW7LnoA4oBmqkimfZ8EmByKA/x1Ww=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DtUMqiiDY8YeYKA1wSvodbO6mu6UOorBUBYKiwpDfLYXR8pYkfFalePDpAI86bE1Rcue68bM6P2nO4nwe6F08e5XF43J9csV2DgEKuhAiPY4M/NbX2OLo6CeRuxSoPFxWQYXp+dqD7046WkAFScmTcHatr+8sCXRNwv5+YcCcQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j2UXFJCE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I0eTke014060;
	Wed, 18 Jun 2025 02:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QPxKANHLv7NCrr5U8VFOG1yqB2CKXa4O2a9p0CNsww0=; b=j2UXFJCEXDaTMEWM
	FVN2xTnRrhzPknDq68/pDJUhF57Vk+gZhilwPrtsVbOVLnAG14N6/jgS8GJid6Ef
	qBvlbVOxerIZ2sEzXoJx7S50MNV30CzsFu5KqQH7ZuL1QCjUXxS36cgE8jOvILk8
	Ws8XljwxwVOEo5ZiOBUQlZnPBWyzksD3GDdLlY1xNLVzfSZvrO5Du5Xh1PaePR+K
	PQJaWGLdA6/w7UgtBwIDXl7psKf+v+upfRzdza+QVBwfP0hEKHOdH1+giO1IZdkD
	qcVEH3nEGgvW1D6LGtwiEKXczzMZ/tKpZE72nZkVmFTR8LSSCkS/irK8tPXh/Zi6
	U/Tpcw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47b9aksxfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 02:55:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55I2taj0002766
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 02:55:36 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 17 Jun
 2025 19:55:33 -0700
Message-ID: <2ad9d5c5-c55c-4425-9581-2326871ac1be@quicinc.com>
Date: Wed, 18 Jun 2025 10:55:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] Enable CTCU device for QCS8300
To: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250327024943.3502313-1-jie.gan@oss.qualcomm.com>
 <d87a6bba-eaed-4ac4-a272-3bb38b1607dc@quicinc.com>
 <yiz7tewisidbzztbcwc7v2sac4lv2lom5kv4a4rubdfcr73flt@rcga4a6fxhdv>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <yiz7tewisidbzztbcwc7v2sac4lv2lom5kv4a4rubdfcr73flt@rcga4a6fxhdv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: owAuna-5gnzQPnIReTbNSS4k5VQqLhee
X-Authority-Analysis: v=2.4 cv=UPTdHDfy c=1 sm=1 tr=0 ts=68522aa9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=cYWCKBAcly1RK3kNDnkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDAyNCBTYWx0ZWRfX/T/SzQJjTAt+
 9+kj4jkmAPpeVsdeLd1ICnfa2x3FvexQpbWdrpj/aGAAH2baf9UWXZYmeHibfm1XrxEh4ZomRx4
 u///Y56bFEM0MfzBudARNnlhDL+55POnWyBSanEghqq49nogdtJkXoN75gNsISsmOOCsl2xzIB7
 +XkUFGC+6+vtWBQiN2Hb9hZJ6hrphCTcAO/2bxj+e0Nt76frf3Jkuz/ahqxCBzpPwaCeyLRjcC1
 hDDaCkwHrbpYADw0IgsLT2lj4Dr0eMGkY1SZIc8sXrRQ8JWqPeA6CA+lqmIiyp5UwDGlaKzb4xS
 67JN9TsBskzoe+qhOwuGKx0ARz6mQx9dB+wFPKYMTa8AdbhEb9h6DW6p4VooG/mpFUFSiA6CQjE
 YBJSf7m62iMf7X0LEvvfuaqP8ngOf7wLAte+oLSyDGwN9l/ZOXokrqjUveBCKAH1qaTjN+fZ
X-Proofpoint-GUID: owAuna-5gnzQPnIReTbNSS4k5VQqLhee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=826 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180024



On 6/18/2025 10:50 AM, Bjorn Andersson wrote:
> On Wed, May 14, 2025 at 04:00:12PM +0800, Jie Gan wrote:
>>
>>
>> On 3/27/2025 10:49 AM, Jie Gan wrote:
>>> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
>>> the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
>>> configurations as SA8775p platform.
>>>
>>
>> Gentle ping for the series.
>>
>> dt-binding patch has been reviewed by Krzysztof.
>> dts patch has been acked by Konrad.
>>
> 
> You don't seem to have the Coresight maintainers among the recipients of
> the binding patch, so that's probably why it hasn't been merged yet -
> and I can't merge the DTS change until the binding is accepted.
> 
> Please apply Krzysztof's R-b and send the binding alone to Coresight
> maintainers, once they have accepted the binding please resubmit the dts
> change and I'd be happy to merge it. (v2 sounds good on both)
> 
> PS. Please see go/upstream on how to adopt b4; "b4 prep --auto-to-cc"
> would have saved you from this mistake.
> 

Thanks for the information.

Will re-send the patch series.

Thanks,
Jie

> Regards,
> Bjorn
> 
>> Thanks,
>> Jie
>>
>>> Jie Gan (2):
>>>     dt-bindings: arm: add CTCU device for QCS8300
>>>     arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
>>>
>>>    .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
>>>    arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
>>>    2 files changed, 160 insertions(+), 2 deletions(-)
>>>
>>


