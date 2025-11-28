Return-Path: <linux-arm-msm+bounces-83790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F30FDC92555
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 15:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABB923AC1BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 14:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BFE32ED2A;
	Fri, 28 Nov 2025 14:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iG8Ozd1t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+Ou6BND"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD09D30F7F3
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 14:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764340205; cv=none; b=HqJpaeoFUPAle80FIUxkp9aY0Wm3ecBWxEo5YdjO8u3fuGPq9fVGMNHWcyvU4myGBEuhNPgU63xhcCAEYyZK2ivsAbD23vrv0Ws4u6OzN5CDviYTTLyGwftqOZV8w/qQNu+9FH7pshYi808X8fSaU8dVSd232VtfU0jGjaFhyGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764340205; c=relaxed/simple;
	bh=tRNBe4fjRO1hx9IAslahBhVvZMSRTvihSK2tbffhBp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D092aCATE6ZumZaYD5ScmZfmehXItCu3Gcnf2EXcJUJNhRUlaZTgu3ijUCmlYt0lam5eVxXluoQ3+AXXP302qEZnFPjev4F1HcirLd7LwW9s8/GPtOrtFaV+hHIoXPdy/FoL/Wx2Un4qttB1aNZIKt+JAs5dDnrOWi0+pQO/qf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iG8Ozd1t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+Ou6BND; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8OgbA3627217
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 14:30:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I8m/Cd13luBRYG7SBIJit3CvmjCN2CxIcV7mIbzooIg=; b=iG8Ozd1tc2RsfYFs
	sSv5uIi6bkvfKUUvQYZ1efBDhdy/Nsbf6VL/TCtjnHct7tR1j+5J/fZluNL/wERy
	OCV+HreSeU4pB/zn2RgitxSg+nh7g3zdr53Smk5QLk6hQqFc10eEoxu0G/vjtUu3
	AKglRC/z5aFpId35ztl8iNZOsxTXYNw3QdmPkigDyoYijxTA5mctG6Z5majWcX62
	436bPIlgqeFEexVB/FyqAfcnY/VXv/lAb0iQHzLB4Z3FWbM0+3mDzmAxpkWVdyrt
	GLrEkWc0h8sElqYW3O1gddf37pSuOrpeOpHW3f14YJJcgDYHaS1E8nQ23IUgIetm
	tDETWQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmynum57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 14:30:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso2093950a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 06:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764340200; x=1764945000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I8m/Cd13luBRYG7SBIJit3CvmjCN2CxIcV7mIbzooIg=;
        b=a+Ou6BNDQRak3prVWQh81bkpVgDNzdYyb+5ZyD6aOjZLwfOl0ExP6GZZwWUzFZgDzE
         e0UtmDw+r4oqr/LYxYrXO95EGKbiT7D20QGX9vcA2BGAmvdvcYudgb43W5gvVc1RhEyP
         l7TbSOsytajJ5oczGPpUplZd7VpdzyIivPGGxWJNgLYpFFui4+TKHuEMbCknVO7XMu1H
         pOpbqgH3vy93cCpiycb0F0TozETIyAz9Ko+vbUBnLfvTRiplJ4H4mdo34xnb4B1l8VbN
         8EDdRR0PNXhYbJDjVCEbWJ4AMqjCDiHZxEn5qxjdXSmjQiVvwrN54GuaP57SYImAkAo2
         Mb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764340200; x=1764945000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I8m/Cd13luBRYG7SBIJit3CvmjCN2CxIcV7mIbzooIg=;
        b=s/JWxNq8DkV0q5KVqTE5lFaqhU1rVQAoYmlYqcAt0zxtLce8dicxn1+SIRi/TaCSRT
         QEM3423GR/xwcWwxHOX9TBAYonYq8bc1nkqtYqCeyJnnIEM6X2IYzWOnnSBE4wtGdCJE
         UmToipjSdr+XCWDDDI0a5m1AZQ/2S+GLS/3EpE5akEJGEJe6I6hQRePUBdFEGuRXv2bl
         RV3ER/Ii3pwaIq8MUeqOfXZpy3xceBu42YT0eQ2klpu4qQll73AOrDS83zLjGpnN3pAi
         BUnQFkxk2vVu2Fll47Ok9vnj2CWRRGHgaw4+3Ng4jtmVr4VCyOi3u77aK7nY4DySCDjd
         NI2Q==
X-Gm-Message-State: AOJu0YwuAFOhoEQMcjRXtJ7vpGhylVH4A02SbE/YzO03yUexaMNFwQgD
	RBW0q2OwPP4J1M0+xhl4akXQhEdv+YMTiri7pzHUIToHdbUTIDdp+U2tLvbMWEJOEt9RbKWkcZL
	cpA3V1hpSEW1AbfNHLpTQp41sfouW9KKSXzhdaKfsS/BqoXekVWcYTdbv/EnLEAvTjOPe
X-Gm-Gg: ASbGncvbaxnsTngmll1twg7RLTSn+avvqVPjUt3GeA8FKfR06vetQ4rnGj3SGpVCE8+
	6jhb6EQMiOcM+ZWB4ZW11gF0N1pCtwImSU89iFiRrMyGowbU1E+MLJiPD9Ort+ZzP8QnYW5av5+
	YRxTrUkYbCyLMcaagc8Zeo1WgfgVu4S7vw31O08WsBPGhXjmrp2bg3jBjC2jY7c6yCXh74ZoHJt
	saGOYu94r8Wso9byiXMo6SHBNu5eexGCdZz3eWTh6ATMDl7LBKTs8GPFXBUOYDZNT7+1FHJSe6J
	VCPKS2uYsps/r8QJVVvZ9MMp0M1IxYM82nDo7DxVl1nwSYcys/WdsSjkRJ2TWnOG6m3a12aREgn
	S5irI2rODaaC1ivQH3y0J5BBVKNWwUmXtxw==
X-Received: by 2002:a17:903:234a:b0:299:fc47:d7e3 with SMTP id d9443c01a7336-29b6c57224emr319638405ad.31.1764340199727;
        Fri, 28 Nov 2025 06:29:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQDWkrRLq6Z/YilM0CQ3+TKY3UGACkoNWNyTlguCOA8KyIumCSBYe74T3rnKhV4ld7zREH+Q==
X-Received: by 2002:a17:903:234a:b0:299:fc47:d7e3 with SMTP id d9443c01a7336-29b6c57224emr319637915ad.31.1764340199231;
        Fri, 28 Nov 2025 06:29:59 -0800 (PST)
Received: from [192.168.1.119] ([183.192.29.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb54c6asm48719675ad.90.2025.11.28.06.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 06:29:58 -0800 (PST)
Message-ID: <ed2aaebf-f0ed-4eb6-b880-9c39d4f0533c@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 22:29:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] clk: qcom: cmnpll: Account for reference clock
 divider
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
 <20251128-qcom_ipq5332_cmnpll-v1-1-55127ba85613@oss.qualcomm.com>
 <2d83f0d3-4798-4183-9e3d-9972db706cdb@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <2d83f0d3-4798-4183-9e3d-9972db706cdb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: apgjXbWz6FxTzr8-jjjWI-lxyX1Mm17S
X-Authority-Analysis: v=2.4 cv=QOplhwLL c=1 sm=1 tr=0 ts=6929b1e8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=sdhyOahhduPysBwc4dimug==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=HfvJj5BQp2OzgikQKL0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDEwNiBTYWx0ZWRfX40fmt7HKppE8
 cBUO7Q5aADX7fmD56y0oZfr/D4R/csCL2G7ibIjwEHQtDdYdZ55V5iDur3Nea1ldGO9iWzcrk99
 Cw9fPEklHzMv5SdTn/4f+rAvk4i4b3LHP3f9jLbM30OxeBhqe/Bk0QpGrErm46UtabeJJFNMX7N
 CHXQBR/H+HtR5cAIBcN8jmcPruAz0mGdje5HssekrqkRG4sv+ghTIj/OdObN5TtnfJrGTdzMWJt
 mBrMAfkpiQ29hkSnIGC59GB/e9FqhtvEc3MtcmwRWSgKnWf9NjDI6ayQlhZtsZnR4x+pyd/afDP
 MAka41IZvvkLjuoETq0dWdn2c5wtCbBdPDGSRHwaSd8Xh+dlEWDkUprXtVaCg3xCFeKDX3fBphc
 Cs8OwA5gE1MnozU1OUZyi/TbC/xQww==
X-Proofpoint-GUID: apgjXbWz6FxTzr8-jjjWI-lxyX1Mm17S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280106



On 11/28/2025 7:38 PM, Konrad Dybcio wrote:
> On 11/28/25 9:40 AM, Luo Jie wrote:
>> The clk_cmn_pll_recalc_rate() function must account for the reference clock
>> divider programmed in CMN_PLL_REFCLK_CONFIG. Without this fix, platforms
>> with a reference divider other than 1 calculate incorrect CMN PLL rates.
>> For example, on IPQ5332 where the reference divider is 2, the computed rate
>> becomes twice the actual output.
>>
>> Read CMN_PLL_REFCLK_DIV and divide the parent rate by this value before
>> applying the 2 * FACTOR scaling. This yields the correct rate calculation:
>> rate = (parent_rate / ref_div) * 2 * factor.
>>
>> Maintain backward compatibility with earlier platforms (e.g. IPQ9574,
>> IPQ5424, IPQ5018) that use ref_div = 1.
> 
> I'm not sure how to interpret this. Is the value fixed on these platforms
> you mentioned, and always shows up as 0?
> 
> Konrad

On these platforms the hardware ref_div register comes up with a value
of 1 by default. It is, however, still a programmable field and not
strictly fixed to 1.

The ref_div == 0 check in this patch is only meant as a safety net to
avoid a divide‑by‑zero in the rate calculation.

