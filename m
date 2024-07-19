Return-Path: <linux-arm-msm+bounces-26626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C72D937811
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 15:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC9D9281A4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 13:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E2D7581A;
	Fri, 19 Jul 2024 13:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Lt5O5bzP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4934110E6;
	Fri, 19 Jul 2024 13:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721394027; cv=none; b=c8xGGj7ZBeIF9S9m1ISEfgRo9hwALloedzoVwgniSD/Jm0+GGwyfRgU7yQXEt7eOAnP3Hq5urkTOZkjbZeh1MQe7q823gXdA7yrA3bLTUUZanNHA24nVVeOeMMS5hB0XMV+mo/Uz3W153pg5PXn32Wo1QX/Ht2naYAYcxjxbWVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721394027; c=relaxed/simple;
	bh=4PuD+Zg8WgoYi5qoPzC967jzIAoumbZIZBDixv3rlJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=K83weVQLkKM5AKqb/OpfBNJp+hQHwyHNXzIxCRLZqbbWPFMjRXa7k66YZNgWI05w2ZXK37MT666UL8uW/QlX+0k3LnLZ+iPn0xZRv9Ytp6ybHZx4als4IlcRaGXSvxC0YwaibXMuCb5FZthR4LAVo6XpvdNsizXXVY2lIcYf95E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Lt5O5bzP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JCCBIF002452;
	Fri, 19 Jul 2024 13:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GGg4SWJkQClPBhLeVuIPvmo11fhUGwYA5HNu9OcriZU=; b=Lt5O5bzPqG3RMzmR
	h/Ga/H0g+EluvBkgAgHrlWKfinBju29KlCogDO94z88NNxRWfnKlbBbGiFsDEC0g
	8B4B/ESYO+U+TQ1KJdt+BwaHdKYcTIMFZBivdc61BFIXtVX25Rk8q1dD4rjMWc98
	/bI6ixPRQR1sJGWYzwP3uZVWQxyW89bMinEy4MbGB1+TJZeNPpNoKUGJNR8LiAea
	9H15qPjCuiFJ45jjUcSwY1MvM8QNa+2zCpvq5rub1AnAcJycVdv7UtPeqVgox1LQ
	wG+4VWzGIojopQXrRko+4FwlFw+2465VfORBfUKZ/9DiB1B1oHn3cC4XsuSfKKFw
	AMNMIg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40fe94sbr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 13:00:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46JD03KH010173
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 13:00:03 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Jul
 2024 05:59:57 -0700
Message-ID: <7b757a6b-4ca9-4f8a-b8dd-571737805405@quicinc.com>
Date: Fri, 19 Jul 2024 18:29:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 6/6] iommu/arm-smmu: add support for PRR bit setup
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <jgg@ziepe.ca>, <jsnitsel@redhat.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <quic_c_gdjako@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <iommu@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>
References: <20240628140435.1652374-1-quic_bibekkum@quicinc.com>
 <20240628140435.1652374-7-quic_bibekkum@quicinc.com>
 <CAF6AEGvroi8rJimFv95tkWmRFa5_aTpBJ7GFcRAuZpLGdSyEYQ@mail.gmail.com>
 <0650ba0a-4453-4e2d-8a76-0f396ac1999c@quicinc.com>
 <CAF6AEGv_9e-TDW1r0N4-db6pY_aV_EZFqrpNbATVS5Vy6+fs1g@mail.gmail.com>
 <4a5f54c7-120e-427d-8a0a-9fb83e13a72e@quicinc.com>
 <CAF6AEGtrtFNxDWtuADA4oOHhZJ=dJZcGaJ1XLFJt4fe4Xp=pTA@mail.gmail.com>
 <3b7c05b1-8f36-4c81-a55c-dbb467314099@quicinc.com>
 <CAF6AEGuRKU+DkL0-b3xdR1R45_MiiKQYRRXEXYz-xohu8rUaEQ@mail.gmail.com>
 <CAF6AEGtbw06-gOSvX9gAbi=SA801gmD3_8c5xkOU-G9g2qKptQ@mail.gmail.com>
 <9509f256-04a4-4907-98fc-148c5087d74d@quicinc.com>
 <CAF6AEGuLwZ0yFGWMKX-O1VjQB2M57K+CsyJ=7PCKXE=b=VsSNg@mail.gmail.com>
 <3382aaca-4ca1-46e5-a445-dcb115ff206f@quicinc.com>
 <CAF6AEGu0uH7GuNb3SJVk0cPDUwkYZ6NTG1ze+wmc1OjsaownwA@mail.gmail.com>
 <61e04616-32f8-4574-9721-ea032d227bf2@linaro.org>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <61e04616-32f8-4574-9721-ea032d227bf2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QVnm_ko1ZvkehGKw91BeX_EU5vbklOxb
X-Proofpoint-ORIG-GUID: QVnm_ko1ZvkehGKw91BeX_EU5vbklOxb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_06,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407190099



On 7/16/2024 5:44 PM, Konrad Dybcio wrote:
> On 15.07.2024 10:07 PM, Rob Clark wrote:
>> On Mon, Jul 15, 2024 at 4:00 AM Bibek Kumar Patro
>> <quic_bibekkum@quicinc.com> wrote:
> 
> [...]
> 
>>>>> As I checked gpu_prr_mem reserved mem section is not used for mobile
>>>>> targets hence not present for other DT only compute targets like
>>>>> x1e80100.dtsi has the same. PRR looks to be smmu version specific
>>>>> property.
>>>>
>>>> I only see it in gpu_prr_mem in x1e80100.dtsi, but not documented
>>>> anywhere.  I'm only assuming based on the name that it is intended to
>>>> be for PRR (but not sure why it is larger than 0x1000).  Are the
>>>> PRR_CFG_*ADDR regs programmed by the fw (and access blocked in EL1) on
>>>> this device?
>>>>
>>>
>>> As I checked, if the drm/gfx driver allocates the page for drm, then
>>> this reserved-memory region is not required.
>>>
>>> PRR_CFG_*ADDR regs have read and write access in EL1 only for this
>>> device, behavior is same as other devices as well. These are not
>>> programmed by fw.
>>
>> If there is any device which _doesn't_ have EL1 access to these regs,
>> I think going the reserved memory route seems more future proof?
>> Otherwise we later on have to deal with two different ways to do
>> things.  But I'm not sure if there is any such device or risk.
> 
> We can have our cake and eat it too, if we keep the check for a
> reserved memory node handle, but make it a dynamic allocation (see
> [1] for example), this way there's a way to opt into using this from
> the DT and there's no need for adding more properties
> 

Coming to allocation methodology, here the client/user(drm/gpu
driver in this case) would be allocating the page and pass the address 
to our SMMU interface which would just configure it in the PRR_CFG_*ADDR 
register.
So I believe the choice of allocation method should be better left to 
the client, rather than restricting them to a specific strategy. (?)
If dynamically allocated without a reserved pool, this region might only 
be present in some targets and not others, which could make it look a 
bit ugly [1].

Thanks & regards,
Bibek

[1]:https://lore.kernel.org/all/CAF6AEGvZWdN+CC9O3tq7kjYPq424U6__KgAnFNCV0bCqE8wPuQ@mail.gmail.com/#:~:text=That%0Aseems%20a%20bit%20ugly%20to%20me.

> Konrad
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/msm8916.dtsi?h=v6.10#n109

