Return-Path: <linux-arm-msm+bounces-84343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99326CA3371
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 11:27:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 480BC30852E1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 10:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34A5339709;
	Thu,  4 Dec 2025 10:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ai+P1nNw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eo+xTxer"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45875338F45
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 10:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764843424; cv=none; b=Thau4tRfvoNFagET5h3d7pTqX/zivzBLtAvuIFMtAs3Jt48BlvuuadqPlv/BnjhovbA2y3p/Uz4rgNlM38pwhHbCLT0DJ6XLeJbQqU0jFMpPHUmUuYMgS1FCaoWlImulPMV7e37ols+kD8NDJx/DXfab4meGd2G6FF0oK+bW/2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764843424; c=relaxed/simple;
	bh=ofkHLROB54ChsECzdj3Xz53UdVsn3BabkapHXMJnS/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=msiKygeRne3hZwvigdFjEUL6h6/LB/vFXTqoi5T1FyacNPlrp2nAQsm7hwK56qPVarSKlGibJ0/UaeuG5oMvXZc+zSNsaf0Sf9KRKR2oaFnvWhs5457JDgWHpztHaNws47uDOyL8IVBgZPR0XYOC44+VsovFlxcBnaexAmvjong=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ai+P1nNw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eo+xTxer; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AErwB1275605
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 10:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T0vImK6X1mn+ula3pSSqSAEbOcpsIwPad4vI0lX4McE=; b=Ai+P1nNwW0r4Iua9
	PY8B19sPPIN8qU+vKJkMGIrHUPE3Vo0QRtBqalX9q51DGRyp10j2W/A0xqu+yuwS
	/6vhjyKganAXEzJCV6YRj+k3zsou7FM5GH1OG9MwtLYMpcsudB6eyplK5d0jQXAn
	ruUFHYJRD9GbhCtlMmbXTG4HOpFRScoHRsH+qLwsJtDGTp3VCeVhtZMfaEEi3Qjm
	ZqPOS/LPCizn8lPqZh+XMcWXvWFB4i9C5eHQFvcHVYVvwA3yaGvFDHw6wM3U1PUe
	KHOFnTz+/VMzlbJ1hnI9bIrfD7VI0L30XIEtA+Mbf80IvzwkFT014B+vajcFL3Tk
	6GsvHw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au6uvrdg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 10:17:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b184fa3ffbso23888885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 02:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764843421; x=1765448221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T0vImK6X1mn+ula3pSSqSAEbOcpsIwPad4vI0lX4McE=;
        b=eo+xTxerdSamy1M4IymLxdenISZBNFO6mbSNR2fHjDuS2NWpJSmBeATr2IqI7AwWn+
         ZT20Z/9D+pwJWTBYgxh/vqLsXnPgBilRqwJr5UkcNkandHX9pExJMs+YyeVBLZ2ontKF
         R2AHlCHoleSZQfoOF5owIx8gg0xLt17MDzo4v5m1X+LeQmK6+Kw3LoH8nPGmd42Si+e/
         PLloe/NkLUi45oGY0KaHiIPnpc8kAcavG2pl1ATWfIxQQ7XmQVIg93u8XjYmQb/PNCV2
         e03taESAwWkKoJh51vWM/1hXh9ch/hyNCXkWDraK9sa0B7VJZmA4H/00BPHJCCVB+vJR
         zUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764843421; x=1765448221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T0vImK6X1mn+ula3pSSqSAEbOcpsIwPad4vI0lX4McE=;
        b=kSTKEnRXXy7iK092ZHm0Fa3f41nEhRU5hwF4QJ6LgtlgLmP4/8edi3Lr0NXv3QfVGd
         hKZiGoItOxvaHtTMtMZfSt6XFtZmhjfOcp9+2N6tZRunbuB7AmevF3hhXtVYYydbzylG
         XOp/Ij0FnAA+ekGenSF751dghoMJAE28SEYgX16WYzJ0kQHWWvEZciPHFPSO0p+1aXCp
         0FbtW555pA/wgrBrivNjHfhenYEsiS8lGIpkZ4w++PrIsqJ6eSUCAxdHgrwrDesuqiJX
         gE0jvWGsVZ+wO/B/L2fUan5NADWvxIhVd4m858pM1Pd9IEoo3LbDp6oQa9c+vcogwA8v
         uVUw==
X-Gm-Message-State: AOJu0Ywt31fZNTykW/5OIWz2pXomV2dQV3svSjet4wmg2BG65rGJgPoK
	iTcYlTmXE0193VlK8F7kBwT5LfzHod1C86QgLX7APlLZ0ZBAYFHvvTrrOvMKM1YCEXLz1DJf0Ex
	Rz/R8A4Lt7dNi2CLGrpaGEaHufzdUwd+hE2HMrRmVrzZjgAdgSfiDLb7y9ej++Gzu5QV2
X-Gm-Gg: ASbGnctldtbmt8k2HgX4rJ68GAl7PxfEuDChZy9wvPo9ok9FNGx2y9NpNzWdrJ3YQ0M
	NRQliKYBwbs9AaGQ/PCtlsZ/7zejdjcq6v+ZdtVqqG7l3XMegH30t0Kfvh9YONAZVrOjrOcHOkJ
	f5+HzIRGKGB9zBHKtb0y+mu6jZPQbqmzrhNmk4CVr+6MjIZKvAZ2FcB8/vWf7Oa1lIqBBgBtd2f
	dHe7xYZUbzr63wLuIz3YrfJc9GDK3FGE397mEwHXpaSyXTuJ5+aZJBorG4tNMP8z1+JPZF+ZazN
	XN9h0Ya1BfZovlYWayk7DGh6TFQbVVwe0mhaGajMj3kHPWCh/hJ1PybRdfWSXsnjIYcwhYYcBMm
	IV8jjttX13TxvtK3LDmurrA7QHle70IU+RkmCsjug3SzjkdWDKk9RBUvPRvqMvcGw3w==
X-Received: by 2002:a05:620a:bc7:b0:8a5:2246:bc29 with SMTP id af79cd13be357-8b5f95453c6mr463125785a.8.1764843421256;
        Thu, 04 Dec 2025 02:17:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHggcUSlMX5cJ1nBurgk4zyYwBBsopu862KGWfgRMlxjeeeTtXAhOd67UjmzQwEQ+0X69C11w==
X-Received: by 2002:a05:620a:bc7:b0:8a5:2246:bc29 with SMTP id af79cd13be357-8b5f95453c6mr463123685a.8.1764843420823;
        Thu, 04 Dec 2025 02:17:00 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49b7177sm87268566b.50.2025.12.04.02.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 02:17:00 -0800 (PST)
Message-ID: <9f8eda70-e077-4925-bc80-f95e35464f87@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 11:16:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] clk: qcom: cmnpll: Account for reference clock
 divider
To: Jie Luo <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
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
 <ed2aaebf-f0ed-4eb6-b880-9c39d4f0533c@oss.qualcomm.com>
 <1d9b953b-5af0-4a81-9182-f1cd47e772f1@oss.qualcomm.com>
 <5a982965-4964-4f50-87b6-e3b8a1182876@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5a982965-4964-4f50-87b6-e3b8a1182876@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA4MyBTYWx0ZWRfXz9ndo75XxXl5
 ZkZkuDeosHeyU8Pqe10nsQVboHGtDsPwbj9Cla6TGtU+3lYbu9ab5f9KrQ6Bnu7vi5IKmPT+a16
 gKOZwThKzapg/GizCSLJ9qxcPujskaMKQltflKfTQ2FpYK8i1tzNy5AOosFwqsaRGPddH0z9QTC
 rHlyFwqwbO5jZ/A3XoW1K1c8MBg5DFgy2BKkVnZE9lbcGOUpuWBx+GX7rk1N6iEHXHkDQ/vQqf6
 RArPkrJXZUElGNq9PbrJmxXMMLl/cuAKaRtzGQ0qURm52z3rd8VcbdumKntO6Z7ctXH5f4XippA
 gBx+nFJdpEGaci44KrEx4NUoeZkUa7KHjmxmk+0gg2iDM6BmQA2xASTF6E1GES9pGAMwe8CCJ4K
 zjYOVGYZq//5WbegNd2+MewHPpPqrQ==
X-Authority-Analysis: v=2.4 cv=d7n4CBjE c=1 sm=1 tr=0 ts=69315f9d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QLMSgXiTzcT6vDBu34EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: TsyxLlzfBtuYWxZVnTTatYSlGZDXrWtX
X-Proofpoint-GUID: TsyxLlzfBtuYWxZVnTTatYSlGZDXrWtX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040083

On 12/4/25 8:44 AM, Jie Luo wrote:
> 
> 
> On 12/1/2025 9:42 PM, Konrad Dybcio wrote:
>> On 11/28/25 3:29 PM, Jie Luo wrote:
>>>
>>>
>>> On 11/28/2025 7:38 PM, Konrad Dybcio wrote:
>>>> On 11/28/25 9:40 AM, Luo Jie wrote:
>>>>> The clk_cmn_pll_recalc_rate() function must account for the reference clock
>>>>> divider programmed in CMN_PLL_REFCLK_CONFIG. Without this fix, platforms
>>>>> with a reference divider other than 1 calculate incorrect CMN PLL rates.
>>>>> For example, on IPQ5332 where the reference divider is 2, the computed rate
>>>>> becomes twice the actual output.
>>>>>
>>>>> Read CMN_PLL_REFCLK_DIV and divide the parent rate by this value before
>>>>> applying the 2 * FACTOR scaling. This yields the correct rate calculation:
>>>>> rate = (parent_rate / ref_div) * 2 * factor.
>>>>>
>>>>> Maintain backward compatibility with earlier platforms (e.g. IPQ9574,
>>>>> IPQ5424, IPQ5018) that use ref_div = 1.
>>>>
>>>> I'm not sure how to interpret this. Is the value fixed on these platforms
>>>> you mentioned, and always shows up as 0?
>>>>
>>>> Konrad
>>>
>>> On these platforms the hardware ref_div register comes up with a value
>>> of 1 by default. It is, however, still a programmable field and not
>>> strictly fixed to 1.
>>>
>>> The ref_div == 0 check in this patch is only meant as a safety net to
>>> avoid a divide‑by‑zero in the rate calculation.
>>
>> I think some sort of a warning/bugsplat would be good to have here,
>> however I see that clk-rcg2.c : clk_gfx3d_determine_rate() apparently
>> also silently fixes up a div0..
>>
>> Konrad
> 
> I agree it would be better to at least flag this as an invalid
> configuration. I can update the code to emit a warning (e.g. WARN_ON
> (!ref_div) while still clamping ref_div to a sane value to avoid
> crashing in production. That way we preserve the safety net but also
> get some visibility if this ever happens.

if (WARN_ON(div == 0))

sounds good!

Konrad

