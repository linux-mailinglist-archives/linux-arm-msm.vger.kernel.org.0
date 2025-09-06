Return-Path: <linux-arm-msm+bounces-72406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E84B4772F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 22:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9907C1B2651B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 20:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30918315D3A;
	Sat,  6 Sep 2025 20:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pouNVh+O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8071C1F4191
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Sep 2025 20:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757192183; cv=none; b=od7DHhVWDQyoVtG13wW2CMiLFIIWJf7GOxXT8zKVeCiLrwIUl7AAopItEibrzsX1yBax+NepUSjVAdKhAR65peVvKpVC8KqsAAsY8W4ow3nEnIC5fNHQMzEJVG1zpj8/wxAKXsd7GLaUY740K+ZQLEz1i7hJfWhpNZJhZwudQmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757192183; c=relaxed/simple;
	bh=zkHlighMIa4YKyBr9JmsyBrsqO6Nvqpv/Ln7wMiLZSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gk24NByJYvZKDkfoLSw4O6G+WjAxd0x9sGi99juAiKC/zPNBas4KGD/1756JOrmxEoKMMrg6QzEwfTPaR4niD8Lo9wj4735peJMeyiuPnJ36kUOJuqwSRygFx754RPxwKThyo18aAYSlbrrcuAeQUtL0MQFSEchhJgxaOpG25dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pouNVh+O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 586KRG4I004521
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Sep 2025 20:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KWeNW4vApSp5Fjhfu882/TynnsrQdubrSOZdGp7Z6M4=; b=pouNVh+OGEzOITO/
	C2+htmLJcDpkMljryRhFF3jCT11A6chBEAfC9wZfCWBMpTotzZxpxo8cPQS4Mutg
	ua9xM/VsgUoHsKmmgjFtDNvdzSagwf4CStdvmYUj2rKHh3yYfBiA5ks1QCwhoo8A
	/XXGcbqspmUAxyS/wfi/NDfc8ubPhbaZMRmjUWc2C/YCA57mq4DPpHGMlVeLg4Vy
	pNbOeoPM7lyzIEqMXrpwc3E/uhVo2yV7LC82Iyn3ZyTbG8+rVNUhwiKoqZaHE/QF
	9vPAod/us/XXjjhgjpfKhKixXDPD/PFBA8j7rJcWEp+j3M5QBO90shOY2fff909D
	qWI7gA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d1v96jr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Sep 2025 20:56:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4c949fc524so2493424a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Sep 2025 13:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757192179; x=1757796979;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KWeNW4vApSp5Fjhfu882/TynnsrQdubrSOZdGp7Z6M4=;
        b=Z378TJWhd8zu3N0HqO7gCk2eu9m+N45EUShrHJNif9V/hm4PLXthSojkY9DTQUgwXE
         1Slh4IM6NFMsObFPMc8VDfrUa8tyx1BBi8NbKva/327uR/gmfWsu+uoLV4IjSgCNULZ/
         60p9lbl2IexV6mVimz4f6KnHLrUDHlzoMuh05A+nvyzoMBv62JnbiPst8T82c72Jp8ZL
         YnYfjVfJ+r43u17rVOD7PDmyT5/NwWgWeZ+jK+9tX4ELNHQMsL88EJFxUay0JYLznRoO
         607pDZ6CpLYlNZpeFLaMMzysGrWVTSqEdiA0aPcwp4P8vacOyLNjQBUorrBml0ABFTN5
         m65A==
X-Forwarded-Encrypted: i=1; AJvYcCVr4GfQMR+crw8AKX/eLCGJ+gunXIcWYhODom5DWu4khftVoqeUfRcX5hVTpnLVnj4CnaLKkqtV7I2ksQ7F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw61Yr1iuMVz836eguPwtQAtBjZG/mgmymxN4BtQaLHXBtLmzuV
	CDiFd8ctD2s0hzaY2qyfKcCQ2KtRxyjckkgceir3ZZPcyuG6x4md6/R9xWd6r1Tk8gf3ACveZh+
	0PlNiakGL6ajaKu5aJVyChJe3wWjj0o2gNr4tImjPBvQqFXd0riNVo/4Soq5Nbkawp2Jf
X-Gm-Gg: ASbGncuMsPVrPjJCjqX4mgXPE8dA0B4pY+sN246kR5JM43qV+qK8HRAMKB5TbPVYRRJ
	wI1KQbT70aLpiqXcsRueNuxMs01MM7x4M9th1eTStOdvQxB3hqqMZql/43KkwEDQNkZZAyTDxat
	i7mIaCJB6S2H6lrg8e6lEl1gKoVM9/5AwrUzaue9zgNoiHPocxQL1xcl7ouH+4F6OVQmmHh0GpQ
	GzlNIHBKNHtTDtHJk4IUB9n/WDVXL6dQUf/pesvDByR/pe1FUPTU3wS0oxW5/R604EAYbcK6BE7
	IIpT5hjL4eMT2s8BECvLGxE6z7FN3L48rvhFTlrhRolRCT/MMhhRrwVbQLhR/FjE
X-Received: by 2002:a05:6a20:734c:b0:24a:69c5:e9d9 with SMTP id adf61e73a8af0-2534557a858mr4403383637.39.1757192179025;
        Sat, 06 Sep 2025 13:56:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSFjvOo/qTGxHXp3wiVQKj7HoGwmGtWzfJpDenuCSbN2DKNJDPXY8f/qc5OOKz5fQQXodCEg==
X-Received: by 2002:a05:6a20:734c:b0:24a:69c5:e9d9 with SMTP id adf61e73a8af0-2534557a858mr4403357637.39.1757192178483;
        Sat, 06 Sep 2025 13:56:18 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.231.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7727822817asm12558174b3a.98.2025.09.06.13.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 13:56:18 -0700 (PDT)
Message-ID: <14b5db9f-8b31-4baa-a03d-12112425fbbe@oss.qualcomm.com>
Date: Sun, 7 Sep 2025 02:26:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
 <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com>
 <exkrgx6rdotfrrsnklsd7zk4ydehsk5vaoevibpqisyq2dwbd4@sa4kgnuexlna>
 <f169be5a-faa5-4824-861e-27bd2083b9cf@oss.qualcomm.com>
 <t5pxum74q3fwf6wgcbaeaginjvtjfn357pkfswvafsggtmvxfv@jl5qjfhpmmow>
 <c3de911c-e80a-429d-8a5c-c693546d4abf@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c3de911c-e80a-429d-8a5c-c693546d4abf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cLimJhbWeOgs2PaXxNjboqm8qlN-Ye7D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNyBTYWx0ZWRfXwtJCImmj2Lwr
 8JS2by4TUcqZp6BprwsR0aEWJYdz4EBwJaJ1acnclHQkqBe2bwOXug82I4olrfDi5iPkbug8BO+
 NsjbeFXVmgcUAKEJzhMGftPYxVy81rlABAekTtPmsAPNOz95AAc9oq22wsmoBfwdEZ4CW89sFIL
 TB+Qdjpr3B79Q2pXGrH+cs8bR080gYV06A0EuSRC4DbAL3fu4K6MzPL9cJ561h1xR8c9C/bFcLx
 +n3eQqQhtU6TM1n3Aa/mjlnGsrdThwFmsUoEo0Ws9dWErxRA1a9SnywOkUHU4oF7JY+axUa+x2L
 7mTi1E3uShQhbHrKtGpGSQw8aCA7kRQ1k+y7Rze2zq2kd7S3C0PyAlNQjn0hfJ8+qWFHntoLxzf
 vAg3MT/y
X-Authority-Analysis: v=2.4 cv=cYXSrmDM c=1 sm=1 tr=0 ts=68bc9ff4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=LaKoERy2ZarllCCVqnwusw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=fXDYdZQTyQKxOPRIeewA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cLimJhbWeOgs2PaXxNjboqm8qlN-Ye7D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_07,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060027

On 9/3/2025 8:44 PM, Konrad Dybcio wrote:
> On 9/3/25 4:00 PM, Dmitry Baryshkov wrote:
>> On Wed, Sep 03, 2025 at 03:36:34PM +0200, Konrad Dybcio wrote:
>>> On 9/3/25 2:39 PM, Dmitry Baryshkov wrote:
>>>> On Wed, Sep 03, 2025 at 02:26:30PM +0200, Konrad Dybcio wrote:
>>>>> On 8/21/25 8:55 PM, Akhil P Oommen wrote:
>>>>>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>>>>
>>>>>> Add gpu and gmu nodes for sa8775p chipset. As of now all
>>>>>> SKUs have the same GPU fmax, so there is no requirement of
>>>>>> speed bin support.
>>>>>>
>>>>>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 +++++++++++++++++++++++++++++++++++
>>>>>>  1 file changed, 116 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>>> index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db9230105ad93ac22287850b6b007c 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>>> @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
>>>>>>  			#mbox-cells = <2>;
>>>>>>  		};
>>>>>>  
>>>>>> +		qfprom: efuse@784000 {
>>>>>> +			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
>>>>>> +			reg = <0x0 0x00784000 0x0 0x2410>;
>>>>>
>>>>> len = 0x3000
>>>>>
>>>>> [...]
>>>>>
>>>>>> +		gmu: gmu@3d6a000 {
>>>>>> +			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
>>>>>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
>>>>>
>>>>> This bleeds into GPU_CC, len should be 0x26000
>>>>
>>>> gpucc is in the middle of GMU, see other platforms.
>>>
>>> This is not the case here
>>
>> Why? I think GPU CC is a part of the GMU by design: GMU accesses GPU CC
>> registers directly from the firmware.
> 
> Correct, however this is only a similarly sounding argument - the DT
> describes the hardware from the main Arm cluster POV. The GMU Cortex-M
> core has its own address map etc.

We have been keeping GPUCC region in the GMU's reg range in all chipsets
for the purpose of coredump.

Can we leave this as is until we have a mechanism to dump these into gpu
coredump (via gpucc driver??)? I recall you proposed something similar
sometime back.

-Akhil

> 
> Konrad


