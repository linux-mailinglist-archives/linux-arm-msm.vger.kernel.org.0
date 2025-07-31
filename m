Return-Path: <linux-arm-msm+bounces-67213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0FBB16C22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 08:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2BA13A4EF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 06:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192BA285C91;
	Thu, 31 Jul 2025 06:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EcqENJS+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7211E2857F8;
	Thu, 31 Jul 2025 06:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753944058; cv=none; b=EhQGhC9sc8oCigmjdRkrtzxtXflUxXDQrYVUA/ypmxwDj8p6bqxqDbPcxhigJjlDagzyS99TXKeZhzEVP17TuNUNUCMNDrYBAj4xFzfHmUMHZssGVXiHOOgxEtNRHqcDX8/DIU7rvR7gvB2NL00Ts3Od8+qKSal50Nns6bX0weE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753944058; c=relaxed/simple;
	bh=ivBeR0Qy095FZgjGh7+vo1NDd24Y+ZuPhGp3A2lVokg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=O0su7tH+MhUhmg+uFHlFFy6NXQyFP2ttFyIjb5kwqj4iehrLh2y9iJuYxiJrbWUM4jB00vhejTKoPQIiWepba7+axhkTUY8qUOpjhGegGwfyHG1/1BwpErVnpXPTIe6DGDrSG7sM/KI4h9ESiZ+MmCgkHYSq/TqXsPvqLpIjprI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EcqENJS+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V1fOMv020374;
	Thu, 31 Jul 2025 06:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	krg4eEKBDHW8yuizuSSwWwKUE+N9PXsQII1Dp6qD3AM=; b=EcqENJS+/wVctH2E
	Eo+3P+t8o5BFAqA/gipn1qa/cWNc/PDflohl1ixcR86m9OsCWEVLm0J1hz0sCTWz
	XFs+8BfuGcTp1D+eueTb9+EJwc0rS+We25X8nm9GGtSeC8gGo94BjRtjUYQo+sD+
	DEsgSMoFPfSrDwkMAAitjtYY7ozeMHfegS/p/M72jK51s8z/7hISUgrId5kKXstS
	edBEp9N/nfkgLji5ZzkRgswKn32HUrD+0hHlQgOf/FLeuFqh9FaeQg9CflRFcbKY
	woVWyZnNqRqujs6ovof1ewFmeU9CzgfgBU6Fxk1xNKUuIcQqqF7hsc0vxW9cFJqr
	MI34Lw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1apgv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Jul 2025 06:40:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56V6eedT008345
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Jul 2025 06:40:40 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 30 Jul
 2025 23:40:37 -0700
Message-ID: <8d6a4c97-51a3-423f-9095-74347283d71b@quicinc.com>
Date: Thu, 31 Jul 2025 14:40:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: Add Qualcomm extended CTI
To: Mike Leach <mike.leach@linaro.org>
CC: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Yingchao Deng
	<quic_yingdeng@quicinc.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
 <20250722081405.2947294-2-quic_jinlmao@quicinc.com>
 <727fa9f4-fe25-495e-9d8d-48e504fbe6b0@arm.com>
 <20250722091425.GH3137075@e132581.arm.com>
 <CAJ9a7VhLLgAak_4FB=iW0izXprM4W+RsKfHUeo=XUHh9LwtUsA@mail.gmail.com>
 <20250722140659.GI3137075@e132581.arm.com>
 <CAJ9a7ViUoSMV_HHKKRMhcQX=isU+feJvwCaVhu-6EBK4QXJbVg@mail.gmail.com>
 <de702854-aca1-4c78-9555-f2139d5376af@quicinc.com>
 <CAJ9a7VjTYvFVz1fp2_hNkLrKBbBYkiHHyshgsVT98V8oB_bn8g@mail.gmail.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <CAJ9a7VjTYvFVz1fp2_hNkLrKBbBYkiHHyshgsVT98V8oB_bn8g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Z2D5yA4lildV6Q0NQz6aK8P3MRlPOFQM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA0MyBTYWx0ZWRfXyM0hefolPZzi
 bddd8kZGEcgZYpwmRgg0TRXI5Spa99CeHizTgpc1eYFieg/SvnrcAsdNJfjNoK0vRamRf6AKDIW
 3dhyqb6u3/kWJvKc4tBFY1YT5DhBprH75xG4+mOUSoEBZ/1H6SP7teZZBxDQYmSYvEWfXUpT2DJ
 S3X0hh/wAQ+FN1urjMIUlc/5jzifyDEwD57qQFd8MOGqWY3HEvWeHFNK423UzuchNqWfnEUl5k/
 xtGzPLLecWq2pHDve0K8FQzxFfleJxhpIH6MrGcibYaYm1khSgwoHPkg+lPGo4jKn2FhWoaQXLK
 uVkZVE9kt8PiWdDgL8tCitVC0EWGHIK3NxwJcgwE9ri3n5opGoiXzG7QkU2YhV7L7hKoutXd2Bj
 Z12MJUu1zcpCucc08NdWij1/KdURjb75+4AJIjanSbacqJh6OxV9zUahnJNXGaLYCdYLSitI
X-Proofpoint-GUID: Z2D5yA4lildV6Q0NQz6aK8P3MRlPOFQM
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=688b0fea cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=7CQSdrXTAAAA:8 a=lllgu8f7gHFEmeyaSi0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507310043



On 7/28/2025 5:52 PM, Mike Leach wrote:
> Hi,
> 
> On Wed, 23 Jul 2025 at 03:58, Jinlong Mao <quic_jinlmao@quicinc.com> wrote:
>>
>>
>>
>> On 7/22/2025 10:56 PM, Mike Leach wrote:
>>> On Tue, 22 Jul 2025 at 15:07, Leo Yan <leo.yan@arm.com> wrote:
>>>>
>>>> On Tue, Jul 22, 2025 at 01:00:18PM +0100, Mike Leach wrote:
>>>>
>>>> [...]
>>>>
>>>>> For a change of this magnitude to a CS component, that the ID
>>>>> registers will also have to change. This is a requirement of the
>>>>> Visible Component Architecture in the CoreSight specification.
>>>>> External tools cannot see the device tree.
>>>>>
>>>>> This is effectively no longer an ARM designed component, so the
>>>>> CoreSight specification requires that the DEVARCH register change to
>>>>> show qualcomm as the designer, and the architecture value change to
>>>>> represent this component.
>>>>> DEVID should be used to allow the driver to pick up parameters such as
>>>>> number of triggers as per the existing CTI component.
>>>>>
>>>>> If this component is Coresight compliant then the driver can use the
>>>>> ID registers to configure to the extended trigger architecture.
>>>>>
>>>>> With complete remapping of most of the registers, and the dropping of
>>>>> claim tag compatibility - which appears to be a breach of the
>>>>> CoreSight specification - it may be better to have a completely
>>>>> separate driver for this component.
>>>>
>>>> Good point. I'd like to confirm with the Qualcomm team: apart from the
>>>> differences in register offsets and claim bits, does this CTI module
>>>> have exactly the same bit layout and usage as CTI standard
>>>> implementation?
>>>>
>>>> If yes, then from a maintenance perspective, we probably don't want to
>>>> have two CTI drivers with identical register settings. It seems plausible
>>>> to encapsulate register access and claim logic into several functions.
>>>>
>>>>     void cti_reg_writel(u32 val, struct cti_drvdata *drvdata, bool relax);
>>>>     u32 cti_reg_readl(struct cti_drvdata *drvdata, bool relax);
>>>>     int cti_claim_device(struct cti_drvdata *drvdata);
>>>>     int cti_disclaim_device(struct cti_drvdata *drvdata, bool unlocked);
>>>>
>>>> Thanks,
>>>> Leo
>>>
>>> The CTI supports 128 triggers  - which means many more registers to
>>> enable / connect etc.
>>> I need to study the changes to determine if there are functional
>>> differences too.
>>>
>>> It might be feasible to divide the code into a common file and a pair
>>> of variants so some is reused.
>>>
>>> Mike
>> Thanks Mike & Leo & Suzuki.
>>
>> There is no register to show the version ID to distinguish between ARM
>> CTI and QCOM extended CTI.I will double confirm with internal HW team.
>>
> 
> Can you clarify here please.
> The CID0-3, PID0-7, DEVARCH and DEVTYPE registers are part of the
> CoreSight specification for component identification.
> Can you confirm they are present on your component and the values they have.
> 
> If they are present then the CoreSight specification requires that
> they be different than the standard ARM CTI.
> 
> Regards
> 
> Mike

Hi Mike,

These registers are present. I checked they are same as standard ARM
CTI. Like CIDR1(0xFF4), both are 0x90.

Thanks
Jinlong Mao

> 
>> For extended CTI, only trigger number changes and claim logic. Other
>> functions are the same as ARM CTI(bit layout of the register and usage)
>>
>> Thanks
>> Jinlong Mao>
>>
>>
> 
> 


