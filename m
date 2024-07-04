Return-Path: <linux-arm-msm+bounces-25249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 873D59272C1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 11:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB7FCB24B2E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 09:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4818419B3D6;
	Thu,  4 Jul 2024 09:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lsozSrId"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB4A748F;
	Thu,  4 Jul 2024 09:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720084377; cv=none; b=XpQAEc9TAIKMR/4zuRBo4vf2TD0CdojV1h7u1RPKDYX1ZtoG/zsq6ES0+cmNpqYdg1yesIEbw/WphfmT7EY6S85SoG1GmJBm0kBkE5/xtXOxso/efQlQf8Y+qSmBzicdzsjEW/7BAEuemxpzgfqQXpaPYXHgY3o5wM+7IIq76d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720084377; c=relaxed/simple;
	bh=OYLPfV+8NtDWkziPQDKG29MfY5TjzbBDOQq/oZSSnmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=r+XVZuniDVZ0x8bS+0gU3e13DAonu+r6oC/aUljvpSoyyoUZj/hwLKbzPVEWB+HXPiy9rpa+jr6mcn9RomzgymRNz5TVV0w5cTLMzUsOvjd22XoFdpNNcrOSHdAVy3ErS6/RhmIdSfVcsBy9gt8ymHrcnmDGmQMfKZ/CmVuL4Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lsozSrId; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4644Hvpl028769;
	Thu, 4 Jul 2024 09:12:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jG0Ib8Vn317l2flbKFBoO2J1QolULszJacV0GDH3cRw=; b=lsozSrId1LkKQpOe
	wUOv51LWOdGuFHeocdddqO+vnwh7+jzRKxljoktjzA1D2AhQI7x9TvsKP0s1HKFD
	XS92xqa9rnBa5M/bpbwp3B+WcinILEZEpVmOXoqMoHXzDqiMPkKaKONhW4hmAAiA
	1oCvCrMt7/iBC6H4cUyM4DuSFL0NwuGEzQYsFsedUztKnoLqTzlDwxCUTXptfjiE
	P/I2z8QITw1ROlUFA8ZbpES7xGyBLseVMUof6i26SEyuv8Gckutwc5NUmJ5F58aA
	6ODt7qQsrlLg2rRponLkAkvSzwUUGLrAfah1k4YAeZIKe7WUBhzFrYL40jCyc6MJ
	YUd2zg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 404kctn7vs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 09:12:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4649CYxb013234
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Jul 2024 09:12:34 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 4 Jul 2024
 02:12:30 -0700
Message-ID: <6ad2e62d-8672-4b64-848a-6634d7a9410e@quicinc.com>
Date: Thu, 4 Jul 2024 14:42:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 4/6] iommu/arm-smmu: add ACTLR data and support for
 SM8550
To: Will Deacon <will@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, <robdclark@gmail.com>,
        <robin.murphy@arm.com>, <joro@8bytes.org>, <jgg@ziepe.ca>,
        <jsnitsel@redhat.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <quic_c_gdjako@quicinc.com>,
        <konrad.dybcio@linaro.org>, <iommu@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240628140435.1652374-1-quic_bibekkum@quicinc.com>
 <20240628140435.1652374-5-quic_bibekkum@quicinc.com>
 <ueuhu5xfzp2rnuxzeqqd6cho476adidztgx7oq2tbiufauv6h4@obblpxvqwnno>
 <6da77880-2ba4-4b02-8b3e-cb0fbd0a9daf@quicinc.com>
 <20240703130209.GA5750@willie-the-truck>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <20240703130209.GA5750@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: e2Sxmnfg0-J0NMOvYal-1fw0fJpnlbN3
X-Proofpoint-ORIG-GUID: e2Sxmnfg0-J0NMOvYal-1fw0fJpnlbN3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_05,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407040063



On 7/3/2024 6:32 PM, Will Deacon wrote:
> On Wed, Jul 03, 2024 at 05:45:23PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 7/2/2024 12:04 AM, Dmitry Baryshkov wrote:
>>> On Fri, Jun 28, 2024 at 07:34:33PM GMT, Bibek Kumar Patro wrote:
>>>> Add ACTLR data table for SM8550 along with support for
>>>> same including SM8550 specific implementation operations.
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>>> ---
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 89 ++++++++++++++++++++++
>>>>    1 file changed, 89 insertions(+)
>>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> index 77c9abffe07d..b4521471ffe9 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> @@ -23,6 +23,85 @@
>>>>
>>>>    #define CPRE			(1 << 1)
>>>>    #define CMTLB			(1 << 0)
>>>> +#define PREFETCH_SHIFT		8
>>>> +#define PREFETCH_DEFAULT	0
>>>> +#define PREFETCH_SHALLOW	(1 << PREFETCH_SHIFT)
>>>> +#define PREFETCH_MODERATE	(2 << PREFETCH_SHIFT)
>>>> +#define PREFETCH_DEEP		(3 << PREFETCH_SHIFT)
>>>> +
>>>> +static const struct actlr_config sm8550_apps_actlr_cfg[] = {
>>>> +	{ 0x18a0, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>> +	{ 0x18e0, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>> +	{ 0x0800, 0x0020, PREFETCH_DEFAULT | CMTLB },
>>>> +	{ 0x1800, 0x00c0, PREFETCH_DEFAULT | CMTLB },
>>>> +	{ 0x1820, 0x0000, PREFETCH_DEFAULT | CMTLB },
>>>> +	{ 0x1860, 0x0000, PREFETCH_DEFAULT | CMTLB },
>>>> +	{ 0x0c01, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>>>
>>> - Please keep the list sorted
>>
>> Sure Dmitry, will sort this list in reverse-christmas-tree order
>> in next iteration. Thanks for this input.
>>
>>> - Please comment, which devices use these settings.
>>
>> As discussed in earlier versions of this patch, these table entries
>> are kind of just blind values for SMMU device, where SMMU do not have
>> idea on which SID belong to which client. During probe time when the
>> clients' Stream-ID has corresponding ACTLR entry then the driver would
>> set value in register.
> 
> I'm still firmly of the opinion that this stuff needs a higher-level
> description in the device-tree and should not be hard-coded in the driver
> like this. It's not just a list of opaque values; it describes
> SoC-specific topological information that should not be this rigid.
> 

As per my understanding since ACTLR register is an implementation
defined register,
so I think the placement can also depend on factor of how these
registers are used?

For Qualcomm SoCs, it stores prefetch values for each client, improving
performance without defining hardware design.
Even without setting this value, clients on these Stream-IDs would still
function, albeit with reduced performance.

The SteamID/Mask pair in first two columns <which is a SoC topology> is
only used as reference to find preferred prefetch setting for the
corresponding client on this StreamID

To refer initial discussion and Robin's thoughts on device-tree approach
for this property which we proposed as a part of RFC:
https://lore.kernel.org/all/a01e7e60-6ead-4a9e-ba90-22a8a6bbd03f@quicinc.com/

" On 9/18/2023 4:49 PM, Robin Murphy wrote: "
 >
 > At the very least this would need to be in a implementation-specific
 > backend, since everything about ACTLR is implementation-defined; there
 > could be bits in there that the driver needs to manage itself and
 > clients have absolutely no business overriding (e.g. the MMU-500 errata
 > workarounds). The generic driver can't know what's valid, nor what the
 > consequences are of not being able to satisfy a particular setting. Then
 > there's still the question of what if two clients ask for different
 > settings but want to attach to the same context?
 >
 > It's also questionable whether this would belong in DT at all, since it
 > has a bit of a smell of software policv about it.
 >
 > If it could be
 > sufficiently justified then it would need a proper binding proposal, and
 > "write this opaque value into this register" type properties are
 > generally not approved of.
 >
 > Thanks,
 > Robin.
 >

So as per the initial discussions it felt right to have this data stored
inside driver.
One potential downside is that the driver file could become cluttered
with this data, but this can be mitigated by storing the table in a
separate file if necessary.

For use cases or vendor that implement the ACTLR register differently,
deeply involving SoC topology values or defining hardware design
(something similar to Stream Matching Register),then it might be more
appropriate to place it in the devicetree?

This is just my understanding. I’d appreciate your further thoughts on 
this - Will, Robin, Dmitry, Rob.

Thanks & regards,
Bibek

> Will

