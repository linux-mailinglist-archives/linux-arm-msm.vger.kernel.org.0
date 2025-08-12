Return-Path: <linux-arm-msm+bounces-68712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF62B222F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34F5E3BC731
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 09:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE4E2E972E;
	Tue, 12 Aug 2025 09:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MsSwylZJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB4A1A9F91
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 09:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990220; cv=none; b=EP5troG9kfFL1pZmppiqlP0nxDqCatbVA1z17w5GLMvvAFDMxgoOk0M8kvY/ymY3aAmfCMo5JkKfGLmqIPr1ffQhlJ8WXMsMgSYxxWXZnTBlGzdhYcLSXVtJPzKcw4XiI+V5st262KEKYz3zu8OoNS6ymc3QtQRl8wyrHFuNiRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990220; c=relaxed/simple;
	bh=3vxrRJAh+EqyzgyBhex5r9Yo+PAKpEu68mEfY7pR1MI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dOvFRlHAQtH4oqjAFPtfINF8/3ToAv/UwJYIncd/Na1i+CLfpGlQIwSuM4tC7vRruJVqkwUQQKim0cUl/Be1eaUHt3Upi3SYbVTSxPOAIWRrEi0egpk81EoaLEIlkioY6Ib1SO8pku1rxEYXXFEKfmjyqMoL4LhMs8Mx6bePSc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MsSwylZJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5P1sA022882
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 09:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	szoFZFn3zyipQklF/BzIbtuPr+6uKdGBAsaMiBXKvR8=; b=MsSwylZJY+3ibgJC
	fNiPBU4FTg9cssCQ9U9HILeP2nJG9HKbc449cq+p5EpjhqxahasZoA8p37wZ3BCt
	crVxwJil8Rb/mdyxf2dKW+Ewz0S0j2MnDyB+gVd+7ut44WnExaWQ4VA5JMr6/HFp
	oB8WhuSjgB/mxAOoIFF6X3wUdPLc9Z5Vui1mjbu1n9ucTfruGgP2G/ia0+BgbV4N
	x/W4/Dgl54U+5nNjbs+1D4+bzOYSj6LbP2w1m1mDtAPjtoyVMIYcIJiN2zdkn4Oz
	wIhqjn/G91h0etISHReHyovTc9CceS7rietBqhshanuVQS8tQreIWesG1GSH1yJ2
	zBb+sg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj47hfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 09:16:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b0dfcd82ebso2266441cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 02:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990217; x=1755595017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=szoFZFn3zyipQklF/BzIbtuPr+6uKdGBAsaMiBXKvR8=;
        b=m9RIxR1mGAwWPruxUeHOBRk3f9+bsB3L2hbTRy/4f1aQ6hpVkiLcqK/ccW8j6YUqUM
         fgDyEHlF6eBsViBOGQPZfalwOSQbtben7J5THUP18PCp7VpEkdbo0yAD3CKqsG3743PT
         Zdhu04wqCIRwuX/Z7JKa+aUtje6FkOrMHEyexPJKK9bxFLpqDp1+W2IDnZzULTpV7GPL
         7YmbfMb2K8V8khFjqIok7+VZ+gMsSAdsKtS7iPMHsZY+AA4qm5eue/+qBuazgjw1RCHl
         i0zN4S88rsl4JrYwKomOAmydhUSUEQKomQKl5uleVCnkodXFbprj8y8dZpnzhfTOwMUW
         HwKg==
X-Forwarded-Encrypted: i=1; AJvYcCU/IWRILCO6fbktDpA2fyk+mByTadLqQzMVoCRZx8+v0CN/umtQBeXdDeoMHm2ZSbfoT7Ss108nXY9MX4y5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5B57DKKtHh/4Q/C73aeZsvmfReN9qS80dF24ewaHbKwz903yf
	9yWt3NZG7Pm4Dt1YYMOQPG5KSySOukI2QlXJqjY0DO62gYkAe/bWIzCWn23ntazt1f6H2axz4Y2
	a8QISGLdwxASp26tdbKPWvTkWciiMK4D1gZrddrTHYnVeqD5gTR+0cyL6CnX+NdB8ZDUF
X-Gm-Gg: ASbGncs8fqqDhN5tE0LYBaPulOvb8LZewfrVawHUVTxZbVG4eN9wrWLx6CMAstqDxVe
	J7YUt5ScGk8G4ZMYQTpPLPccjv4fFTKrdvbQ7cjTW9LeYdQHBhrsta05+F+UaK7iMDrXOCxCWxw
	xdN4D1ESOIIlaG8OmxLiSUj1aFPPvH4eiDQ8txuZSLK/2S6twIZIflQzGV/6woJnCOWnaRJj0hK
	MCPAkAfk/2kMyiTyq5NXCq5tcUR9AcbrF8EbJQyLk9i/ggeXyv+j2shPqKcpXG1Kih4z4llhwGZ
	bjx8iIVfchLfNztez+kBjPJ9+SsYGXp6+JdBQDas+BhsooGWpO9oYkmu+iC1ytg2ivPXi+lk4mk
	Asqp70ZmOslC4sgnrhg==
X-Received: by 2002:a05:622a:1a29:b0:4a9:a320:f528 with SMTP id d75a77b69052e-4b0f48fa006mr2988671cf.3.1754990216692;
        Tue, 12 Aug 2025 02:16:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEb8BIOiMB2aaszVUO5sc5ldVeAaDIfkEujTFUEDPXKgEEwpNoWILRyxCr9Ql2Svsw3ZJzZXQ==
X-Received: by 2002:a05:622a:1a29:b0:4a9:a320:f528 with SMTP id d75a77b69052e-4b0f48fa006mr2988531cf.3.1754990216019;
        Tue, 12 Aug 2025 02:16:56 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a219ecfsm2165172566b.94.2025.08.12.02.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 02:16:55 -0700 (PDT)
Message-ID: <3f712fec-a4c6-41a3-9b7a-34b9edc1d9b0@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:16:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] driver: bluetooth: hci_qca: fix ssr fail when BT_EN
 is pulled up by hw
To: Shuai Zhang <quic_shuaz@quicinc.com>, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com
References: <20250715051618.724475-1-quic_shuaz@quicinc.com>
 <20250715051618.724475-2-quic_shuaz@quicinc.com>
 <ee84aeb0-728a-4642-9686-3abb9588bb24@oss.qualcomm.com>
 <e7e700e4-e87c-4e2c-8df1-634870ba91b2@quicinc.com>
 <0a6d6ae7-67f2-4974-b005-f36ee8707c67@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0a6d6ae7-67f2-4974-b005-f36ee8707c67@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX1G9bSORDya86
 +Ka9EifDoE+v8W8y9uFK+Rzm6jxnS452Rx2ICGChAtZwbjj7F4coJSs4j2GgmLfGkzlOoJMSmwp
 iaITtqgpY1AtfhunQy9NBw3NNJ2gHj8DidOAQL107eOgmKNB1GeWf8RSsPm7FWgVoRGG1U8lZCT
 G0ImnWSUxSMONSs9eNUmPA+qweGLJ1NUSzIaZlaVA2t4Quq+agGiEMb9Vgqmwgua9CgvM0DZewp
 p+1J+OG0mni14XsjJnDjNUDtxW/FLmn1eF08RdKgO7E5x7HUrf16NKrGSGGpXnM0v5Y33jRokCu
 gDOn++8pdUUFjGHJTvHvG4GJiS05bF/0WG+hqd+A9oXbltOP/c4Uekr2oVn9s75/UjbiapHVuv0
 OV8LQ0uP
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689b068a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=TmvEoTIt-G6_DD21KxUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rXu5fesLFWttuulp9DqMCU1Kmgq4P6_Y
X-Proofpoint-GUID: rXu5fesLFWttuulp9DqMCU1Kmgq4P6_Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027

On 8/12/25 10:03 AM, Shuai Zhang wrote:
> Hi Konrad
> 
> On 7/19/2025 7:32 AM, Shuai Zhang wrote:
>> Hi Konrad 
>>
>> On 7/15/2025 5:11 PM, Konrad Dybcio wrote:
>>> On 7/15/25 7:16 AM, Shuai Zhang wrote:
>>>> the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
>>>> This leads to reset command timeout.
>>>
>>> This is a description of what goes wrong in terms of the code of
>>> this driver, and it doesn't explain why you gate the code addition
>>> with HCI_QUIRK_NON_PERSISTENT_SETUP, please share more details about
>>> what you're doing, and more importantly, why.
>>>
>>
>> The problem encountered is that when the host actively triggers ssr 
>> and collects the coredump data, the bt will send a reset command to 
>> the controller. However, due to the aforementioned flag not being set, 
>> the reset command times out.
>>
>> I'm not clear whether you want to ask about the function of 
>> HCI_QUIRK_NON_PERSISTENT_SETUP or why the changes are placed 
>> under if(!HCI_QUIRK_NON_PERSISTENT_SETUP).
>>
>> Regarding the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, 
>> you can refer to this commit. 740011cfe94859df8d05f5400d589a8693b095e7
>>
>> As for why it's placed in if(!HCI_QUIRK_NON_PERSISTENT_SETUP), 
>> since HCI_QUIRK_NON_PERSISTENT_SETUP is related to BT_EN, it can be 
>> used to determine if BT_EN exists in the DTS.
>>
>>>>
>>>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>>>> ---
>>>>  drivers/bluetooth/hci_qca.c | 12 ++++++++++++
>>>>  1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>>>> index 4e56782b0..791f8d472 100644
>>>> --- a/drivers/bluetooth/hci_qca.c
>>>> +++ b/drivers/bluetooth/hci_qca.c
>>>> @@ -1653,6 +1653,18 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>>>>  		skb_queue_purge(&qca->rx_memdump_q);
>>>>  	}
>>>>  
>>>> +	/* If the SoC always enables the bt_en pin via hardware and the driver
>>>> +	 * cannot control the bt_en pin of the SoC chip, then during SSR,
>>>
>>> What is the "SoC" here? Bluetooth chip? MSM?
>>
>> yes, Bluetooth chip on qcs9075-evk platform
>>
>>>
>>> What does "enabling the pin via hardware" refer to? Do we ever expect
>>> that a proper platform description skips the bt_en pin?
>>>
>>> Also:
>>>
>>> /*
>>>  * If the..
>>>
>>
>> Sorry, I’m not quite sure I follow—could you clarify what you meant?
>> Here is my understanding.
>>
>> Enabling pins through hardware refers to "the pin is  pulled up by hardware".
>> qcs9075-evk platform use the m.2 connective card, the bt_en always pull up.
>>
>>
>>>> +	 * the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
>>>> +	 * This leads to a reset command timeout failure.
>>>> +	 * Also, add msleep delay to wait for controller to complete SSR.
>>>
>>> Googling "bluetooth SSR" yields nothing, so it's fair for me to ask
>>> you to explain that acronym.. it's used a number of times across the
>>> driver, so perhaps a comment somewhere at the top in a separate commit
>>> would be good as well. I'm guessing "subsystem reset"?
>>
>> Just to clarify, SSR is short for Subsystem Restart
>>
>>>
>>> Konrad
>>>
>>>> +	 */
>>>> +	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
>>>> +		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
>>>> +		clear_bit(QCA_IBS_DISABLED, &qca->flags);
>>>> +		msleep(50);
>>>> +	}
>>>> +
>>>>  	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
>>>>  }
>>>>  
>>
>> Shuai
>>
> 
> Please let me know if there are any updates. Thank you.

You're expected to address the review comments in a subsequent patchset
revision, in this case please put the answers to the questions I asked
in the commit message, or in the comments, so that someone else can
make sense of the change

Konrad

