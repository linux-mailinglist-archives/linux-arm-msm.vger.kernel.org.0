Return-Path: <linux-arm-msm+bounces-63596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A26A0AF85AC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 04:41:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06CC54A8532
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 02:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129BF1DE889;
	Fri,  4 Jul 2025 02:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E44G995I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A181DDA34;
	Fri,  4 Jul 2025 02:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751596897; cv=none; b=m7ht5/ri62LdeaJRD0LDTkJl+md6yEMZFEiVsx1D6Yl86BOeqoR0mcx4vJFVWzOhiRlFfYjGoHq9IMGGHm7nVZHd7XzswusIAI1UqgRT6fqZWDV1XH+H4H5tIdavXCy3GxPc0yqjNQ+YOqR7to7GxdC/xXz/oOcgtPconYiStUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751596897; c=relaxed/simple;
	bh=y1My5v030XEh0WaLlRiSBHqtzi/T5G/z6AFiYN0rslQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZIDWeZ+pOqOlBPIZn3rA7gjqpCg1hqz82oj+r7+PTjria8ef6jdiXSo4mw/UV8FnYhC0rQcUuBlzBt7SjHP/6F+7vPVf8ToBwbKYVeRZvWzJB0haYhGY55VgiI0XrsdhRgQHmgsX4TZppurgZFoa+Go2NjQWgy4LS1WrJ86SnSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E44G995I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563JPKf5029511;
	Fri, 4 Jul 2025 02:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4c2MhmG9LJubabheJJ4s6DnDEcYP/0f7ZQNfLP0aXkQ=; b=E44G995InBDYpB9J
	YS6KMDHwNDDpsYUhj6882fA8loOTJOSfEffTbgXb2xMR/7/sH2Hcs75e4t/qnY8V
	Wm3XipDB+pVyqhsD/2mPvoDym2q65fqKLEKklkx+4M6IdV1orbC9hdAJJY6AjdTp
	REEoM9IeQPDshdXmVStAu3FGgtYXKdbFSvJU+qedU2UwOp4pBMkOvuiCDqvTkzlv
	ATEErTSVpHThAaIBvhcbI56ysq7/UOGk8TI8WASpZFrDzWPbbr5VlLrlY7S3B762
	VAir/i1i2FIJ0QbTvzSu+MlLgB19B4MCoTR0aLtXw0qosEGqfkoe4cObgtB8K8Dd
	ZNL2EQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47nh9s3mm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 02:41:23 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5642fMOD023425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 02:41:22 GMT
Received: from [10.133.33.146] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 3 Jul
 2025 19:41:18 -0700
Message-ID: <7f2cb415-3f56-4e3b-a6a6-093d5d2a5161@quicinc.com>
Date: Fri, 4 Jul 2025 10:41:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Enable CTCU device for QCS8300
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark
	<james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
 <338a9ee1-10aa-4bd2-9b0a-5006ed571bb9@quicinc.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <338a9ee1-10aa-4bd2-9b0a-5006ed571bb9@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=frrcZE4f c=1 sm=1 tr=0 ts=68673f53 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gW6MYXlkPblPBwbZtHMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDAyMCBTYWx0ZWRfX43QC1Rg2OVfQ
 pgXAWSksEeAOdatAc1sqIIJANUhXpz+WuI8AVfjO5Eff0XHzi+mTfs/Bug+5NL7jx3LBWSPR5eo
 QPHb8nqcEReLYr4RjkPOBu09hynA+hhIJSCwax891ln8gJCYCVehykxeiPFT6/ikp12vDUd08Wv
 0+gQSUY2C80u7sWetlq9iXzV1rv/0qE3l5TFUGOqscxByEzNv2x/8tz1ALe3Z63ugBXnG0Ym0B5
 29TOKn498Migml9myfp4abXXaOakSH6V3+QZOw9/c06+k6jCh5oz0qgWqcaqiqzrQHgOS1TKDCO
 x0DJOW9F7slaZA89ki6wLDXKaY892ytDUVZ+nJAvK8kiqDZvr6EYNcKSEyadmejUx2AwFrnQ6Jy
 Y8l99pPuvJhg7+IuY8qbAXq7A6xCetlH0xMY6/KZX/Ap2uN1CI8Dcx4meEiQmWlfmFopEAvK
X-Proofpoint-GUID: E33tVrL2Pm-yhNsUEc6BC8z2FTjUBsgK
X-Proofpoint-ORIG-GUID: E33tVrL2Pm-yhNsUEc6BC8z2FTjUBsgK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040020



On 6/25/2025 8:59 AM, Jie Gan wrote:
> 
> 
> On 6/24/2025 5:59 PM, Jie Gan wrote:
>> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in 
>> binding to utilize
>> the compitable of the SA8775p platform becuase the CTCU for QCS8300 
>> shares same
>> configurations as SA8775p platform.
> 
> Hi dear maintainers,
> 
> I just realized it would be more efficient to introduce a common 
> compatible string for SoCs that include two TMC ETR devices.
> 
> Most of these SoCs share the same CTCU data configuration, such as the 
> offsets for the ATID and IRQ registers, because they integrate the same 
> version of the CTCU hardware.
> 
> So I propose introducing a common compatible string, "coresight-ctcu- 
> v2", to simplify the device tree configuration for these platforms.
> 
> Here is the new dt-binding format:
> 
> properties:
>    compatible:
>      oneOf:
>        - items:
>            - enum:
>                - qcom,sa8775p-ctcu
>                - qcom,qcs8300-ctcu
>            - const: qcom,coresight-ctcu-v2
>        - enum:
>            - qcom,coresight-ctcu-v2
> 
> Thanks,
> Jie

Gentle ping.

Thanks,
Jie

> 
>>
>> Changes in V2:
>> 1. Add Krzysztof's R-B tag for dt-binding patch.
>> 2. Add Konrad's Acked-by tag for dt patch.
>> 3. Rebased on tag next-20250623.
>> 4. Missed email addresses for coresight's maintainers in V1, loop them.
>> Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1- 
>> jie.gan@oss.qualcomm.com/
>>
>> Jie Gan (2):
>>    dt-bindings: arm: add CTCU device for QCS8300
>>    arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
>>
>>   .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
>>   2 files changed, 160 insertions(+), 2 deletions(-)
>>
> 
> 


