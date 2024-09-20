Return-Path: <linux-arm-msm+bounces-32121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D864297D9EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 21:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7056E28388A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 19:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B08183090;
	Fri, 20 Sep 2024 19:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XqsxKCth"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46064168BE;
	Fri, 20 Sep 2024 19:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726862353; cv=none; b=n4+0Mxw0qFHVQwVZUZJ29vRkiEi3xRl+quKidu4FSfBnf6WcPFR8I/HMdwRWK5FatNqzDq5YhFKQNaHXQQTnk7PG8u1M9EGIA4pmUZPqLiKY6Lbm1wGwgBl9u2ArEaijPA65dZYTIQ4cRFiDIuoCmMSxCnxRdYRnyqTfk1MnFqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726862353; c=relaxed/simple;
	bh=Q8ax6UdOuwjg3P/YiKUPIa1rIa5rXqErQXWEV7/CIYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Miiz1EqFuAUfkNB4lfSQ6esj4ZTPlSVaf/5DhayhqiuMhyS2sIUak/VIuIJkPZBs+AtRilk3g8J1hcHyvq9ZUkCujtVUoHfuekfs6DhtZDTdZVUCC/QCEJAoUf2xJmX0VcT2EhFQbeyTRCRBA9qYTvczPGDSoYIGjfq+cAxJNZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XqsxKCth; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48KIDJmU011965;
	Fri, 20 Sep 2024 19:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pGg3xFSr4kJTIfcs44S25z/cOPJ3YCIit2QoVd/rW5A=; b=XqsxKCthFZUTBpZy
	hAWHTmCt/vgQb+vyz6prpzpB2gQcyXbDpyQmu2UDrZyWuKbvIqW2wYSuLNgHkI3a
	PpPu+CpUphuNDi8FipRXTXTUiMzcMExTcJNBwZB6nlNFsk/9KhzZDaJ7I86NLPaJ
	eYqTiCsWpYEqj3OeBC9wj4SlOtDgYxqL269XLV088WfUF1hl5heZKLLL6Xxa6CAn
	B/bSd2GjvhQ5ZL5W7u34Zqvoyksfe7fl3s8P9Kix504xBealogdZBCy0hPCmmZoh
	g0y0Eo9BlfOH4ERqGZLwRhXedkgTY4eeUXgrtdRAyO7rHb9Fnhf32saCpZgsA96R
	afFf1g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hftd27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 19:58:53 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48KJwqJY020313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 19:58:52 GMT
Received: from [10.216.31.199] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Sep
 2024 12:58:47 -0700
Message-ID: <9309fb5f-beaf-4395-9388-9f4ab8485bb4@quicinc.com>
Date: Sat, 21 Sep 2024 01:28:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 5/6] iommu/arm-smmu: add ACTLR data and support for
 SC7280
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
        <robdclark@gmail.com>, <joro@8bytes.org>, <jgg@ziepe.ca>,
        <jsnitsel@redhat.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <quic_c_gdjako@quicinc.com>,
        <konrad.dybcio@linaro.org>, <iommu@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240816174259.2056829-1-quic_bibekkum@quicinc.com>
 <20240816174259.2056829-6-quic_bibekkum@quicinc.com>
 <20240823155918.GD525@willie-the-truck>
 <3ae75a75-1717-40b6-9149-bc3673d520d6@quicinc.com>
 <20240827124714.GB4772@willie-the-truck>
 <b335452a-977e-41cc-9424-a2244fbe20de@quicinc.com>
 <35849d74-1197-446b-9a4c-1b8aabb38427@arm.com>
 <a882d634-85b3-4c5b-8309-348b4b3d9f0a@quicinc.com>
 <CAA8EJpo4rX=FwAwoocbys4-sv9gzPz6wwgFVyW1x4J7TU_JTgg@mail.gmail.com>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <CAA8EJpo4rX=FwAwoocbys4-sv9gzPz6wwgFVyW1x4J7TU_JTgg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: i2JTi-hzHAKvZ9AXyM8e55_4dpk1rBYq
X-Proofpoint-ORIG-GUID: i2JTi-hzHAKvZ9AXyM8e55_4dpk1rBYq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409200144



On 9/3/2024 6:43 PM, Dmitry Baryshkov wrote:
> On Tue, 3 Sept 2024 at 15:59, Bibek Kumar Patro
> <quic_bibekkum@quicinc.com> wrote:
>>
>>
>>
>> On 8/30/2024 6:01 PM, Robin Murphy wrote:
>>> On 30/08/2024 11:00 am, Bibek Kumar Patro wrote:
>>>>
>>>>
>>>> On 8/27/2024 6:17 PM, Will Deacon wrote:
>>>>> On Mon, Aug 26, 2024 at 04:33:24PM +0530, Bibek Kumar Patro wrote:
>>>>>>
>>>>>>
>>>>>> On 8/23/2024 9:29 PM, Will Deacon wrote:
>>>>>>> On Fri, Aug 16, 2024 at 11:12:58PM +0530, Bibek Kumar Patro wrote:
>>>>>>>> Add ACTLR data table for SC7280 along with support for
>>>>>>>> same including SC7280 specific implementation operations.
>>>>>>>>
>>>>>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>>>>>>> ---
>>>>>>>>     drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 58
>>>>>>>> +++++++++++++++++++++-
>>>>>>>>     1 file changed, 57 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>> index dc143b250704..a776c7906c76 100644
>>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>> @@ -31,6 +31,55 @@
>>>>>>>>     #define PREFETCH_MODERATE    (2 << PREFETCH_SHIFT)
>>>>>>>>     #define PREFETCH_DEEP        (3 << PREFETCH_SHIFT)
>>>>>>>>
>>>>>>>> +static const struct actlr_config sc7280_apps_actlr_cfg[] = {
>>>>>>>> +    { 0x0800, 0x04e0, PREFETCH_DEFAULT | CMTLB },
>>>>>>>> +    { 0x0900, 0x0402, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>>>>>> +    { 0x0901, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>>>>>> +    { 0x0d01, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>>>>>> +    { 0x1181, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>>>>> +    { 0x1182, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>>>>> +    { 0x1183, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>>>>> +    { 0x1184, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>>>>> +    { 0x1185, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>>>>> +    { 0x1186, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>>>>> +    { 0x1187, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>>>>> +    { 0x1188, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>>>>> +    { 0x1189, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>>>>> +    { 0x118b, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>>>>> +    { 0x118c, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>>>>> +    { 0x118d, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>>>>> +    { 0x118e, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>>>>> +    { 0x118f, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>>>>> +    { 0x2000, 0x0020, PREFETCH_DEFAULT | CMTLB },
>>>>>>>> +    { 0x2040, 0x0000, PREFETCH_DEFAULT | CMTLB },
>>>>>>>> +    { 0x2062, 0x0000, PREFETCH_DEFAULT | CMTLB },
>>>>>>>> +    { 0x2080, 0x0020, PREFETCH_DEFAULT | CMTLB },
>>>>>>>> +    { 0x20c0, 0x0020, PREFETCH_DEFAULT | CMTLB },
>>>>>>>> +    { 0x2100, 0x0020, PREFETCH_DEFAULT | CMTLB },
>>>>>>>> +    { 0x2140, 0x0000, PREFETCH_DEFAULT | CMTLB },
>>>>>>>> +    { 0x2180, 0x0020, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>>>>>> +    { 0x2181, 0x0004, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>>>>>> +    { 0x2183, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>>>>>> +    { 0x2184, 0x0020, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>>>>>> +    { 0x2187, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +static const struct actlr_config sc7280_gfx_actlr_cfg[] = {
>>>>>>>> +    { 0x0000, 0x07ff, PREFETCH_DEEP | CPRE | CMTLB },
>>>>>>>> +};
>>>>>>>
>>>>>>> It's Will "stuck record" Deacon here again to say that I don't think
>>>>>>> this data belongs in the driver.
>>>>>>>
>>>>>>
>>>>>> Hi Will,
>>>>>>
>>>>>> It will be difficult to reach a consensus here, with Robin and the
>>>>>> DT folks
>>>>>> okay to keep it in the driver, while you believe it doesn't belong
>>>>>> there.
>>>>>>
>>>>>> Robin, Rob, could you please share your thoughts on concluding the
>>>>>> placement
>>>>>> of this prefetch data?
>>>>>>
>>>>>> As discussed earlier [1], the prefetch value for each client doesn’t
>>>>>> define
>>>>>> the hardware topology and is implementation-defined register writes
>>>>>> used by
>>>>>> the software driver.
>>>>>
>>>>> It does reflect the hardware topology though, doesn't it? Those magic
>>>>> hex
>>>>> masks above refer to stream ids, so the table is hard-coding the
>>>>> prefetch
>>>>> values for particular matches.
>>>>
>>>> That is correct in the sense that stream id is mapped to context bank
>>>> where these configurations are applied.
>>>> However the other part of it is implementation-defined register/values
>>>> for which community opinion was register/value kind of data, should not
>>>> belong to device tree and are not generally approved of.
>>>>
>>>> Would also like to point out that the prefetch values are recommended
>>>> settings and doesn’t mean these are the only configuration which would
>>>> work for the soc.
>>>> So the SID-to-prefetch isn't strictly SoC defined but is a software
>>>> configuration, IMO.
>>>
>>> What's particularly confusing is that most of the IDs encoded here don't
>>> actually seem to line up with what's in the respective SoC DTSIs...
>>>
>>> However by this point I'm wary of whether we've lost sight of *why*
>>> we're doing this, and that we're deep into begging the question of
>>> whether identifying devices by StreamID is the right thing to do in the
>>> first place. For example, as best I can tell from a quick skim, we have
>>> over 2 dozen lines of data here which all serve the exact same purpose
>>> of applying PREFETCH_DEEP | CPRE | CMTLB to instances of
>>> "qcom,fastrpc-compute-cb". In general it seems unlikely that the same
>>> device would want wildly different prefetch settings across different
>>> SoCs, or even between different instances in the same SoC, so I'm really
>>> coming round to the conclusion that this data would probably be best
>>> handled as an extension of the existing qcom_smmu_client_of_match
>>> mechanism.
>>>
>>
>> As per your design idea,do you mean to use qcom_smmu_client_of_match to
>> identify the device using compatible string and apply the device
>> specific settings for all the SoCs (instead of StreamID based device
>> identification) ?
>>
>> something like this rough snippet(?):
>>
>> qcom_smmu_find_actlr_client(struct device *dev)
>> {
>>
>>          if (of_match_device(qcom_smmu_client_of_match, dev) ==
>> qcom,fastrpc-compute-cb )
>>                  qcom_smmu_set_actlr_value(dev, (PREFETCH_DEEP | CPRE | CMTLB));
>> /*where (PREFETCH_DEEP | CPRE | CMTLB) is used for compute-cb client.*/
>>
>>          else if (of_match_device(qcom_smmu_client_of_match, dev) == qcom,adreno )
>>                  qcom_smmu_set_actlr_value(dev, (PREFETCH_SHALLOW | CPRE | CMTLB));
>> /*Where (PREFETCH_SHALLOW | CPRE | CMTLB) is for adreno client. */
> 
> I like this idea, especially once it gets converted into a per-SoC
> table of compatibles.

Ack, Just posted the latest version v15 for this series , based on the 
compatible string based design approach [1] as discussed.

While completion of patch, I came to know that it might sometimes
be possible on Qualcomm SoC's, same IP/device on 2 different SoC
can have different ACTLR settings as well.
[1] _can take care of that case_ as well through different compatible
strings but this can be handled through per-SoC solution as well.

In the latest patch [1], I am going forward with Robin's suggestion
of single table per smmu, and can later follow up there if any
conflict happens.

[1]: 
https://lore.kernel.org/all/20240920155813.3434021-6-quic_bibekkum@quicinc.com/>

Thanks & regards,
Bibek

> 
>>
>> }
>>
>> Let me know if my understanding is incorrect.
>> Then in this case if different SoC would have a different settings for
>> same device, then everytime a new compatible would be necessary for same
>> device on different SoC?
>>
>> On similar lines there is another TBU based approach which I can think
>> of. Identify the TBU -> Identify clients from TopoID derived from SID
>> range specified in qcom,stream-id-range -> Apply the client
>> specific settings ?
>>
>> Both approaches would be driver-based, as they are now.
>>
>> Also I'd like to point out that in the current design, since we fixed
>> the smr_is_subset arguments to make the stream IDs a subset of entries
>> in the actlr_cfg table, we can reduce the number of entries in the
>> table. This way, fewer SID-mask pairs can accommodate several stream IDs.
>>
>> Thanks & regards,
>> Bibek
>>
>>> Thanks,
>>> Robin.
>>>
>>>>
>>>>> If I run on a different SoC configuration > with the same table, then
>>>>> the prefetch settings will be applied to the
>>>>> wrong devices. How is that not hardware topology?
>>>>>
>>>>
>>>> The configuration table is tied to SoC compatible string however as I
>>>> mentioned above, its basically a s/w recommended setting.
>>>> (using prefetch settings other than the recommended values e.g
>>>> PREFECH_DEFAULT instead of PREFETCH_DEEP would not render the device
>>>> unusable unlike changing stream-ids which can make it unusable).
>>>>
>>>> Since it is implementation specific we cannot have a generic DT binding,
>>>> tying stream ids to these recommended settings.
>>>> Even with qcom specific binding due to dependency on implementation, not
>>>> sure if we would be able to maintain consistency.
>>>>
>>>> So from maintenance perspective carrying these in driver appear to be
>>>> simpler/flexible. And if it doesn’t violate existing precedence, we
>>>> would prefer to carry it that way.
>>>>
>>>> This parallels how _"QoS settings"_ are handled within the driver
>>>> (similar to this example [1]).
>>>>
>>>> [1].
>>>> https://lore.kernel.org/linux-arm-msm/20231030-sc8280xp-dpu-safe-lut-v1-1-6d485d7b428f@quicinc.com/#t
>>>>
>>>> Thanks & regards,
>>>> Bibek
>>>>
>>>>> WIll
> 
> 
> 

