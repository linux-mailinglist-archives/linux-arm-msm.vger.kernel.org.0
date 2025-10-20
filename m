Return-Path: <linux-arm-msm+bounces-77955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 902B4BEFBFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 09:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 189AB189CE1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 07:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7EB2E1F0E;
	Mon, 20 Oct 2025 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QdoNfdUp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9812D7D2E
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760946923; cv=none; b=boZRYxUyCUL+vZll/SUJ1pAg34OomsUAZrNvtUecEhN0jESBJY8Q6u1YyMbWDt3hDn37Xn37+/qiSnGWDy5KQk30/AIUwZseNuJuDUMQU/ORiP/i0iflE2dEOxPmfytojSZOJ1bNRSaO1O2XQivlY0aOc/EL5vuH1Zg2Ry2+twg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760946923; c=relaxed/simple;
	bh=h4HiajxzA1CmxWNt4SKng6oupQWXzBhNBClD4/b9L4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TxhIonF1GH2uewMCVfX8W5/SCwbrsyhi0n16IDWM8brXuMne65vZXKFAnwRezHrlu52GZcwzpdWk7viGHkUWVeEyxFTpXY6mS9Tg1SODUmcWla7hGjS0xQRAIAsemx/hknkjBkOqC990q0R8oU4tJqJU0I1jvMWSFPxbDcSu8eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QdoNfdUp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JKOCQt003617
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B0MqLkW+f4N4oFjZMeCRTrse82lpLs+0SyfGYBzgcts=; b=QdoNfdUp8mCI7a/s
	PR1yg584DCplcVlcnIxV4DrsQLp5KYLWKOtyK3nfWFgNhBI9fyxaI5M6rMeAUdNC
	xFXX4WkxjASM5N96WEZc8boNcuR5qTeTjW9tTPbJnXYNmPXcwSUehJxf0CfQrsYT
	TnPifrHFnupWY+GHIv4Ja0hVETGb3MaSN7UviDPe4Hs/0Vfx2HC7nmGLFaJjr4NJ
	byll4eguPY9+jNGWQ2G8bjvFgCgNqiamps13mrc5WeU8n0jLWRiu+o0lR4yYhriR
	eI7o3bINW0TqaHIOu2ljyHQeOjz6G1DNffSWYX+meKipLXE9QsKtq62qXsfl/2+W
	fT07ww==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w7v36c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:55:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-890921c382eso118338585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 00:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760946909; x=1761551709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B0MqLkW+f4N4oFjZMeCRTrse82lpLs+0SyfGYBzgcts=;
        b=RoeUUOfAngF7Grf5ughzs92o4i8+/ULnZmXgSfpMevxZJqpmk/RRkqZqOid9X7HvPh
         kXz5LeXb1rr349FQs4BCSDgzRcYeEj5OcyiEhh5Nk1YC5cxT9mPrezta+zVtwC7QxhBz
         MvewiX8KTXjk3AxII8oGYCJbk0klfYUQ5IQchPXW2twTpUqE6lWQdts4JAAutgj9snMq
         9ItoCNbaOjadCtbxgqwaNZKMFGl7+u+U2W/y03XMq/X4/zr3MmP/78kpr7fWjaa521kA
         AdoClWLqIYCow3Ils6/e37GHrM2de94CLEqyt8z7xQtNcEVVSF8JDkBLLBzoTAKBQg6d
         ccBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRjwwfaSYwfEYyRvnXNCweLE1FIhT0OJAIVv5/z2jmsrjCJ1xpth8CgBJjG/hoR9aRCa/70ZkVMdYjHHsn@vger.kernel.org
X-Gm-Message-State: AOJu0YwHj0zEjSNHpdFxurNZhBAY9lp9nbM4vXYo9wU2AS3cwSC34FSq
	8QWZrcefNQ4HgzqmKCuSTqkpW/w6S8Qfi/zMtu1YuE31tUKscg4hPKxiNk5JK0lKmau2sWouXKT
	yPTLd588QJydBMzoOCWlutHlmMXSiNEFuqyoA/52BfTSX7Eq7fBPu30wC1VBYMgsm4K4v
X-Gm-Gg: ASbGncvXkoCsBOeTltFeMQ3Fk+hUGPQaOh3QVDipRC8WupDHBdBxuFPo93kkc6LnOoz
	cSA7nCPHBg13csZX38b8E3Exk7x2H7zF7LgKnGg4/ZPogsW7LJqtwbrSQVBteWgNXFa/kQNQFzO
	i9JSNagnGsHLMASxeVP+N4SDsp8diS0DNMS58/sp3Y/JeCj5rGKnf6Z5NLWu0SM8vGaGxTLTp1S
	RcIoMed7xWHArBdUT63QU/9MiA/+xWJEVOqo68yiNhTOtiBbntGWq8g5RG2iq4GE59RSseOmGhq
	qPi7sLLG9zJkMRf+JCM1oWVccbr2YjrMBQJy+2uGc3Lo4Xf/ysxffPT2NY1CaQc9GTuMBNkr2hn
	nCkio9/iKifokL4Wq1rLhyILSJJqApth4IrKzau/F+I3VsXLDx3wxNSNs
X-Received: by 2002:a05:620a:190e:b0:85a:4bc8:3d2d with SMTP id af79cd13be357-890706fe6admr1086223485a.8.1760946909220;
        Mon, 20 Oct 2025 00:55:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnqwQmG7J94vQWIA2FUvtne3ArVMs4rBsBb9NG0DgZ3XvsR7GgvmNul8r75lm+yVlBgyfpFw==
X-Received: by 2002:a05:620a:190e:b0:85a:4bc8:3d2d with SMTP id af79cd13be357-890706fe6admr1086221585a.8.1760946908328;
        Mon, 20 Oct 2025 00:55:08 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e83976afsm712000266b.34.2025.10.20.00.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 00:55:07 -0700 (PDT)
Message-ID: <f2f1b46c-1c1f-427b-879c-7fa0bbb783c3@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 09:55:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: qcom: tzmem: fix qcom_tzmem_policy
 kernel-doc
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20251017191323.1820167-1-rdunlap@infradead.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251017191323.1820167-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX7RmqNBiZiXA8
 R/tJ3U/vXrdHEw5Y168YIMYl3Z2CX7jCaq9fpsEALMYowxP3sawOdrR/WkqVRRqNjj3SzgOdVRA
 MFiJIqHmT+9Pfz5qaZGZqpOph9VtRTRwfTHmlyzbMFAycQ1Q4VpFfYLkgTok0oJ+1tWXZ026GEz
 Y5v1UM9Zoivw5Xqm6ud045iUt21ApeGQvLtWdEYsj0TVTkD3RwiZul71dUs8M4sVGdfHy45Z+Bs
 gYH9E0duCZOVpkyiUHLbfSiW/A/wJuMpXoJzkny1Pdv2NDQ1RICtNjAaW6V6/R02TvkoKvj15Sj
 aNuoYd3m7mwsYz17O6IbwYg/mJkWF9pY24+iyN/yqOk4t2IKK/quMimxJLMIbCru6UL8ixbw1bx
 cXT47nRuyU20c99pViNmedgRZeQeXQ==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f5eae8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JfrnYn6hAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=anZyeu-lZFNz4K4B6V0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 01yBRGipB8vJtoDhJVj3WYo3OeLuwjoF
X-Proofpoint-ORIG-GUID: 01yBRGipB8vJtoDhJVj3WYo3OeLuwjoF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

On 10/17/25 9:13 PM, Randy Dunlap wrote:
> Fix kernel-doc warnings by using correct kernel-doc syntax and
> formatting to prevent warnings:
> 
> Warning: include/linux/firmware/qcom/qcom_tzmem.h:25 Enum value
>  'QCOM_TZMEM_POLICY_STATIC' not described in enum 'qcom_tzmem_policy'
> Warning: ../include/linux/firmware/qcom/qcom_tzmem.h:25 Enum value
>  'QCOM_TZMEM_POLICY_MULTIPLIER' not described in enum 'qcom_tzmem_policy'
> Warning: ../include/linux/firmware/qcom/qcom_tzmem.h:25 Enum value
>  'QCOM_TZMEM_POLICY_ON_DEMAND' not described in enum 'qcom_tzmem_policy'
> 
> Fixes: 84f5a7b67b61 ("firmware: qcom: add a dedicated TrustZone buffer allocator")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> v2: drop "area:" from Subject.
>     Fix kernel-doc comments to have the ending "*/" on a separate line
>     by itself. Otherwise scripts/kernel-doc becomes confused and skips
>     the enum and the following struct!

this is fun!

> 
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> ---
>  include/linux/firmware/qcom/qcom_tzmem.h |   15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> --- linux-next-20251016.orig/include/linux/firmware/qcom/qcom_tzmem.h
> +++ linux-next-20251016/include/linux/firmware/qcom/qcom_tzmem.h
> @@ -17,11 +17,20 @@ struct qcom_tzmem_pool;
>   * enum qcom_tzmem_policy - Policy for pool growth.
>   */
>  enum qcom_tzmem_policy {
> -	/**< Static pool, never grow above initial size. */
> +	/**
> +	 * @QCOM_TZMEM_POLICY_STATIC: Static pool,
> +	 * never grow above initial size.
> +	 */
>  	QCOM_TZMEM_POLICY_STATIC = 1,
> -	/**< When out of memory, add increment * current size of memory. */
> +	/**
> +	 * @QCOM_TZMEM_POLICY_MULTIPLIER: When out of memory,
> +	 * add increment * current size of memory.
> +	 */
>  	QCOM_TZMEM_POLICY_MULTIPLIER,
> -	/**< When out of memory add as much as is needed until max_size. */
> +	/**
> +	 * @QCOM_TZMEM_POLICY_ON_DEMAND: When out of memory
> +	 * add as much as is needed until max_size.
> +	 */
>  	QCOM_TZMEM_POLICY_ON_DEMAND,

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

