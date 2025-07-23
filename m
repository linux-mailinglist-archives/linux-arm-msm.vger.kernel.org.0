Return-Path: <linux-arm-msm+bounces-66172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF8CB0E8DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 04:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 297BA1CC14C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 02:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409601E1DF0;
	Wed, 23 Jul 2025 02:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KpUkCLqP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10735184;
	Wed, 23 Jul 2025 02:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753239499; cv=none; b=sUl1eWQplMAB8S+9bWKGyl9ZcsPBVkkNOUgLV0MOujx1IYhPnPx2L106qzh2/ekamxSqhZL1yuFR+nvwpNw5/mgNisR72KkSlrQsW/0btvgpqnCCdiaFlerC9tiC3x5Ughm+empeEfS6yVe//EFyw6PxkdzxMyIqxII0OydZ3XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753239499; c=relaxed/simple;
	bh=EAvfpVXBg/s7LE1f/r9TEmhahpc2eSJyn/1aSVG7P74=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Bc2DtjI6QM5N8+JILkBGNYoAvOOkPm/jumxRpr1ffGyAFuCcLBRItkYymgegYBZFbQTrLwuZiOZLcJb31utnxiAw09cUPEfdmDMA/z4a/j9Dn9hem0gzDlleGBOeMO0jgr8vhgZo6eCx624eAnr/ST2+ywSGedYNOPSs4uDEnTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KpUkCLqP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMPJ0T031583;
	Wed, 23 Jul 2025 02:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FB3rPM3yt3uXhH5VZX+ye+pyPNsVLbKVwD9d2WguCtM=; b=KpUkCLqP5ZcyoIpO
	OeL3ZxGAKi9fu2eiH2tamDOWdPnVGkPMRG9kcSFoUwBTJzsK0UsbNDG8GgB7Z8hU
	0/BW5KC0bj642kUPVWqx9xq2AKpiDz2uPDHVrrRInn/HWxomZSj3yoS6DTZKrB6d
	32ZJMvHBjjfPo92UFVnypcqOti9BZkEoU8Lg7ezwR5KnUPC5DmfjMmeV/rWMcQBH
	kwxBTz+IgplYvOXlOfFdzVWaBvwUs3whGTEHA0nVgX+BqsYiKdYYXow4/gW2CJNz
	thZbRXwBkgCq9igbmtFGwvh6GBr9OYWbG74JsLj+LnZHKMRZN4C2W2lBLUahG0No
	2RPuZw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s3m4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 02:58:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56N2w1M7007736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 02:58:01 GMT
Received: from [10.133.33.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 22 Jul
 2025 19:57:57 -0700
Message-ID: <de702854-aca1-4c78-9555-f2139d5376af@quicinc.com>
Date: Wed, 23 Jul 2025 10:57:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: Add Qualcomm extended CTI
To: Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@arm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark
	<james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
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
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <CAJ9a7ViUoSMV_HHKKRMhcQX=isU+feJvwCaVhu-6EBK4QXJbVg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAyMyBTYWx0ZWRfX6ykturwn5DWU
 S1F3fn7b+5ugIj++HFmL0rkYApWdxBqwkzagH5u4p1Jb2oMDsz9/v/+H3jF94T2JDLsWpmsiz+Z
 Pqvd82kfQ4x16N9XDjcbcDHtOHkX2TSEWq4xLms4gpVtAOarKGjrN1u898DmO7sGtt0uOt+YmpT
 3hwnv8KBTC/X+rSNKlPb+44/Tgh+rGDqDMPzRmOg9ISMQlbZP2sWDYcxilcvIxZt4wh7IkI0t3x
 QWGBGlO+2LxDKzAoZHO3aZpFa9QI9JBGqAyM8Z/kyEaQX8eVEn+ErqezWRzEtrkJRAehwRpFiqC
 GKYCt8ersPSuYmm48VbOo6EZaqxnSjhyFP1aIPg3nOKcZYtg3EOlTe1PWT6oQ6rNtwPSWHikFrJ
 EkOb2VukRKPEPSdfIYBLaEiLonKvkmA36XLXz3Pl07pNgYa8HJ8WdqaonZzTxfNYDoDgrRmG
X-Proofpoint-ORIG-GUID: vVA81xI4G2ll7kSGqawiKMrZIIMs25EQ
X-Proofpoint-GUID: vVA81xI4G2ll7kSGqawiKMrZIIMs25EQ
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=68804fba cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=7CQSdrXTAAAA:8
 a=BpXFY5eAunnYVu0cvbAA:9 a=QEXdDO2ut3YA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230023



On 7/22/2025 10:56 PM, Mike Leach wrote:
> On Tue, 22 Jul 2025 at 15:07, Leo Yan <leo.yan@arm.com> wrote:
>>
>> On Tue, Jul 22, 2025 at 01:00:18PM +0100, Mike Leach wrote:
>>
>> [...]
>>
>>> For a change of this magnitude to a CS component, that the ID
>>> registers will also have to change. This is a requirement of the
>>> Visible Component Architecture in the CoreSight specification.
>>> External tools cannot see the device tree.
>>>
>>> This is effectively no longer an ARM designed component, so the
>>> CoreSight specification requires that the DEVARCH register change to
>>> show qualcomm as the designer, and the architecture value change to
>>> represent this component.
>>> DEVID should be used to allow the driver to pick up parameters such as
>>> number of triggers as per the existing CTI component.
>>>
>>> If this component is Coresight compliant then the driver can use the
>>> ID registers to configure to the extended trigger architecture.
>>>
>>> With complete remapping of most of the registers, and the dropping of
>>> claim tag compatibility - which appears to be a breach of the
>>> CoreSight specification - it may be better to have a completely
>>> separate driver for this component.
>>
>> Good point. I'd like to confirm with the Qualcomm team: apart from the
>> differences in register offsets and claim bits, does this CTI module
>> have exactly the same bit layout and usage as CTI standard
>> implementation?
>>
>> If yes, then from a maintenance perspective, we probably don't want to
>> have two CTI drivers with identical register settings. It seems plausible
>> to encapsulate register access and claim logic into several functions.
>>
>>    void cti_reg_writel(u32 val, struct cti_drvdata *drvdata, bool relax);
>>    u32 cti_reg_readl(struct cti_drvdata *drvdata, bool relax);
>>    int cti_claim_device(struct cti_drvdata *drvdata);
>>    int cti_disclaim_device(struct cti_drvdata *drvdata, bool unlocked);
>>
>> Thanks,
>> Leo
> 
> The CTI supports 128 triggers  - which means many more registers to
> enable / connect etc.
> I need to study the changes to determine if there are functional
> differences too.
> 
> It might be feasible to divide the code into a common file and a pair
> of variants so some is reused.
> 
> Mike
Thanks Mike & Leo & Suzuki.

There is no register to show the version ID to distinguish between ARM
CTI and QCOM extended CTI.I will double confirm with internal HW team.

For extended CTI, only trigger number changes and claim logic. Other
functions are the same as ARM CTI(bit layout of the register and usage)

Thanks
Jinlong Mao>



