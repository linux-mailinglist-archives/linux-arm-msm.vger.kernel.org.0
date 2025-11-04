Return-Path: <linux-arm-msm+bounces-80343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EDDC32520
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 18:25:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1463C3A53BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 17:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD485338912;
	Tue,  4 Nov 2025 17:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LbRGfxV9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c8/6Tcsz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C022D73BA
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 17:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762277114; cv=none; b=kEmxfayNsGUQ5MboRf2iGhjze3k6z/gtXFZrZ8fWdQ2jqTOP19nuqmgii/72kA1u4zWD7FnwglqxHBZK96KT9Jhe4PT+AIg6alucH//5zeSkkqPhnP3+pNoeIBJQALeCSnLMjtKLRgdDdun0ui+aJj0Gwi9oEH9kEGixiNajllk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762277114; c=relaxed/simple;
	bh=nnjUB7LL5+SU4kruAo+s/uJqZUqYb9G1b28dkS2e//8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UttsxvcyUA8glaP9IyKfA/1mGQapz+5P29tniPY3BBxF3RB2sCXHA8FHDyHGRXo2Bx3UJ9OM+xXcAmxIAvh1DkSiNpXilANrmiGmywScoV7rNEU8tPjv0Ae7iI0jZSfO+2ek72y/guvnieW38cMFc1JcnT6UJYFflA0JW0o5kzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LbRGfxV9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c8/6Tcsz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4Gg4dC2417524
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 17:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XqomMh4cXtCMhqeRVoWkhlqju9FTNhESCKlR4nUZAiE=; b=LbRGfxV9m3rOEpez
	zwqGcxrskCA4S+0x66f5+tbJp9QbP1R6m3zHNhiEhhUOJGrJ84ccRuBuur0md/5x
	fkeLSoCa7s6EALNryjMiFt8oRGSRnx40ak9aiwkQVQxJ2xtwrd/JUmfXmUlOWfXC
	HzwNWd01jgEFOwD6eVVkqzRbpT/AxwcrtV8B14qzlbjYgp3nfZ+dAG2zeGk/ZXTz
	srYI0OOUx1oua1CIHnV7gJUjhWi2CRblLoe6ANYxT/Va50gde9E6mT4/OroTrvfD
	FmlmtDv/EVJrcf79Qv5ysS00ML+gDZTD3AvZ7Lf9g78XWx55Ch54MiYSlyMhrJHU
	7QKtaA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7mbbrb6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 17:25:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed0633c433so17822061cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 09:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762277111; x=1762881911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XqomMh4cXtCMhqeRVoWkhlqju9FTNhESCKlR4nUZAiE=;
        b=c8/6Tcszz5THkRbDFlfNMcgmDxY9jCuWUZ+MgVADWY0rB7i1hxtjkDzZDq72RIC5/o
         gb+qr0hFNjELZp5TkVIFhGrOfL+ctZ4437udqDipm+H/8B/wqb3GbGADmopLGzTXPuo1
         AWSs/kGx/Lm/sNBaa5jvMvcO/uPlh4TDSTfzd9ekkDilkJpdBfTQRkKCvBlUgwWocZO6
         hi17w9dbPffodOQ20bWQC1rNB+Q6tZJ19E9zaEzPDZLMG7mjP8zi/CMvwu24pQgZZqbj
         mbVeUlWKs/gflmPw1kEoGPXIjEsSPt2taJQzN5Fy3AcJKXkdRPTeuFJmfbW+jqSCCEbH
         H2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762277111; x=1762881911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqomMh4cXtCMhqeRVoWkhlqju9FTNhESCKlR4nUZAiE=;
        b=mvl6Rn/XXxLyiaFwnYO6cabBrb9dxN8PXVIG39nAUCLpsjhjEsOU8Cd/xsbBP2V9EK
         jDTTFbiv5ek7dAkUYiJZzVmA7enUoA/yQJX6W/A8gldjv9e8XW4DJCqUkAiAvYGpHusA
         OfYaRX/dMuexx/LhwenSGH7uc6Hj8Bm3Ji9OOh5vgtB86Gzbd8ZupxrVRLA4mGdGGqrO
         8m/elPPq3hDvScaR/mXKtzmM95Mel6LZqzGSrczuLTK0jo4ExZEnNO12Rgihtj2xR+7i
         mfKfy3TfbzfsNgTjYeb0eBMAsPT1W522qK7cii2Yv3DKtmqF3Vbv45p4vAtPnjQfyK09
         Zjrg==
X-Gm-Message-State: AOJu0YxLPMlxj9YOvH+gm0fJ9FuvfEyVC0vK0yhk1oGcJQ9Y/02h45jt
	GLw2W1ABMkicgaKM1pE5+gBne3Q+j3GpSWMcLNHcCLyiHJ7ETB9sKHE5je/VGq5X24VNiEao0c1
	8bdhBhH3w2I6zkmOGTzasMbnnE8r7h+zIygDftrPdnxGtqW3fAzZk5K6sYxE986uo5M5m
X-Gm-Gg: ASbGncuI3dg0NhRJcxJMchivNv/YghpPx7U16aiIQnryTQf6rcsAs6CnEak1zHjLtX5
	mYmR+QFFQRzSvaa6bnfmkZ/2ke8JdUMZIyMdzL4rvOFaImmnC979VkfRRTV/mgJ3Vuj+ZG4pnaI
	zwFU4uoaWIOV0PCXm7s782L90R5JPoNR2Aifg5dSvGxMHur69Dd30Prko9h+Rt26exZTSdTafuQ
	5xhTOHvYlLjDrWQY5PGrat5OzzNzivRUZQBnKsOHa7BWFNejKHvAMKJAbrpqo5pkigeKjbUS90x
	4BbcYcHh451B9JR8PkhkPKb99SBBg9ClX3tyaWMXpIOwZUJGUxHCucixCbtRQsUEGosVOC6dQ/v
	AQxlekx/y0bfQYdYQgS1kEmRzg0Uh0iCLfSY6uotkQVNXviB5ttA+r3Xc
X-Received: by 2002:a05:622a:50:b0:4ec:f123:230a with SMTP id d75a77b69052e-4ed725d82bdmr3092781cf.13.1762277111498;
        Tue, 04 Nov 2025 09:25:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0AZ0NEqJyAxkO9tPQooyXaYVFUIJ/Dkxa/d3F8NW2e4gkuIPHPgeyXln246n3SP6taM5GUA==
X-Received: by 2002:a05:622a:50:b0:4ec:f123:230a with SMTP id d75a77b69052e-4ed725d82bdmr3092491cf.13.1762277111059;
        Tue, 04 Nov 2025 09:25:11 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7240540d7csm257218666b.71.2025.11.04.09.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 09:25:10 -0800 (PST)
Message-ID: <8103d16f-6b03-474a-83bb-b2e8ba9b9cbf@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 18:25:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/14] firmware: qcom_scm: Rename peripheral as pas_id
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-3-7017b0adc24e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251104-kvm_rproc_v6-v6-3-7017b0adc24e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Wgglxrl5SqjfQjMUpMpR2T70zIxv-DCs
X-Proofpoint-GUID: Wgglxrl5SqjfQjMUpMpR2T70zIxv-DCs
X-Authority-Analysis: v=2.4 cv=MK1tWcZl c=1 sm=1 tr=0 ts=690a36f8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=1x7xYhVcW7TDj72elYYA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDE0NSBTYWx0ZWRfX1KT8IKuNJjH2
 /eGeU6HCqu/+KxJG+hi/ZqcR20ac2HBg1zHLaTDbGiDYNi5yUUTQZEpWxKFEG5IupkmHNswZrjo
 phRu/6KuEHCZ8OK3iNvIFQZRUqr1UoWoKYo+cYS/oDdmc9iJg0rs6fBIgYpJGeTaUZiAcuufFc6
 /hpjPEzH3OQZo6LL3ZRv5MMG89hlLVsRFLzoRW8rUTQoMeo9VFjYtNsOSe3CaZ9CxuUAvBb1B+G
 7hQRXQtytaRkBLkUfbJd2prBEPyHjevU+0O3WHbgAXXg1EJIsdqGVq/fMAFyJ6jusrLCFhz7+EZ
 yp2ANHPV992Ho8v0asZfHsEyCj3yDO40fZ4PWpC/SYOb/8TsSwMDunKQfGES20qZV+YuPEGi/Fo
 Vqie2AlKQWmfWk4d7JeJzxVm6/eD9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_02,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040145

On 11/4/25 8:35 AM, Mukesh Ojha wrote:
> Peripheral and pas_id refers to unique id for a subsystem and used only
> when peripheral authentication service from secure world is utilized.
> 
> Lets rename peripheral to pas_id to reflect closer to its meaning.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

