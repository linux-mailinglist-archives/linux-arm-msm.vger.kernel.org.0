Return-Path: <linux-arm-msm+bounces-57942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81425AB744B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0D3F8C213B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EED28136B;
	Wed, 14 May 2025 18:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fXq7yA6q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036C827A112;
	Wed, 14 May 2025 18:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747247113; cv=none; b=ZDLDQPRHD5rQNL88+FkUqoV+os4BZFWfLNfLqENYf+nAQMO++XDgvf245aFJ2yKH3Jl5NGGAz8J0v8TbKCFMo+azelKv3ZD73jVIz7exA0kPib/yuQ/FZW80ZvJFPlz56LX5oklp0oY2PfL075w8prF/GNJwg2hQEQG+OBGRO8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747247113; c=relaxed/simple;
	bh=l4oaE46B7vL0FO5cEYhhQyinrpnk40AbBuyp4cLW2Oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ISefudo+gtlkInTkjMlcbaGvknUU5mhbKXb+yZf3NfZdvhzpvEFySkeS02q8fqTvTQicDG7E4BR5J2jC3E3mqNksVLUxspRY//Iyi/5+cow12xZYGH91r2X6G5ghzPH1lgC/ZzY413/hR+C7SgNG2mobjMIhSxS08X69lnMvpao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fXq7yA6q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAug9i020138;
	Wed, 14 May 2025 18:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J49uDkCb9HKOce56BSBOkcrkK/RKgG1QwXA27OlhT64=; b=fXq7yA6qg3X9LptV
	4MUsBu3fv6pYXkzdpX886aCRYl7rz40evf8YpVgY4Lv3HPZynN8rrcwM1K19KOtu
	A3+a8r/+k2Bg9jex7GogUNc0U0bF0N1SPBXnlPSMJk4h46dKfCXFPneTgszGmv3U
	mGqmV22doQk8dXtRet/Zf6IbgzIb/LMQZEKNFRWrxAOO5P9t/ylV03lnVu+FUuF4
	0eChBUsGUQ/fFMFgA21WM60PePO4zI+rwkNsq05zH7nc5Gj1R4nzhIjOVGVTa51T
	PwMhfUQdXBsnqmgwZc823/yhz1VD4TdbTG771ysuEGL4ePE2ijf0HhclvskY9duw
	+dItcw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnknqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 18:24:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54EIOsvs026769
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 18:24:54 GMT
Received: from [10.71.113.47] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 May
 2025 11:24:53 -0700
Message-ID: <5183b76b-8043-4309-b25d-e1ae505f929e@quicinc.com>
Date: Wed, 14 May 2025 11:24:48 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
To: Vinod Koul <vkoul@kernel.org>
CC: Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Kishon Vijay Abraham I
	<kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
 <20250409-sm8750_usb_master-v4-6-6ec621c98be6@oss.qualcomm.com>
 <Z/exOF4T+0vNLQwg@vaman> <0517c37d-b1ba-466e-bffd-9f47b0d458d5@quicinc.com>
 <aCRVaNDQP/PdAXPR@vaman>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <aCRVaNDQP/PdAXPR@vaman>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: F8I7biqEH_-DftRpl4rk57BfXlJJqFGt
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=6824dff8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=_9SOoMVj05wlhOc5M30A:9 a=QEXdDO2ut3YA:10 a=aM5GUTHLM7wA:10
 a=AkvdQnL7tdoA:10
X-Proofpoint-GUID: F8I7biqEH_-DftRpl4rk57BfXlJJqFGt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE2NyBTYWx0ZWRfX4isQh/phoKL7
 gNDYG3ctyr8fuuqzZFPj6IggNXhjWBDL5ogCgcNsGwC5wuF+88+7gNzdLw6ayLccV+mT3DjgQls
 q5FJwXv5IjmwnnKB+bjItELeLBl3E0HuA8FM5mv4PzZH8goauI610a46plxlu2bVGmgmBmC1xY3
 BBLUhgfJOrB0pmILepR+8HMOwaJ5eVBHslVs0Lq9ouIg+blN+QljpxL4Q3WslkpHD4/TM4JQmgp
 mNlbsbLaYxiLV+PRn9OxC1hPkXfHJn8v1QOCSNM1FeCBd6SkrA9fZJ8eZLb7y6uud8boMHxBt3I
 NgbWnscTxcheU1x99B9dCiesQF/QaCRpgU+jVh5hwd7sldVgBkKUlYAnh9u/UWJ9oVFsE+80asp
 3Ko7aMXimriZxwIetQjAUS2CM4ZpVb31IK0YKwgNdGFb9SCDTnD7asGXB9wjpl2oemknpOhC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1011 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140167

Hi Vinod,

On 5/14/2025 1:33 AM, Vinod Koul wrote:
> On 16-04-25, 15:45, Wesley Cheng wrote:
>> Hi Vinod,
>>
>> On 4/10/2025 4:53 AM, Vinod Koul wrote:
>>> On 09-04-25, 10:48, Melody Olvera wrote:
>>>
>>>> +static int m31eusb2_phy_write_readback(void __iomem *base, u32 offset,
>>>> +					const u32 mask, u32 val)
>>>> +{
>>>> +	u32 write_val;
>>>> +	u32 tmp;
>>>> +
>>>> +	tmp = readl_relaxed(base + offset);
>>>> +	tmp &= ~mask;
>>>> +	write_val = tmp | val;
>>>> +
>>>> +	writel_relaxed(write_val, base + offset);
>>>> +
>>>> +	tmp = readl_relaxed(base + offset);
>>>
>>> Why are you using _relaxed version here?
>>>
>>
>> No particular reason.  I think someone pointed this out previously, and I
>> was open to use the non-relaxed variants, but I assume using the relaxed vs
>> non-relaxed apis comes down to preference in this case.
> 
> Nope you cant! There _needs_ to be a specific reasons!
> When you are doing read, modify, write, it is very important to know the
> right version to use...
> 

I mean, its a write readback, which ensures the bus transaction is complete
based on [1], hence why **in this situation** it is up to preference.

Otherwise, w/o the readback then we'd need to ensure writes are made
depending on the required sequencing (in spots where the sequence is
strictly defined), and that can be enforced using barriers.  If you feel
like using the non-relaxed variant is preferred let me know.  I can replace
it and remove the readback.

Thanks
Wesley Cheng

[1] - https://www.kernel.org/doc/html/latest/driver-api/io_ordering.html

