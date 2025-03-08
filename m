Return-Path: <linux-arm-msm+bounces-50702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFF9A57B46
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 15:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38CC33AF664
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 14:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9301DE3DF;
	Sat,  8 Mar 2025 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HC2ekB4x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23E0140E30
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Mar 2025 14:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741445570; cv=none; b=VkDjob9fLWVCkZiaplg4mk0v3Hoc44qXBvJhA9R2iZd26FwzWX+74NDnfmVTlBqaf3OY6UmELAOcmP5H0j9ipGdRF7PiXtkg6arLYREDRn8D+Tjn5dL/0U2cQxgecOtzSuHnnD2uXJUy3YtWjyxsr9si1akijkGw+e143OgMGTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741445570; c=relaxed/simple;
	bh=anRYeYF309AXBW25z7R2hL8RDDSJQseUCtoq8QWO5XE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e3qZVH+5XpAOBttmmYAgqslmW6bdSEMQbtWEmcTD7ANQOZONbPdxXkuKCxQarEBTagvVqK4FITtRDlJnwYRqDqD2S8XhfWKHt/E7HiIVojMStHiIOBJG5nm2eOD8ZvCuas3c9EFmBrSnv92vq3g0Snrwb2GNIXUPhYXp0uImlXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HC2ekB4x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 528Btnb6019678
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Mar 2025 14:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FRjkl6YhFHYJ1JWEogAn4n+Snf68kuUomS1wUveNVAI=; b=HC2ekB4xQd1nCpfI
	Nk+5TaQfbL8FJuh8JC2aGxlx6o8uX8mjA4UBrdT70LdLdO9he953guW6Q+kswF3d
	DZjB/UW9q8hwE8Kn4pOSq1ZaAbZNNFLTM6bFyBF084Pqh9yYDq+bxFvQyszshd9d
	8L8u5GbB6NJCkIV+XID4xzMa0iIuEOZcgMoVH00dsDYwLpW5cVfowRSDTmZiAWBc
	eyKk1M8uBOsJBSwwQ65G+im2TFBwge0m/qBCzeRZ+t7i8ph1Swdjb+pxjKRYu8Vz
	NcStMfZpXFyzSna07sRSWOxzyCBUyYje1z9azBbpxE4sVqbTMzFlG1YZM749x0wf
	jF0cIA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f0prq0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 14:52:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476783cbdb8so342031cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 06:52:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741445564; x=1742050364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FRjkl6YhFHYJ1JWEogAn4n+Snf68kuUomS1wUveNVAI=;
        b=kvHm9LSxpfypK8GNb/CMsQXO1jXYh8vF9UitLXwR4T0vjPGQRCmxON8ZE6kwjUxDhQ
         Qq4kulgvLGGD5XYoQYljCZ7XcZp9YKt0nZAWlysR2sjdgfGZNM/9eDbrhXgWH5KqEhZw
         IwQwfznhRh6Nckvo45pRaDWQl/mAUXZskDgCm8ywCBVQBcsMlcRpl0PhBIengqIqWeXN
         IZhD+KFhEi3sKKr5NbsWpcICN3RsgzxoxrBbwmOrrlHXINW7tBcxDk/xa2IbHwEWnEB1
         vyjTmIOBKUXTXokH0tu/HVBrLIv/8t7MBRFW5VeI0CoGc6Ot84/x0G6ukK2KpDwr202i
         0R8g==
X-Gm-Message-State: AOJu0YxBswGCQjewVe2M/MCJEMoNW85WKTJ7TNoOohYBpCXbVbjaGs3p
	+kXcmi9Y4jigcunVG+OPG4GjtTwrJKY0E5p4gr3dyi8jAHxdlRd6Dl0eUa06pdA7t8Ka86GWnIu
	q5QFLeXWSJqQ6Z+vBs5MmDj5e6EopoKOQKYJhZRY5AItj21kkLgKhMcqxFEK6Y+2036NQ0okM
X-Gm-Gg: ASbGnct8AMKcH7Z24BIy2s8Z9Qyz0f6HNnmgLM8dM6ea2m7CEnF7xN458md+tpEvLVW
	DHiWfs+lMlE+I0ZG9/ljNTXumRK3ww5eS1KDxrYB3cTppU8AyZnIBco7tjLJQeRGmTNYWX1vrUc
	q+7aJQuYO8yMvIvc6KayJweyUxNT4vU83hORkdjdesvqWA8sTwETedYh0qW/5JWUg1UF6ISB8Fy
	l8mboR4RTJc40MJxzCVTwxK9oRAK8M2KGgdIDwdjFMhgQoiv30M1vUCP45X5Z5qSZDf+ZFzH6+I
	TmMeqsgAuSKyR/tM6CO3uYKr08ealk5AwWmxdxkYibC8SOIAzBdPksx1waG8fCoTJwegMA==
X-Received: by 2002:a05:6214:2502:b0:6e1:8300:54dd with SMTP id 6a1803df08f44-6e908cb83d2mr16970716d6.3.1741445564632;
        Sat, 08 Mar 2025 06:52:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSj4DtwyIyuqnhiEdd/BEFf5BS8fhU04AWxZPyJhZB2pXyHozhGGkjEGML4zezlWGkfpna8A==
X-Received: by 2002:a05:6214:2502:b0:6e1:8300:54dd with SMTP id 6a1803df08f44-6e908cb83d2mr16970516d6.3.1741445564301;
        Sat, 08 Mar 2025 06:52:44 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2399d1237sm441737066b.164.2025.03.08.06.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 06:52:43 -0800 (PST)
Message-ID: <40eea830-b3b0-4a80-91aa-9acd67e7ab41@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 15:52:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/23] arm64: dts: qcom: ipq8074: Add missing MSI and
 'global' IRQs
To: manivannan.sadhasivam@linaro.org,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250227-pcie-global-irq-v1-0-2b70a7819d1e@linaro.org>
 <20250227-pcie-global-irq-v1-17-2b70a7819d1e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250227-pcie-global-irq-v1-17-2b70a7819d1e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VmWTypC7P6hCwQKN02WluHFu78K1O8UB
X-Authority-Analysis: v=2.4 cv=KK2gDEFo c=1 sm=1 tr=0 ts=67cc59bf cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=x0-Ntm4DP0gVEan9CnAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: VmWTypC7P6hCwQKN02WluHFu78K1O8UB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_05,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=631
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080112

On 27.02.2025 2:40 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> IPQ8074 has 8 MSI SPI interrupts and one 'global' interrupt.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

