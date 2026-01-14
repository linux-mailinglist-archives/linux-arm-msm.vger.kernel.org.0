Return-Path: <linux-arm-msm+bounces-88992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26240D1DCB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 11:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A471D3054674
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 10:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE1438A2A5;
	Wed, 14 Jan 2026 10:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osyvYa6j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RlNm+YCT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E8638A294
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 10:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768384888; cv=none; b=W4mAnG4bnIWsmX2V49ctOdDyRNSrAOltiUctjCk9A7vKoI+od8Iqj+dmVCIwqc/sB8A5+6L1YS/QeGGdbbFf1Rb3q+XofjFLMwbymx/0soGZsjuM65ch/ehf0ncLcPdH5XNcJtLS7hxnaStC1v0iME82e0Qr+dDL6YcI2HqEoBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768384888; c=relaxed/simple;
	bh=Cb6FC3gtzETC+k1SGFS4tqbxeS5YcpStP/VPK+kKkgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=otwLOAbMkzfcYHQX73Aoh5SwA56PaFv0lQcvMVGCFYmlWjSigRskyCWEa3otZSTVpVJyFWpm4GXHOisLBzmQi4ywXScY6DE2+B1FPWZyz36KQ5onRXvc8TkoG2Eq94mFUobcl6PCfBviAuVEOjxLXW8XqCHC++ZcbCuTFUwxzmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osyvYa6j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RlNm+YCT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7jCwH2081590
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 10:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aEIUa58QzMdh48xJTS0LDLGFM+1ppe36houtUvK+EWQ=; b=osyvYa6jcaLgJAjM
	LADxVEbgZbfAaIWJ2FeBLoe8YdcM2wvgBJO1pTk51xfzBc3fvArSOSqsLls1U17/
	PmJgD5wJ79xm1K16yDBDTd1xPNxcTWxdbXlb15FuVTA6bTIxKHOBjJhQSLLILL9j
	KcGl/niZmKU6LGRFneWyRvD+1M3z6KWpvjqmy9jM4TOtzNQjEVgmaTwlqLGxhgsw
	QF98GshxSk6xsnJ076yD4suUhJkBmMkqFx4+me5ZRRZ9H//3CtCn9zvjR0S+sMsx
	w6Oe7CAtzFx307vViC4N4s6hWXSZmOBc6vqZsLtM8dSMSHzvHDqRUw9+8litlr1u
	Uhxn3g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnu58tutx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 10:01:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88fd7ddba3fso32739296d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 02:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768384885; x=1768989685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aEIUa58QzMdh48xJTS0LDLGFM+1ppe36houtUvK+EWQ=;
        b=RlNm+YCTznGoqMVcONzZone9tW8p+0rIdBxzglFbenPk0u9gS15p3aTBz6Pc1q8qHJ
         eanN4qAFyJW0B9Xlqsod0YEMSd70IpRovsCXoFZpBQpqH/J1uVg+13AhDZ0ObX1x/7OD
         oOyN8KPULvjRWJhUlDzPrtnJM71HuZF0Um7ynorUsGJZgRCuDe+5wKRztcT+S8Y7+9jC
         H0fu3+/kYIMBnSECKEJqzhMMABYVwK5PgWJOgphp/u+idEGwMm3Bt4tbAK9qjxM1dz+r
         EhzilD9upGtwmeeWjyA4q58yRZSp0QqPQX+6ii8lmKt73SFeIGl3+1d1UoLrRbo7fvP7
         U7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768384885; x=1768989685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aEIUa58QzMdh48xJTS0LDLGFM+1ppe36houtUvK+EWQ=;
        b=S+0hNdabOWP/yNbgC68Hn0MlfB+zq396Jk8HRX2alrWI/lqnRZU4gLdPtfbJtPZOnz
         yu7cygLXJh6C1xxA95j4l+G59LUlJlSk9d37MB/aWAnsRUnda4zYhERSOvMjjR2BtnIZ
         uM2r0xbvrTfXb9scAXQFHspejOIaQQujX4cJkvZlJOVQwJJpvmemBd91V06CJgNpCOuI
         k/HJgEaNWXaj0aHsBprFS8x6saEsLOaF6HSNi/JOgSBp1uP3fbaPgvTHYif54wTNnUSg
         Isf534WFwgU54FzgnFW2dM5ob0PhVLfelW2uK9eFIoPhuiUv7Q+o3vRXRMv8QFHXGi9q
         9kMA==
X-Gm-Message-State: AOJu0YwHl6xyqLfmcfHH/c3GnSuw1oENsFs+KmQlT1J6ShltXevjFIv8
	ayiPcX8EnGkjlXQ14mk3hKU+DZd9VaCUeScb7y5qjgDE1jbS0OLhpRwqNf8/K/2NWewERIXwzw7
	zYs5hp9cO5hCKqhMJXgMfRx7YpbWxQCFjz8jEqOViQ9hcnIVqEF7flhEZRPSw9OX72PmKBTd7yd
	C7
X-Gm-Gg: AY/fxX4obD1FS2CLNPFDpsDhKG54yyeXDiRkmtFmQ+LjBp4SaOniwAJo+czmFERp2Bf
	Sm116mx7Ce+L/SQDt1PNdK4QU+rUc+guM2SjmfC+tsWhO9SYQuPF7Gml3+u3Guz28zSMsq/1sm3
	H1IMbdLO4eQLwf5MTQb1J5CX2O/Iallh8ufdx1BgNS2+GF5ExcbGG/EiJ80/5bmokg0nyIoS3xd
	4wMRAvBzBFterz3OlOceATrY8rbcOsXoVge6+6mohhSpSGQmL797ODlrmjkED0FFDb3a0uornpu
	kS8MSipIYu+uUk39gfSDJdyCOPeML31v4TDc4DVGX9jH1zB3tFj3R4kJJw3rcowRzEFWpf4clfy
	TOEyhVPMXdyWIn60Ys1PBa0w7BSzklyOuC8A93FAy8aqrrb09a+0cG9kRdbZ9RTCXKPk=
X-Received: by 2002:a05:620a:c55:b0:8c3:9ae3:1a78 with SMTP id af79cd13be357-8c52fc117bdmr208657985a.11.1768384884905;
        Wed, 14 Jan 2026 02:01:24 -0800 (PST)
X-Received: by 2002:a05:620a:c55:b0:8c3:9ae3:1a78 with SMTP id af79cd13be357-8c52fc117bdmr208655485a.11.1768384884440;
        Wed, 14 Jan 2026 02:01:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b876b6865desm95154766b.12.2026.01.14.02.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:01:23 -0800 (PST)
Message-ID: <1be287ac-fce9-4f27-aa88-b1f786e968cd@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 11:01:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT] interconnect: qcom: implement get_bw with
 rpmh_read
To: Georgi Djakov <djakov@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20251106-topic-sm8x50-icc-read-rpmh-v1-1-d03a2e5ca5f7@linaro.org>
 <8eb528dd-71fc-408e-a97c-d484198e4f81@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8eb528dd-71fc-408e-a97c-d484198e4f81@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4MiBTYWx0ZWRfXzpqQjCrcQuQq
 uGhrUsDO9Mbq7JCbj+EtFkMmOiitfgJTC0Kpe37HCcpQSNq88xD25lKg7zPZM87y2pP7aH692oq
 cwv6tcbWXgA4TRFklcsTueUh7o40njANDwO0DbvOHcdefVbH+fo3zqWMhyfI3UgSrDmX/PJQX03
 hjqe+Skhbwgtc7r/GNpvqsFvC5+EAPeAfzZYGIIwDa/N8c06MGrnUAm2aqjv6IlxctlBNYPmpU4
 WYUAyESjkbQAhh3P/9Pxxb1kk6yuzobcodQo/IH5J76KcdQCC4A+B28wwbiGly7m4P+tkmXYY8N
 +UHfZ+LxHj9pGQBpJJ1T134gatLaleYI4vMFoNRWHEKceqIUf9wZjxN6x51/bPRG3SCTl/yRYtD
 AUEo8aPWQo3AMHKuTM3PiY84n+wfwSww268f4KDIEorbizNLJQSfLnt2B9XbtlwAY02p6EihxxP
 ZyDsoVEr3kMN2OyZS0A==
X-Authority-Analysis: v=2.4 cv=BZnVE7t2 c=1 sm=1 tr=0 ts=69676976 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pn0_eU-81vYunYMLtHMA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: M6G84irDD9sbnYJAxQRKbcXPZjmXu3gs
X-Proofpoint-GUID: M6G84irDD9sbnYJAxQRKbcXPZjmXu3gs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140082

On 1/13/26 6:53 PM, Georgi Djakov wrote:
> On 11/6/25 6:46 PM, Neil Armstrong wrote:
>> Since we can actually read back the APPS rpmh interconnect
>> BCM votes we can actually implement the get_bw() callback
>> and provide a coherent average and peak bandwidth at probe time.
>>
>> The benefits of that are:
>> - keep disabled BCMs disabled
>> - avoid voting unused BCMs to INT_MAX
>>
>> If the interconnects are correctly described for a platform,
>> all the required BCMs would be voted to the maximum bandwidth
>> until sync_state is reached.
>>
>> Since we only get the BCM vote, we need to redistribute
>> the vote values to the associated nodes. The initial BCM
>> votes are read back at probe time in order to be ready when
>> the get_bw() is called when a node is added.
>>
> 
> FWIW, I was able to finally test this on sdm845. Some nodes are indeed
> showing reasonable bandwidth values instead of the default INT_MAX.

As I learnt here

https://lore.kernel.org/linux-arm-msm/1e7594dc-dca6-42e7-b478-b063e3325aff@oss.qualcomm.com/

rpmh_read() will only retrieve the currently active values, so as-is,
this hunk:

+	/* For boot-up, fill the AMC vote in all buckets */
+	for (i = 0; i < QCOM_ICC_NUM_BUCKETS; i++) {
+		bcm->vote_x[i] = x;
+		bcm->vote_y[i] = y;
+	}

is lying about the state of wake/sleep buckets

this is ""fine"" today, as I don't see any "if (old_bw == new_bw)" checks
across the framework, but debugfs is going to report incorrect values and
if anyone decides to add the aforementioned check, it may introduce issues
where the values aren't commited to the hardware (because Linux is going
to believe they're already set)

Konrad

