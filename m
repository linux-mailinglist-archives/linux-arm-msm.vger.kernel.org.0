Return-Path: <linux-arm-msm+bounces-57655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B7BAB4951
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 04:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09FD03BBB71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 02:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7331A4F1F;
	Tue, 13 May 2025 02:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BOLRnVh3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E07E19CC11;
	Tue, 13 May 2025 02:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747102337; cv=none; b=NMVT4Ck+oBdmU6RsWxnF2vnWCESMLceRztGbX3XJOsXkdAEpguAbfUyMEW6NVO2hCrItZNauCM6vC2Lg6Wlsms5hB3oEB+1YKMCidCVA5+28ajMFYCW8Yk2FYNYdZaufc7w3SE+pnhYvButMpwW1+avBYvDG0yHuZZBQmtclFWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747102337; c=relaxed/simple;
	bh=msGACJxgZMAcYAO5uKeVaNtkgzsFsO88vG4SqG0T/Zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P9OgrOa6YLxjNOJR8LDNgJ13mVCxreYUW2RDbhyE1c3CvvgseRKBEMR/z1GovthIJ6iU67bG0XaZCKxXJ7YAhqJVl40zZ4bu2mz26kL6GJY5NmLFFA3vrwehy/AEb2G5MNGRaUp2IWDNBCXHDi4/3z4a4roQF9BoMYO4Q/0M5NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BOLRnVh3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D0qQGx029118;
	Tue, 13 May 2025 02:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8SUb8hEHEFHY95Bi7e51NdrMmosGRZtsBtm7SlwE1fg=; b=BOLRnVh30ACDx25x
	RT7fyKUZhxWhJ0ShcXguAsVwfGzIVSSnQ+4uw0trCy1IlO4HlAa+TU9YoKOSPyT9
	bLNSZIETvImotsAFWlyV413a3Bi3Xbm4ePpN32WQ/UrCd1beMzFs5NM/QnxUDPn3
	AxhuanuguR1PRLjseg5EvfxQjfoM26+LR2cSIwyTl1LmDnAqQy/O2IAP8aX81U9y
	xbzfcbAgFvbv8PIjCU85jtL3W7e3lwttykQWcQtKoUjAnmouDbz0JvjcT6V8cSZe
	ENLBoJXxKeTNyZ4xG4kwSPNqVlfuhicYcb7TYcJIF6nIET7jIP4qRF86NAFGeHDa
	xVUJgQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hxvxe3ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 02:12:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54D2CArC006497
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 02:12:10 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 12 May
 2025 19:12:03 -0700
Message-ID: <76327ba4-a416-41b5-b6ab-d1f9c7b58126@quicinc.com>
Date: Tue, 13 May 2025 10:12:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info
 region
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
 <20250507-add_qcs615_remoteproc_support-v2-4-52ac6cb43a39@quicinc.com>
 <64893588-544f-4cb0-8c0b-7eef588468d5@oss.qualcomm.com>
 <c0ab504c-2b27-45cd-be8f-1176230b8bfd@quicinc.com>
 <f81b3f81-b14d-41c1-9968-2d473e1f0947@oss.qualcomm.com>
 <2eb4606c-16f8-4e34-8084-039c9e57bbdd@quicinc.com>
 <3065cdb1-30ff-4be3-8959-45e4c4edc123@oss.qualcomm.com>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <3065cdb1-30ff-4be3-8959-45e4c4edc123@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAxOSBTYWx0ZWRfXzxH3iEgCgX5S
 ReyIO82We46svPrFw4vHuB8LAsmmtJZoWT2Jts3Lu/hDkFzQRhphAAdc01E3ZokvCdEVCM3vaRj
 NScvuC9LFCkcu6/pRC+47HbssDAcBc2fR6BzQ7qOhJkfylkDuJFwPhzFKN05F8jlMUZJ7Icbn8Y
 n0jhPrJ5cHyK/5NN4MbeX5mlSkJzRMLiPT40X5CrhKo8PAVlQCwpPeE71SxCV6AyvOnlZyoH43s
 bYXplVP14IAGb1fnTJEFhDeS3E6PkEJ5hKtKuQvT/C2UbJStQQhy2HULOC9LLVYQYrBtnUYxb/t
 WD2R6fmaEnGhLkm4aiKyTaEvIb+arzMFgQEvs62geJIFQp9Yv8UCUf0FHyGvW8z8pcVsCq5DYXy
 ZIZxyHFb75u5m4zYfJ9Yh+4LbezFfN/5P+bOHGL8Zchk6SdPRQZKRsdZU82oQ7kXYC75IFXR
X-Proofpoint-GUID: cRG15oF3Pb0sJNfQvcDa5U1fiBsN7Daf
X-Authority-Analysis: v=2.4 cv=WMV/XmsR c=1 sm=1 tr=0 ts=6822aa7b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=dHwnwrLdN51fry_tQmQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: cRG15oF3Pb0sJNfQvcDa5U1fiBsN7Daf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 mlxscore=0 mlxlogscore=869 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505130019



在 5/13/2025 3:10 AM, Konrad Dybcio 写道:
> On 5/12/25 5:20 AM, Lijuan Gao wrote:
>>
>>
>> 在 5/9/2025 4:54 PM, Konrad Dybcio 写道:
>>> On 5/9/25 9:37 AM, Lijuan Gao wrote:
>>>>
>>>>
>>>> 在 5/8/2025 10:41 PM, Konrad Dybcio 写道:
>>>>> On 5/7/25 12:26 PM, Lijuan Gao wrote:
>>>>>> Add a simple-mfd representing IMEM on QCS615 and define the PIL
>>>>>> relocation info region as its child. The PIL region in IMEM is used to
>>>>>> communicate load addresses of remoteproc to post mortem debug tools, so
>>>>>> that these tools can collect ramdumps.
>>>>>>
>>>>>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/qcs615.dtsi | 14 ++++++++++++++
>>>>>>     1 file changed, 14 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>>>> index 53661e3a852e..fefdb0fd66f7 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>>>> @@ -3266,6 +3266,20 @@ sram@c3f0000 {
>>>>>>                 reg = <0x0 0x0c3f0000 0x0 0x400>;
>>>>>>             };
>>>>>>     +        sram@146aa000 {
>>>>>> +            compatible = "qcom,qcs615-imem", "syscon", "simple-mfd";
>>>>>> +            reg = <0x0 0x146aa000 0x0 0x1000>;
>>>>>
>>>>> 0x14680000 0x2c000
>>>>
>>>> I checked the latest datasheet, the Shared IMEM address is 0x146aa000 and its size is 0x1000, 0x14680000 is the start address of IMEM layout. The shared IMEM is used for debugging purposes, while the others parts are dedicated.
>>>
>>> Even if we don't use the entirety of it, it's good to describe
>>> the whole block
>>>
>>> Konrad
>>
>> According to the definitions on all existing upstream platforms, this imem points to the shared imem. Should we stay consistent?
> 
> That is because everyone kept copying over whatever the downstream
> kernel did ;)
> 
> Let's describe the whole region - at best, it doesn't hurt
> 
> Konrad

Understood, it will be updated in the next patch.

-- 
Thx and BRs
Lijuan Gao


