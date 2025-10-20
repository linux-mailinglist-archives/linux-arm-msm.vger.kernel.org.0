Return-Path: <linux-arm-msm+bounces-77998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B3ABF0FE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 14:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3673318A1C92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 12:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD26F2FB615;
	Mon, 20 Oct 2025 12:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YIzjiTLJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747B02F3C19
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760962092; cv=none; b=IaFuwM+iuIDudlI0KERCiftuqWMsUaSEvUwvPCvcJK2Ao1vVp6mNpWU8oB8AzAAye2rQOP0MJhexvmKIamCR2OoK42VbNNQbV28A2gtcJl+thl+W9pqabCp9vMX8oGvEyUH6u8TpYvex1h61JwANk2Xy9hm7qVJQ3xePDZpPdKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760962092; c=relaxed/simple;
	bh=33LPI6E72AMQx+gYv5kCkz5RE96g9h/zUVadmF0GT5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KgQigrNGqsBdlkggZYYtOO17uRoV8TePbdh99k8SXoVl2byvlP3E4Vjhp8omnbfQa0a1p+qqJXVHcqSKoss2YeuTX0lAFuM0fLrfU3q+8Bu+WK1yX1oCYHwHZKLVbw8ZACkwF65oU1iuJ9wH7tpcYkxtckR6WS1li4kA7vDOJXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YIzjiTLJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KC5T1p015370
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXN6fotSa04gUPgCl+hHGvVwZiaZT4vBN793iStPbuU=; b=YIzjiTLJYy6NmBWA
	Lbg0A8UCxuNJDuP2MW8ZDKqe1BNOjphfkz4Vb0tlXcgHkbma7tZRG6hGfFUzucK2
	e18hdFnZ/EhACrSw788nr/MhJuGjj1rGcWuPoZsTCgOFi3olInhA4guNbHLpTr9d
	2sqpP+ZmR8XI/QoKeeQAy+5FvUJeKkFf7pNjLZde/EswePY4W4wHNLh4np0qrmdk
	z/mMJfAGvlhkvwl292P/yYc/keZ2GqCHm5R3OOD36MqUwmTE4WXad9nN9/YfbeYk
	IGIp0BEC9jRM3b7ORjX/LhbZPjArDisDV/dFk9FTe0fWu5PPGRfFuyi0WVM0maqI
	PcAnHQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469ck3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:08:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-88f7d885f8dso168964285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 05:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760962088; x=1761566888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RXN6fotSa04gUPgCl+hHGvVwZiaZT4vBN793iStPbuU=;
        b=DeDy7fV1cE3FXdRXZiZ9eaWQU5Buti89Q1f+mxxs8KEC4au6AL/o7dfDHHt+1y0NXI
         Pw+dOPllAmO+rbKsU3VYxKv8bp4o2NUb8DbyA6oGQyvfmhQM+HqvRCVJXKF+4NNPjpUi
         E2J+pBJU8dTeHFt1KN1HVI9D8RCwwA33/2Cl3pAOOIeTEGUpcRp01bSa78PH+K6670GH
         IDDIVw0uyd5SfAvdbmeKMPknSAaXigafW/A6CbhGpuVrzBFA692FjllJqbwVicWiMVOr
         sfaHcwY0RqNYOdeHcAQuryRivRsnGqdHlRmpqn/vW+atTPGE9kkpkMdMl4tZzaCuaqSC
         l++g==
X-Forwarded-Encrypted: i=1; AJvYcCW8Nc257eQlCc3ZFzwziPOZXMQKrYWR9/osxIGg+OBgpjmGjVWGFiix3mD497IgF+xhWqdBdnWcSkwmw2Ic@vger.kernel.org
X-Gm-Message-State: AOJu0YxFlF4KkgP8IT/kpNcBn66RIioVLiL2eGXb3aCGQSfjSgRpcuTn
	XpF7Oe0yYifo1aGludnHHNo4oeAjt5DOhxqTQUwtn5m+iXeuFkTnZz7+RZ05kVKDS0uVpruGu1B
	G2ovUlKEHgGSBOS/KbjGhnsOdHUWw1X+uyGwop3yntleEaAGlZKZ9d4MOpuAWW+lr8JBw
X-Gm-Gg: ASbGncuWYlyuq9jUDi2SjaS3YVGWhW5Yh++sbpyO5N5cgL9S1FVf4dXHnbvbSraQrsw
	uGDF5MHKFiyeyxX7HDbFQtH+I2277NK0gQdNuGJQshjfNQgkyoW5w79Fc/1lYXW3/3/I7mqalkP
	9ER0AqiHMjGGp2Al/hGAQXHdei97pKGQLPTifXk/nXTIiEZW/ON0cOcjrIYGSiZn/RfFA36OfP4
	cgBtC5c0HjcB3HPqGwP5LPOU5+izKEdKV/LNyjh78TvkKkot6QIbI136HLijMeiTTg4Oaay0iOP
	n01VjhO7EL+HDo0ROqD1QuF3MBrE8Tq8DB1eIBM5suP/6ZI+1fg/bZWa8Ga1aXeq1KzVIxf/1++
	pMAe/eAOVn2emjt3qtoxDZ68HkUcE1Vh+Qt1snQNRgsLMahGgBD/NDzzg
X-Received: by 2002:a05:622a:2c9:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4e89d30dfccmr115733531cf.4.1760962088525;
        Mon, 20 Oct 2025 05:08:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAxgKzIAcFSpHxOq4gtrj/4OH9lLOlq/BGeVVwcOTFLyLCTJYBxkyYpkGmaHl8NF/KFdtpCw==
X-Received: by 2002:a05:622a:2c9:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4e89d30dfccmr115733091cf.4.1760962087934;
        Mon, 20 Oct 2025 05:08:07 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb0366casm787927966b.47.2025.10.20.05.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 05:08:07 -0700 (PDT)
Message-ID: <36928f42-3603-4e01-a31d-8f9e60f54009@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 14:08:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 VTOF_LDO_2P8 regulator
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
 <20250930-sc7280-dts-misc-v1-2-5a45923ef705@fairphone.com>
 <ac1c0d1a-36a9-4542-b879-06c017f7f2c4@oss.qualcomm.com>
 <DDDOF3F8K5WQ.FTJ0F6E6DLPG@fairphone.com>
 <8e452e51-3a95-49e6-91e3-53aa46fcfe2e@oss.qualcomm.com>
 <DDDPKMMSAMJR.1JIQMK3W2Y40V@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DDDPKMMSAMJR.1JIQMK3W2Y40V@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: keLcTZtgBKFC21pyRi6Won4aW5WGC6-N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX0WAfq5lk0P8F
 Xhz2imXQc1CJ0pSliYDtOevNf4KqGAtWIxu55SHgtvgWyrd6ogOlHI/e14eGLvhxOYJdvUtlhPH
 03ndZCdlYia5DYRKV06ABVgO+Rh5yo03zrxO5LC9tGTSv983eWgyIBt82tkV7h56mn34DktxutX
 eAviWYMWznzZPOqfCTW7c0LdNTkDtuTTR4xmdjkxL8sLrwo+tXdT1Hxm8PM9XEqiVbMFQ5meZqc
 TZlR6Gk9Z1uUu/pW+hqzpCSKo0uTTaOaKDuVKe4GtJCjXwcd1a2dOkqppg3eM7AIMXNMU4nhgyV
 tPTYFT9mLBIkown14ZFkfgzwlBBRly4AfnoayfxiPApq9mH5/i1B6a+IYmT5YX3lNhD1EhYKIZ+
 RN+TR64VP1DHYznEXEOd7QNlWq4CmQ==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f6262a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=xF4_qlAILLPsp1LD694A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: keLcTZtgBKFC21pyRi6Won4aW5WGC6-N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032

On 10/9/25 12:10 PM, Luca Weiss wrote:
> On Thu Oct 9, 2025 at 11:22 AM CEST, Konrad Dybcio wrote:
>> On 10/9/25 11:16 AM, Luca Weiss wrote:
>>> Hi Konrad,
>>>
>>> On Wed Oct 1, 2025 at 10:30 AM CEST, Konrad Dybcio wrote:
>>>> On 9/30/25 3:57 PM, Luca Weiss wrote:
>>>>> Describe yet another regulator-fixed on this board, powering the ToF
>>>>> sensor.
>>>>>
>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 13 +++++++++++++
>>>>>  1 file changed, 13 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>>>>> index 36d5750584831d66b4c2faf6042e4cbb3274eca7..0a64e5721e092d1f3e4bb7329335704eee567761 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>>>>> @@ -195,6 +195,19 @@ vreg_usb_redrive_1v8: regulator-usb-redrive-1v8 {
>>>>>  		pinctrl-names = "default";
>>>>>  	};
>>>>>  
>>>>> +	vreg_vtof_ldo_2p8: regulator-vtof-ldo-2p8 {
>>>>> +		compatible = "regulator-fixed";
>>>>> +		regulator-name = "VTOF_LDO_2P8";
>>>>> +		regulator-min-microvolt = <2800000>;
>>>>> +		regulator-max-microvolt = <2800000>;
>>>>> +		regulator-enable-ramp-delay = <233>;
>>>>> +
>>>>> +		gpio = <&tlmm 141 GPIO_ACTIVE_HIGH>;
>>>>
>>>> You may want to define the pincfg/mux config for this gpio too
>>>
>>> While I wouldn't say it's not good to have it, there's plenty of GPIOs
>>> that have no pinctrl for it. Downstream doesn't set anything for gpio141
>>> either.
>>>
>>> I honestly wouldn't even know what the 'default' for a GPIO is in the
>>> first place, or could I query the runtime state from the kernel? Is
>>> /sys/kernel/debug/pinctrl/f100000.pinctrl/pinconf-groups trustworthy to
>>> solidify this in the dts?
>>
>> I normally use /sys/kernel/debug/gpios
> 
> Oh, if that works at least the path is a bit more memorable. I needed to
> check quite some files in this directory to find the correct one.
> 
>>
>>>
>>> 141 (gpio141): input bias disabled, output drive strength (2 mA), output enabled, pin output (0 level)
>>
>> but this seems to be formatted very similarly if not identically
>>
>> Generally it reads out HW state, via (among other things)
>> msm_config_group_get()
> 
> So, you recommend setting a pinctrl for every single GPIO that's
> referenced in the dts? Shall I send a patch to add all the missing ones?

That would make the state always deterministic and it's probably
desirable yeah

Konrad

