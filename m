Return-Path: <linux-arm-msm+bounces-85692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBBDCCBF48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 14:17:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D659F304A4F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 13:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC25033A9ED;
	Thu, 18 Dec 2025 13:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vi2infJv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9+FNPi9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6751533A9D7
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766063371; cv=none; b=oaaieApnDr1+PsFMAE+QZY+c20Vmk4DBfNUqNrXUmgPgQCoLfOzlRGeCvIJxk1OSy67D8RxIHGttKoEsYKNXkvU5OxVNRXpSUEgTlsfuoBXVbUbdOPkUXTyOxgMhoKsmDOSb8BjVm74DAxlpRyPp0FHF0P4sYt+5wlhgg2zjXBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766063371; c=relaxed/simple;
	bh=V45xXat0RYWJlHdQN92Wh0o91vws0gCRLYJEcGCCDbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UMbvqjkEJCh6z3sphSe8YRYM3OBGUjEgb/0Io4suLqGDklZuKeJGzNa83v6upah7AKrsVYmUuEXLYU9KSEz0AEMk3l/H42P5310WAyhSL7PkC+lsfHMLgE9UbhEsxwXfm/rQUH/op2JFe6uFkUF0gsoKphsH8MLUnYcaF9VqqKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vi2infJv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9+FNPi9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI8s1fc174300
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QiEoWwYyyuFHNyZgoh7Ufmvd0yoa3SUKfbng1lG9YMA=; b=Vi2infJvdtnr6d+x
	r96D5yYJO6G6z+wyKSlI8pJ561etdmVwZw/Eli5KQduDI8fNexAQU/5LJyOLsjt5
	MNQCgtXPqyOYF7n26BhdVT3QdCdx//v8pt6y4DmE4FrW7XjWnneWUdYAMZU3A+7e
	dVzg7ur+t9KXVa09OY1u+u9QwRR7yUj+rpZuXIhfgMgbYBtwERZ+l9Eee5yA2i9f
	EmZ0fih/QEtjGIhnIxItX8UEnHrFIUoz6XF1RMNW8//+TQwCvdIc+R/YmkG+Hl9x
	6B9brraV+/Qvb70tzzrraz4jenu+apv9EDQ0emb1+4GBfzbvhHCiYj0Pa6mSUCK3
	N7tqkA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b43nmtq38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:09:29 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-640e5edbce4so155839d50.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 05:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766063368; x=1766668168; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QiEoWwYyyuFHNyZgoh7Ufmvd0yoa3SUKfbng1lG9YMA=;
        b=B9+FNPi9eAMi3G6ITwTR+VpLrgK8Zwgqcfy64IswkOyKS1x+Cg1O9kimntxk2iwfA3
         iH3qNYF68yl1E7Y9zFtgpTue2jiNbH16heWsrbR3xzYTS0GcnRfK26oWFDqRNU9GxwKd
         FUYq/iQkindkE7eR3BOXxGTsKtySclQHVfT9pzYXaulGlurM50YIgPjgDOOpZZ9qM+8b
         SI8JCSYOAtzboDJl+cfhIgwu7tbt4wVRHG3wxqQTotY+CcQsk3KqJnihMTBtdjAoY5gL
         /DdXZHkrxTxRDX2jX34f0ot0ETKDXaTkajN1ulSJ/B8AGdOtXH2YzERpGIws5xfOQLHc
         dZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766063368; x=1766668168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QiEoWwYyyuFHNyZgoh7Ufmvd0yoa3SUKfbng1lG9YMA=;
        b=Iu74mAb7jykGtxM6Yyc0XI299g6/E4S/uRhphcBvZamgw/2idXleIBD6LHMgVaUpk3
         Hy6Y7ap37FJng8Cy3lzC8xAz/xr2i9WV9rzPxgum5RA/Ts1uE5v5S/s24Zwa2NZ9i636
         X3qsjUywfL5ypP0cuaoH+XrIlqNU3kP0/JodPy7qqPpqLo5ecv1lwT3vKQaXkfe7nLE5
         ddSB6ryt23P5m2QVAEsTpNvjSf/7ee0qlMAn3MWoSVRScjkdO0jwScLlD8crsQmm64Q7
         ml+CPCCc7q9FGE8oyjNQuIEs7trFZzNCVC3elsqblB6npMR1x39aaAKNObzYhyll4b7c
         N+jg==
X-Forwarded-Encrypted: i=1; AJvYcCVj5rWtZ4xBBWOb+78v0OYS1w4kHpm6V5ig+vZxRkvi6OZanP3kWFhHW0B1wLQ1dJ6mdXWlsGrSuNAe4ZC7@vger.kernel.org
X-Gm-Message-State: AOJu0YzU/U7320HmR2u2zrLwUtJN4OWzMr6M+b8y3mhJ0Kpn+BJWpzPy
	Tinqeo/pWTRdQX5OIzqACCbFTZUXTVApysY2Mwh3SWMvpMLB7aT1dRTn4U6dTM0VGC00YinLYrv
	1qjAWPl8BihGIz6BAUvI2zVHRiwG9jFdZgnCCOIFs6JyV6bqm7hjtgzLfq1QDPCAORXF8
X-Gm-Gg: AY/fxX6HiEXTq9lzfnQIBCgO+RZ6JdXFGAg8ETgumjlA4EXYCYvquJjV1uZk1b2nj9O
	cPICOlvC+UV+66pmb50q5m+H3ZbNfgboD5oRLeRmehwI/pz/t9Kz44zV8OcFNmDSlsqWCI7q2nM
	V6fHoXqVqGg2EXYscSTK3cO6fMAEdxmyoRHKLiF23OUEcghS+G6T+aiOzo57nvvPLBTIu8UruMc
	ENIzVDFtmG59NyoTlVitL2VVWObxboiftTYCBihJDElCI1xhdPysw90GCrUGWZ8/keMF2sy3qyW
	H5GOSdslwCCIPiyW5FQYaxMyNT6bWgTaM7a3Ym92ZZy11Q5iSAtx2uJP4pxth74FgFYCP8VAAFG
	XWqYGSV3jjKXN2A5JnnO6tZ+O+BksieWDqPpN8mz+Fc9d/UTZL/MqlerHkQaXCAjArw==
X-Received: by 2002:a05:690c:398:b0:78f:9d17:aff2 with SMTP id 00721157ae682-78fa7fb0c7amr15942727b3.5.1766063367619;
        Thu, 18 Dec 2025 05:09:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFifopypuevmb+FqUBATgrQoe5AFsPBKob4qTBZdPbAYt4wyIXuKwKmcy0gST8Hsk52yDv5yw==
X-Received: by 2002:a05:690c:398:b0:78f:9d17:aff2 with SMTP id 00721157ae682-78fa7fb0c7amr15942287b3.5.1766063367154;
        Thu, 18 Dec 2025 05:09:27 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8022f98862sm228146466b.4.2025.12.18.05.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 05:09:26 -0800 (PST)
Message-ID: <5e255831-3e84-4f3f-8b4f-c66d05e6be09@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 14:09:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "clk: qcom: cpu-8996: simplify the
 cpu_clk_notifier_cb"
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Christopher Obbard <christopher.obbard@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20251202-wip-obbardc-qcom-msm8096-clk-cpu-fix-downclock-v1-1-90208427e6b1@linaro.org>
 <8d769fb3-cd2a-492c-8aa3-064ebbc5eee4@oss.qualcomm.com>
 <CACr-zFD_Nd=r1Giu2A0h9GHgh-GYPbT1PrwBq7n7JN2AWkXMrw@mail.gmail.com>
 <CACr-zFA=4_wye-uf3NP6bOGTnV7_Cz3-S3eM_TYrg=HDShbkKg@mail.gmail.com>
 <f902ebd4-4b4a-47c3-afd7-2018facdaad6@oss.qualcomm.com>
 <e2eg3zk2sc7pzzlybf6wlauw7fsks3oe6jy3wvbxkgicbo3s2g@tks2pgigtbza>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e2eg3zk2sc7pzzlybf6wlauw7fsks3oe6jy3wvbxkgicbo3s2g@tks2pgigtbza>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wqcJ_Ju6v4yTJcS6ZcW6BBE3pEERgbbe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEwOCBTYWx0ZWRfX4eM/CfWzllip
 u3ois1UWZWN0j6r8qwHybFgn0XqwmM+bpGd7NEzgVD+KBomL9VtBh4BXYMCL+Ia+P3CB0/tDfSV
 dEFQSPWXzhXKfT+HxA64JAtatLFx03sQSu9E9N0Zu0nxts/RXP6xIcZaMdQmdjhBRS4clJ5n4tH
 OHwSXB10/BAj7/45oyybh72dbcfGEdz+jCX4O2z+c/FbWNKYt8787N6I+fzHr9u/MpUsjoti+xI
 C6FxcQWOmfDtAg7+q26sWvjSp5LT/Wd1v6oSRUToYtk51te6HUhEF0+WXtPiGHCTLlWyPZK/RRA
 tZAjSF4Rjz5V+FjLET1O4WuUbm58s7J/oMk7zJDdKGm2cTYM8vk5tkj1pnDJGYNPrTXLl0L+nwI
 b7p3aF8zPzezSM4fm28cINjbEK8ffA==
X-Proofpoint-ORIG-GUID: wqcJ_Ju6v4yTJcS6ZcW6BBE3pEERgbbe
X-Authority-Analysis: v=2.4 cv=A6Zh/qWG c=1 sm=1 tr=0 ts=6943fd09 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=4bLn5VPlT3nyTanoBuQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180108

On 12/17/25 5:39 PM, Dmitry Baryshkov wrote:
> On Wed, Dec 17, 2025 at 01:22:59PM +0100, Konrad Dybcio wrote:
>> On 12/14/25 8:26 PM, Christopher Obbard wrote:
>>> Hi Konrad,
>>>
>>> On Mon, 8 Dec 2025 at 22:36, Christopher Obbard
>>> <christopher.obbard@linaro.org> wrote:
>>>> Apologies for the late response, I was in the process of setting some
>>>> more msm8096 boards up again in my new workspace to test this
>>>> properly.
>>>>
>>>>
>>>>> It may be that your board really has a MSM/APQ8x96*SG* which is another
>>>>> name for the PRO SKU, which happens to have a 2 times wider divider, try
>>>>>
>>>>> `cat /sys/bus/soc/devices/soc0/soc_id`
>>>>
>>>> I read the soc_id from both of the msm8096 boards I have:
>>>>
>>>> Open-Q™ 820 µSOM Development Kit (APQ8096)
>>>> ```
>>>> $ cat /sys/bus/soc/devices/soc0/soc_id
>>>> 291
>>>> ```
>>>> (FWIW this board is not in mainline yet; but boots with a DT similar
>>>> enough to the db820c. I have a patch in my upstream backlog enabling
>>>> that board; watch this space)
>>>>
>>>> DragonBoard™ 820c (APQ8096)
>>>> ```
>>>> $ cat /sys/bus/soc/devices/soc0/soc_id
>>>> 291
>>>> ```
>>>
>>> Sorry to nag, but are you able to look into this soc_id and see if
>>> it's the PRO SKU ?
>>
>> No, it's the "normal" one
>>
>> Maybe Dmitry would know a little more what's going on
> 
> Unfortunately, no.
> 
> Maybe, the best option would be to really land the revert.
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Is there a chance that this removal:

-       case POST_RATE_CHANGE:
-               if (cnd->new_rate < DIV_2_THRESHOLD)
-                       ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
-                                                          SMUX_INDEX);
-               else
-                       ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
-                                                          ACD_INDEX);

could have been the cause?

On one hand, we're removing this explicit "set ACD as parent" path, but
OTOH determine_rate should have taken care of this..

Konrad

