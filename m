Return-Path: <linux-arm-msm+bounces-88083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C714D040C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:52:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 387863145B7C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90073471498;
	Thu,  8 Jan 2026 12:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dsPMqdAC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fkNW00/V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AC4470F2A
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 12:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767876731; cv=none; b=UY4YNv/nLNAXBu5qSQI2bz17qVnM1VK4Ygfkk/AcGuRPK2GWlMw1nBnzgW+VKrZewm/0t96Sg6jf6I3ESIxaTeSdeL6TEgkLb20kBDZHlUMEiRAEyq2AX1tIdREUl22hwBkPTJGOu3x/NXNm+kPIni/jZYbTSvDgsIZF2WCPrBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767876731; c=relaxed/simple;
	bh=QOFVeDUoq+RkKbWZq/pMK6/NwJiOTJMnMsw+4xmARgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q8SSiLgsYAFe64ZF5owL661bBxNxdnxZsP1P+gvv0woJ/z46FScfkPU1fyDOtps1ONlWuVo11vsCXZbZWreNOKEEYgyLnCV9bBwkxBguR4QwgS9q5odBdUii6xv3QeY6+Cyxxy6L4EbXPRZ0zBmmATgPKBTd9IFGFggZrOH8POc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dsPMqdAC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fkNW00/V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6087Q5An1258442
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 12:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSZq0W/AuZXDHLOoNS/P9czI9HRnbDZBm6oN0SdJro0=; b=dsPMqdACt2Xh921z
	pRkDa8qe5suH+5GhB6H7n9IAh3Qy7G1LuN85nUII5FMXJpXNj9+kK0UMg7M1l201
	LOWIGdY+dSbghFFh+hxtyUABxBUqVM8XdcjwoFpX/BMUtjjPfWx46iZgU/RDWYt7
	vCurZWjy7vIbL3UnUlpvnUoE+b0y3Vqu20qXqNfpo3Z2EszkjScEBXM0N9PWBePb
	ZzuXegM0TdDSCU2Hm0+yALRVRh4pKQWHJJbd1BFyZihZq1DUvpVzAzmFzsY14+0k
	oIs/rzV/2q+j3d5ahZ8S/sFgTv/5UAeRsAUg+TMdBTFe6uf0MHlO/Lg1aMFHxkh8
	5IxtjQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj86grxq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 12:52:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b9f3eaae4bso75889885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 04:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767876728; x=1768481528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SSZq0W/AuZXDHLOoNS/P9czI9HRnbDZBm6oN0SdJro0=;
        b=fkNW00/VQAyq8xsMPjygWHJu4wIkmz3lGV2Aac6AaNhNFOBzk5RAqQ8tgjTivbvasa
         Sj/znN4fIuRiEgOe2eWJDCmrPZNvI2/Ap47CVb6i035Uap+BJSi2y52pfkIDNz5+ffni
         2gSFgQHi3QisVWnOTlK+YGMV2J1j5cXELZrAGHo5PIMj6NdEPjWoP93PtRUJAkj4QvM9
         lUcNNdF4QIF4YiCzpZoNKO7+ndPhffAlVZnXzljTa1fhYxyQ4Uuc69lDphvHVFv2gAfJ
         0iMN1ALtyaqrKbLXme1VI/cAFBf+Ng7zenhew1qHSQJvWaJKgc70w6IYlZbUKqziYKqq
         y/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767876728; x=1768481528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSZq0W/AuZXDHLOoNS/P9czI9HRnbDZBm6oN0SdJro0=;
        b=exOrjBKnvpqcj72IkwD8OCDbCbRXfxY/fxlEjC8JkEmFOSKESinf5JDq+yjjcDYdEs
         yfWXdgxowmFvIxGQQC5YRH/0cfeHODNbj6n77+AbT9MVB5X5NHeW8zq0MD1t0oS+OSIS
         T2DuPXLHNyZs0TAcF/Qk5sIkRd/HaggWcTt3CElpzxRMU0gI8EMimnAwhriMZ43YeKwu
         n38FCR8NGTqM3dvk1J9pose6YUJwcHzjLpmnfAUXLK1qPb/HUI3MyktDd6nNhHBLTAMT
         8wo5Z6vqgaIjeyi0G9U2VuNzZPzWLDRmEixp5ShIenf9cvNFhkWqJpj+I9GlaG4B6jsq
         SJVg==
X-Forwarded-Encrypted: i=1; AJvYcCVxmC3F7IEYw4L91hKtPDRfV+isQmwHjyWibKnyrPtQMt8PLUw83oYE5knv32mFNxeMr70WSOvsLuRD4L7Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzAM2oU9AsnYBdzBsfDtgSfEqF4Cyobi4u2ZWfcg+Pf29CxwLjl
	iLy8IoqxteN7dd6BlUpzUgNL8Smyw1Ap0x2dkxGX1nyPOzohpr2qgcsnWSp/b/fgvqEC8PHBTIS
	2cJyhIGlsyxBgmsKjeBwk0e+FKQ7zxCa+05WvdGoMl13ffxl8RGBVTnDWDBhetCe9OJRp
X-Gm-Gg: AY/fxX6G90XG0Fv5i383Ztpebt3h37NnOvopG16v061oV0ppjXu4Wle86JRtE6ntZ7B
	4lwQHlOJ5rgx/MoYQOj626FUw+U7j5Rt7ES0Brlu7MieHOFJXUuVA4VxpOLQQnXYjfGkODcofmW
	0yLdH7xj3TNnH8Gg3+rzU4pWfMpDqPqHRHkymR5PyFVyIqv+4DdZAkhjcEyxvnhIdZD0KyAhJk5
	8lhTl71Owh1uD2LIMpXpSu0cpUFbk261f5sBobDQZIbLqJLpyf5DrIyOYw83xFE/0GxhzgvOalp
	ssd4y7vT6639lXnCWOaYQsfCXXtry1ByCbXHaGK4wqNcy0meqGmqXOEnZo9V+fqDLIud+5C4D07
	Sd/nOi0imi5U/zauFW/NmAO4hijk9uOo84JiP6x2q2oORnXM2UWe2NOi1JddmZfRTYbY=
X-Received: by 2002:a05:620a:1794:b0:89f:63e7:b085 with SMTP id af79cd13be357-8c389410364mr545961385a.10.1767876727871;
        Thu, 08 Jan 2026 04:52:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHo45yMO7U4oaudAIbE+xfU6IFOYt/20jPnNbq86GzeDWfKgToo4vFxzHEx+lvnvjGdNyAZaQ==
X-Received: by 2002:a05:620a:1794:b0:89f:63e7:b085 with SMTP id af79cd13be357-8c389410364mr545958885a.10.1767876727439;
        Thu, 08 Jan 2026 04:52:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a230db0sm811852566b.2.2026.01.08.04.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 04:52:06 -0800 (PST)
Message-ID: <dff0c32f-b471-410b-8a70-9c20e436a3b7@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 13:52:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: sm8350-lpass-lpi: Merge with SC7280 to fix
 I2S2 and SWR TX pins
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260108100721.43777-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108100721.43777-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZNjaWH7b c=1 sm=1 tr=0 ts=695fa878 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7bMfskS0MixV3btvheMA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: iBSTEqCIGT9ELWEBY6mUJFaEgfE6M3bG
X-Proofpoint-GUID: iBSTEqCIGT9ELWEBY6mUJFaEgfE6M3bG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5MSBTYWx0ZWRfX37RDHjelZ1yx
 eLCOQrz3E06J/QPo9ahEiMA67U2fJ3VGTcTHbFq60S0pyLbdJDOkqWqlNs27zV1jcxtiKpKwHku
 Ca7P1uieW5pxE9vNyR8wBVAZTG0DXdY3UxWk/K7zDBLIvBsML9NF4prjeWV1Smp7CXMZA/VAjmU
 I1x6uqCf8xalypTK+l8Adui5Bwh74aPtPAU5XN79xqna7VGu7K5soIV8pisxjmzZ0DIjiMo5Upj
 056qMM5hKefY+BRtNdP/NIppMI2b92nZal1jnaH4sa75CdSSoD0JmVeYHluqn2Nz0/ziKrVM6Xd
 K7ZWYzV2o3z4C2PGw8uoZDRJ42C7vRdjvfqzOHpHNXC+i+WnCYorK2/Tc2ZVtc76PlqzJp4rsHY
 2zIlojMZoaZvVobhbIiNRzsXX44ktQ0jVGwGtK7ibyRaMPe6Dcl/gXNnLeU5p3uA/MQzpha9S/I
 g70xEinPBs1EnfriBtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080091

On 1/8/26 11:07 AM, Krzysztof Kozlowski wrote:
> Qualcomm SC7280 and SM8350 SoCs have slightly different LPASS audio
> blocks (v9.4.5 and v9.2), however the LPASS LPI pin controllers are
> exactly the same.  The driver for SM8350 has two issues, which can be
> fixed by simply moving over to SC7280 driver which has them correct:
> 
> 1. "i2s2_data_groups" listed twice GPIO12, but should have both GPIO12
>    and GPIO13,
> 
> 2. "swr_tx_data_groups" contained GPIO5 for "swr_tx_data2" function, but
>    that function is also available on GPIO14, thus listing it twice is
>    not necessary.  OTOH, GPIO5 has also "swr_rx_data1", so selecting
>    swr_rx_data function should not block  the TX one.

This is a little difficult to read, but tldr the correct functions are:

5 -> swr_rx_data1
14 -> swr_tx_data2

which is what this patch does

so:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


