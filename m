Return-Path: <linux-arm-msm+bounces-84869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89649CB1F1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 06:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25792303BE26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 05:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0E9261B9C;
	Wed, 10 Dec 2025 05:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="daS5lex7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f5tJvu1k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D430A23D7C2
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 05:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765343649; cv=none; b=si86l3zExr26vZLvtGgFQF4K2QiP0kkNdZdE18HI/oZkk1CfoHQzeskOj3YCp7cyiTMTiPdAgXDazW+KFVwSedrpQufnBK2K3shmtknpuuMBcSo0kpE+AAbFqk6foC2+7Hfn7NvWxaPrzc/0ig6knh7ynFjKQQm13osNRbulb/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765343649; c=relaxed/simple;
	bh=m8/5Q9oj6QKjaJr6myeDzfCdrnili52mlNx46FQEDs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=niqiAZzrFT4pz2qp1Wuojgw0EMLUbr5A6qYePHgrqzSuplb8/ch2p7wi7LHJgoSZyi3QoDZpCnGytcAqnSykNs8brWcWRnILTv+d69ocH9TWeSZAnzJ9fqJTY9b5cT1t0J/1njApFOmbrQd+TRU3a3YLc/dEfhjj+2DV2HX5NCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=daS5lex7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f5tJvu1k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA3LfXT879218
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 05:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HDmAzDw/NTzSeLdl5cqVPBOU+h83cMXzhf/1QBYfTgw=; b=daS5lex78x0DSkQi
	AlQv7bavsmzadNoLPvHlLjhFlRTIePrJ5kaaFCdWXW3iZiFA0hD+FeYloe+1vMSy
	uADlhDTav5LSmzDS+8pdHQHgkdm2AOwBKmfBDpk85u6gectdhCBqBbAGr3QeS5EM
	+McHzorp3mtvU0OFfwajvf8X4kSZRigm9UfQ3fdmZUy3oRqstAlNRpdlOUrpAr6G
	2rRC1yxYHLCEoXjjvF3mX6w57VvaykY+RmmZvuvpw+g1PXyxBZn2SQXKRdYpE8wR
	nv0jG+oHl28an3gIscIKF0RfFWIvp/Z2HnAXv4Tiam+OHd2NYEyfp+5rjZHhBmZB
	gorHzA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp4vthd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 05:14:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b9c91b814cso16465054b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 21:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765343646; x=1765948446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HDmAzDw/NTzSeLdl5cqVPBOU+h83cMXzhf/1QBYfTgw=;
        b=f5tJvu1kwUH0Cxd/cQ3/voMcz/AR8tTzNKMq3jejBjtgqWiMYDUvE8NUrwvJ/BAaT1
         8fShrQt1z1yvqzK8BUAEmxvNEQgwkgRFAe72mkzNt/qI8ApAciOlvJQGe7PJdHpIt7lY
         15MvWWwAGET0akEyR60rCBldkzdc9gzRQSG/Mnv3foNvhPUER/qM8Out9UxLxpmapegI
         QyFBi5E00YaYUF52J6l+jg5MDBsCxcp7PuRyWE4X67CdsgtkRFLaQR7Zcv93U3STIzgD
         PUyF+XS3WXy2GbY6sNy055hP3+nNHfGH5rABBnvvGZLGmAQQWeLoNrcq5aT30vz4xMa3
         N8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765343646; x=1765948446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDmAzDw/NTzSeLdl5cqVPBOU+h83cMXzhf/1QBYfTgw=;
        b=Hv9aLZdVQ825WZ/e2ByXWZumIkYG3BedM3xsRIvjuKxhUxmMFDgUFGCLvQDm1eBO5h
         X/6j7rbsfssQmVpCqIMpk9hQ7b00q7BTJ6cS1Zy4YYbL0JIT85nQ+1fsrqjNLOVPNlba
         6kEsn7tc2o8B5dsS7KUGjLjAPrkmrfWLT8wgeazrphe9kCk/YvrNrT9UIY0AWAmU9fZj
         t0hHFzusrBK7BnHI/PWmw/nzoy4AwF1NNjbgdu9TIrRUHScrytZz+PhiyxjBi3IZY9NN
         kNiq3dq0G/3SFvQHrSdSrWCpEiLX+Xn75w985eb7QMqX/PJhdIvL65yjBX3/LzbWlh6d
         7vAw==
X-Forwarded-Encrypted: i=1; AJvYcCXxZwNLF7A3pjgeZvWXQUrU4ZMKOuqPkDlmGfGbDVryx5Vd+eXio6DIbOgFbadxDOKS+MOr772167VcXEf/@vger.kernel.org
X-Gm-Message-State: AOJu0Yztm51Rq5CK+r0abjJla3bwk7cSWWDurwj2tytDX9ja3YE0w4ie
	kZ0xoMULlz6Klo9Wp4RRCuUAIvbzQXeyAtbDjcQrNkbkE0M6RivzDXRevUt/8eRafbcgJgBjtFr
	PX12HJAG9sse1c6sS8xWkKHyJzLRA1b8w9mqGdVCqrKrUM6ogEG+dcy4f7KPo33VtZEuY
X-Gm-Gg: ASbGncuu/Pp/dkYk91qaivuBNfknmiX0xHNLwUGlakHNGSJPC9qiFP3sW5JTdNBiOzF
	kFGmRxEQ+g8Y40+qECzl2F8wk1pNdfkzXTbE/TlFYchZbf2oGOlUBWsr8nt37TXzor8A3RmC+WS
	Bbj5mtIUNYe6AA+K4OyBnDiMjIeZ7roaXYOcohsxbN/EykyYgBxdEn5cyqKAMsxd9xOzRF96l3V
	MUAfujVTt6umsXilC0gCl4I1WOCly7BmKYvNMg6QzuDOMhStcVo0lHr1NpesB8n6HzrswHnztkm
	i/xgtT1aFFaz66eV+hBLFspDDMF/dRKSKgND8XuTqLce1jNZFDX1Wmtfkdo7wdOJ3Kufv9Ps68K
	hQpS4K9blT/jql6lytNnLkSAX99j1OcI3rUNHzkk=
X-Received: by 2002:a05:6a20:72aa:b0:342:d58b:5617 with SMTP id adf61e73a8af0-366e2eb7cf7mr1142774637.60.1765343646326;
        Tue, 09 Dec 2025 21:14:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESM+rglN05tsWYnDaLNLQd07cRZWkYXxjSC7huoB8xpIG8ftfeblN8gYxyf1dgn0Xg3wo+wQ==
X-Received: by 2002:a05:6a20:72aa:b0:342:d58b:5617 with SMTP id adf61e73a8af0-366e2eb7cf7mr1142753637.60.1765343645894;
        Tue, 09 Dec 2025 21:14:05 -0800 (PST)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f01csm167844105ad.48.2025.12.09.21.14.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 21:14:04 -0800 (PST)
Message-ID: <f41c3d9e-2597-4c33-96c1-0eeba41dc803@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 10:43:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: x1e80100: Add crypto engine
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>,
        Stephan Gerhold
 <stephan.gerhold@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Neeraj Soni <quic_neersoni@quicinc.com>
References: <20251208-crypto_dt_node_x1e80100-v4-1-f5d03bb2c501@oss.qualcomm.com>
 <2cf32f08-99e9-48c2-ad0f-2e579d50f7a9@oss.qualcomm.com>
 <e51d4fd8-80bf-4774-ba93-66d9a6761654@oss.qualcomm.com>
 <vvbtsf4qw7c7ymshxjdxlprtw3s3fctldvpw6zw4h5ny43wmju@ln7ecfh7y34j>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <vvbtsf4qw7c7ymshxjdxlprtw3s3fctldvpw6zw4h5ny43wmju@ln7ecfh7y34j>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HS1CfdoEJQPYcHigXDmsFSs0_mHGYpCS
X-Proofpoint-ORIG-GUID: HS1CfdoEJQPYcHigXDmsFSs0_mHGYpCS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA0MiBTYWx0ZWRfX7Ff9xNFGhIJD
 g0l1z2Lje70/M5Fg4wOfE5UGnJIfzNRvD0E7lvU00sAEuOWhNlvvxPKlPuMdseLa5ezaK643AXf
 jqTwEeR5SsjwMZnJ3FTiSSDD/ySX03GU3/s0pFgtNJtVodRRx9cirJMMUggKd67qQwzkK84tVVr
 xzgJA9hxP6KrysGdANWapwojqjulFLnZKIWm5ThASk0i0linZ8eSH6iJ+qzT961MWMgf6moIjLK
 HP9kJ+Dw31TQutdt0PJ6viOUU6PQtU/03ruDqzrHp7TfqMHLU6B4PTTCRs+u9YgSmNMlqeDrSxg
 9zsm1XeImC4p4CuhwZ36cNqd3YXV9fzNb15tX+HWp8PwBn2bha+lClbOm0hqN7X5Q75edxtG3Ph
 7Vcn9rNpR34fJ0rsrxJFPGwsYZKo9A==
X-Authority-Analysis: v=2.4 cv=IoYTsb/g c=1 sm=1 tr=0 ts=6939019f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Sq2XzeuoxLYqJEPbuLIA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100042



On 12/9/2025 1:09 PM, Dmitry Baryshkov wrote:
> On Tue, Dec 09, 2025 at 12:57:29PM +0530, Harshal Dev wrote:
>> Hi,
>>
>> On 12/8/2025 9:26 PM, Konrad Dybcio wrote:
>>> On 12/8/25 1:32 PM, Harshal Dev wrote:
>>>> On X Elite, there is a crypto engine IP block similar to ones found on
>>>> SM8x50 platforms.
>>>>
>>>> Describe the crypto engine and its BAM.
>>>>
>>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>>> ---
>>>> The dt-binding schema update for the x1e80100 compatible is here
>>>> (already merged):
>>>>     
>>>> https://lore.kernel.org/all/20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org/
>>>> ---
>>>
>>>
>>>> +		cryptobam: dma-controller@1dc4000 {
>>>> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
>>>> +			reg = <0x0 0x01dc4000 0x0 0x28000>;
>>>> +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
>>>> +			#dma-cells = <1>;
>>>> +			iommus = <&apps_smmu 0x480 0x0>,
>>>> +				 <&apps_smmu 0x481 0x0>;
>>>> +			qcom,ee = <0>;
>>>> +			qcom,controlled-remotely;
>>>> +			num-channels = <20>;
>>>> +			qcom,num-ees = <4>;
>>>> +		};
>>>> +
>>>> +		crypto: crypto@1dfa000 {
>>>> +			compatible = "qcom,x1e80100-qce", "qcom,sm8150-qce", "qcom,qce";
>>>> +			reg = <0x0 0x01dfa000 0x0 0x6000>;
>>>> +			dmas = <&cryptobam 4>, <&cryptobam 5>;
>>>> +			dma-names = "rx",
>>>> +				    "tx";
>>>> +			iommus = <&apps_smmu 0x480 0x0>,
>>>> +				 <&apps_smmu 0x481 0x0>;
>>>> +			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
>>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>>> +			interconnect-names = "memory";
>>>> +		};
>>>> +
>>>>  		cnoc_main: interconnect@1500000 {
>>>
>>> Right as I hit enter for the rb message, I noticed the nodes you're
>>> adding are not sorted - please sort them wrt the unit address (@foo)
>>> and retain my tag then
>>>
>>
>> Not sure if I understand you Konrad.. I believe the nodes are already sorted
>> since address (crypto) @1dfa000 > address (cryptobam) @1dc4000? Do let me know what
>> I'm missing.
> 
> 0x01dfa000 > 0x1500000, so no, your nodes are not properly sorted.
> 

Thank you for spotting this folks. I realize that the sorting was correct in v1 of the patch
from Abel. I will revert back to that.

Thanks!
Harshal

>>
>> Thanks,
>> Harshal
>>  
>>> Konrad
>>
> 


