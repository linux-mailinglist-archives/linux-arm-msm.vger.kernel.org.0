Return-Path: <linux-arm-msm+bounces-78130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E10BF5883
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 11:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB6D318C1CAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 09:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3DC2EBDF4;
	Tue, 21 Oct 2025 09:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ezzQ1Pkw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1D52E8B73
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761039320; cv=none; b=YzQBhqx07sIzUt9YIku+1i54cXtXT8JoxCFWeEOdfQ43Lh7iggh9CTErbI0E7Bd8rnneyNYau2AKPgM8f66sjhCTaqgQn+EX3PkD+VTQ1G3PLF0tJ8/kpS1o1DUboxNYQyU8JVBCYWVUzVf7CkzdiW4tJS0BMk5EOpLUGEuL7Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761039320; c=relaxed/simple;
	bh=AaJ8fp8tD3uibzHr7wVOW+DfGy3v96VNlL7Ey35m/Sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJ2TnoW8VQf4z4uO77AX0idQcM6ln/wTt1h0vJ4UWzDVEI9EPORbUs6HxOJAAzlbje6aDRV36IiOBiZozH4DJ4hLcAAAAWkEFklvOn0HVoWyRwSpdKvyO13FC0SEdmq2h+bqGnTQtEpk2b7WSqM6HY6dLQjidbxCvPjFz91XrEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ezzQ1Pkw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8VUNg027963
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/YvikoKhdG+EgPtj7A70Jfd6SrCl1GIf+IjJo8+hT4c=; b=ezzQ1PkwbVRr2UmK
	gBpz6BMBpkl+BNnWG8v1tVSip4TwNtoXbqQdpFAXeEfeLUtt040PqSAAdBz+kF+J
	6un4d7eX8W5CEHWjfTsnJsy++zcWgddIxb8+qyEjm0y9SOWbk+jWh2bVUQTUhZKj
	4pvm8ArfaUNdoLaajOj+Hb5uZLwi51bWWYP6hVGIFYTXKfJZzyuDkYfVk3bObrGf
	OwDjL2sYstar9Jc3ZCSe2nclovafoWmrNIzwyjdrsFN2reWuykF1qoLK7UGkfYdI
	O7eVwz/IBZBrWjGHgf1QZ9SM2IZUpSNfN7fQCiDoMpimdR3GPSSN6j8wi+SReNVh
	7atp7Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j078a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:35:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87c28cecb4cso14143446d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 02:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761039311; x=1761644111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/YvikoKhdG+EgPtj7A70Jfd6SrCl1GIf+IjJo8+hT4c=;
        b=iw0H7r3Z2O7pYe7vuJOejdpooIYb+MeU6fxL2rXrzb72JS7f7QF7GiOMwwhYTk7f2x
         jpYXVB4bHd+Te0jLAKxdu8A7EoWgbWohu+OBhGghXX8mVZDdO69Z6IflJ0sTFhOIAWVn
         MMFj2c4DdX5EW0bHe+RDg7il1GnOkCdWwni5DqZg8bqF3aZ94ikt6Joc/IbGoVQFiq5Q
         mxp5d5QbwKFOEeTCsrzeObNWdonRgpCTP6ycSfSMeyGWWul9vCJYQme7Dl4mps4gfwzV
         3EW63Nz3r1i8SljoUrKw21O9cmQOGFkdnTucqe3lIjz1CYnz60B2HwZcVRar3d5d1OBQ
         f0AQ==
X-Gm-Message-State: AOJu0YwV4NlPssS7aa0whM+4wtxwfF6cozMk13y+/ExxR0ys42pfo45U
	qvko2cBEXZLnyUgkCGCQscsIwocqT8XHLDdqZJT3An8qn1jYoFIhERb0jRdYhUdFXt6TYkeGmf4
	OIYqF7PeThI2bg957oENKYGquQxaosvRVoQVPRGIhy2aUxejxGzTzhDUPgMTc8FrviOiA
X-Gm-Gg: ASbGnctR7wl5X5FnmY1Rx/6IrpovIuCb3fRLZ/rQ48CoJGiB0q2KHdZAaVg7omEh9G1
	lLANy1KjKRTzg0yhg3ffLPirqxO+4jifUEivkjf2cHpvLkqjpBDYvw07f6bUG0wx2oncd6BMlqM
	aA/+IJDbbKp62hTYJingIGPVIa2vKJy/nlugqAHngKztLo0yKMtPuHe3s8ZSGP5WVi/wc6x5CMq
	ytUSbObFs0FJTSdL1gKDjmzqfutqTaoFn2rPOJpxqMYEP5DGYPhN3C2MmHBy0Smh4FEx91QOfr8
	pT5NGybpjhqYY6fe3jparJyyvNXvgeDy8JrhwODtDevsWBj7oQdDSdjUk1Lw2BmI0UzhYSGO+wg
	zAeVHck1eUXF/uHIG1l4krpcrB0HEnvqxepnXB8q01/+xecVolSQl3olx
X-Received: by 2002:ac8:5d91:0:b0:4b5:a0fb:59a4 with SMTP id d75a77b69052e-4ea1167d71cmr16325931cf.1.1761039311562;
        Tue, 21 Oct 2025 02:35:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD6BFi9dlOuGV6sEzxgWqB8Wo4UIpA+DWPkZXM1aQT8aB8phcyP0h2MBQrdSQJclIihwxLqA==
X-Received: by 2002:ac8:5d91:0:b0:4b5:a0fb:59a4 with SMTP id d75a77b69052e-4ea1167d71cmr16325201cf.1.1761039308426;
        Tue, 21 Oct 2025 02:35:08 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65ebc4d552sm1039408666b.80.2025.10.21.02.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 02:35:07 -0700 (PDT)
Message-ID: <344f0f72-27c5-4b88-99ee-f71065cc3a5f@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 11:35:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: smp2p: Add irqchip state support
To: Deepak Kumar Singh <quic_deesin@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Lew <chris.lew@oss.qualcomm.com>
References: <20250923-smp2p-v1-0-2c045af73dac@oss.qualcomm.com>
 <20250923-smp2p-v1-1-2c045af73dac@oss.qualcomm.com>
 <15c56c70-928a-4939-86a2-e7b81f1596a6@oss.qualcomm.com>
 <c239bce2-4bef-4085-8a74-c6d7c863febf@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c239bce2-4bef-4085-8a74-c6d7c863febf@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX9Gujx4yVDFGy
 uUWf07pMlWkoZXIkgWychYIEi9QjqPKudpOHJxh2X6TrYJPlO5yET87y2i1yZref7HTLs4UhWZY
 Gz0b0QUtwwCqG+uQPgca275OsWhxD+ZPfq4nwGhI2ND3xKYiSSAx74rLfBwYXZInuHUlLdEvj+m
 3CpJx9Vh58kCv6gsA8BzM7uDQeNkZrxSu4BZr7Eg5InxYAeDTgG8C5WeicqC/3cZuUy03SmW7KZ
 RuSfU8afkedKO0vQ/dXkvTYrxxXFI62azzySA/MBNIpkFM5Tpl6mfcm2dYcBDwie9p3/3P+1JMh
 RjwdfYd6hRPZHjUdp+tBdvTg1qhOTpi0azo6mA5Ciu35jCSqsQsM7AbIDVhcujLHtjEfHwhwoBh
 RPJaEkvoGbaP0h2/U65Ujt/kZFrjHA==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f753d6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=CnSXRHQeWs9gKxsjiQAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: rmq0y9_VE-R0LDb3LgpSmP12cb0__yyt
X-Proofpoint-ORIG-GUID: rmq0y9_VE-R0LDb3LgpSmP12cb0__yyt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

On 10/21/25 10:12 AM, Deepak Kumar Singh wrote:
> 
> 
> On 9/24/2025 8:20 PM, Konrad Dybcio wrote:
>> On 9/24/25 6:18 AM, Jingyi Wang wrote:
>>> From: Chris Lew <chris.lew@oss.qualcomm.com>
>>>
>>> A remoteproc booted during earlier boot stages such as UEFI or the
>>> bootloader, may need to be attached to without restarting the remoteproc
>>> hardware. To do this the remoteproc will need to check the ready and
>>> handover states in smp2p without an interrupt notification.
>>>
>>> Add support for the .irq_get_irqchip_state callback so remoteproc can
>>> read the current state of the fatal, ready and handover bits.
>>>
>>> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
>>> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>> ---
>>>   drivers/soc/qcom/smp2p.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 55 insertions(+)
>>>
>>> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
>>> index cb515c2340c1..e2cfd9ec8875 100644
>>> --- a/drivers/soc/qcom/smp2p.c
>>> +++ b/drivers/soc/qcom/smp2p.c
>>> @@ -222,6 +222,39 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
>>>       }
>>>   }
>>>   +static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
>>> +{
>>> +    unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
>>> +    unsigned int pid = smp2p->remote_pid;
>>> +    char buf[SMP2P_MAX_ENTRY_NAME];
>>> +    struct smp2p_smem_item *in;
>>> +    struct smp2p_entry *entry;
>>> +    size_t size;
>>> +    int i;
>>> +
>>> +    in = qcom_smem_get(pid, smem_id, &size);
>>> +    if (IS_ERR(in))
>>> +        return;
>>> +
>>> +    smp2p->in = in;
>>> +
>>> +    /* Check if version is initialized and set to v2 */
>>> +    if (in->version == 0)
>>> +        return;
>>
>> This doesn't seem to be fully in line with the comment
>>
>> Konrad
>>
> Hi Konard,
> 
> Can you please elaborate more on this?
> in->version == 0 means remote has not initialized the version yet, so no need of enumerating entries. For other case i.e in->version == 1 or 2, in entries added by early booted remote has to be enumerated.

It's not at all obvious that 0 is supposed to mean "uninitialized"

Please #define it

Konrad

