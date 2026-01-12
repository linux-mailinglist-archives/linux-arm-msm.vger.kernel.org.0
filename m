Return-Path: <linux-arm-msm+bounces-88550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C98D124F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 12:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BFE830084F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A533E3559E5;
	Mon, 12 Jan 2026 11:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLT1KdOm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HgUXQEId"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325A93128BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768217373; cv=none; b=rI648PTIhHsJ+gXQU5KwUplDx7mA2ArUhWmV7O24iIu+9OQwIBYEecOUFi8htB4j2u40J0/m76Cfq8PWDAR2+GrvravjvmWKBBHtd6c77zKFu42OTfa1tfRN93Wt324Ad4bi6uNn6oTiNjFISYOp5rMMmAv+TcBtCFARMoJ1Bcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768217373; c=relaxed/simple;
	bh=VLK70LC18wkNjao+aGm2zjKT4RmVykaHdWPGuVEbRxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eO9JJgDQ4sjSf8MqKryKTyWWMtDixKkRMIhWN1jDQT2PR5fv6FVVqrTR330OC2ZkX4mSuKB3FGJ4i/ytlPRq3o8142dWm91cFAz+4laTI32sQwETSYUQbttiSxfOQjUJ0do3Ccj6I2ofhGSgBBqBNdRdzCv5rO2oAptAVzvCFLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NLT1KdOm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HgUXQEId; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CA6g0K1380741
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tUtpv5e/gy4OU7aN/5oKSOK0w10MtlmNCkbBwyyRAXk=; b=NLT1KdOmayE+14m/
	zOO/hFHB0QrZ/45xcZrsL9sI3DBHCQFQGlOpN2hwDo1jvFUzftyKAS0HBs9ju4v6
	erf+KB6JSoFF7jeJDnFfq3cPd2md+D07jCxLIHXfyhqYLm6ZebGAZLj5zcw0unNp
	W4J8A3kUBcxtCW27fCvjO7r7y/opARCtIlthVtSc0/kyqQr2a4I3Q+uOr6Qp4SJV
	9ioVdHp3CsaADRpDB8n59SpWYkVI0OWN28UTKEkxnETBcp/mQcE9MRvl4mOxl5O0
	6TBCYpMojwwaT39RDKapZAaHNGS05TGii7z5qS/4Gn+DzVtN+6c/YMhSIFQ7s+st
	HjWt/A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmxwv06w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:29:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1e17aa706so32731241cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768217370; x=1768822170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tUtpv5e/gy4OU7aN/5oKSOK0w10MtlmNCkbBwyyRAXk=;
        b=HgUXQEIdu9vcT1X69uA1+Q0FqlP65lUfAc5Au+SFihTmkHS+PpCF2/QNe1GJOordWe
         hjXZhcOTMR/KzOup+kLjjGvChnJNETmgdy2TqQWtMSADMzp8uw9nnmm3JO7Kd0es1Ppd
         wt1Pcv6hYMfSqL/p7oJeHjrUZBHW8IHeV0XYluXrIJHDlsJFF5GPCEaLBtd6IUA9v5fG
         +QOGTpfP4YcZ51ywgeM/EtdFLyhbvEE/miFoBPokRKZDQs6KVCQpzfyqNi32B04lKQi3
         irBaQ2JDjo8pnHm/GEA26Z6sarI+Xy/IpFvtGXwXSav/IpIoTaKA7swrmquWYaXsJ9cq
         h/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768217370; x=1768822170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUtpv5e/gy4OU7aN/5oKSOK0w10MtlmNCkbBwyyRAXk=;
        b=QoKJpkqF9Spc3mbYb6U4DGgeRriKiu9FFb8roXmlSFa1IxA2Z6fEXBsWVjBo84sr36
         nTz0cmPJpKU19TfTU2NgO9wBznl5Gkx9RF3CFYbSULimicTRdxx2OHlqdSfSEkPfiFUG
         PlJ6nJakBZljmzRKPrIdUVBEC96oWede8ZH7H8n3/zHfgiABUWTjSduJd/x8aql+p3yL
         MaPhhwGDfpBNWphKmDoT2q+eanjmeHUMPW9xp+pQEmIUyO1tVzLnslq0JGNZqHBllnWV
         RjcyjPceCFPZ5NgoQry05fejhc4muZgWHGbsiObIjCSffeAZG6ltLuLFTIELXNKD7MPD
         RptA==
X-Forwarded-Encrypted: i=1; AJvYcCVeWWhPvMMKppVbeZ4tnclQRvvgCxpwLw7MuHKtKAfsiOBsp2f0TMYVWyY6LtNLysqijJH5wskvMbxmIlsn@vger.kernel.org
X-Gm-Message-State: AOJu0YxhzPqhYMfKqvuvtIv+O0BtFaTozBAK1wOlVY4Xt9SPZrLVhgop
	OISvKDiIQCuBwVkGVy6gnLu+BOmjxW9Ir7BTl86PR9aI/TVZh+dbfcQUZohXmTqAhrrn7wseZ5B
	V52wfgztrjuXszWdnOB70TUwaq1ZBdAWfsw3CLhFscyv8sKhkYgYqvBcL6kKJgyUDPjFY
X-Gm-Gg: AY/fxX52bD3BpUlIDxe/AWPRR1BOvEAB+h2VxbkiuBh9sxW82CPpC3SbFuUdVOnY7GA
	ot3ICG6WEVfAE4R92N/aIHMIokwJSJ93p+9OEnw2cMycULsh+NspMkINA88r38nsNUSDCjxgCwt
	RgL34Jr+j9u1YhnXLUzl4zdGgWfBYtdTT/QHkshDYqK7CrD1bP4XOjWITBdzR4emIA0fa5+XrEt
	0bdzvN/vP0mwhHb4Iw8wd9CHfnZQfcXJlhyxE5DB5S5j/xIYyXDQCvinms+uq96YglLkg8ijtu9
	wJlZbyM3/5d5Dq9QKCsFo3081JZlX7y//KRfUva/jTxfpB0no9YWTn5Lbd7r+M8ZRguQlNc3QVu
	UnQfUY3+/QzV6pGEhHQe0CNC0wL8mASR9AZTYMQb5IijssoxBRTM55Upx+Q/GT8qOPkE=
X-Received: by 2002:ac8:7c4b:0:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4ffb47e2d4bmr190431411cf.1.1768217370423;
        Mon, 12 Jan 2026 03:29:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEi/U/8coggZOauhZL/T7g+wAK5iJgcYMafFH0a6UdArjpaA3jBAYm8fDnA4Y55d2WDEEvi6g==
X-Received: by 2002:ac8:7c4b:0:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4ffb47e2d4bmr190431141cf.1.1768217369973;
        Mon, 12 Jan 2026 03:29:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87023a8a33sm538070066b.18.2026.01.12.03.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:29:29 -0800 (PST)
Message-ID: <816456c5-ad32-4829-ae0d-a0d09f468863@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:29:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] PCI: dwc: Add support for retaining link during host
 init
To: Bjorn Helgaas <helgaas@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260109155350.GA546142@bhelgaas>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109155350.GA546142@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dFJN5_CggW97aUZf0t4hQzFOd6BcpM6P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA5MSBTYWx0ZWRfX4h1+6JBaM1+A
 GofSzt/mhw6ZO3Fh+BQtutAkMMlmZoeCLBrqWCNevBOWqYb8PD1U8+t1f/Lfse6/8aZic3NpyNw
 HUcwjmO5GUqnPviYt/ekSxEgGkKD+Wot60Y7FVlcbE020bVckmmOBDbub1vzy7PO5oud5pt2Tuz
 aS20EI0tK0TMjM/ZqbwEhrlvflhk8GaOohjxWn/756Q2TDRpHk5YxYu3b8AAkArYlyh1WAzlXDx
 oUSXNMSVzESVkD8C+bcE2bRgAmd5cmq/x3t8vKaIDPGFZehSjfEkiGbt9jykqbqbyP8mZfxBBT4
 wGvQluQYVo6TgKR2yYlWTRXKClwevZBzXaQ717v7ZfTDCj2+7oJQXlYOOX9mkZjoOMWZAjrehra
 ksT1RsVle7PsfHVp9VqU/BQIaHl62NnpgQOd5c2Ksxp9WWvI5h+dkFg3WU1GtABiC7wXI0QZ66D
 lYUaSWsGkRV6W1++/JQ==
X-Proofpoint-ORIG-GUID: dFJN5_CggW97aUZf0t4hQzFOd6BcpM6P
X-Authority-Analysis: v=2.4 cv=C/XkCAP+ c=1 sm=1 tr=0 ts=6964db1b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sQDjRcaqkbB8EtgPkRQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120091

On 1/9/26 4:53 PM, Bjorn Helgaas wrote:
> On Fri, Jan 09, 2026 at 12:51:07PM +0530, Krishna Chaitanya Chundru wrote:
>> Some platforms keep the PCIe link up across bootloader and kernel
>> handoff. In such cases, reinitializing the root complex is unnecessary
>> if the DWC glue drivers wants to retain the PCIe link.
>>
>> Introduce a link_retain flag in struct dw_pcie_rp to indicate that
>> the link should be preserved. When this flag is set by DWC glue drivers,
>> skip dw_pcie_setup_rc() and only initialize MSI, avoiding redundant
>> configuration steps.
> 
> It sounds like this adds an assumption that the bootloader
> initialization is the same as what dw_pcie_setup_rc() would do.  This
> assumption also applies to future changes in dw_pcie_setup_rc().
> 
> It looks like you mention an issue like this in [PATCH 4/5]; DBI & ATU
> base being different than "HLOS" (whatever that is).  This sounds like

FYI, "HLOS" is a Qualcomm term for "High-Level OS".. which is a very
pedantic way to say "OS"

Konrad

