Return-Path: <linux-arm-msm+bounces-54450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EDFA8A969
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 22:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE86017DC7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 20:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156CA254AFC;
	Tue, 15 Apr 2025 20:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gwBlDFU3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983BB2528F2
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 20:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744749459; cv=none; b=fEcWc5xkuDqmCTOqwd+B69ieoLkUT6QOKj9DgR890wh7EgfWBigmNJppNNOus4jSvFTQ8TGWU6X+NZSgVJkwf4NCOq5e0tpTqD92cY58kJBO5v2HU8gLKrAGEdygJjP1j041YIGLHNFQshNUZBaTZqpRM8gDkS0m8LVVHp5wUuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744749459; c=relaxed/simple;
	bh=vJYeZKynbW0y/0TN0VVY3GeBlfQ+ky5vNJGDsEcf0H8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oAP1YhuOrJi0FMl9L6xCRmdHh0M4pyaMgCYS+5Q5WF4jnhDvNF5CBoN8Wozvr27iiOMVW+sv2/BTv1PiJgn/GUVDhr+ysFGKU2qnxJ1HYzKJuWIGBIwHohGXKdyfgkgJd/kb2OpZTjntR4yD7PJUrUjSYXhgnK6U80trlVzOxDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gwBlDFU3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FIHv8V022965
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 20:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jh6wZ8wOe35XO6nPBtm56xEYnTRfvkG4K4xQHIRnHpc=; b=gwBlDFU3bpUIJNxd
	cDUPvSEQzGsF62CBJHDxxJSU5PS6Sa5LUYbFVqU+NSm9Rrpp6PP2iHzIq2E4unwP
	nFkJ8bf3hqwTgv+pyMb6PCIWoc0lNjHElLpoYDSKR3iq0t0aIWGRdhrwyKrE0Orf
	cQV1VqxDVgifvSBFXLtDr9RpzqtqmVSmnAM3nHT8z3e8s0Mex0fJXms4pBpjSI+R
	7nU8Xd5hZ0hAKxaXyjeyCPWbgph/rcfJziw2RfAyEiy6QAAFAxCLMVh/k1cdkbj0
	ET86gbWy4bDcfLzxSy5orjeEs+56rA6hLbQL5cdDKZnJxZ+qA2W4YWYYd7DCymAX
	2UYGTA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj99apa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 20:37:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54be4b03aso112446785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 13:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744749454; x=1745354254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jh6wZ8wOe35XO6nPBtm56xEYnTRfvkG4K4xQHIRnHpc=;
        b=NYEcOfiYGf0xMJUIS0Z8PxEgs83GGvz1gi/klldmbrm8/H6n+Ip4pVtWBAxT+ZtLIt
         wSOEEaOz1c+0Bp7KDAxgXepdIeIaSMIEZouLyeVkF6SYoP5eok2k57awa3E8K3LQC04P
         qk5CpG3ALglPU0OnAWJo1jw80mbD5waVeMN3bcxKBUFgPJdv4/bul9YCUlbsmvRqKH4M
         PkZ4tMwdkyJGN/n8wMYQL2PPNVn7a9zzU3GL9ist/++CuWQo7Wuywd70Lpx6nnHyRdVI
         UQsH+156ZqGBVmbqmmivhNfhsGWPVbHtoZqfNW7l5js9EbLTjm93rc5pErDKe+LV6VsX
         drDg==
X-Forwarded-Encrypted: i=1; AJvYcCUNgqfP/CSPuforwD9XEqW4HfsWHC0GTKc5ZrC1XQVlx7nnLWqlEwQWm7rT13xcrL/CUWW06JH+YSFfwuzh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7a3FGdOJ6voLn/IGAWne8YhWURTF4rAQSPy8b4NP94apFPspQ
	M/s4Hqq3YvzvGZ2dcVt9cOvFEnHjkzuWxLCCNPHdr4ypkL6rZbG9EsXHJ/sFRqAVNIWt9vwpLDM
	EO/MU6ztSHwrUlZNfr13C1eq69vdRqH06i6VdMpM28yqiCGU7AtMHBcRof7zCIU9r
X-Gm-Gg: ASbGncuUSEgi47Qlt7cJYHYW2idwMK9sQWpISq0TKrSXgI/EqAF9Lcb7jzGp4H1Zh32
	rPHS5L4HETA/Y/6LF06EEoK6Jj5pu77tTZAJA6YGvyYjuZZURfT/qkWqrTsh4EQvtpl0XfBDJO9
	b7YP+tTTbVAuqSSRNAc48muVBuwYqjfd/4ntjHbm7qhUqLLJoRexrLfKUGQfLEJl61Odddneh4h
	RJg9Iq/fKmbInRD4L048lwXfXIkcX+JHTJNyAvGDi2j/+6uSkabd52z74CGwkdvLhDWtuc37dk7
	4ASMZozA1xjCArqk28WaFeNAD1DKtsY64zXIK4JGyEinZem5LYju9CwzX8aiHM1+LZg=
X-Received: by 2002:ad4:5765:0:b0:6e6:9c39:ae44 with SMTP id 6a1803df08f44-6f2ad9e0c4fmr6195696d6.10.1744749454592;
        Tue, 15 Apr 2025 13:37:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL2uGX/Z6b8+QQ5A7RjQ9VGQklgqNfIx9zsMrX/Z761Y0JZsqutG+DGTlwNH2KtxyKSf33qA==
X-Received: by 2002:ad4:5765:0:b0:6e6:9c39:ae44 with SMTP id 6a1803df08f44-6f2ad9e0c4fmr6195496d6.10.1744749454247;
        Tue, 15 Apr 2025 13:37:34 -0700 (PDT)
Received: from [192.168.65.126] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb42b4sm1163025566b.97.2025.04.15.13.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 13:37:33 -0700 (PDT)
Message-ID: <b5d139f6-5704-4486-b7ae-c960ceddc7ba@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 22:37:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] arm64: dts: qcom: msm8916/39: Move UART pinctrl to
 board files
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sam Day <me@samcday.com>, Casey Connolly <caleb.connolly@linaro.org>
References: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
 <20250415-msm8916-console-pinctrl-v1-1-a1d33ea994b9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-msm8916-console-pinctrl-v1-1-a1d33ea994b9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TthabNHVh5rUS41nw9w7qa7ZoQfISVxW
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fec38f cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=HegNSTBbrY75hgcjlfYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TthabNHVh5rUS41nw9w7qa7ZoQfISVxW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=796
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150145

On 4/15/25 3:52 PM, Stephan Gerhold wrote:
> In preparation of adding a new console UART specific pinctrl template, move
> the pinctrl reference to the board DT part. This forces people porting new
> boards to consider what exactly they need for their board.
> 
> No functional change for the boards upstream.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

