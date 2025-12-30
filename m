Return-Path: <linux-arm-msm+bounces-86975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0510ECE9BD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 14:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41DED301BEAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 13:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A275212FB3;
	Tue, 30 Dec 2025 13:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P0YidpJT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b5O9UTyY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D748E20A5C4
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 13:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100051; cv=none; b=bsinln41Dkb1fOfGfdptzvpY7czPtAAljE6/cA8r9c7lKBAoYty79FMWJcO0/8aZP2cFMoUoSzGAuEcFkq1iVwupr5/3RTFtae+tYnrcO2paQ9rinXQIjIF2qiB8k0EgB2cy3HSjC2en40izCzVLmNRW6iZDh5e4FPyU8S9Zy4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100051; c=relaxed/simple;
	bh=iH/SbC54DyFXpS+l6/ahq2usVBBuh9pGr9vAucj2Qrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ANVm5N7hTMQA+qt0uHiIjvY/oVgUBZPvBY69Sru/5j2Zh2aLiMcB2sMqDzh90TsShh4F+kpUHIxCyUBfhKPCHonpa6vZiLNp/dV7MSdYSeX1LF4AA+ffDszFwnop2PPpcUTdt2cLkoZeOjnWptQW3NfgToWEDkCJEe0muIN+y0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0YidpJT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b5O9UTyY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUBDGdh2671413
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 13:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXMK/KNvJokGpNJ7WsGLfHm1jgTz/TRZoqblIdgBKBY=; b=P0YidpJT4tLlg6y7
	PnA04i18vBaavxnKVzvUJdDuzv0H6Mi2JnpON8mr5bI8EWM1qVGu7xpp0dAe9WTg
	GJZF4wcz99Hm4e819Fl5KJQ/qgGs0G6cWJJjG76SnLbzul33lt4X/u9oflQL80ik
	l+UXgpOza6on2uXXPY9o5bvovYwtY/vcTo7IKXUVlrk3DQmmBZtBK0BpCMUj/LUf
	exQyjqe8iEJONZzmdT1xGbQko6e0tRRQlTo6ekLr612ZCm2COd9U7nAlCu9Ooiux
	wNE9YjVn2pBF88/VcrOnJPZHX8SHA/YRB4a+nrxICPWGJdz3LZG+SPQ+DC6UBhU+
	SXCd1w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc4fcshdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 13:07:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed83a05863so32972691cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 05:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767100048; x=1767704848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XXMK/KNvJokGpNJ7WsGLfHm1jgTz/TRZoqblIdgBKBY=;
        b=b5O9UTyYXNd4QS+87A/qCRW5d41Qf44KrEtu3PWosqr9MB8tebb94lLSCN7uOC0hPw
         NR4Fd8rFmHsEPyVI/t5NKh+IjG9XqR6/Sw+mLK/2vrCc/tbEfbWOcpLJVg66yhyvRsjn
         bqGVqMGEk0t/HzXPaNe/ucXNyTmajIf02ZZG6QcD7T4PMGJhw2DKoCoR1JUbYcXoLmZk
         jiCowQL4bEjsLVwenKp8Vlgj3FxWF89lHxsJ7aeLUzLErBFK1kxQW2yvoSQqosn2FLfb
         WTrD3dmiWSRq/ixqDlJfAwMMqiOTA/kI5vgfTa8QXjK8LtixvEnZtVhq2I2VRcewdbal
         c83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767100048; x=1767704848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXMK/KNvJokGpNJ7WsGLfHm1jgTz/TRZoqblIdgBKBY=;
        b=X3Z22HBCfcnGOtArGFaaLlBcG5KEu/Ahnqes0A7zFyzi+/vODKdqw5vvJLsOS7+fs4
         KA6Afic68ErDnEbX1BJ+g/2r1xDMXBjyUjwMlp4js0VA3+Rmq0v6Olq4Jz5QB1Ejc5Yb
         I0O/7gh9z7/vzbZgp3AxB0M80PoEu9IUsr91k+LZgDY6B8Ww1XJCXWZjXx1FTwbZIEqf
         lmDcIteJN5svy0TqaQ8kPQvrVDntaKm6GeJct5ar8I2YxXLpQjxQeEI4gE0UAQgAf0Lt
         zugIF8InL8SN30bSoOCm/WZM2PTw4jnjs/WyHWvaLGvmEARtr9+UQZmAmJVDRWx0QTNh
         C2jw==
X-Gm-Message-State: AOJu0YwyREtpb34LlYRpmZs6YJL5dxOrlF+UTy/Ds8uHlf3ep8Oeh59f
	jzDGLiIFnQY/TCC6plIjUd00seRYh85cpKJctP197lYh0jlBjEkCNwgCdUsKKRtxIyHbak5VP4i
	fgPTJ4X8oDePO+4NX+cLHrMkV8SqefjzyyADRbrgrMYxIQwTA0xdF0JZuGVFv2jJfQH/0
X-Gm-Gg: AY/fxX4Iop3hw8zQXR4u8qyPvFYCIz6Mne0UliONJIfg0h4akBDDu6pJkKFBOtSpbzx
	fqpvdSfBfLGSbpMYmFPQfockEpg7ul158I2oYoMCmvF1Rw82k0VujyMNP5DYliTj53CB54b71KW
	uZEqNbea+SnNC2y96EIMo9Y2ll29YLlptiECeRHM4fa2SWp5BeVjKCdgP0OD7TnAmBDhiGkkr/b
	pVvW5RPobrmaTdXRk9tvPs+Y74tqIUdFQYTa1/VwbZqDa54cuDANNO/dSV4i0tc87Y67W8QurFY
	OCPqczICM30D4VDLFQkpt18aGiy50XTaFa0zEva4crhWejh14woh36u7WOe7FUw1UhHChKdmzAS
	vuBBfMtiX1PuYm8vM4+Kra/h4HG6IWNU42IfNjX5qhlXioUiDE5jUqD45CfSuZrhdlw==
X-Received: by 2002:a05:622a:249:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4f4abd3d611mr408882111cf.5.1767100047445;
        Tue, 30 Dec 2025 05:07:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHo+d4CC+cCCHywIIG3f9F/agTV5zHZGmRFIXu9W9+iV1sfY0qOVbKgOX04sqcJnmja84Syiw==
X-Received: by 2002:a05:622a:249:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4f4abd3d611mr408881301cf.5.1767100046874;
        Tue, 30 Dec 2025 05:07:26 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f512e3sm3625336666b.67.2025.12.30.05.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 05:07:26 -0800 (PST)
Message-ID: <1595f84b-91d0-4369-b1ff-713cf21472b1@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 14:07:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: agatti: Address Gunyah memory
 alignment needs
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
 <20251229071258.456254-2-sumit.garg@kernel.org>
 <90264256-f53d-4a12-9b37-4cc43720c181@oss.qualcomm.com>
 <aVNZPOHHZn2U5N_R@sumit-xelite>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aVNZPOHHZn2U5N_R@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ox8HPLDU0lyV6ns0FAbzPl-6zFQpGDsX
X-Proofpoint-ORIG-GUID: ox8HPLDU0lyV6ns0FAbzPl-6zFQpGDsX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDExOCBTYWx0ZWRfX71OUKPvZWgQZ
 5p08pK74klc7l75OZ1xFBekUTowwW/qIoh5p4b5rwbUxTfrL6G0CfPMQdkEUMOIaPMG6FAReekG
 HSWfUWh7lO0OMHs19bsxDhEU5Z/oYRVzWonHi4CpIvaHJE5Nkl4gFxb7fZQP5KXsd/Gbcbyi+bL
 /g6d8V34NSvSsYtsDtkm7e5Qy2hlkZdxwzjDdZEo2OeHNw6/A4qnmdg7yafUuhlw3G3gmrMruXT
 +7Dt3QWgKRXer1PpAmUJOVjiHyMnXbJsXwjOVO64NjYpk+Ya6tSTw6fsM6cgCPJ77o//FVC1olb
 SFtiqiNuR6268dHxjb+6/aJhPLLF7OVd1Est0OKc3hiXzeqVdVhDsak7TYWuCJM8k5EklVPxK19
 TtMRF7JJ4xGWNDnmcASuOO2ofMJMxEkCmP2PsinO2eN6LaB6JS69wtlAyhDhv+6lly3CamhUOvI
 PjlAolJjpF/ihmxWByg==
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=6953ce90 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lTImZTorwxYyWPzu4DUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300118

On 12/30/25 5:46 AM, Sumit Garg wrote:
> On Mon, Dec 29, 2025 at 01:43:18PM +0100, Konrad Dybcio wrote:
>> On 12/29/25 8:12 AM, Sumit Garg wrote:
>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>
>>> Gunyah hypervisor requires it's memory start address to be 2MB aligned.
>>> So the address map for Agatti is updated to incorporate that requirement.
>>> This should be a backwards compatible DT change which should work with
>>> legacy QHEE based firmware stack too.
>>>
>>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/agatti.dtsi | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
>>> index e705eb24160a..153916980ac0 100644
>>> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
>>> @@ -298,8 +298,8 @@ reserved_memory: reserved-memory {
>>>  		#size-cells = <2>;
>>>  		ranges;
>>>  
>>> -		hyp_mem: hyp@45700000 {
>>> -			reg = <0x0 0x45700000 0x0 0x600000>;
>>> +		hyp_mem: hyp@45600000 {
>>> +			reg = <0x0 0x45600000 0x0 0x700000>;
>>
>> On a second thought, please add a comment like:
>>
>> /* Gunyah requires the start of the region to be 2MiB-aligned, QHEE doesn't care */
>>
>> to prevent someone "fixing" it in the future
> 
> Sounds reasonable, I will add this comment on the next spin. I hope that
> I can keep you review tag with comment added.

Yeah, although as pointed out by the bot you'll need some bindings
updates to match

Konrad

