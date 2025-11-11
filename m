Return-Path: <linux-arm-msm+bounces-81245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D79BCC4DBE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 13:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 69CB84F9224
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 12:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE86F358D1B;
	Tue, 11 Nov 2025 12:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/hinb6U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T1LIn9z5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEE93546F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762864048; cv=none; b=P3qlsVHb06bCs4u7smiNPGdY0o091hKW5ZsI6xSTt31sWIrgihs9AevNm4HwVoGfjGapWyZeCl2X+XGKUqc4mKmeLmZqlSeksvrw691dQa4w0o+qioWgZ+MW+8HtNyupyubRShWC7yiWDKV71Zrq+vx+l9SD3Y7ZXOsiDj8B7jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762864048; c=relaxed/simple;
	bh=VGdvTXWayZd9acqSC1XpqmFYKx5saTQFPP4oRMqV0LU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gshonAaEfaCSnY/HMcks2bAdIJxJCihlMiQKTox4f75UccnqNKOpreN0S+MLTfWoIA+cuPmxbx8pRUeftoK06XLlSHEgG83EfnXf510FTRLCWfCUoVsuQp8atrzyicVP+SnHHZt3o4T6Se6RpIAEiNGdM1YKHnsB7LP2YtKjBwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/hinb6U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T1LIn9z5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBG6Cr2425223
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QRY+UiweNrpiV+fWFDnNBjWl8BU+4p6ioCGCbojZn7I=; b=T/hinb6UUym/RnOj
	IgkI1HgkV91LBjUKL1ExFpEiRFwslUDB4Y3QFIp2DUmKauDn4XeS9jjzCLxnpNip
	3Rq9zR5DwJXSN67HFg89z54iszIF59ewNgQYzKc1ErzrHr27BA7QEoxa3ONRy69+
	kix1FghuLS+HVIf490pi7WKfLd5BpbSEelMaobSN1NzYcMdouzTACz+EgYXegE/D
	cx8RLNOnB7sa11sDEl7fPYQ4lvhcaeNlKcDiefzZa6oO8yxs3bdbxmky4fDeM/o6
	p/JJLyRz/fns4x4zf0opUn1LSQcsRAXzPR5W7G8hoyDW/H1ReWmkrVxJvorj2j9h
	1X6pKw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac2350k0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:27:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ba43116e8abso334168a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 04:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762864043; x=1763468843; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QRY+UiweNrpiV+fWFDnNBjWl8BU+4p6ioCGCbojZn7I=;
        b=T1LIn9z5YFqZ4Kew2IXUgvt0WVAz/tm0E4k1fOriqrSCwrs+QtgXldGFFGgYysSJp7
         j2KG4XBBRWaWVnp+vswXTbJYtpUBSmKXAObeECwD32pTM41T5JQ4Iq9+7TDL54AZJOFu
         AZwg1kp902kdCHlhPfIA0PgjT0QFYf5Cupj2ji8FJ/BMtM5D5mIY3Czg81CtinGs5kWW
         LqlPPf6eh4HTDZYqsrmvGV8lVG3q5i5kiQGkaF48Q7BHJpUE8H0Tg7r/Ly3Xo7SiuTAa
         OaBsvJpSpA1Bn3gUa+zgwdYOHSrMXQuSuYzXRueEJAzY1Eq6eIr1WM4JxG9WGjL/PlFh
         iU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762864043; x=1763468843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRY+UiweNrpiV+fWFDnNBjWl8BU+4p6ioCGCbojZn7I=;
        b=XA0uhXIYCb50DVUFaUs3xdWkohFZPTWZSAnzTcgHWXuuKw4gQaWdRiC6zoNkYM3m0i
         M4cRdyMhyrWZ/UHNUS6CQOqDc96PmERqgopfo2CNtnVPKI3ziPPyRhNeS266bAtoBm4K
         LCEDcshTFi+FFYz40c4VmBiVDFzcOZsH1YL5rFxcDcIt+QQjtjXkO7/5tlrD/0rr1Is+
         J9ME5IaqlzUEzlj5W64c2S40jDTmxrflQkBLZp2D1wmXhjf8n73oSoifWmo4Gyi/yIfa
         8MVR6cu7xDK+xJ7zGz4nEuEiF4ibzPrsj4rG5eDHtirU5v29g0g9RUJutNzOoFNPnThp
         PO4g==
X-Forwarded-Encrypted: i=1; AJvYcCUJ4z9E5ZL6FpvrhkqQvloHER4ZSB72D+tDicg5qbTbFk688ypYAzISRH3fMF05PVVVkh9GA83Nlu32ccyl@vger.kernel.org
X-Gm-Message-State: AOJu0YzjGaPGK4eCE37uGGwxECcMe6hYhDfj8Svu+AMdvuTOWV/3T1M1
	+OzLDQSRjwX8Qs/BLXQgdpj7aF0hDe5a8IbPPAtFII4s/I4ixyxwxm09iUkmL/IcAmzN+A8ack3
	u3/lWzfo+8h+hgkvzc+81sRXjqZXy2iBpe5dO33iuxi4p8bF5CECK6SdMr1n58+p0utgV
X-Gm-Gg: ASbGncuQ3w2X+O6lbxYgKzJ18AXU6kvFiVCAyDjl372V+eUGjUuHFDUk0p4kPFpm+nj
	YsiQ/7BkLEA71iEEkW8DoMKG9TXXH10StzVHwap/UPtlK+k5cTNCqMwm6t5AIeYC8yjypaq58o7
	9WpFlR/VRQcPo349TJ20DU0+BRu7fHCJhPx9uTNUdyOd+OxyxFrxDZDXiSiarEiPsoyqDrbAYT5
	qpUAyj/LcB4th381CfbUb4AKfCcjgxIN+oDMZ9IA+6X4/3IoUt9olWjqI7afV1dz30ru7kqfs3R
	6H3Jg8KEfqxSZ/Y02sr9P9gRolD0CoroSq4HOgUxB7C8uiYD8Fgum3rW2Jn1GU1UJbF04jjWBZj
	jwZwpg1hIkTCpOUtp9WxER1EN8yACbVLVi97arH1ODsWmU81xSF+qCcu2EvdXuamgVg==
X-Received: by 2002:a05:6a21:3283:b0:34f:5e79:d1af with SMTP id adf61e73a8af0-353a427eb2dmr8346515637.5.1762864042492;
        Tue, 11 Nov 2025 04:27:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2eaVkRhGzoOp/g+/yML4H5Qb+B2JmbxgwtpgDHFUGmoNmjvYzcKFNrVXWnjr5EMSRh2pSXw==
X-Received: by 2002:a05:6a21:3283:b0:34f:5e79:d1af with SMTP id adf61e73a8af0-353a427eb2dmr8346492637.5.1762864041735;
        Tue, 11 Nov 2025 04:27:21 -0800 (PST)
Received: from [10.133.33.249] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9c08e53sm15248839b3a.22.2025.11.11.04.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 04:27:21 -0800 (PST)
Message-ID: <81174278-c3c4-4dc6-856e-b58aa2cb6fea@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 20:27:17 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Kaanapali
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-mfd-v1-1-6c8a98760e95@oss.qualcomm.com>
 <b623c7f6-f28f-49ba-b6f6-25084117a6b3@oss.qualcomm.com>
 <l4mb5pi7kz7uuq6o3eueoxl2ngt2sdd6dv3kyudw6i54co5v5h@w6ya2nuas322>
 <ad00835e-bc20-4f97-aba6-e1b4f5e97191@oss.qualcomm.com>
 <f2q7a7r7quq6pplcn3kklwrhdc6hxa5zvc7osygshtyurwyvi4@t5iyragt7irh>
 <b5ecf5e7-4dc4-41ac-9b56-7c52afacb950@oss.qualcomm.com>
 <01de9616-825b-4fbb-83cf-e0bf91e8cf39@oss.qualcomm.com>
Content-Language: en-US
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
In-Reply-To: <01de9616-825b-4fbb-83cf-e0bf91e8cf39@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA5OSBTYWx0ZWRfXyh5OVP9eIAmM
 5JR1aYkvVKKwD2Z8BJnYlQHAl4WcB07gsW0DPudAXdf3EOadElhHjTpU0GTUX0iVqw6vLBG+8Qd
 nSWi9fc8YThbYUDaHUtxyde5vv68YpSdtRyROTxXES5UQ8brypOF5BmpjYM+gZzsKe8sxqZEu8H
 fW1hXeqIZ25R6f2henSXbyrzbmjQlDQUiqYb3J1doYNxpT0GCiuxBECNb/RRS58DQg5pxeuaBvf
 HHm/lYffFxeHqzk0/vCmeTwM/bUUUgdm8o8F/cJH2xvsIwz6LOjjSsvmDDsupi3U/zwX+thzkyC
 if/OI4+eqakN9ijcaMboNhrpjRe857hu0XsMXTpYIobGWe003hrtugANWvYHvut5diaZjdY3OuX
 QKdbCzuUj6Hr63if9oDDWr07XNwzMg==
X-Proofpoint-ORIG-GUID: 4tj2hsAXLrHtQKa8zhYtKiEBE4k484xD
X-Proofpoint-GUID: 4tj2hsAXLrHtQKa8zhYtKiEBE4k484xD
X-Authority-Analysis: v=2.4 cv=O8I0fR9W c=1 sm=1 tr=0 ts=69132bab cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Fz6UwL67OEVMctUH-G4A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511110099

On 11/7/2025 12:24 AM, Konrad Dybcio wrote:
> On 11/6/25 11:16 AM, Aiqun(Maria) Yu wrote:
>> On 11/6/2025 5:06 AM, Bjorn Andersson wrote:
>>> On Tue, Nov 04, 2025 at 01:35:01PM +0800, Jingyi Wang wrote:
>>>>
>>>>
>>>> On 11/4/2025 12:02 PM, Bjorn Andersson wrote:
>>>>> On Tue, Nov 04, 2025 at 11:34:25AM +0800, Aiqun(Maria) Yu wrote:
>>>>>> On 9/25/2025 7:23 AM, Jingyi Wang wrote:
>>>>>>> Document the qcom,tcsr-kaanapali compatible, tcsr will provide various
>>>>>>> control and status functions for their peripherals.
>>>>>>>
>>>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>>>>>>>  1 file changed, 1 insertion(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
>>>>>>> index 14ae3f00ef7e..ae55b0a70766 100644
>>>>>>> --- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
>>>>>>> @@ -48,6 +48,7 @@ properties:
>>>>>>>            - qcom,tcsr-ipq8064
>>>>>>>            - qcom,tcsr-ipq8074
>>>>>>>            - qcom,tcsr-ipq9574
>>>>>>> +          - qcom,tcsr-kaanapali
>>>>>>
>>>>>> It looks good to me. Glymur didn't have this functionality verified yet.
>>>>>
>>>>> You spelled Reviewed-by: Aiqun Yu <..> wrong.
>>>>>
>>>>>> Remind for review.
>>>>>
>>>>> No need for that, reviewers will review when they have time.
>>>>>
>>>>>>
>>>>
>>>> Hi Bjorn,
>>>>
>>>>>
>>>>> But that said, most modern additions to this binding follow the common
>>>>> format of qcom,<soc>-<block>.
>>>>>
>>>>> So I would prefer this to be qcom,kaanapali-tcsr.
>>>>>
>>>>> Regards,
>>>>> Bjorn
>>>>>
>>>>
>>>> qcom,tcsr-kaanapali is used to distinguish with binding for GCC:
>>>> https://lore.kernel.org/all/20251030-gcc_kaanapali-v2-v2-2-a774a587af6f@oss.qualcomm.com/
>>>>
>>>
>>> So, qcom,kaanapali-tcsr is the clock controller region of TCSR and
>>> qcom,tcsr-kaanapali is the non-clock controller region of TCSR?
>>>
>>> Sorry for not understanding that earlier, but this doesn't work for me.
>>>
>>> It's a bit of a lie that TCSR_MUTEX is a separate node in devicetree,
>>> but it's always an nice chunk of 256K in the beginning (or end in some
>>> cases?) of TCSR. But for the rest, there should be a single tcsr node in
>>> DeviceTree and that one node should be a syscon and a clock controller.
>>
>> I've been dive deeply on this tcsr block. And actually the tcsr clock
>> controller part is a very small trunk size(0x1c) of the tcsr block. And
>> this block have contain other multiple purposed sys registers. So maybe
>> we can have a more discussion on how to have device tree node describe
>> this situation? It is not straight forward that to have a non-tcsrcc
>> related area being described in tcsrcc.
>>
>> What about option 1 (tcsr_mutex + tcsr_dload_syscon + tcsrcc):>> tcsr_mutex: hwlock@1f40000 {
>> 	compatible = "qcom,tcsr-mutex";
>> 	reg = <0x0 0x01f40000 0x0 0x20000>;
>> 	#hwlock-cells = <1>;
>> };
>>
>> tcsr_dload: syscon@1fc0000 {
>> 	compatible = "qcom,tcsr-kaanapali", "syscon";
>> 	reg = <0x0 0x1fc0000 0x0 0x30000>;
>> };
>>
>> tcsrcc: clock-controller@1fd5044 {
>> 	compatible = "qcom,kaanapali-tcsr", "syscon";

Remove "syscon" here. Not need for tcsrcc fallback to "syscon".

>> 	reg = <0x0 0x01fd5044 0x0 0x1c>;
>> ...
>> };
>>
>> What about option 2 (tcsr whole block + tcsr_mutex  + tcsrcc):
>>
>> tcsr: syscon@1f40000 {
>> 	compatible = "qcom,tcsr-kaanapali", "syscon";
>> 	reg = <0x0 0x1f40000 0x0 0xC0000>; //align with the whole hardware
>> block design.
>> };
>>
>> tcsr_mutex: hwlock@1f40000 {
>> 	compatible = "qcom,tcsr-mutex";
>> 	reg = <0x0 0x01f40000 0x0 0x20000>;
>> 	#hwlock-cells = <1>;
>> };
>>
>> tcsrcc: clock-controller@1fd5044 {
>> 	compatible = "qcom,kaanapali-tcsr", "syscon";

Same here, don't need to have "syscon" here.

>> 	reg = <0x0 0x01fd5044 0x0 0x1c>;
>> ...
>> };
> 
> Is there anything wrong with what we have done for x1e80100?
> ______________________
> |             |       |
> | TCSR_MUTEX  | mutex |
> |_____________|_______|
> |	      |       |
> | RANDOM_REGS |       |
> |_____________|       |
> |	      |       |
> | TCSR_CLKS   | tcsr  |
> |_____________|       |
> |	      |       |
> | RANDOM_REGS |       |
> |_____________|_______|
> 

Second you! We can firstly have a option selected for kaanapali, and
then other platform can be followed or fixed afterwards.

Here suggest to have option 2 which is remove "syscon" from tcsr clocks,
and only add the whole "syscon" to "tcsr" whole block.

> 
> 8750 was different because someone decided to stick the "TCSR clocks"
> into the TLMM address space, but it was a one-off
> 
> Konrad


-- 
Thx and BRs,
Aiqun(Maria) Yu

