Return-Path: <linux-arm-msm+bounces-34085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 540A899A308
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 13:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E95292854F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 11:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48712217310;
	Fri, 11 Oct 2024 11:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xluqv25C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38683216A1E;
	Fri, 11 Oct 2024 11:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728647687; cv=none; b=NbHjtEqdz58eSqW/Dz1DJDdq5JkcXawqtBC+VtbdSIFiHLDTuq9JrZnknw1O0jSxPFritEQk5Rbf3nwWfFzJAekjNg97JbXKDsexAWdj2AKKDDUJTgBGeOxGVCL86470AhyTvUyC7Id0gHzQf3R5faElNbxNG63EMaOJpBSX32M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728647687; c=relaxed/simple;
	bh=SApK/39gvjPNAxcgbtJYmUOba43oHFWpeYksd2ZYoKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GO36OCWUx3SHD2ykwg813DlKHUqpNOOsO4XKYeK4ElRUV2Q94Nub/MYKVUY++QvSVsuxQfSpblNUzvs59RCEDUkWcbX0cRuZiuxrINzqZ9KVcZXuTFVU3DN8o/H92Q8HuHA6631DTzFWbtuFn4j/XZ5wiBGQswWvawr6XuUV3K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xluqv25C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B50o1v029089;
	Fri, 11 Oct 2024 11:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jTo14+oK5KKtwWN2j0jzAmesONfG/qfgIeutVskgHGA=; b=Xluqv25C0VvaicRI
	tAuOosKgE6IOM8c63y8Fm4yFhSdEFtAbD84Dum2A4EBe3Z+1i1Ccm9dV7uVrbuc5
	rtQ5OyEJ0k7zznuzylKiKFUeHpHdq/wFBKM9af0DvjL/iO4nkn6mOISF/6aTA6EI
	eUQa53dBZFiujv9S/T/3QskfFsRpgvtWCDwbHBQa2IKzio6h7TxtZaLfNxsoTi4S
	j/nv/JTaSrZ7NBdFRUtnsdq+MnwNLOyeOmMfViwFyI3MnTHnCiYMMGGiYtL7ZAmB
	CxssqQZ0X5KVq1okZ/fhCdr2YozrRLk1glFBXoJt9e66ek+5WJoWaCFZhHCCHtmp
	wf03yQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426g6nb383-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 11:54:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BBsdxk024844
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 11:54:39 GMT
Received: from [10.216.13.225] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Oct
 2024 04:54:33 -0700
Message-ID: <9c24ba5d-431a-c45e-ce1c-3541eac7d017@quicinc.com>
Date: Fri, 11 Oct 2024 17:24:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Add PCIe nodes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_vbadigan@quicinc.com>, <quic_ramkri@quicinc.com>,
        <quic_nitegupt@quicinc.com>, <quic_skananth@quicinc.com>,
        <quic_parass@quicinc.com>
References: <CAA8EJpqjm_2aE+7BtMkFUdet11q7v_jyHbUEpiDHSBSnzhndYA@mail.gmail.com>
 <dec2976e-6e1e-6121-e175-210377ff6925@quicinc.com>
 <CAA8EJprsm5Tw=vFpmfEKL8fxS-S+aW+YR0byfyL=v78k75TGEw@mail.gmail.com>
 <3ad77846-b4a8-80ee-e9e1-d5cbf4add6d8@quicinc.com>
 <CAA8EJprRF0tVFZK9c=MT8bSRcBdRvcugBaeEzpX5-wfRyNgc3Q@mail.gmail.com>
 <c8be2bbf-a51c-a38f-6e6f-a88801f953d5@quicinc.com>
 <20240209075716.GA12035@thinkpad>
 <CAA8EJppfzc_dM9c9mHPVWheVxi-1gJxCmaWPvreELijEQDDSyA@mail.gmail.com>
 <20241001101622.ys36slymgjbaz26q@thinkpad>
 <8459161B-87B8-481F-AE71-3D5156B1CA56@linaro.org>
 <20241001141948.g74rn6777ywvtcmx@thinkpad>
 <CFF89D4D-8131-47C2-95B8-A0E130A16E46@linaro.org>
From: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
In-Reply-To: <CFF89D4D-8131-47C2-95B8-A0E130A16E46@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8ke2pOR7KZZssvD17G3N3TtjKwSt-mc9
X-Proofpoint-GUID: 8ke2pOR7KZZssvD17G3N3TtjKwSt-mc9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1011 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410110082



On 10/1/2024 8:38 PM, Dmitry Baryshkov wrote:
> On October 1, 2024 5:19:48 PM GMT+03:00, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
>> On Tue, Oct 01, 2024 at 03:30:14PM +0300, Dmitry Baryshkov wrote:
>>> On October 1, 2024 1:16:22 PM GMT+03:00, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
>>>> On Fri, Feb 09, 2024 at 12:56:18PM +0200, Dmitry Baryshkov wrote:
>>>>> On Fri, 9 Feb 2024 at 09:57, Manivannan Sadhasivam
>>>>> <manivannan.sadhasivam@linaro.org> wrote:
>>>>>>
>>>>>> On Fri, Feb 09, 2024 at 12:58:15PM +0530, Krishna Chaitanya Chundru wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 2/8/2024 8:49 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Thu, 8 Feb 2024 at 16:58, Krishna Chaitanya Chundru
>>>>>>>> <quic_krichai@quicinc.com> wrote:
>>>>>>>>> On 2/8/2024 12:21 PM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Thu, 8 Feb 2024 at 08:14, Krishna Chaitanya Chundru
>>>>>>>>>> <quic_krichai@quicinc.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 2/7/2024 5:17 PM, Dmitry Baryshkov wrote:
>>>>>>>>>>>> On Wed, 7 Feb 2024 at 12:42, Krishna chaitanya chundru
>>>>>>>>>>>> <quic_krichai@quicinc.com> wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> Enable PCIe1 controller and its corresponding PHY nodes on
>>>>>>>>>>>>> qcs6490-rb3g2 platform.
>>>>>>>>>>>>>
>>>>>>>>>>>>> PCIe switch is connected to PCIe1, PCIe switch has multiple endpoints
>>>>>>>>>>>>> connected. For each endpoint a unique BDF will be assigned and should
>>>>>>>>>>>>> assign unique smmu id. So for each BDF add smmu id.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>>      arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 42 ++++++++++++++++++++++++++++
>>>>>>>>>>>>>      1 file changed, 42 insertions(+)
>>>>>>>>>>>>>
>>>>>>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>>>>>>>>>>>> index 8bb7d13d85f6..0082a3399453 100644
>>>>>>>>>>>>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>>>>>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>>>>>>>>>>>> @@ -413,6 +413,32 @@ vreg_bob_3p296: bob {
>>>>>>>>>>>>>             };
>>>>>>>>>>>>>      };
>>>>>>>>>>>>>
>>>>>>>>>>>>> +&pcie1 {
>>>>>>>>>>>>> +       perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +       pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>;
>>>>>>>>>>>>> +       pinctrl-names = "default";
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +       iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
>>>>>>>>>>>>> +                   <0x100 &apps_smmu 0x1c81 0x1>,
>>>>>>>>>>>>> +                   <0x208 &apps_smmu 0x1c84 0x1>,
>>>>>>>>>>>>> +                   <0x210 &apps_smmu 0x1c85 0x1>,
>>>>>>>>>>>>> +                   <0x218 &apps_smmu 0x1c86 0x1>,
>>>>>>>>>>>>> +                   <0x300 &apps_smmu 0x1c87 0x1>,
>>>>>>>>>>>>> +                   <0x400 &apps_smmu 0x1c88 0x1>,
>>>>>>>>>>>>> +                   <0x500 &apps_smmu 0x1c89 0x1>,
>>>>>>>>>>>>> +                   <0x501 &apps_smmu 0x1c90 0x1>;
>>>>>>>>>>>>
>>>>>>>>>>>> Is the iommu-map really board specific?
>>>>>>>>>>>>
>>>>>>>>>>> The iommu-map for PCIe varies if PCIe switch is connected.
>>>>>>>>>>> For this platform a PCIe switch is connected and for that reason
>>>>>>>>>>> we need to define additional smmu ID's for each BDF.
>>>>>>>>>>>
>>>>>>>>>>> For that reason we defined here as these ID's are applicable only
>>>>>>>>>>> for this board.
>>>>>>>>>>
>>>>>>>>>> So, these IDs are the same for all boards, just being unused on
>>>>>>>>>> devices which have no bridges / switches connected to this PCIe host.
>>>>>>>>>> If this is correct, please move them to sc7280.dtsi.
>>>>>>>>>>
>>>>>>>>> Yes ID's will be same for all boards. we can move them sc7280.dtsi
>>>>>>>>> but the BDF to smmu mapping will be specific to this board only.
>>>>>>>>> if there is some other PCIe switch with different configuration is
>>>>>>>>> connected to different board of same variant in future again these
>>>>>>>>> mapping needs to updated.
>>>>>>>>
>>>>>>>> Could you possibly clarify this? Are they assigned one at a time
>>>>>>>> manually? Or is it somehow handled by the board's TZ code, which
>>>>>>>> assigns them sequentially to the known endpoints? And is it done via
>>>>>>>> probing the link or via some static configuration?
>>>>>>>
>>>>>>> There is no assignment of SID's in TZ for PCIe.
>>>>>>> PCIe controller has BDF to SID mapping table which we need to
>>>>>>> program with the iommu map table.
>>>>>>>
>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/dwc/pcie-qcom.c?h=v6.8-rc3#n997
>>>>>>>
>>>>>>> Based upon switch the BDF to SID table will change for example I had two
>>>>>>> switches with one switch has 2 PCIe ports and other has 3 ports one
>>>>>>> embedded port which supports multiple functions.
>>>>>>>
>>>>>>> For the first switch the BDF's are
>>>>>>>        - 0x000(root complex),
>>>>>>>        - 0x100(USP),
>>>>>>>        - 0x208(DSP 0),
>>>>>>>        - 0x210(DSP 1),
>>>>>>>        - 0x300(endpoint connected to DSP 0),
>>>>>>>        - 0x400( endpoint connected to DSP 1).
>>>>>>>
>>>>>>> For 2nd switch the BDF's are
>>>>>>>        - 0x000(root complex),
>>>>>>>        - 0x100(USP),
>>>>>>>        - 0x208(embeeded DSP 0),
>>>>>>>        - 0x210(DSP 1),
>>>>>>>        - 0x218 (DSP 2),
>>>>>>>        - 0x300(embedded endpoint function 0),
>>>>>>>        - 0x301 (embedded endpoint function 1)
>>>>>>>        - 0x400( endpoint connected to DSP 1)
>>>>>>>        - 0x500(endpoint connected to DSP2).
>>>>>>>
>>>>>>> For these two switches we need different BDF to SID table so for that
>>>>>>> reason we are keeping iommu map here as this is specific to this board.
>>>>>>>
>>>>>>
>>>>>> I don't understand why the SID table has to change between PCIe devices. The SID
>>>>>> mapping should be part of the SoC dtsi, where a single SID would be defined for
>>>>>> the devices under a bus. And all the devices under the bus have to use the same
>>>>>> SID.
>>>>>
>>>>> This sounds like a sane default, indeed. Nevertheless, I see a point
>>>>> in having per-device-SID assignment. This increases isolation and can
>>>>> potentially prevent security issues. However in such case SID
>>>>> assignment should be handled in some automagic way. In other words,
>>>>> there must be no need to duplicate the topology of the PCIe bus in the
>>>>> iommu-maps property.
>>>>>
>>>>
>>>> Agree with you on this. This is what I suggested some time back to have the
>>>> logic in the SMMU/PCIe drivers to assign SIDs dynamically. Unfortunately, it is
>>>> not a trivial work and it requires a broader discussion with the community.
>>>>
>>>> Also starting with SMMUv3, there are practically no limitations in SIDs and
>>>> each device should get a unique SID by default.
>>>>
>>>> So I got convinced that we can have these static mappings in the DT *atm* for
>>>> non SMMUv3 based hardwares and at the same time let the discussion happen with
>>>> the community. But this static mapping solution is just an interim one and won't
>>>> scale if more devices are added to the topology.
>>>e
>>> My main question to this approach is if it can support additional devices plugged into the switch. If there is no way to plug addon cards, then it is fine as a temporary measure.
>>>
>>
>> The logic here is that the fixed endpoints in the switch will get an unique SID
>> and the devices getting attached to slots will share the same SID of the bus
>> (this is the usual case with all Qcom SoCs).
>>
>> But I guess we would need 'iommu-map-mask' as well. Hope this addresses your
>> concern.
> 
> Yes, thank you!
> 
Hi dimitry & mani,

This particular board variant doesn't expose any open slots to connect
a different endpoints like another switch(which might have BDF unknown
to us) so static table should be fine for this board variant.

I tries to add iommu-map-mask property, the issue with that property is
that the driver is applying the mask to the bdf before searching for the
entry in the table. If I use a mask value which satisfies all the
entries in the table ( mask as 0x718) and if a new bdf is enumerated
lets say 0x600 due to mask 0x718 its value is again 0x600 only.

Can we skip iommu-map-mask property and use only static table for this
board as we know this board doesn't expose any open slots.

- Krishna chaitanya.
variant doesn't expose any open slots >
>>
>> - Mani
>>
> 
> 

