Return-Path: <linux-arm-msm+bounces-67015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBA6B14F24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 16:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62944166EEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 14:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5895B1D27B6;
	Tue, 29 Jul 2025 14:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FxX5+zQS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2881A3177
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753798704; cv=none; b=r8w1dgVsD33vOxCH3N8C7W8t9cGtZpc02QKqzhbW36ZDuoOmad7MhsJy6e7l9MrT8cD+r9kjwZppysHzc3SlwAPW7G1MW+yHs2Pl/RmMtuC8xtWAZA9OnSrRZAsB7BN9kn8/BZeVPM/YjgbP6zHeks3IvYVRsz52Inb5rySv8vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753798704; c=relaxed/simple;
	bh=2q83QnAPZfpFgPafBP7XU6Up/noCHicxS0L2OSGBamM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hN68cnWvG9Icvg43rZJgmTELQt1CRzhfw6tmSbFUsZXcAXLUJx5fHwPxbgW+k5Zm3c2W7DGLZeqEE0Q1WoQ6C28RDQ+ofielY84yBjlau/24SmzdnDy2rxk0kbYYoJjm1DmSVwsgIflP6EEP1TIn2cHzUqJDJzzp1vnRVzOCnJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FxX5+zQS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T866eF012855
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uPJzTv/LsbZH/DP7GxqrDBaJiP6VaHmRqwcYKmkvw5s=; b=FxX5+zQSKgQwSpee
	DKs21uj/O5Lev5GgRujGmcE/cCI0YwWEKXcUavyVuNxsaYJKN+dx3KBr56Fu2x5p
	SDhX7uxRHUcBlLMNmozeAa6hXE/KZ+23T+kexG/KW5558LVCF54WJsFoGIdf2u0t
	en4z+rNyS80nEO69dimXS/O6rVik4Z3ggvlryiE8PvfjqpDyvJWlPM2yt3CeeATE
	uSCW9UdRYD5p2g7GTM51YNe87BZbvX4DvC12GtK/5mnBrIkitYgfTVSFjFQtsoxv
	7KVPMlBymws6Lhjryr8SmkDsK8JtwZuE1/5RQXYCImlohoiukd1TChEGCbDH/CC0
	6ACgbQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda0aks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:18:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e33e133f42so115890385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 07:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753798700; x=1754403500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uPJzTv/LsbZH/DP7GxqrDBaJiP6VaHmRqwcYKmkvw5s=;
        b=YJywUCyZe99tCm7/plZ3sG5UHUHIwE1b4tg282gA98DRV5TXdR2QFgXGMI0wymuMmf
         4LqsZ38sbhYg3W3drHUewShOrB8fHiYShMBOrbEBylHZt854ChQlcW8gspLC9mdVjWMz
         MnVL5O3NJEmacIYWNhRyj5dyWkdf+xKZCHEzCzly9fTXxFVRPBVDBb0CuxVDMEpO6lrS
         eqodEjux7g7GFJIU9NkRBvExRWSflImbFAeLml0ba9z/l7Dri2go4Tq47fxCGKcexAos
         mc8tWtlX4Axo8W4toAy4BshMZiJSBZ6gwQa4ziPYLENk+tLvlQZSzgePg7MugNGgLh14
         MQ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHMONr4eSop2HcKBTtnWk92hqdJRKEisu0eOGwEdjw5Dn9K1huWzOaPD5v4lV/rLbY1VwvGPnnDZw1iQ5u@vger.kernel.org
X-Gm-Message-State: AOJu0YzvjQF3a6AponTZhIbNN5Phxxy/UnKOsBLBJ+9ekL8jN0/GW1Wx
	RubhNSkHkbAD7GFAbb8KxdAMMwgQLAy8DrpF2dPXfzRoVSMcgmINQap0aR8ocZNNqI12eBLOApT
	LazV48aG6n9kLbgMukucduwlBdzZooiTUaETvy5XNXdVaUoA77Es3oWj+Wr+JUcMSKVkq3ko3u0
	XN
X-Gm-Gg: ASbGncvMn13REf8eAYtdef4br5bQhSg9iPf2dq76znR4hpYMtog+51VlFJElbS+T657
	chp/kZnJYrf2sSKYxOswN1AYtTHROrPviQtK6kDW7NzHmNS0PFKD1pL2CLgtJWPev/+4PVTY+fC
	QBJBhG5nHVsNf4cjsw3rXpjNEZ22oAn8N6qtcrEAKOeHpaQCm5/5Oa7zN8ohmk583xkJ9CUICe6
	i7kMKqrsVcOT9q+0yV3EXaq12pR83iED27X423bdo+xm4qKYwhqWXT9kO8WC8Zqi14L/Zc4j4qN
	RhgkbKnl7GmMAl6+DaAgBCsr9adHm//bd//DW6AjxMj2DfqP/wUf/ZH01oZol1+sjbVJONvEUI/
	eBobkdfE4b3/G9rhr2w==
X-Received: by 2002:a05:620a:2544:b0:7e6:67b5:f92d with SMTP id af79cd13be357-7e66d4ee20emr11556085a.6.1753798699837;
        Tue, 29 Jul 2025 07:18:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNcpUDTrukrGA/Ku3+zfham3Jn5WZovcxGRPs2Xx7mhoe+YWNAI0qwzjx7TtdhTwzEwh7/Tw==
X-Received: by 2002:a05:620a:2544:b0:7e6:67b5:f92d with SMTP id af79cd13be357-7e66d4ee20emr11552085a.6.1753798699019;
        Tue, 29 Jul 2025 07:18:19 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635adb093sm595797166b.124.2025.07.29.07.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 07:18:17 -0700 (PDT)
Message-ID: <341a7e85-9d4e-4ac8-8fa1-1000281eeed9@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 16:18:15 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e7e700e4-e87c-4e2c-8df1-634870ba91b2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nba2_a_FJHx6jmSvzihIMeZa_gvcVU9H
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=6888d82d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=1VU-nOPUZsXZC3zCpdYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: nba2_a_FJHx6jmSvzihIMeZa_gvcVU9H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEwOSBTYWx0ZWRfX8gpJQtaEAZDy
 QkSgKQxhKLwDPZK/XNYw9w1ChxDFM40hqz57vDZYt/00uyauOnWV4MzM3gabEKtGz0doH4RVqKQ
 Lq2JMWKCYk1WdOjnzb+sWYOeKmCKIIVJjrdh1kr/tjWABh/sMzmsBCVm46TecJPfNm1DIDaiFWS
 3Th57It7NJQCUXEiFmww43sLHNRd7dpEwXQm4ozUqOcf84jqu94QHLBaVCEvvB7nN//Fx/zcgpf
 i5flVy1ZdIXwRV7Cu572Z+YvnI9odTBQ8qyFUZmhesrxlTdBFwylb7bR19LGzLDHMLTeYMjJ/Ez
 CnP75XnRI9xxid1aEquPTrDErl1x5cVC3Yq76cI5lrkD3+1gcuu2Vho4jqIOok+5UHV+IqZdFZB
 lJdYbilJECesF+gjNBtjnLybm43JNqPD3oFTx+cZpFhupAnnIpDKfPkrrXIVdGFCkRFoPgb2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290109

On 7/19/25 1:32 AM, Shuai Zhang wrote:
> Hi Konrad 
> 
> On 7/15/2025 5:11 PM, Konrad Dybcio wrote:
>> On 7/15/25 7:16 AM, Shuai Zhang wrote:
>>> the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
>>> This leads to reset command timeout.
>>
>> This is a description of what goes wrong in terms of the code of
>> this driver, and it doesn't explain why you gate the code addition
>> with HCI_QUIRK_NON_PERSISTENT_SETUP, please share more details about
>> what you're doing, and more importantly, why.
>>
> 
> The problem encountered is that when the host actively triggers ssr 
> and collects the coredump data, the bt will send a reset command to 
> the controller. However, due to the aforementioned flag not being set, 
> the reset command times out.
> 
> I'm not clear whether you want to ask about the function of 
> HCI_QUIRK_NON_PERSISTENT_SETUP or why the changes are placed 
> under if(!HCI_QUIRK_NON_PERSISTENT_SETUP).
> 
> Regarding the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, 
> you can refer to this commit. 740011cfe94859df8d05f5400d589a8693b095e7
> 
> As for why it's placed in if(!HCI_QUIRK_NON_PERSISTENT_SETUP), 
> since HCI_QUIRK_NON_PERSISTENT_SETUP is related to BT_EN, it can be 
> used to determine if BT_EN exists in the DTS.

What I'm saying is that you should put this information in the
commit message

> 
>>>
>>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>>> ---
>>>  drivers/bluetooth/hci_qca.c | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>>> index 4e56782b0..791f8d472 100644
>>> --- a/drivers/bluetooth/hci_qca.c
>>> +++ b/drivers/bluetooth/hci_qca.c
>>> @@ -1653,6 +1653,18 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>>>  		skb_queue_purge(&qca->rx_memdump_q);
>>>  	}
>>>  
>>> +	/* If the SoC always enables the bt_en pin via hardware and the driver
>>> +	 * cannot control the bt_en pin of the SoC chip, then during SSR,
>>
>> What is the "SoC" here? Bluetooth chip? MSM?
> 
> yes, Bluetooth chip on qcs9075-evk platform
> 
>>
>> What does "enabling the pin via hardware" refer to? Do we ever expect
>> that a proper platform description skips the bt_en pin?
>>
>> Also:
>>
>> /*
>>  * If the..
>>
> 
> Sorry, I’m not quite sure I follow—could you clarify what you meant?
> Here is my understanding.

The comment style.

> 
> Enabling pins through hardware refers to "the pin is  pulled up by hardware".
> qcs9075-evk platform use the m.2 connective card, the bt_en always pull up.

This is not conclusive either. Does the firmware of the bluetooth chip
configure the pin, or is the reset pin connected to an always-on PCIe
supply or similar?

> 
> 
>>> +	 * the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.

At a glance, they're only cleared in qca_setup(), regardless of their state

>>> +	 * This leads to a reset command timeout failure.
>>> +	 * Also, add msleep delay to wait for controller to complete SSR.
>>
>> Googling "bluetooth SSR" yields nothing, so it's fair for me to ask
>> you to explain that acronym.. it's used a number of times across the
>> driver, so perhaps a comment somewhere at the top in a separate commit
>> would be good as well. I'm guessing "subsystem reset"?
> 
> Just to clarify, SSR is short for Subsystem Restart

Please write it down somewhere

Konrad

