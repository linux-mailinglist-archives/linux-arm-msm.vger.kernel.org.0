Return-Path: <linux-arm-msm+bounces-76005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 557A0BBD4CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 10:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C127534980F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 08:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6D625A633;
	Mon,  6 Oct 2025 08:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8hZO2eW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B15A2472B9
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 08:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759737932; cv=none; b=Y1uF0/2yiHxz3qDa4VCbA6A6rgJeYmC0gzADUKfEkAgJfUKd3A3Tz18pZZhDP0/K0XQWfLVm14t8j0ZXhcC8IT6R0//iPY6y5INKfz5ZxCstDk14zFnOovk/NtIwFr2C6vJTX9DIhuUtpR0xruKMlkLIFhfKzetLtC5zUHpb09A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759737932; c=relaxed/simple;
	bh=QA5XuDVb2r3T1rUhSUw2wU4hB4uJTsCr6nvMKYFQzzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yfc5aKYKFrY5sJ3i1G1dqJ0Ebzgz7tD/0t/rkjd4kyGJKPFnl0yQYFrJ7Uh1DUDRAWytXerP4yTtiADCX4Iln0Dva5b+3tasR4FOVKKPlwdd8NHw2O0RErmA01Fe9oCIdFn9YYMeI1nJpgsV0DiQNDhGYYYMPE9DkV6XI9hOycg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8hZO2eW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NPJo6018867
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 08:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHQSGZR9GO7rC/pjCE3xxsdC8DURJ2+fIVFYs/vXeMQ=; b=S8hZO2eWAYjlF7yS
	9sM+q5XzvCTMir+y2JSYydRu8Pb/Mus6Bnp9KV8wLl4RB20m203amqSyyA/7OsPH
	X0BJTb8ZIPcWzK7u/Ro/UX6ABEGJTk0YCa0vh1DGIN9Pi8F5dr7DWCIwjiFHxxqx
	PvTB7DwfR3isd9RAXoEcAT/UM1OYzq6lPrd3q+PAuTwZfiYyIZzlcYlbKM3W1hUD
	pHQhZIAPDQGkXggZM60q0a1Yr4efU0Ppev8cYpI+7O7yNqK6P2o2O3n+cc3THgI6
	uHdYMZHkPe6s53hXHcCRQ0HgMl3bPln5OLWRHHIaEo3lEccgYgJy9m/2l8TSR6Nf
	ujuz7Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49k6bfje3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 08:05:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8572f379832so116836785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 01:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759737928; x=1760342728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YHQSGZR9GO7rC/pjCE3xxsdC8DURJ2+fIVFYs/vXeMQ=;
        b=Nya00abqhwYAd0bOWhe8rFy0QQAOTrcPGUbWJnu5mDeJeUmUvEka+MJPWHMFgH1mL0
         +UTV5+5/p0X1PCRs1wC7hANZEWI0T+c/TLklrp0ty/Mci/aJKZCv8ZZ9MYet4xl8kHzK
         72/WU7GqSgPb0Lr7xrql9W9HUYRjBwEL3FTeT9I1YiIPUS3XWG1h8b9uTUMP/MPGac/O
         Q3UyiLa5KWFqL+iiq/pgKofeLYBsjfh0iWuJIxRPmaDuxIer2vFaq48W5RqQIDVQND81
         AL83f1A70CNMHEqNpOtojdvBUWsCObQAWF+U1zhtkJSInS04/piAXKl1b+0tVlA55eWH
         tfPQ==
X-Forwarded-Encrypted: i=1; AJvYcCULC+QX0n6VXYl7Tid9jJ1zvapNmeT5VGtN1/nnbftFDcQyIYA3JTr53UP7k+CqDF+oWsQxPmDE1ziLeKah@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+8gKP/JlHaxO+h+LFbZxqt30tCfgtK+ghTBISyi7AdcX09hEk
	AWhGHkl6AApwC0P5FqiVt3i3k1wcH0UjxAtDXeQQws8zojtDf5xEMD/jqOpNTNq8f/aJ4oD94PU
	6ZwuhXeUFEpbu8lIWYG1YJCi9RxjHrEXekO5b5/vZDZb01pZ+RRYMXdGVWjABxxxILdYJ
X-Gm-Gg: ASbGnctAQwiAeYYQ1ZCnnh1CS+PGFp9YjRl7fOJAPvJ9N+Ac7QsD69z3dXk/08tjy1H
	zidM3zIbp+LE5wmxsAzyLYAFqct13ZnSyzHBi5uOvYlyFDEnMgpStqXrv1znSnXxuPCbNcoSMy7
	Av2AFBVVtsg9JVHrFjdvF8AKkR7KRjhVAoEHzj3s8uqxUo43Vd5zgtekcB5mU0COfBR/9KCQmPb
	tWqb/kZ0V56r3U9U5TpzefqoDmb00tTiwjvLzP4YVd2WjjOqUtFqfU/8z19Fl3R2DgOKDPfwNSN
	DG8XpbXHggduRx/fOKDGC3p3mtLBulu+RhQ5K0QAxHexrZY97LdUcvDGWcr45pI3rKoyEneqQSh
	E8nWPw/snieJ+X754/cQB33J9GTs=
X-Received: by 2002:a05:620a:1a1a:b0:864:1d18:499b with SMTP id af79cd13be357-87a36779e3emr986276085a.5.1759737928234;
        Mon, 06 Oct 2025 01:05:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiHABiaY7kNoovBaU7TywNPovpCiqTpnopBNDWVEUf2OLmzGt7ShaBnEXJHsNVZXcDkLZ+FA==
X-Received: by 2002:a05:620a:1a1a:b0:864:1d18:499b with SMTP id af79cd13be357-87a36779e3emr986274285a.5.1759737927723;
        Mon, 06 Oct 2025 01:05:27 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b2ffsm1099083366b.47.2025.10.06.01.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 01:05:27 -0700 (PDT)
Message-ID: <b85df7d5-01a1-490b-b223-e968a862e9de@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 10:05:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm630: fix gpu_speed_bin size
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251006-sdm630-fix-gpu-v1-1-44d69bdea59a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251006-sdm630-fix-gpu-v1-1-44d69bdea59a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uDiQsfFRvqnMx-uSFnejEZSU8c8xL4V3
X-Proofpoint-ORIG-GUID: uDiQsfFRvqnMx-uSFnejEZSU8c8xL4V3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDEzNSBTYWx0ZWRfX/JC/x0EDlf4X
 jpDafCf+Ue7ugG/RQsJZGJVOEbn2Vyr/BYg219jFQyvdrUMWYzpBvF3LnlzzpVC4fomf7Fd7tLF
 quj2cZajntb8fwcBtd8Gw3Xp08rdsX5TkImTwJLD0t/VAREdf5383ogjyz5aLFuCL92YKnIbiuP
 3tgocaNpPFyLd/Zb3xsIUUqROVFmkzOmdxvx7MKVlHhHZ9yvTRE4FoJeSO47tM8Klc2SFHYzN2s
 X7kItCeLE91AX4GoZBG9NpwRd1T9IQ49y8U/oWiUa+/9ILt7MUq+WHm6Td67yH2Nj0u3+sgLDh2
 E1nDOEqU9QGU25D3PaJ2SQbX+qLj5XrZLfxFuY53sFZvOAc7lunTzUHVaOZ9qmrKj+VwEmQ619u
 8Eu4ww7Eczhh0+xclwquOG3ao/sg7w==
X-Authority-Analysis: v=2.4 cv=Hr572kTS c=1 sm=1 tr=0 ts=68e37849 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=19hG_fmFdy9UMJMDlhIA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_02,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040135

On 10/6/25 12:16 AM, Dmitry Baryshkov wrote:
> Historically sdm630.dtsi has used 1 byte length for the gpu_speed_bin
> cell, although it spans two bytes (offset 5, size 7 bits). It was being
> accepted by the kernel because before the commit 7a06ef751077 ("nvmem:
> core: fix bit offsets of more than one byte") the kernel didn't have
> length check. After this commit nvmem core rejects QFPROM on sdm630 /
> sdm660, making GPU and USB unusable on those platforms.
> 
> Set the size of the gpu_speed_bin cell to 2 bytes, fixing the parsing
> error.
> 
> Fixes: b190fb010664 ("arm64: dts: qcom: sdm630: Add sdm630 dts file")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

