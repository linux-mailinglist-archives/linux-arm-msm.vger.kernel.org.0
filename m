Return-Path: <linux-arm-msm+bounces-68766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAB7B2262D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 539F917133A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A5D32EE618;
	Tue, 12 Aug 2025 11:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDErDxyz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937C12EE5EC
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 11:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754999497; cv=none; b=uEddJWOLV66Pvu4LlPy2x5x1v2mZ0SL+rdyLuLLltD7ZFh/sPzwI7L06UsRwbhfEbbvKEqVx8z7+NTt5SjhZ6gI11pnqZrbHuz4egbTdu7RfRdNygb1mo8S7OQsSccKYxImXrUHy4lctPNNoNjwsxuFJbYcg0MKQj9xMltHwdh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754999497; c=relaxed/simple;
	bh=/CS/9qSbLaXIJEWYXyxMhbjk90TTQQYwhrPDuItSjeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a8ykvzASW8xw8XQlECX8SuJgAaexStd9CPtYLuIAfeW8Q+SJ5c/nfgRSGqBS/VOR+jinD1hUZQRjTgr3tBQTfpIz76bsuNrXSNVmmh7Km9MoUzBsOu90JRFQbZEqCCnUr4+bsmCvikxdlStXBXLx9bwqAG8eUscYgWXvwO86fOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDErDxyz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvfxx020363
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 11:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IcqMtG7HWSJRgtgjruymStdSKtDhCtKrModFZRr5TzI=; b=fDErDxyz7fh0vIH9
	A/fdhfWKqT6GOCS5E0EtDGPTHXQf5AiQBlby+iN/B5/psm5TNTeAY5is3iO/8PFG
	TSz7g68BSZM2XZFJPetVo5WZAt2uyhNKrs+IjnBlJVMtp6AYGV//GT3LLSMKCcLQ
	jVwN1x2lEPSyhwrWucdmRJsTVeqf2IMG1HmQx7laT+1UxWmSYbzPnc6oFC7Cv4Su
	73GAHVL0fIF4jeQ9vv49J55bS6zulzHIlXTeOTtQCyh6zxGN+oJ+LD1VIZuqUdws
	82JQ+oGNodK6y5r4A80fh8o5jHDwshCoOidS6Mev4UZ+lTasxEIKsSEIiMdG7PJF
	wHRN7A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx65pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 11:51:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b0dfcd82ebso2764761cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 04:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754999492; x=1755604292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IcqMtG7HWSJRgtgjruymStdSKtDhCtKrModFZRr5TzI=;
        b=fkfEr3/meWfxXgqnjdLnzWNP9LOj9MrYFMCcpv4+IifP/IzfNz+p5wetveWzSyOeoV
         6s37oftTQN7wnS1UWhJBEPAcHu1npsxiSmnzh25ndDMJn9BApciKp3lo/d7shky+Us2Y
         LsDBkKyyMmKoozoZvtcW6fxfFhgiGeiWXHAcdKWPsciL85HXRVM79Ksf7FJuO17ei095
         fUjc/mt0XkhpeVcaemTAbn4CLUQHQqF2gWYQn0Kxjb3WHJbrCVwwtn/G1ipsFeci6iO+
         eqneHDPcbLKvANYXAZA2Um+YIQj6LGxTTRhSW3eG7NfN8aLDa2qsuwIaLyNRhKCzqXMr
         gViA==
X-Forwarded-Encrypted: i=1; AJvYcCW4gaIH9YFU+ctu3vIBCDcX6i8nmsDa6fRkWAbn7uMhbU2Er5vprk2N08RvK2pod68mGNY6Rbzs/d1ulU3Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxOXOQmz+MmHm6qXnxJJ7TMxVK9qbFdaUhc4VkzhMuya2xdqiU7
	7+x5u15SLkarel87JY2GlMBj7khWa3V0+dCXO/bH3siyAiXwphKbSsaxhltndM45INsUfQ3cdHq
	kBK8RZ0NvT8wBc3nvFEowYrGZFLeqyYUNDfmAXLO+PBfwvTazbztfKkMozLVoEoCT2WQB
X-Gm-Gg: ASbGncub1+4417PwfVOeeZFj+B+m2ngDEbsPQE7Q+jRwKru7FeiY/oHdDz0A364LaI5
	ReqPq8tVVnbT30s2AaWauzlIEkVsGsc0I6N7ZMgKuVIloTtptKFP50BGJyEl6ep6yPoerYyjB31
	eIKAL7H2w/EJAtgQbvfiyd2Dy0dvNxO2+hmlHQFkEUbCEEnKwffKPZif8PStDisqau2SaJ04c4z
	+UpPy4HxvADwNvdxHFKlkpRuH8OQEqeNuYRHOxL1kp7Pcv5uZhRqIrUe0GojAZwTBeifXlhe4EX
	m4RQl/fP5nhH2qHU0V8BtV/ULUw+LZPS29K5qbb8vxGONDzgb3R4mWPaFCdcv5Ia0PisEA+pLZk
	tgrJzQtWG8VTUL/lqYg==
X-Received: by 2002:a05:622a:189d:b0:4a9:bfec:b794 with SMTP id d75a77b69052e-4b0f4a2abe2mr6340781cf.9.1754999492479;
        Tue, 12 Aug 2025 04:51:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFITBg4vqK2CSbxykDD4kNop02iZfeW6YQOawNuOS++hPrAWLUyme498eMMsdoL5cta64VLwA==
X-Received: by 2002:a05:622a:189d:b0:4a9:bfec:b794 with SMTP id d75a77b69052e-4b0f4a2abe2mr6340531cf.9.1754999491958;
        Tue, 12 Aug 2025 04:51:31 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c050sm2186769866b.104.2025.08.12.04.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 04:51:31 -0700 (PDT)
Message-ID: <1ba08f18-cfba-40f3-b600-1b1762e8982c@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 13:51:28 +0200
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
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, alim.akhtar@samsung.com,
        avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5se3wgpfabzlcidflef5orwtl62jk2dtg4lx47gnqcqn7mya46@i6zir5uny7gi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfXzBDg2AqhGW+I
 mpuvyoxDENxTkiOuNdTWB8O4AAKH5wDdKsVYqOpwPNBT2S7B3rS0A4HSoYGZZkKRLLuzVy1ORP5
 dPIw66yoZOHRPVHFGGGW9QOewHBeMWW+f1ciudy08in0gCFohwQkHIMJJPbjBKm9WAotoVh13ff
 reTwnoEPEOCqIboc52GO5Oa75ft8S5ijgZMAU7shKsQTlBBqSgrzFGRjTz152dKvwsKk8OxRxkw
 4t4eODfZboMXn8SEBOY8/ozCvF+w8QQ435SZ8ahMGJAPMH3dcOxIJoLrP9EaIVmk3Kzng9QQTlj
 lzv+Loku3WSBSAuaMf7msIPz1Zlj7Flf/25dui7lSmHGqOLzavp13f3EbKIItJq5XHb138/sEgr
 FTROrQjX
X-Proofpoint-GUID: siWDzntXb2FnSg_h28iZXJ-BJp6s2XCf
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689b2ac5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=ZRovytJ3VJirhm_mrpIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: siWDzntXb2FnSg_h28iZXJ-BJp6s2XCf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On 8/11/25 11:27 AM, Manivannan Sadhasivam wrote:
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

(that means we can look into ripping out lots of code from the ufs driver
as I attempted to before, feel free to take the wheel on that though)

Konrad

