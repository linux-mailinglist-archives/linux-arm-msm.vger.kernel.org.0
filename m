Return-Path: <linux-arm-msm+bounces-65443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D86B08B62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 12:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AB083A9D20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 10:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73ED829B77B;
	Thu, 17 Jul 2025 10:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZDJwHd6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA4B22D7B0
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 10:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749752; cv=none; b=pnqEL9h/iwXWezF/DBxgDzHBzrSLIHbpUs+CWeroNLQtux0RL5ySt5u8x6crKWjeOJidiMm46lSgNMpB3yE1sVoIG/pPT7/y8LaXslXE85qDqh9f5fnBIT7YrfPf0clDcLlUDGF79BxsQ17wjIzQinsVuDVT9k6vx6cislDkROQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749752; c=relaxed/simple;
	bh=m4bhiRaxDw14G00aNNxF0/Fk5xp4oxLL37CkgM+bSuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U5IZnhQBWl905ia1o2G7TZGNTgh0MLgpWGIRllTZY/8sE4wt2kczXU1+ADzuHvWtF8X6dw+/RYlfCRinJOGT6lF3nTrrdIWRZ90p0L8ZzXKKhUc3gMZ5hBgJ1kt0dJBQz4U3lv3O5ThVJXUHiNiKdbosx9bIKbouLBHNOS7cEMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZDJwHd6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H5hi7w022149
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 10:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EsEUvuBRDMzRKRRLJsUyfbmC1yOuPlsLU/0xN60mrqE=; b=IZDJwHd6XDcNhEnd
	3yf4+K38F3BML7mfcVVvbjH/f2Qlf0RdNFFggnIMqcGgv+5Tx0PZmXfho42t04C1
	pKsN6fTlZYmh5W077iGc97meCjX52xm4sbvx7+NN855CHSby5S6C3cW9gvHayI+Z
	YRFiQEnF8EnHazbc9mgiPOtVsjKT0rYYbVwRpSNlRztyM7kDY9kwqbSqqIlesG3O
	SN+Em2culeXThD9nnqxvOn5WH211W6FBvPA2gpI3RRHyQm6TZvSyboWXkhGEd+fp
	wjMTQulwOHt3I/Esw85vMa4xMcnyuWecMgFQosNTBD/xy+gDyhKdfxfukzSBjAZR
	oo3vHA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8f6aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 10:55:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab7406bfa1so1663221cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 03:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752749749; x=1753354549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EsEUvuBRDMzRKRRLJsUyfbmC1yOuPlsLU/0xN60mrqE=;
        b=FIRn1R2HmPveFvWSMGeEMA+BJZ/Fj37tLpFAPdAIlx3nhkT6jvIRz2uIYMwxN4MSj9
         BpJ1Zz1OEqA9WsBN9Fa0z3qnBIK7eEqHhzq4mJ4axWSWGqXzext7FKqLacnSTqcqyo86
         8Cu1JCcjEsYClrarjg621HyiRCcSWNWmb5nLuzWBgp5rcNLwVWbSwOxJUhHUTVNVwUsm
         +SyHTOE0vplsIh0tbu3YYxBJkOsoYXc7lKFiSe34WnGp/nXACNMhkS4nYVoSd2kXyjQL
         maEIrfFi5vr+OEu6lmF8zUq4zx7hmcp1eq2fs5Hs+57/nYTFk4sxyISl1pNq0T/qRNNe
         A47g==
X-Forwarded-Encrypted: i=1; AJvYcCWR0QIHjgWHfM/A2mVGwOSHbBANhXFF8IcqobL+mj4v4TH0ewarSeiQFLLG74efaMBXpJzu1dkQtYDThL8j@vger.kernel.org
X-Gm-Message-State: AOJu0YwjEEEaOaAlsGQpmI1dUVjh/vMIJp+WlQ55oZoC8i3GRWd0K34v
	TtUvzOhza9Nn/1vMqoDyyUJCnkaykbmvgQ0gkhibyt+ddIqfGsXlLFlraA4bI8FiMpAJ1zLVCBN
	2ttzW7fDN+kJb5ny08/+wKyQnwGvWI7RZ12hgCk0+PwGP38z4mrf3S43P8Gc/PiAOcVqH
X-Gm-Gg: ASbGnct5mlKEg8Q8myyAJ/2vE5CPaULWZl/C2cZL9r3LyvjpItqK11TBxlweg+H3wpu
	p4R+fAekxRWquoQlGxaW5FUdHfauF9pRuyUskWKdBBjGp82KKkgzDE7XT9H2XZPiBye+IxzWzzE
	iQY5vnNSgVipAkVHAPuiURhlCEOlNcVerdzJUipkQpEBCnO8qFpFjSQXZ5HqewHJziQyscwE9k3
	P2IrVpcl6MAED/wHYd36EJmijH5IWqByxexjia+lF5797kENhhxU7rhvMd74ViT2dzDkDejUCwy
	X3RR5uZS1tCGmvBqwJfUIG2S0wk1RrKN1ToLC18LkpRhwaE3UHXz5WsDhO41EbwGHSgpko+Q3/h
	zecb7vKICCKQPhrUhwk9d
X-Received: by 2002:ac8:7e89:0:b0:4a9:7029:ac46 with SMTP id d75a77b69052e-4ab90cb3599mr37973951cf.13.1752749748783;
        Thu, 17 Jul 2025 03:55:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIXtaAbwds9yIaxYyNO5vMi4lC/pKMkm1pehCrB0BGO1mpogQimYGvbA/xUnAXMGKXn/lD6Q==
X-Received: by 2002:ac8:7e89:0:b0:4a9:7029:ac46 with SMTP id d75a77b69052e-4ab90cb3599mr37973741cf.13.1752749748206;
        Thu, 17 Jul 2025 03:55:48 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c9733935sm10034847a12.46.2025.07.17.03.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 03:55:47 -0700 (PDT)
Message-ID: <5502b2eb-f6d1-4ece-b918-1c8561a92607@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 12:55:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Nirmal Patel <nirmal.patel@linux.intel.com>,
        Jonathan Derrick <jonathan.derrick@linux.dev>,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>,
        ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
 <20250716-ath-aspm-fix-v1-4-dd3e62c1b692@oss.qualcomm.com>
 <38ace6a3-d594-4438-a193-cf730a7b87d6@oss.qualcomm.com>
 <wyqtr3tz3k2zdf62kgtcepf3sedm7z7wacv27visl2xsrqspmq@wi4fgef2mn2m>
 <03806d02-1cfc-4db2-8b63-c1e51f5456e2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <03806d02-1cfc-4db2-8b63-c1e51f5456e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA5NiBTYWx0ZWRfX2HYD3QQIW2kw
 HmBEq73Ua8e69649pl1n82QAGz3gJ/Xt9RU2lWTZYRzEOWnXqgLmPHzq0PTJoHFhrSrxPVCqmRr
 MGxL0JVrQqVlnECeJqRrIjTvV5pfGWVla1la3vzNqz4hke/0Y0931HsTgeCaPfcWGxTn/HWgry/
 QpsurnuCAJ7mWEuGvkr8le4LBs9YHZurwsM4TkwCOFwDJSLPuA9s80OZX65DX+YzmPOSKlXS1H+
 9Hinjl2ZnhgeU+cVILzaboq1zTszSkHXpArjsQPcxcIHu+K+RfyxBA7XJb9Y+koQziQoBEPp7QY
 YbsAlaxk5RFXCqBJuecSFb0vW1gh1l0j4ltiG8ECzZJC5ewbhDj8B6s7XASjA6AxmpvhA0YlSEB
 79Ve6m8rPaXNb5AS5OCei7SASC6L0RjPbWsIDJsWjlCRteyHSdCfUGNDTzmkb4KE0LD2Jdcb
X-Proofpoint-ORIG-GUID: 5RqO5oKhva7PqybNWh-c0nC9X1itvHqm
X-Proofpoint-GUID: 5RqO5oKhva7PqybNWh-c0nC9X1itvHqm
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=6878d6b5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=a0K6PxZnllCBz7J7qkkA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170096

On 7/17/25 12:46 PM, Baochen Qiang wrote:
> 
> 
> On 7/17/2025 6:31 PM, Manivannan Sadhasivam wrote:
>> On Thu, Jul 17, 2025 at 05:24:13PM GMT, Baochen Qiang wrote:
>>

[...]

>>> In addition, frequently I can see below AER warnings:
>>>
>>> [  280.383143] aer_ratelimit: 30 callbacks suppressed
>>> [  280.383151] pcieport 0000:00:1c.0: AER: Correctable error message received from
>>> 0000:00:1c.0
>>> [  280.383177] pcieport 0000:00:1c.0: PCIe Bus Error: severity=Correctable, type=Data Link
>>> Layer, (Transmitter ID)
>>> [  280.383184] pcieport 0000:00:1c.0:   device [8086:7ab8] error status/mask=00001000/00002000
>>> [  280.383193] pcieport 0000:00:1c.0:    [12] Timeout
>>>
>>
>> I don't see any AER errors either.
> 
> My WLAN chip is attached via a PCIe-to-M.2 adapter, maybe some hardware issue? However I
> never saw them until your changes applied.

It'd be useful to know whether that's a Qualcomm platform running
an upstream-ish kernel, or some other host - we've had platform-
specific issues in the past and the necessary margining/tuning presets
were only introduced recently

Konrad

