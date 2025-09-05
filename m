Return-Path: <linux-arm-msm+bounces-72279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4ACB4574F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 14:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B297A4644E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A1B34AAF7;
	Fri,  5 Sep 2025 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IGexhjM5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1EF34A323
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 12:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757074185; cv=none; b=kwgEhTUM1kspP5fSErfQE4IvInHbg3GExECaIzr8Ev9gbRoOK313Ner6LXn7IH1oJ2p1QkzHJEMzPm+nAIA9/ZGhnTMblND6G9ghOwXG8+LGvCeG0JEGPsDkrKAHpD1elPtJLPIgyTrTywdVfTO4dg1zwhhZwPGDX2EqZ1yrmvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757074185; c=relaxed/simple;
	bh=YHBkz0h0Rvf+QBxHBQvEoOTPIUgICyaTi8a6q5BhBOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWprGsmdKdefzwAhfFZTVUTqmyA4OBU3sHsUAr5vrSHy+v/A0/e01vk2o5xD1R/807ngW7SwizN9w9Iwf8k5/p1DCjr13XIBsD/w3o2zhaD45wgRxMxItTioGNuPS7G8VsRXLwJsc8ismSL0nNq4++quSdLj/bBlFUGavSNQPFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IGexhjM5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857Ll7P008288
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 12:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V7ghSLZ7heKhs650IbAjk8nclyw1JeB2lIG1BpFKJVs=; b=IGexhjM5a/NcGRFU
	RYU2LhDskGj2CGBjAOpoBE0WjJRvqGwcGd2HzwHJbT7lk/0b5e8IGJrStHqnXJJn
	Kj6KfdUhKsTXhjQPJh9XmCSMIMoA12C0IzKMBzYZOHgkqjxvCwVz+3v4U7rbH34J
	8JMl34fntONWURRhf8MNHMJamDzuyllkoZLkxqyO+VMTLasqm+ni005ReUrcXCen
	PA/V25XUuD3HXfZcgNK41y8SR611oZfu7dQfjk3L1S4e9j3gO7kypAWy7GuJI2hp
	izI+QLtxPgP1DHkK/TP3F0OKajz65ckUuGYaDNOQbTuB388QUE7FSdzwgm5G5JCV
	UX3hQw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmju0te-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 12:09:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-71be0557385so665636d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 05:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757074182; x=1757678982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V7ghSLZ7heKhs650IbAjk8nclyw1JeB2lIG1BpFKJVs=;
        b=GULRmCrriHE9e3tWTDhennwjG4QufPfAjYBxtqQAcrmI3zIn7v5b3M4EZbfo0uWr2D
         njQzfrBZDBTrfUi51b80OcWkY7+xddZr+JuXNrr1pLhC8y1oOzjOJlia8BeYXzImuVD/
         I3O53AwLR8qS9bMXBRVqabp0hRMt1eN6CVxtOG2RqoogY4+o214WLX+ybb0s+A642/px
         bqWiPWjB/A0wYHNljIz+F/70vnDJbp/eS4wpOU0smnUv4jwRQxJABbUX55IbykejX+fW
         DKg6w/6LFylffz7UwsH0QPkFRetrGvYuP/Vq8D3KydCnpj8sfyv4eB5jxewa89eylYnf
         er1A==
X-Forwarded-Encrypted: i=1; AJvYcCUjMFgTj+Re6g7hoYRBNhZUBf1HO8FCVlzJaX3RYLPEAtsvhvfoqwZRAV5xrPaol9w6095JVl3v3S7sAl0m@vger.kernel.org
X-Gm-Message-State: AOJu0YzOymCEuAfrguQvMPeksZIsL8joFFZTx2b9diqA+OU9LqZsDtx3
	rVR4f3RHxFDDkl36RpOIu5lpZgBPrMBs+e0wxXCD9GbyX7ijZT13qGHpmjYGNAY3gOmjkeCBrxS
	jqZNNL1FZDAz8dIlqOTQOEtyDm2puJorMWvzvpX8SiTff3uQFJ0jyyVEwbZxb1Jtbe2qv
X-Gm-Gg: ASbGncuFmWxj9wRiV3Cpmb3i5ftd2+cZd/hAwiWlK1YUbjjyqvlrHnZxLSV9MXuwGCX
	QNX+Ks02NSTEFf2HpabDVtZCij0l+HScR+PNE5ry/YAAhHXX9117HjmanRI1OQ2/lOxe4EvpUGn
	08w7oBNN19Vu/JlU47GmQGU0/mRNnh2J8cpXNfefrH3a+kXKkgbRpYKvfsJ4hjW4CdOjLDXTrH/
	iT0yf6e3/xm3/9LjT+via1CIEGkxeDValS/WDU1J+zlOFO2u/65VI356YA73GqlEgcL41UPumTA
	A9DIvxVZSclTFjxjIFOxMdkU/PL/IAZXeDbksy9VemHRJk0to0ans7vBiRMaKRjKm2K/bXkO2nu
	dvxtDmtL1LR2X6Lkpxcr2TA==
X-Received: by 2002:a05:622a:295:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4b5a0fb5d27mr60014721cf.2.1757074181717;
        Fri, 05 Sep 2025 05:09:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/PGqXh2InjZaarOb7O9uqOEso5Jemelf0KIpqlrqz5P8qaKxyNGfd6p3aVvjCmjCOCb3Hsw==
X-Received: by 2002:a05:622a:295:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4b5a0fb5d27mr60014111cf.2.1757074180997;
        Fri, 05 Sep 2025 05:09:40 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040a410817sm1487836266b.101.2025.09.05.05.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 05:09:40 -0700 (PDT)
Message-ID: <9694f896-e1f8-427f-bdbf-225706338b7a@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 14:09:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/14] arm64: dts: qcom: lemans-evk: Enable SDHCI for
 SD Card
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-11-8bbaac1f25e8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-11-8bbaac1f25e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68bad306 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=3hZAb_iNorm4NPqi49MA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LAzUBLxTNaJ9bq7HkdB-xWiMWu_0NPFX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX0vpH3ZhKmGJn
 dM6+2gxWQsiK6zDztaQzx74OOlSjWSMlKObAk5n+E3ek4o0d+F3P+2zCA2WgHs9VVej7tBCgGV/
 bL2s5IY5cOBYbCDaPSu8SVIlrkQPQgOn3JK7DZXH2oKQG/KVcXpcgMgNAFHvIz9I1vrhDiBR8zP
 MMY9uZ/l+DAySZH1ZjyBHvTVpBHyp77oRj9GTcroAb8SfxSWS3BmW47SHBeNDurUAN0gADxfXjI
 VUtpEdebHSPn/CyXlQ91HAo55vYr1YyNsP57IOQ0lWkzM3jSC0lEpKva4T55Z9WnB8qoGseB8Wz
 UFb9WjqagfxR/Ap2fNCu+pVtQG84gqff2HMwdWICd+9P65OaQt1jPIjii/TE1YwXk70nZ2FXLT6
 1wu0XMDO
X-Proofpoint-ORIG-GUID: LAzUBLxTNaJ9bq7HkdB-xWiMWu_0NPFX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On 9/4/25 6:39 PM, Wasim Nazir wrote:
> From: Monish Chunara <quic_mchunara@quicinc.com>
> 
> Enable the SD Host Controller Interface (SDHCI) on the lemans EVK board
> to support SD card for storage. Also add the corresponding regulators.
> 
> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

