Return-Path: <linux-arm-msm+bounces-86391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD3DCDA1A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:28:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2B383037511
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBA1346ADB;
	Tue, 23 Dec 2025 17:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DpNZp3Y8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INC2sUpI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEB43242CA
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766510834; cv=none; b=DFmvZ+39s3bP+MAy4cRvimfqpETZ39hEduk8DQmVT7YIwWtb5SHyQ4s+4fBhJdQZ/Bi2LYEa4KnF+zuPjKhCjtA8sYtkH7nNVOWTM+YfTko897FCByWV2uN83jOQdrr9hdGuuez4RHZe0JYwKi5Y5HxKgu7U3WndE/ZArniuORw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766510834; c=relaxed/simple;
	bh=YzwHk1h5PQT35HsiDzIXWC2c4Nyg1mzMBWcD/+5qN1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l+8Yo/AhzR3dPXJ8HYoDDmNSc8pQUTy4LbM1DNTkJ0UmsMNgPlyTciVNsLgaqNryahpNN924et334yuhJFdh8Wz3UdVc4p3l7CCDTVTl16LERPDShPdf4+jcmeSVlAsrsUneO5HbI8QQRt9kNCRjyP3CFWSu5uO/s+qnmlheOqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DpNZp3Y8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INC2sUpI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFvWDK2747756
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dOT7EwfbfDX7NAU7Z9zg/Z+3hTQvq0pbEfhiEz+zL6U=; b=DpNZp3Y8aNW2XYNG
	gHB9e7wg/uz+7dMZMFA41p/cigVooI0UwobkjxerlYks8Mb0uV6gOOlVHrBLNRgs
	fb37hc4NRQu+oUxPA+EixlxJWHXx5dd0QvvRN/du4C4CLkgWRwKuqHspI0GmwvZh
	W2GWDoMgdZpQG/WsYBnAkqjZqLSvZLU6QTGKLqubdsT7rx2McsoXazKmjAqAoped
	t30r262SGql88rtk//exbJlAqptjePdSUgkz6F+F+WK1I97XzE8lOuSf7pgbY6X+
	jSnAJDku2ZxlKZTmUdv8banB3oYU3/+WYl0UtGl7W1iK7i39QonZnU123FoNQk52
	+aDIrw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5ctxu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:27:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee05927208so21221481cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766510830; x=1767115630; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dOT7EwfbfDX7NAU7Z9zg/Z+3hTQvq0pbEfhiEz+zL6U=;
        b=INC2sUpIVmN8DqdcqfVNo6cA7pE14E3cAMyVEcsP+unMuPIuV2o65ETzO/VhKMqLCQ
         Z2ZyqRzuYkdfUrUiX0OG4mCUnDuy7SLRi/ELLlwRp4UkB0PYghtNC3xzT0x6Qt7Oj8V7
         DjXUDTy9jRgpUbCiJx7ufN0jcTIOeqgqBH44ZDPYQCtG3BbEQrC+MotCM2g+kPsPgMu/
         5H0xj8+lWAxSY08vvtbz4OVFlIJ98ioN/B+gyg1hwwqbFUbBl0xVViNatMzQYRXhR9Mo
         1WGi/OZFdVj7EOttYwUVHqV7GToOQCQ6b9/bYC5cRI09MaAbhnDrmUYcpAwbkFMSudsT
         IdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766510830; x=1767115630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dOT7EwfbfDX7NAU7Z9zg/Z+3hTQvq0pbEfhiEz+zL6U=;
        b=JesgITmDQQI/Y9f7FGueqyW5Gsj3tsNU5/JeBwq0EhqKmFWj20w4HNdB95IWiEyARr
         CIqWC0gdy8XvyucnoZZXE1bRfnAkz6wI8uGrKyNHMwz89e5d02z4Q461bggy4m2Y3Tk4
         0RmhYg2+jdmOoF4h2KkjC3okf9aFuNAEwW0e5ofPh4CZVEMmaW8+kwqIlO7SEOQUtzRs
         37HBrUV06eaAfgsdy6F3GXqo/q4yR56O94iHsH0q6fqrKNYyovC+J/krHDwxbgXjcIGT
         NqY4GmA0YwzgynW9jJMhs57PN0M9l8fioNU4w2K038anHRab8xZKLumkBdohVgutIXyj
         y/7g==
X-Forwarded-Encrypted: i=1; AJvYcCVrJoC6vPEhTJh9xRFkqI2ETxGIIP4503GkRK0uTnzkfLJdpFFXrA1dJBagmNXadsPf+pQIIxUaKdiGZQk3@vger.kernel.org
X-Gm-Message-State: AOJu0YybqznchXXnnFscnYy1RMdN+dq8Bab856VrpGPWzV0VFfgi/PHK
	NVvw4gFgc7oRoBB9SzoBoW+GjUFZxO6tuqfXm9pKukBAi2V2jMHni/WndPVz7cxtqPKCkw3EuRj
	32tjmem6N0Z/i92OP5CvpVt7ryQFvArr6+DmN96LEJKpFdTHs+1DLd2LTZL7XDwGCOg4r
X-Gm-Gg: AY/fxX54Qri+BIC0tEsiqTh1NwTgUnCykfH1FDwwRvic+ajI0QxRjnnnLKbKKwW5uwz
	/LLQfs95lvUG1GC5SL97Q7wFKnudAKhTZxiGStEnXS17I7HsTdbAFJyPRz+ds+VdGxH8tsfKQ16
	S+Z9XMZhpqjHL5Pax/boe1gJGAoUG8QlNdapH6qeYakSxvXvGbpMNA9u8cae03XtN9H81djdXjW
	GjSikZKuONvI5yMiCZiwEAwkRvjEncjXAkohUBYo/D8eomivcjlMiHux+Lp+PeaWi8o7rHacss8
	Pfkxv5KSJS3Vx9L0Cm5zkcOH30T4j0l2cIoEotMkb8JNatp9SwcwD9CVD8AQTpVGO/sT11J9tWh
	5U6RJURq8fZUsuj8bVrEGBFhKphWEVxo/tRvaE2LaliQ0JH8heXjQYYo2K4IprO4gYA==
X-Received: by 2002:a05:622a:1982:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4f4abcee273mr168916371cf.3.1766510830318;
        Tue, 23 Dec 2025 09:27:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF099PwvaGY3E0+s71xr70p+4bCphaLo3cfBs0XSKhlksU9Qb8McMwrWStBk01hfygwF1tOcg==
X-Received: by 2002:a05:622a:1982:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4f4abcee273mr168916021cf.3.1766510829635;
        Tue, 23 Dec 2025 09:27:09 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b82e7sm15331785a12.35.2025.12.23.09.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 09:27:08 -0800 (PST)
Message-ID: <0593cc2e-0114-404f-929a-0860d60afefb@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 18:27:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Initial patch set for PURWA-IOT-EVK
To: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <dmdtwsdwl2bl7mn6j4d4xv76h6bo57van3ni4zt3iapq5bonsp@rxoqan4nahud>
 <d8642ba4-9a6f-4fb2-bd0c-419ead2630d3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d8642ba4-9a6f-4fb2-bd0c-419ead2630d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0NCBTYWx0ZWRfX86Cax/JArbdT
 pwcKFfUiMZiNn5ty84sXHCHo4fKsRdiTq7rRHefNME03YeF8KLvmsqPz16+dLkBnfrzkukrSZcc
 YzN2jB2JDjabY/OwYN7Nta9zp9grZ/C5mzhebuauCeWm/qpQvVM0ILECGvw8+VkyOUYyyDvgGFf
 EyguqLslBwGIw0E+GTVrO9+JY7lRJlbDUcHR+VQmYYiemKGFSCr2r9umHA+C7pDZDKrbFo8m1NJ
 +Jl5s4oYAfEwo5fo6iafU8FD3WA3nMGe9f107G8IcgXNME8J3RlYtkLqhYoas/rK6rF7T5enGaM
 rhTgJIcO5ZQGSXBR+T3pkXbzR0j+0c8LOzqLT/gQXKNewNTl6uVa9ewok/EVqNX+xG/GeF0trG+
 JBMOcCyBGLNkDsjqZpXNQAZQsAjjFV2VePGNr056upJVCtKKOq41Sqtb/AbK5SujHjKX1VuiqzV
 gFmBaGhOcgVCFfPTDOQ==
X-Proofpoint-ORIG-GUID: Kaj9U3JXqHPfH-7to5fNvtQthSKNmaJ7
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694ad0ef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Lmo0ds7W6JHZdixPqlIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Kaj9U3JXqHPfH-7to5fNvtQthSKNmaJ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230144

On 12/23/25 3:12 AM, Yijie Yang wrote:
> 
> 
> On 12/22/2025 5:18 PM, Dmitry Baryshkov wrote:
>> On Mon, Dec 22, 2025 at 02:03:25PM +0800, YijieYang wrote:
>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>
>>> Introduce the device tree, DT bindings, and driver modifications required
>>> to bring up the PURWA-IOT-EVK evaluation board.
>>>
>>> Purwa and Hamoa are IoT variants of x1p42100 and x1e80100, both based on
>>> the IQ-X SoC series. Consequently, the two common files in this series are
>>> prefixed with 'iq-x-iot' to reflect this relationship.
>>>
>>> PURWA-IOT-EVK shares almost the same hardware design with HAMOA-IOT-EVK,
>>> except for differences in the BOM. As a result, most of the DTS can be
>>> shared between them.
>>>
>>> The changes focus on two key hardware components: the PURWA-IOT-SOM and
>>> the PURWA-IOT-EVK carrier board.
>>>
>>> Hardware delta between Hamoa and Purwa:
>>> - Display: Purwa’s display uses a different number of clocks, and its
>>>    frequency differs from Hamoa.
>>> - GPU: Purwa requires a separate firmware compared to Hamoa.
>>
>> Is it just a separate firmware, or does it use a different _GPU_?
> 
> It uses a different GPU.

I think it would be useful to call this paragraph "Hardware delta between
Hamoa-IoT-SoM/EVK and Purwa-IoT-whatever - because now Dmitry is asking
about differences between Hamoa-the-SoC and Purwa-the-SoC which we
expressed in purwa.dtsi

Konrad

> 
>>
>>> - USB0: Purwa uses a PS8833 retimer, while Hamoa uses an FSUSB42 as the
>>>    SBU switch.
>>>
>>
> 

