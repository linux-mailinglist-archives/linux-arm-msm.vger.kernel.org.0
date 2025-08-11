Return-Path: <linux-arm-msm+bounces-68382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEA7B20C14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 16:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9AF8188AA41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 14:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B997254AFF;
	Mon, 11 Aug 2025 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WuWOlH8q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17F12512EE;
	Mon, 11 Aug 2025 14:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754922915; cv=none; b=qlQVoKuJKwh8a6DxM/lLS5b9QMUh2m1sEe9WEOl2REBmmavYj2GOsIiDSUl+oTbVJncipj8WUVCbSoylMXt8lFs6ekBC4ScS/JKXIL8x1q2xwdb+nFM5uZSnjnavK7fOkZc/E0tPo5MdZa5CnsOy3Z0E7II9HZKehUhfZjTvpF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754922915; c=relaxed/simple;
	bh=pDvr9YWQ+V0w5SRTL+f0yoh7gyCQhQ/n25ntJP00x30=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hH9McqbTKFnY1Ge2JRuO4lYxePJA6prhfhYSUMROdSHKD7vIo0hvsf5kY8TtyruukPtNGz+3xxQuZs5yFEp/fWLqWJ/XwI/QrRvdu0OEJzsOAFnE4ODLVjqI++q4HOwUxRk0bodWGmHNppsYekfNklwn+fYiiRb3uy653PXbJlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WuWOlH8q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dB0v029132;
	Mon, 11 Aug 2025 14:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TiyjpQQ2X6AyzQCC+HNvU+VY/cb+U+kZ0/V9a/Pn//o=; b=WuWOlH8q+g2g/Z/i
	ryK+JJTNneY03bEFZhgnPvhh42ujZ8C5DUzvGjNuM9bh6GEY+4xcS2iTX97HUcGg
	zwrGeUe81O8vALFz3sZzVPVFxedV8WvUVDz2mKHapc/+lE/yct8NK74ptFIcBaZR
	gKsuEHSloOrQlofGgJmKAJkaBP2+bB4byqAiKRnTkrpVbAZxNVraOhoEVzgFRqiF
	/BPAYkuSqFZThxFxxVPHBgHOu7/a1lZWT4fz1Un1Li/lwm9CFfS8oT4CzmjHdr0l
	Ys/LY/OC23bLUGOLGBVWpIqZLUKhxwZkOByaq9pgP2m6e7Na8qySC6XmeKtJGWqC
	0ShZDw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9smv25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 14:35:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57BEZ4UM011433
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 14:35:04 GMT
Received: from [10.218.4.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 11 Aug
 2025 07:35:00 -0700
Message-ID: <a7ad5022-78b6-4ebc-9ce1-7c1182c43a89@quicinc.com>
Date: Mon, 11 Aug 2025 20:04:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/3] arm64: dts: qcom: sm8650: Enable MCQ support for
 UFS controller
To: Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>
CC: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250730082229.23475-1-quic_rdwivedi@quicinc.com>
 <20250730082229.23475-3-quic_rdwivedi@quicinc.com>
 <eab85cb3-7185-4474-9428-8699fbe4a8e5@kernel.org>
 <40ace3bc-7e5d-417a-b51a-148c5f498992@quicinc.com>
 <2a7bf809-73d9-4cb6-bcc9-3625ef1eb1fa@kernel.org>
 <kayobeddgln5oi3g235ruh7f7adbqr7srim7tmt3iwa3zn33m4@cenneffnuhnv>
 <5a32e933-03b9-4cc3-914c-46bdb2cedce6@kernel.org>
 <54gttzkpxg55vrh5wsvyvteovki377w3yjfejjddpzzrvldwkg@p7sc4knnvla3>
 <4fa9074e-609a-42aa-975a-a6daa7dd6d42@kernel.org>
 <5se3wgpfabzlcidflef5orwtl62jk2dtg4lx47gnqcqn7mya46@i6zir5uny7gi>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <5se3wgpfabzlcidflef5orwtl62jk2dtg4lx47gnqcqn7mya46@i6zir5uny7gi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=6899ff99 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=ZRovytJ3VJirhm_mrpIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: G2ecdMvgEqREVqqjN3YPNbAgsax4YMDd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfXy/UdVcjPnFvt
 SUqLhP0q9Pn/UstVVeUb/RAlRjzdCV4va9nMNRXtX4rGSdLIAcIMcH8pmczGmmE70PLn7kkpO0Q
 YiDXpYGjNSo+XzPAOv3u+IHnTrFvpFrW2EZJJgxPUZlF8kT/x3zp1CUAGniUsjC97CMwRVzE13R
 TucP7MyeKmITEp8Bvt5sJo64nFYcatKU17KM4iRohCpCB8sDpYX9mmPBj12nDF4MhKotYMOfNiJ
 ppHhVvynghxEoIptYOd/7lXbGUjolzyFT863qraHqsH6M2o//pwzr/ynqz5l66dYoaLSyeW/1xe
 RoTS/eOQmPpPoHl379R4lpmm5BFLo/3zRNKpqjP3e7KcuSmH8poegshzkRoUslwkK5bXrv0AhXr
 NhSxXHon
X-Proofpoint-GUID: G2ecdMvgEqREVqqjN3YPNbAgsax4YMDd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_03,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015



On 11-Aug-25 2:57 PM, Manivannan Sadhasivam wrote:
> On Fri, Aug 01, 2025 at 06:09:18PM GMT, Krzysztof Kozlowski wrote:
>> On 01/08/2025 17:33, Manivannan Sadhasivam wrote:
>>> On Fri, Aug 01, 2025 at 04:20:37PM GMT, Krzysztof Kozlowski wrote:
>>>> On 01/08/2025 14:24, Manivannan Sadhasivam wrote:
>>>>> On Thu, Jul 31, 2025 at 10:38:56AM GMT, Krzysztof Kozlowski wrote:
>>>>>> On 31/07/2025 10:34, Ram Kumar Dwivedi wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 31-Jul-25 12:15 PM, Krzysztof Kozlowski wrote:
>>>>>>>> On 30/07/2025 10:22, Ram Kumar Dwivedi wrote:
>>>>>>>>> Enable Multi-Circular Queue (MCQ) support for the UFS host controller
>>>>>>>>> on the Qualcomm SM8650 platform by updating the device tree node. This
>>>>>>>>> includes adding new register regions and specifying the MSI parent
>>>>>>>>> required for MCQ operation.
>>>>>>>>>
>>>>>>>>> MCQ is a modern queuing model for UFS that improves performance and
>>>>>>>>> scalability by allowing multiple hardware queues. 
>>>>>>>>>
>>>>>>>>> Changes:
>>>>>>>>> - Add reg entries for mcq_sqd and mcq_vs regions.
>>>>>>>>> - Define reg-names for the new regions.
>>>>>>>>> - Specify msi-parent for interrupt routing.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>>>>>>>>> ---
>>>>>>>>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 9 ++++++++-
>>>>>>>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>>>>>>>> index e14d3d778b71..5d164fe511ba 100644
>>>>>>>>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>>>>>>>> @@ -3982,7 +3982,12 @@ ufs_mem_phy: phy@1d80000 {
>>>>>>>>>  
>>>>>>>>>  		ufs_mem_hc: ufshc@1d84000 {
>>>>>>>>>  			compatible = "qcom,sm8650-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
>>>>>>>>> -			reg = <0 0x01d84000 0 0x3000>;
>>>>>>>>> +			reg = <0 0x01d84000 0 0x3000>,
>>>>>>>>> +			      <0 0x01da5000 0 0x2000>,
>>>>>>>>> +			      <0 0x01da4000 0 0x0010>;
>>>>>>>>
>>>>>>>>
>>>>>>>> These are wrong address spaces. Open your datasheet and look there.
>>>>>>>>
>>>>>>> Hi Krzysztof,
>>>>>>>
>>>>>>> I’ve reviewed it again, and it is correct and functioning as expected both on our upstream and downstream codebase.
>>>>>>> I think it is probably overlooked by you. Can you please double check from your end?
>>>>>>>
>>>>>>
>>>>>> No, it is not overlooked. There is no address space of length 0x10 at
>>>>>> 0x01da4000 in qcom doc/datasheet system. Just open the doc and look
>>>>>> there by yourself. The size is 0x15000.
>>>>>>
>>>>>
>>>>> The whole UFS MCQ region is indeed of size 0x15000, but the SQD and VS registers
>>>>> are at random offsets, not fixed across the SoC revisions. And there are some
>>>>> big holes within the whole region for things like ICE and all.
Hi Krzysztof,

I have addressed your comment by using single MCQ region mapping and accordingly updated dt bindings.

Thanks,
Ram.
>>>>>
>>>>> So it makes sense to map only the part of these regions and leave the unused
>>>>> ones.
>>>> Each item in the reg represents some continuous, dedicated address
>>>> space, not individual registers or artificially decided subsection. The
>>>> holes in such address space is not a problem, we do it all the time for
>>>> all other devices as well.
>>>>
>>>> You need to use the definition of that address space.
>>>>
>>>
>>> What if some of the registers in that whole address space is shared with other
>>> peripherals such as ICE?
>>
>>
>> It will be a different address space. We don't talk about imaginary
>> 3rd-party SoC. Qualcomm datasheet lists address spaces in very precise
>> way. We were recently fixing all address spaces for remoterpocs based on
>> that.
>>
>>>
>>> I agree with the fact that artifically creating separate register spaces leads
>>> to issues, but here I'm worried about hardcoding the offsets in the driver which
>>> can change between SoCs and also the shared address space with ICE.
>>
>> Drivers are expected to hard-code offsets and all drivers do it. Look at
>> display, sound codecs (both SoC and soundwire devices). Everything
>> hard-coded offsets internal to address space.
>>
>> What you essentially want is (making it border case) "reg" per register.
>>
> 
> I was worried about the ICE overlap, but I got access to the documentation and
> verified myself (also with Nitin) that there is no ICE overlap. So yes, we can
> map the entire MCQ region and live with the hardcoded offsets.
> 
> - Mani
> 


