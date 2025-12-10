Return-Path: <linux-arm-msm+bounces-84891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F11DFCB2901
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 10:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBCAD30BE6A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 09:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24058F5B;
	Wed, 10 Dec 2025 09:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iy7AS/ye";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g4C1fKhX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737832641C6
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 09:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765358907; cv=none; b=SjyJnVgcBcFBOzhyiuj+yyXUS1ICrWL1LsJy3ZsTLKvRh93Xn+pUyOtygr7G5e2USTcyi3bcbYu3btjo12F0FSJLrQF9FSar4vuxuMc1txOo1ZKsKPd3SJholz93MHDtb6rAe5zRkNJBZZ16g7Wg4iyAz+iitqt/sd2wycs6Ptk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765358907; c=relaxed/simple;
	bh=K4OCg27MYCnUc+65aa4QT+gLs2XrP3BJQd+qvNtJ9Q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cb422L0C+aMclB7bmK+4VZCex1HJ7Rv0QSdgPkLpmQ7MIzp9DJviwRbP/Q769AaGkpHGkkZ4ekIs+S2v+ByUj6ETWupAA1RVI2gEAGDuSGk8w/WVYNGIbkCcrJw+h35hhX6v4yODWc1vlspE9P3g3BgG3hbQYcBPx/y66YW6qHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iy7AS/ye; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4C1fKhX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA9GvIe2859056
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 09:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ePRjDoOI4M0xQx6/poRyTlRkzdYhhno0rSqmTlQaYIE=; b=Iy7AS/yef02qTkFP
	z62uO/LlRW/urYVouTr79/QZsMuJW8u9quCSyOoex7VertA34rLK5q8ZRlC7oNT+
	Ryjxq2IJEnBpip24ULUxd1M6K80ZCV7NwcFLOTyiRUjuRzW9Vn7WBYUO7eK0UMze
	b5FN1xiQRtKv0UrtMe+cqSv9pm6EyYwLkNVc/tReW4b0PSH1RyjSYuC/GRZ+aYN9
	6ZYmNESMlV8Nd5dKEwkWKiKfwI0WJM8p7uOHxSs2wdQs/xeAGKi1Qu2NAKP7Bw5M
	0lwflYOQyPMUg2InOCgNkX0F80bjp8gkev6tXYaCfyfJT1YquRG0Hvm+uFu30Pgi
	mbEWXA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay63fr1ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 09:28:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso7349258a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 01:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765358904; x=1765963704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ePRjDoOI4M0xQx6/poRyTlRkzdYhhno0rSqmTlQaYIE=;
        b=g4C1fKhXB1Qkg1+1Aqrflr4ShAp38PNtpj1ewyi5bcs+aW0Kv1xgqgzciBMK7XV2vS
         uyawNPgNgZ8gssB7htW38MjBn7GyApSEwxi+CtlXNKEi+1jI9yiUQC9KG2ateS/x6yAd
         x/SW7HEsZi3Ft5B4PQPAJmZ2Oi5ESjMirSmOA5kSFp2RHR3n/2LWz1zs8KuGbZxAfkNQ
         yedRgHyLxf+cHomjdAH2okLEKJnAOS8ccioqBalXq0lYa+e648hkB+a8ciwS5VjMFuFt
         QY90nhZMoMqfchyZktSU4M5mTuVmVpZV3JuX8z2L4DZ9nRHCKbNc7lKfEoR7znhzLfyW
         0VNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765358904; x=1765963704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePRjDoOI4M0xQx6/poRyTlRkzdYhhno0rSqmTlQaYIE=;
        b=evT9gvDSQvKZO0otpKpNKwe1tV3Xn+rJS39bEkgyNcYcBpx5Ak0lh3GY43rHiWm1Tg
         KRkz1ZOqt12FAh+2VVzA7b2lmOk8kvR53b0WCbVEVjlJoLCYU1zHvWhbGgwIIa1mV/II
         vahCo6jY5pcqoGk5WHAaO6L5p8HxQu06uiNhdn28ei7HunYsuS8VNYDsVBBe4d19XveX
         1N4/sxSqHfkpgaXA39kGSUED3rsyiOdf7ZaWOuuVdH7U4M9nWD9Ojw/eIXBkRuoNAEoD
         1zXs8StC3nfbk6oGEcn1ofU2EV/JCIS2mjXCcHY8TBSWjDyHBb9LIw3NNkqj89Q62nWq
         D9sA==
X-Gm-Message-State: AOJu0YxnxfrgRzwxIWvYPf9N0mzTEQdb/z/w6XeZElgocvoojSe+gnft
	1cmg8rC+97/Lx0lUoUuOcojSizhripjKxtCJQOE6HQo3wTWDXLYi9m0cUMglCNiyrI/PCoQfk8T
	eK6isHtYSg9qJgQJyZq9pGuJlq5Whl3lGFEwEkLujdfT72+6dvc9YSShz6iYTqea+2CzF
X-Gm-Gg: AY/fxX49f6rBNGMyLadqSyq8KkaO3eeddRGA2bLJ1jzWcyY1dHwr1fhKWa95fpEo9zx
	MqIHnF6SJxzW2D/1mjhddI75C+6Z7AlsVlLgpVaCXaMct/BtMA9PzlPn4d9OcJDRB+NPkZjCMN6
	rhX+jpFIUNzYumWDErqy84uD04PYeBEKYkOSzx7HNGNtP8yrQdI3A8auZJRnA4L8v6LUP6zDeEB
	XdCu4UPcYZ35hvQpGtNoeiUcw0NpCCZcvKGag2x+prJMX/ZVOCIZUhwT8gNhEeLLZ+VBK23RE/M
	n4W2vClQCRQYKUYQ6Z4MY7xxa1b/tVekulLSmTNCpVNJE6903DbuRj2klyDgqSteXODki7naa5b
	aT4Ae+XG26e+mOkdbHCAtMzmk08I=
X-Received: by 2002:a17:90b:1a86:b0:32e:7340:a7f7 with SMTP id 98e67ed59e1d1-34a72809ed0mr1488051a91.2.1765358904080;
        Wed, 10 Dec 2025 01:28:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1fJ2SaDiClPsts12a3t616CMyvLt2PMe3ATPT8jO3yL3ONV31r+nslz4ADvdqoCpwELFvtA==
X-Received: by 2002:a17:90b:1a86:b0:32e:7340:a7f7 with SMTP id 98e67ed59e1d1-34a72809ed0mr1488030a91.2.1765358903576;
        Wed, 10 Dec 2025 01:28:23 -0800 (PST)
Received: from [10.147.240.173] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a70c4ee35sm1903767a91.15.2025.12.10.01.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 01:28:23 -0800 (PST)
Message-ID: <aa4db9a4-fccc-4ff1-ae3d-fe4195f91087@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 14:58:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Enable TPM (ST33)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251114-enable-tpm-lemans-v1-1-c8d8b580ace7@oss.qualcomm.com>
 <3e54b28e-8ad0-46b0-bf78-3f8be3cbb079@oss.qualcomm.com>
Content-Language: en-US
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
In-Reply-To: <3e54b28e-8ad0-46b0-bf78-3f8be3cbb079@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _G0-n5Q9FDuS34sTEdLKCghiXBXXG6zl
X-Authority-Analysis: v=2.4 cv=Y6P1cxeN c=1 sm=1 tr=0 ts=69393d39 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=J2L1Qyf_rTYgVfOkadwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: _G0-n5Q9FDuS34sTEdLKCghiXBXXG6zl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4MSBTYWx0ZWRfXxZ6xactRcqQR
 /Zb0CVfMAUOUZsw+sC+zBlHY/slEfQh/wpco4Pz4Niz2P93C6DqTo7aLmNYLksW/6/MRg8NLD4T
 CW8fBPYsWIZZ/U86PCzL32qRITKXxaVxRdjKo6Ah26/8IBQaheHBOdNgFnwWUUvHTwRXcGg7ucd
 UQJ1/UVue3UB7iw0/A+FW6WGsVKpxwN87lPfbdCW+EPZZc+qA6thLC2FWr9Q7U/Gtl0YmrdJML4
 DWNHbo8RMzQjDeUhBoHQWmxVXAc+z0EmlHlb7+G4wlGbOeul2SxzmibMRgIIE+Z1VuA3OQJI0Fa
 2Rkuy3QPm3HK27ww1qzSesqDeieyypP21lMD4eebHzNTUgvaGfzPJfCTl7yVi7HELtco9HcAqpB
 5Y3n1tEY0zjIhIkdnPClNj3X/jZKog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100081

Hi Kernel Reviewers,

I wanted to follow up regarding the patch. It was reviewed but hasn’t 
been applied yet. Please let me know if there’s anything pending on my 
side or any additional changes required.

Thanks

On 11/15/25 03:29, Konrad Dybcio wrote:
> On 11/14/25 11:15 AM, Khalid Faisal Ansari wrote:
>> Enable ST33HTPM TPM over SPI16 on the LeMans IoT EVK by adding the
>> required SPI and TPM nodes.
>>
>> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

