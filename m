Return-Path: <linux-arm-msm+bounces-845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7F37EEBFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 06:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ED511F22C03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 05:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FB7D2EC;
	Fri, 17 Nov 2023 05:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DOB3m47q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D035E1A5;
	Thu, 16 Nov 2023 21:36:49 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH5RF6H023441;
	Fri, 17 Nov 2023 05:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=nA3PNR25BIaeOhaqDbVpDTHNBGIaUSMBnvis4s/CS1Y=;
 b=DOB3m47qL3P2N4R2tQmhHcNmz1XNHaNHVBqLcDz6LpYNtwY6UOfVPvhYxzrL+4r5YEDr
 NsBdwz/ASy3APOdhba8DySQMBzQ7lzxyEZHrWcR8NIJoIIlhyHo57SXIoBW0fY5gtjt0
 DpoAxXobZ8W5xbmwtswedPuH4ksFBfR4s7XLlrYsT5AnsxCVI9KYn+ruDDGdlIxsRBX1
 SPGZJb6W6yMJeo+S0jtRD1YYlnTMhL4LY25a/0toYvovhannGbma+Tt/zWF/g+FLklQB
 EYhc/youDR2/5qj9Nhf53v+iuqdBB87BdI1VEcNO5WgDra8LeAEFEFXI6appHJtsWmpC 5g== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udw46rg7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 05:36:35 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AH5aYGt029630
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 05:36:34 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 16 Nov
 2023 21:36:29 -0800
Message-ID: <f132120e-1f7d-419a-be07-a1b8ac277d4e@quicinc.com>
Date: Fri, 17 Nov 2023 11:06:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] iommu/arm-smmu: add ACTLR data and support for
 SM8550
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>, <will@kernel.org>,
        <robin.murphy@arm.com>, <joro@8bytes.org>, <a39.skl@gmail.com>,
        <quic_pkondeti@quicinc.com>, <quic_molvera@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <qipl.kernel.upstream@quicinc.com>
References: <20231114135654.30475-1-quic_bibekkum@quicinc.com>
 <20231114135654.30475-3-quic_bibekkum@quicinc.com>
 <CAA8EJpr1NzqiuNVZ0YcLpJ=yeOYFbLouAFgN9VMOiKpmoGVdtQ@mail.gmail.com>
 <7edad996-f148-42d5-8e72-0334d3b9101f@quicinc.com>
 <CAA8EJpqzEvC-LEjJrOk6Ed8utFNnqgP=qkb0mq-dOfMZd5ij4Q@mail.gmail.com>
 <dba223a1-0456-40b8-b295-ea960867dcf9@quicinc.com>
 <CAA8EJpqvXb_Zdmq0O0KEA8mn5UkSriCZ02w16dts7Gd84R30oQ@mail.gmail.com>
 <aebdf7f6-48b7-43d3-95af-83859ddc593f@quicinc.com>
 <be9675a6-a01e-4cf7-95b3-174220d4a042@linaro.org>
 <61d2885a-50f9-419f-8473-10308baed493@quicinc.com>
 <CAA8EJpoTeonht4S5JkW=1VJmKsSFm5iCb_Tz-ZempaRufnjmHQ@mail.gmail.com>
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <CAA8EJpoTeonht4S5JkW=1VJmKsSFm5iCb_Tz-ZempaRufnjmHQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hu5XdWHLnDORm0bOjy4slDoorJfl-3dC
X-Proofpoint-ORIG-GUID: hu5XdWHLnDORm0bOjy4slDoorJfl-3dC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_03,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 clxscore=1015 phishscore=0 mlxlogscore=835 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311170038



On 11/16/2023 12:21 PM, Dmitry Baryshkov wrote:
> On Thu, 16 Nov 2023 at 08:10, Bibek Kumar Patro
> <quic_bibekkum@quicinc.com> wrote:
>>
>>
>>
>> On 11/15/2023 10:12 PM, Konrad Dybcio wrote:
>>>
>>>
>>> On 11/15/23 13:49, Bibek Kumar Patro wrote:
>>>>
>>>>
>>>> On 11/15/2023 4:15 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, 15 Nov 2023 at 11:51, Bibek Kumar Patro
>>>>> <quic_bibekkum@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 11/15/2023 3:08 PM, Dmitry Baryshkov wrote:
>>>>>>> On Wed, 15 Nov 2023 at 11:22, Bibek Kumar Patro
>>>>>>> <quic_bibekkum@quicinc.com> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> On 11/14/2023 7:42 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Tue, 14 Nov 2023 at 15:57, Bibek Kumar Patro
>>>>>>>>> <quic_bibekkum@quicinc.com> wrote:
>>>>>>>>>>
>>>>>>>>>> Add ACTLR data table for SM8550 along with support for
>>>>>>>>>> same including SM8550 specific implementation operations.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>>>>>>>>> ---
>>>>>>>>>>      drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 92
>>>>>>>>>> +++++++++++++++++++++-
>>>>>>>>>>      1 file changed, 88 insertions(+), 4 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>>>> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>>>> index 578c662c7c30..0eaf6f2a2e49 100644
>>>>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>>>> @@ -25,6 +25,70 @@ struct actlr_data {
>>>>>>>>>>             u32 actlr;
>>>>>>>>>>      };
>>>>>>>>>>
>>>>>>>>>> +#define PRE_FETCH_1    0
>>>>>>>>>> +#define PRE_FETCH_2    BIT(8)
>>>>>>>>>> +#define PRE_FETCH_3    (BIT(9) | BIT(8))
>>>>>>>>>
>>>>>>>>> What is the difference between PRE_FETCH_3 and PRE_FETCH_2? And
>>>>>>>>> PRE_FETCH_1? Are these real numbers that refer to some amount /
>>>>>>>>> count
>>>>>>>>> or just dummy names?
>>>>>>>>>
>>>>>>>>
>>>>>>>> No,these are not real numbers, but prefetch settings for a particular
>>>>>>>> perfect configuration.
>>>>>>>
>>>>>>> Then I'd ask for some better names or descriptions.
>>>>>>>
>>>>>>
>>>>>> Noted, PREFETCH_SETTING_n / PREFETCH_OPTION_n sounds like a better name
>>>>>> in the following case. Would it be okay to use this name instead?
>>>>>
>>>>> Not really.
>>>>>
>>>>
>>>> Any suggestion you have in mind, if not this nomenclature?
>>> Dmitry's concern seems to be that you provide:
>>>
>>> PRE_FETCH_1 /* prefetcher with settings preset no. 1 */
>>> PRE_FETCH_2 /* prefetcher with settings preset no. 2 */
>>> PRE_FETCH_3 /* prefetcher with settings preset no. 3 */
>>>
>>> whereas it would be both useful and interesting to see what these
>>> settings mean, i.e. what differences there are between all of
>>> these presets.
>>>
>>
>> Ah, okay got it now from Dimitry and yours' response.
>> But we exactly won't be able to reveal what each of these settings
>> mean, as this might risk of revealing IP as ACTLR bits are
>> implementation defined (except CPRE and CMTLB) which other SoC vendors
>> might be using it in different manner(or different purpose) in their
>> downstream implementation.
>> We can name it like (e.g PREFETCH_DISABLE, PREFETCH_SHALLOW,
>> PREFETCH_DEEP) to indicate the behaviour, but won't be exactly
>> name/describe it to explain what it does with a particular setting.
> 
> This is already better than 1,2,3.
> 

Acked, will take care of this in next version.


