Return-Path: <linux-arm-msm+bounces-88769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2689BD187E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 12:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7EE49300788F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 11:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECDC38946E;
	Tue, 13 Jan 2026 11:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Czavlnb7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JEPiDRyX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61E636BCDB
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 11:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303790; cv=none; b=fdZ72Pq3FwrTEd43KwJDLhGxn+XfugIzpC/xP664ql/CVgMEasZ90WZ9hsoqzXuPhvrTIX/LLFzLvyOyciWGCfRxNrMFWB7iNil0nb+pEYX4ldxPBTOf2ftLI37zRtuA3SmfH141fxyBlcN7ZtQubPzOepC/KPhI3SEM2IkOMN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303790; c=relaxed/simple;
	bh=Qq/N+o4nLV/SHQyIdoEjTgJx2bvxNx51OhBHoFXWwrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oA9B3+aZcRdBcCZ88Bg1GDKJ1HEyw6VGn+O5uPoySEZ8e6r20lz0Rqn+pNVNiPuy9CfNCjG/XRrxNBeJgOVUw5sZFw6mjHrjLR3rZF/KEcaqdxdgNZsD5b2WEXEwy0B3FgA2p0QbXS1eSEfvOuMX/+vyRwyhzPdwQ4gNXLY2FWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Czavlnb7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JEPiDRyX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D74Qq2176963
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 11:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pv6sRN0RquiZ+JSbepqsZ52JkUQDgR3HACjDvriGVzI=; b=Czavlnb7J+PlfM0S
	WtjF/7cI+rJpdgoi/La+tzJHP29XWQ3KDP5wlFaztAeZz+6XutjOUgnGvMUUy/NH
	xME/4wWWgwVYp4Fs9Mj0dGZhxbE7h/aE9O4fzmXo2t4UdjdF9rRTSQVtUFZH8fMd
	Ztp+HiTeUI5Xn4raETgCkHsZ4LpKDJKtA212Ze1eu8dSjGX+j3ocu5JMm5V8rAZ5
	/Rmj4y9Ib6d+6l3O9fUNMAfGk/0GRRTbpNJlxHp8hJsxCu2BmTPw2VthKxqnD7cc
	a4HXMbvb1jvUY+CJ0WPDGmhXxbyJnrjolIkPiqEcZ0DmkbbsUangjhCaar9DJAH2
	Y8dyeA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn52f31mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 11:29:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ffb8ac2cebso14363661cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 03:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768303787; x=1768908587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pv6sRN0RquiZ+JSbepqsZ52JkUQDgR3HACjDvriGVzI=;
        b=JEPiDRyXtptKoPKTupJ6O/u1xT5wf5wfJ3nnDWzd3Ma4C9smGziBSjUlxfMU6nuYXI
         3YB90/jDU19IwOgpL/oIbjnA/odvBO7/ePoczpkSLMRaoZzuiEiIDYuqLkm7GxYDJMzo
         Er9KfZVy3mFlTKGx4T46hn+wvEYKiYCiMVcQ3DEpJELX+YBavl3xuH94EtZTayLg3XBP
         srPDkbNYYiyGd3+Cdhxd91LAhvApQSl01l+oh1scJRLLQqJt2Ha6m3HZq54JIMYKxoHS
         Ci258FO30pndj0xf+cl3+eIfgxrmttXmTE27D/yTtB0X7cPU9MSZreO1P5aRRO1XV8T/
         WYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768303787; x=1768908587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pv6sRN0RquiZ+JSbepqsZ52JkUQDgR3HACjDvriGVzI=;
        b=aRoP0RsVYaUvi1P6Z0MGP83EABK1Ia8Q2Nof9vi6aVGX+5hB/YX6JbqPgRlO0keULD
         dfleYeK47OawBeuHx8aqodgwgqVhlEfn1vcJdUra8Fr3wIw7gztkhagTUSwEIqSfZnOQ
         awk0XbkBGmgyCdfr/0/9/7wEY+fL4SE0wfNknELydx9TlSKVV4EVJp6tCkAK+rnzKBrX
         Y4yAszGyiDMN9q8m70AW/FG8TGcgs8lLIEfoEwT25wp9bWj0zJaI72camyb02G7AoBwY
         L+bzGfskhicvJ28MAQUzGgv/ivX70RKRhoA2befhfKYH9tj0MWMg73rgU7Z3CeC+nJ0/
         y/AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNsfRVspMfr+ptnPGBsuE0Q8hm0mHEAXCFLYFIpQ0v/dyvUokvduv8aE2vDv3btlKmKtcvrPBtzzZWT5GK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2bqWAIQthEaQACE95us2o58lKN91avfGosuZYF+TnbbF4E/w6
	pvw563iV+ZzqT418fYVlnT4fbeKYGGG3dScyYBpBFFQJHLSx6IThJp7BhgPGkchcXQsM6lTEs/T
	5r/wrxoVHcaFxRT9NyN66TYcuy3qbH8+97fCRyjJRNDRHvCTVjvttDXoS597l6EyoQuCL
X-Gm-Gg: AY/fxX797SQa00tYrwdrGwQNAgUMuUaAkbf8rtwjUmUfsi2Se4c4yXasweDZMr3MBoR
	FON+sAR/QDHD2mDE0U3sjYu8ynMHPLF4h0Sx9rIHCke3ar95I8rJqWTxSz3YwKWKDRbPgmhO+9h
	eBvKUnG0w5nCAoXyxuExXB3QamAD9mhvSqzD9ooIF+G1MhMEqFPNQ4YBv1dcJXS23kOuK/xohGT
	Sb5Keg9L//8zevKFLuB6P5yIXITwfNbSN6C9dIFQ5cvjigOSqEU7oujCUqP8S0pQRKFdnmzGo5H
	QPlp63dreYoSHHiermM78veQXcubmwOUbFt8edJLI4JGPq+91zu+y3jDmPRJLptidMhOZD8KxHr
	vK2nkLS0I0ZCPMjRz3D59O02tdefZ6C/Yt3ZSQ6Ge1OB8RuY4gzWvtnv4hGCb196eqHc=
X-Received: by 2002:a05:622a:4cd:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ffb4a8df70mr231718091cf.11.1768303787195;
        Tue, 13 Jan 2026 03:29:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwdVEflx7OpPTCKX3BRJ3HQbYZfg28s3T8WyQHLH5htbkHGEaDVYjrBZKs5MOT9x8w/venow==
X-Received: by 2002:a05:622a:4cd:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ffb4a8df70mr231717941cf.11.1768303786758;
        Tue, 13 Jan 2026 03:29:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a27c0casm2188447666b.19.2026.01.13.03.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 03:29:46 -0800 (PST)
Message-ID: <7050d5e6-ddcc-4ccf-99b6-0888318c5d7f@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:29:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Add PURWA-IOT-SOM platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        YijieYang <yijie.yang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com>
 <20260113102822.590677-3-yijie.yang@oss.qualcomm.com>
 <nfhjbfqflsrye7hqbtgwr5hwkwdtq5z4tbvnta7lk7p7jtvhl4@zbttn6coc7br>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <nfhjbfqflsrye7hqbtgwr5hwkwdtq5z4tbvnta7lk7p7jtvhl4@zbttn6coc7br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA5NyBTYWx0ZWRfX1kTSkfnzTJr1
 uT0ApUk5bXI0UM40opmwC+NirNKkYlm3ryeE1E1Qa35gVSe2rDpgvdmJZJZT5soSxObNTaBBxBW
 mohOeu5YdXkMq064s3AtX5+IbBEbdQ7UsHa4dOb7lSjIbteQ5ueUUQOegbQbMqPqUWC2payAFPr
 Av2rXBYBVMFcIpeJpMqKruxr5e1MXB4HaJ6jAgPhipLDQ7kzUP4U2NgN57gwfVCBiKrgxv/1JSs
 L/G86vllpqtHZKAemYlYOd7a3+6m7jlPkvXC5R9kItKBj7ePStT2F72dBM/Kniv2K5paXLIoET0
 mVJOcOLpg19swruE2VINzYXHHZImPQddFY1Z7GXThxvwtWSH9jlmlDuEhRnFglq9QMWzd7KZZGv
 F0RDPaiV6DRw/gKR5iN7Y3a9ozKGsDFssTBPcA8nR8EQb8RWlswBiLSagQfhZ6ul+gK9YRbnC5d
 DXEdA/rLw2UdQntBQhA==
X-Authority-Analysis: v=2.4 cv=TcCbdBQh c=1 sm=1 tr=0 ts=69662cac cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=djAAhpaB5YPX027tirAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: iugkgj0fZVaKi2Kb0apAaPuWReFIZ0Jk
X-Proofpoint-ORIG-GUID: iugkgj0fZVaKi2Kb0apAaPuWReFIZ0Jk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130097

On 1/13/26 11:47 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 13, 2026 at 06:28:15PM +0800, YijieYang wrote:
>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>
>> The PURWA-IOT-SOM is a compact computing module that integrates a System
>> on Chip (SoC) — specifically the x1p42100 — along with essential
>> components optimized for IoT applications. It is designed to be mounted on
>> carrier boards, enabling the development of complete embedded systems.
>>
>> Make the following peripherals on the SOM enabled:
>> - Regulators on the SOM
>> - Reserved memory regions
>> - PCIe3, PCIe4, PCIe5, PCIe6a
>> - USB0 through USB6 and their PHYs
>> - ADSP, CDSP
>> - Graphic
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>  .../qcom/{hamoa-iot-som.dtsi => purwa-iot-som.dtsi}   | 11 +++++------
>>  1 file changed, 5 insertions(+), 6 deletions(-)
>>  copy arch/arm64/boot/dts/qcom/{hamoa-iot-som.dtsi => purwa-iot-som.dtsi} (99%)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
>> similarity index 99%
>> copy from arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
>> copy to arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
>> index b8e3e04a6fbd..fb90beb1096f 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
>> @@ -3,11 +3,14 @@
>>   * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>   */
>>  
>> -#include "hamoa.dtsi"
>> +#include "purwa.dtsi"
>>  #include "hamoa-pmics.dtsi"
>>  #include <dt-bindings/gpio/gpio.h>
>>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>  
>> +/delete-node/ &pmc8380_6;
>> +/delete-node/ &pmc8380_6_thermal;
>> +
>>  / {
>>  	reserved-memory {
>>  		linux,cma {
>> @@ -378,16 +381,12 @@ vreg_l3j_0p8: ldo3 {
>>  	};
>>  };
>>  
>> -&iris {
>> -	status = "okay";
>> -};
> 
> Why?

Purwa has a slightly different Iris hw version (8.1.2 on Hamoa, 8.1.11 on Purwa)
which I would assume is slighly weaker, plus there's probably a freqtbl change

Let's take this as-is and enable it later

+Vikash, Dikshita this seems like a really low-hanging fruit, could you take
a look at Purwa support in Iris?

Konrad

