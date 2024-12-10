Return-Path: <linux-arm-msm+bounces-41196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 206A49EA6A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 04:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8221E169BFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 03:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5A31D7E47;
	Tue, 10 Dec 2024 03:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RaB5BPXC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C471D4609;
	Tue, 10 Dec 2024 03:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733801402; cv=none; b=cSYLLkW3EDXGEcKJ1wLKcbA6kHYcNUz/2d5LIBsOAEAbMvM6soIU3CAEW9/ZxuErJr499j44PmuWrDZckblFXqzOMV5dDQs/4pgBoILgpkjAhfP3JaDSa92INS6+mp9mO3ymChoE5vftPZOshcYEpG4zn90XKh0f4E10hoW4X6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733801402; c=relaxed/simple;
	bh=JGTU7bdVVRhRv+47k01lq08c1pB8B27E5cGjRbVRJ9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FvdDB4SWqqLLb4jdMMUyC3TSfvKqSYvgVlpyCbRZyrxKZDVm+1gT/nRub/l3iDbv64RW2HZDdPJM13BotQR25S5SlpgCbLU+K/wlqC3j8IntM7QbyMyl3CM2bNzo9UIeHKsVjZaOPIn+2uhPDvTvuoRUZoPCNgDyfkm9/VgBnkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RaB5BPXC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9IgEnH006423;
	Tue, 10 Dec 2024 03:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lh7TdfdFQPLTjhs/GwI6Qlw77TZoNkDrm1oq9mNbkc=; b=RaB5BPXC1QbSxbKw
	yNwuYfb/ylqe0iG5y+0qqRQaJl09o1kZOhrQtPt9ntBjrN2+hP5Hczv+nM5HSsyu
	0jZE1TMbzHVoTIqd0IbW+S1QXfL/gQMkARbIWw7LylsA391PnwntsCqVUKCpDZRS
	yM1E8W85P25GnUL82yplh89P2igolB1WQ6HEDdolOtBLdOik+yJ93Bf0jxsW2bxU
	sO9gde9XavHflOGMC+v9OZxuzYIWzA5tW5nk8qYiNucWz1mB9CTBONPYQhtVKinR
	CzS0MgxFjRmSFOcijNHTd74LKoNn4qMd9IQbNOI0r0NmTIBoAa19E6KmMryg1oaE
	oZ5pYA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdxxexfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 03:29:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA3TsLP014540
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 03:29:54 GMT
Received: from [10.64.70.122] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 19:29:50 -0800
Message-ID: <2e518360-be24-45d8-914d-1045c6771620@quicinc.com>
Date: Tue, 10 Dec 2024 11:29:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615-ride: Enable ethernet
 node
To: Andrew Lunn <andrew@lunn.ch>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>
References: <20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com>
 <20241118-dts_qcs615-v2-2-e62b924a3cbd@quicinc.com>
 <ececbbe1-07b3-4050-b3a4-3de9451ac7d7@lunn.ch>
 <89a4f120-6cfd-416d-ab55-f0bdf069d9ce@quicinc.com>
 <c2800557-225d-4fbd-83ee-d4b72eb587ce@oss.qualcomm.com>
 <3c69423e-ba80-487f-b585-1e4ffb4137b6@lunn.ch>
 <2556b02c-f884-40c2-a0d4-0c87da6e5332@quicinc.com>
 <75fb42cc-1cc5-4dd3-924c-e6fda4061f03@quicinc.com>
 <4a6a6697-a476-40f4-b700-09ef18e4ba22@lunn.ch>
 <441f37f5-3c33-4c62-b3fe-728b43669e29@quicinc.com>
 <4287c838-35b2-45bb-b4a2-e128b55ddbaf@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <4287c838-35b2-45bb-b4a2-e128b55ddbaf@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5ApMHT6AqNWH62gkGuSpQrlpA5smx2YX
X-Proofpoint-GUID: 5ApMHT6AqNWH62gkGuSpQrlpA5smx2YX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=939 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100023



On 2024-12-09 11:13, Andrew Lunn wrote:
> On Mon, Dec 09, 2024 at 10:11:23AM +0800, Yijie Yang wrote:
>>
>>
>> On 2024-11-29 23:29, Andrew Lunn wrote:
>>>> I was mistaken earlier; it is actually the EMAC that will introduce a time
>>>> skew by shifting the phase of the clock in 'rgmii' mode.
>>>
>>> This is fine, but not the normal way we do this. The Linux preference
>>> is that the PHY adds the delays. There are a few exceptions, boards
>>> which have PHYs which cannot add delays. In that case the MAC adds the
>>> delays. But this is pretty unusual.
>>
>> After testing, it has been observed that modes other than 'rgmii' do not
>> function properly due to the current configuration sequence in the driver
>> code.
> 
> O.K, so now you need to find out why.
> 
> It not working probably suggests you are adding double delays, both in
> the MAC and the PHY. Where the PHY driver add delays is generally easy
> to see in the code. Just search for PHY_INTERFACE_MODE_RGMII_ID. For
> the MAC driver you probably need to read the datasheet and find
> registers which control the delay.

As previously mentioned, using 'rgmii' will enable EMAC to provide the 
delay while disabling the delay for EPHY. So there's won't be double delay.

Additionally, the current implementation of the QCOM driver code 
exclusively supports this mode, with the entire initialization sequence 
of EMAC designed and fixed for this specific mode.

Therefore, no other options are available until changes are made to the 
driver.

> 
>>> If you decided you want to be unusual and have the MAC add the delays,
>>> it should not be hard coded. You need to look at phy-mode. Only add
>>
>> Are you suggesting that 'rgmii' indicates the delay is introduced by the
>> board rather than the EMAC?
> 
> Yes.
> 
>> But according to the
>> Documentation/devicetree/bindings/net/ethernet-controller.yaml, this mode
>> explicitly states that 'RX and TX delays are added by the MAC when
>> required'. That is indeed my preference.
> 
> You need to be careful with context. If the board is not adding
> delays, and you pass PHY_INTERFACE_MODE_RGMII to the PHY, the MAC must
> be adding the delays, otherwise there will not be any delays, and it
> will not work.
> 

I'm not sure if there's a disagreement about the definition or a 
misunderstanding with other vendors. From my understanding, 'rgmii' 
should not imply that the delay must be provided by the board, based on 
both the definition in the dt-binding file and the implementations by 
other EMAC vendors. Most EMAC drivers provide the delay in this mode.

I confirmed that there is no delay on the qcs615-ride board., and the 
QCOM EMAC driver will adds the delay by shifting the clock after 
receiving PHY_INTERFACE_MODE_RGMII.

>>> delays for rgmii-id. And you then need to mask the value passed to the
>>> PHY, pass PHY_INTERFACE_MODE_RGMII, not PHY_INTERFACE_MODE_RGMII_ID,
>>> so the PHY does not add delays as well.
> 
> 	Andrew

-- 
Best Regards,
Yijie


