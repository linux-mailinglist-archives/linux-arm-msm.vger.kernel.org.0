Return-Path: <linux-arm-msm+bounces-80576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 00780C3A5BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 11:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9E5DB350B65
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 10:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1457C2F363B;
	Thu,  6 Nov 2025 10:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ysdwnn9I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nf0YooPC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551762EDD5F
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 10:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762426210; cv=none; b=aWlHYqHtfh2DT82ed3OtNY9cDHA0bWonG/AEftbWK7JS78Y/U12Tm2uf6HDW1KdhxlZpVylYTBzOTP3E9PLKSP6yH257F3uv30aIIMmBVxlXMqM6r3xuO2sWZN53NjIRrtEBsPhGF3iNJdp0pGIQwh/wA4/doG42z68xTfe4j6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762426210; c=relaxed/simple;
	bh=IIzlanJESUhT5HfvEWESAycEQAHaY1TGsW3q7CIXFiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KK6eoE8njLSumPjCFidchqpg1MxonfgoceG72dKRMrOtr11Azb+HCnlYNRBZHFVdgmNZfqVsnbbdSndfG0PfDPHnQaNamksUkTS1zsfxEw6euiVEYYmqZM6nkjghv2BtFRWuk6/fE8lZoO3jKDn8NzdRjFVNWFQFNpFYhL6Qifw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ysdwnn9I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nf0YooPC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A69PeYf2798824
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 10:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/r5TJc2Jt6B9ezU0SWbilao6yYAovw2BCl+MHDUkVwM=; b=Ysdwnn9I0bxhlwS7
	iPQR1rxOPUlmujSnq/VV3kpTbwl1klH8Yze5iHhMd4+6MVLMGHXBWG+2DxfVrhZ6
	FMZzJHAL9a28O6XtTsn6pwHhuw994J3+WqEvJRkmmRze0oET4GmD71EU14WYt5JK
	EVIS6si0CL2Mq2qc9B5MUITgIpLG8L6KFgBshEJ/IINwfq2qbxzQ6MARpZHjx9kl
	bhYpVe0yxFQdbdo/4JEl9KQ+mTWx+wVcpunpfbJLbMIYBFqhgk6J3oMy0ZVN3KlS
	FYlPlwh3zYr+V1r2bDl/+YwPm+Jvc7g0Rt8Qfmh8xjINB1wG/D5c6+ZCgJpDX5AF
	ruJSyw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8hytsecm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 10:50:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88057e35c5bso2441636d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 02:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762426206; x=1763031006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/r5TJc2Jt6B9ezU0SWbilao6yYAovw2BCl+MHDUkVwM=;
        b=Nf0YooPC/K4fqisFGIzztf/MkSoOtN5rnztlQLeRrPvGo44pvGHmjSPiacbjdgMwdp
         3hzw/4WAJTBHuJ2ACLZJ16Xu7P3dO38T6nLhMy0dL75C1Jaxgwanm6J9AnvXggFwCWiF
         olbf6gptJPmMWzAW+HqnQh5uXKUKwNGMJlYDG8ZhYUGHWZ7loDIycG2nFOM9bPCUxI7k
         LOKgMlieOBPBLkEJQHS1+5fK+qM4xNs2nPX8VNsqo2Udhg6xxnzUnjGMHiHqdQAFE4ax
         pTwu4W9YRlRTlz333Hjrg82eMDP37cu0bGAM0TdgNVSwm9OiG8LXbPSSbRyBNgMrILe6
         MePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762426206; x=1763031006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/r5TJc2Jt6B9ezU0SWbilao6yYAovw2BCl+MHDUkVwM=;
        b=Ciscxefam6b5j2j3HMHwD21yN/I8eS8VIgDfSsxs1j5H0LeDpvyvwVVyS58lcou/Y5
         aZhuJRtRTm+gxY2atiVwQgu7YQyr4jJmKyGmYIMj0f5kLQMVjkMriDzo+pMpPiO6b8kG
         oRB7wxJpsVv/WI1BJxOe53rbjHh5srlerFdyuscgf1Q2V35ZXJUMBkCnqqUqF7FJZ8+Q
         zuHJd1YQ9p3QHvQV8hDqgYupDl9kwIc7989xz6tvkxAdppFYbFgA2DDw6BInMBDcjZvw
         AvAvIZ8Mm1gdoqEjZZ5sUftitBvGdDWQTuuGVYkg+/MfPNktnaWrB6clJKEJf0j3Y2H0
         GRSg==
X-Gm-Message-State: AOJu0YwzbFOPnu0vo8f4PpnJFyFbMxN01KFU6wqA9aW7EDHkXTvL2CvW
	TXNtQVpoXFwUPF2Cd6O4ZJ4+4htaph9HI9wLX7aADUUcq8rAoPte9Dcyb+0/SK6iZB6u37Tx4ta
	xziR6QulKXOFOsFAO455lOBNQ8ZsYoZuZ3v9OhmUg/Kw5ctX4JEFKOqdqVsnQIvhKAp0/
X-Gm-Gg: ASbGnctg287xUS4UcM1bBktzrtu0t7uEO4pLG6BkaGfVp/QYUhPmrYo8NInAFjjec+u
	RQmLqeyMKy+Td6k/051EVqElZwkI4WqMf7QjhuhbmvpJFjIdGyd3oTCRRkHGFgHMc9YDVMHpj+D
	n9ZzH+5OuwQCKqpKDzHnpW6Ly8p0C1H0iho4ebmHWTf9IzNZhTBlcFyduqt6qKZecCtTPX6oHVG
	Vt0KFHYoylG6ekC36mUFIumGKz5a1ddBxYLEO7g0/ZyYcY7JS3Kxazt5iuSe64zGtN7GHWFLd23
	SkZIwy9lVBwwqWfx4F4gSgJDvOqgcrNz81jR3eqz5kiuc8Rt1rfBq+VKWMCATTgAaqEPTslI2vR
	JmUhFX/mATWVYMIXr66J/BfBH9AaA0fVO9+mkmknywXNpEnzcvi4Kxe+x
X-Received: by 2002:a05:622a:50:b0:4ec:f7e4:8a0e with SMTP id d75a77b69052e-4ed725b07cbmr55865651cf.9.1762426206427;
        Thu, 06 Nov 2025 02:50:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAqEDvEf+gqv8veBiEj9E570Xh7oP7Zo77xgq9b/IAxf+sUFMtd0HH5mOmS6G7k1cOolBRfA==
X-Received: by 2002:a05:622a:50:b0:4ec:f7e4:8a0e with SMTP id d75a77b69052e-4ed725b07cbmr55865501cf.9.1762426205989;
        Thu, 06 Nov 2025 02:50:05 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f8578dfsm1505891a12.24.2025.11.06.02.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 02:50:05 -0800 (PST)
Message-ID: <9b661c7d-6730-428e-ba24-bb35afb011ce@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 11:50:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-iot-som: Unreserve GPIOs
 blocking SPI11 access
To: Xueyao An <xueyao.an@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251106102448.3585332-1-xueyao.an@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251106102448.3585332-1-xueyao.an@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: A8YaNIUO7gwTOoM1h2Ir53Pyh7YrFVCF
X-Proofpoint-ORIG-GUID: A8YaNIUO7gwTOoM1h2Ir53Pyh7YrFVCF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA4NCBTYWx0ZWRfX1jZtl1lhSvJ0
 Ag8K54wo/J+e7uuX2nBbdzhRps+HpqJ83Fl8Vv6crmUmBN6GXWXGv+Tdm1sa+WbjAPGjHmB7KV1
 o1Q5T5mNc+XLeJfFPWFC3VCAPRHtY5PDRlIDuhvb3ccT0U8gbnnGIngyYhkXqxdNtpA/qBvUpno
 zdL/M103iAByERKPriopwK0jznv09mvFTAkAEMe2dfphUGop1MxX0uN2TJxZkvJjcJmTH2eFSYN
 UlvZaN/UQ17d+f9dYYY4vdfYaEuvXy6xgskJQlHzyBRx2XuaLmNWRinycI2ABeQXhXEs3Bh9Bv6
 Ngr17dSMrc2w1VTudmI5q/S7zmKXIagNb2RNSLtZ5U+XaO3OnDhIdD3Agr1R6qzRPiM38KmMs+D
 hAMbmC+sh9gwJR7rF0p+ru1Ctl7m0A==
X-Authority-Analysis: v=2.4 cv=X+Rf6WTe c=1 sm=1 tr=0 ts=690c7d5f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rx43dS7NxoJ6fGjPFHwA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060084

On 11/6/25 11:24 AM, Xueyao An wrote:
> GPIOs 44-47 were previously reserved, preventing Linux from accessing
> SPI11 (qupv1_se3). Since there is no TZ use case for these pins on Linux,
> they can be safely unreserved. Removing them from the reserved list
> resolves the SPI11 access issue for Linux.
> 
> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> ---

Note: you sent a v2 of the patch, it's expected that you provide
a short changelog and a link to the previous revisions.

Please switch to using the b4 tool, which help you meeting that and
other expectations - check out the internal upstreaming guide

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

