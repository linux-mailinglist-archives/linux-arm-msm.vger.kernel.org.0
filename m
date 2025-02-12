Return-Path: <linux-arm-msm+bounces-47835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17373A3339A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 00:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B197D7A0294
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 23:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA5B202C2F;
	Wed, 12 Feb 2025 23:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHN/72TF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C966D25D540
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 23:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739403914; cv=none; b=D3G7A4JtYNJscpM1EXy1v4xYC8oFSUheGUNyLOZnp64OTXDycTRpCXdScsJVQbCSJLcWEyL6uWAT1PEi5V/yh3DrLh4ZZhewBHmjCd4CX2MtzxDX2u+80wfSpIe2aEQuRWiZgNvWLwGgpWu8UBwm8CTK9UQ3tO3fLSDgtvIrGYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739403914; c=relaxed/simple;
	bh=pISEIH1Hgm1ebhPn1Af3Igag6b5WaEXZXIPkb7MG8Ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CzRTyM6r7abSwapDucdXwrrqHxxesFazl1gFBi+M2vw/6L0tuXiBkvt5xpwomSkm7JufYT2kdZc1VCqbPDcSvBbueOzFWIZMW6robKeKLpUR8J4Sq0StxqISWmqsL9FsFZmCW741MfLhMRYy4ftF0WoxMuLh5VcHkb6Y+BRL8Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XHN/72TF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CBawCQ010407
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 23:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9hBUx02+DO2rqZGD8AyCtAGPZWGxGGVd2BFh1CEpmGE=; b=XHN/72TFUl760NPH
	l2CtKPY1AiRfQGp83hKOghligpP8eL1YSeDQKuW7mky0WFrHVy2rtOCR21JGvINI
	ddu+dZLlgYwSw2HLw8lTHMD1SKV1fu5piv0bBIl5CsdoUMQkVXR8VBRxBKNRm8Z4
	L1Dd/QiOV2LQU5CuX8B1KLT4yHBZH82yZcvJRBWkH5gRsZScc3xQ95ViS5bYwWSL
	xH5UnkFvrYKUHm0BP+JOGhJnWvMXLrmdzaccG2SSWXLNeEDUPDeso3zownIH08+v
	o2s/yCX40KgCiNM0PA3BuTgQMQ8q+3qeg9fAYP8gH4o8zImIIGMcZ9rxQrDNucU7
	2irhnA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs5hbb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 23:45:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-46e4842dbd0so391611cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 15:45:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739403911; x=1740008711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9hBUx02+DO2rqZGD8AyCtAGPZWGxGGVd2BFh1CEpmGE=;
        b=JgZ9EgpqNV3BlXnNY4GkSGJWi9udJ0AfYcD0mQKzPr1ACte0HHYeXFUWFmRkGjbO4J
         hu0X/WOWVDB89KKTKqMgmZxgF9G9XP6dIqg+5YjZsAuc4oJp6gemQVuOHYiM/9wu66Gx
         BhSoZv6x+nM+JE1s2R+IC6SS36L1T5BmH990Z6FRYXzbMLZhDFq2KaUUjWKUytCEdHa2
         DA52Hd53ZZOxQInNpgkzanPEn4Jrs8lFgLCZxa5ogeJCeqdwXj5ecCc0BJUhG4gbOyxM
         PLfNLtdyR8jPC9F3nFhw7QBivIQqTwT+IqUZ3OZNj4p5j8d0TRYf/FzD+YGstF6BH6LB
         iMsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPTJv6WoWuaQhff20cbMa/93ym4f1WL6J2liBZGfPiUWS2L4mjMADF8s4ZP0hdsi7d5m8BTpyoK61fHKWb@vger.kernel.org
X-Gm-Message-State: AOJu0YyNfiNQTN397GexLtblf4hZcTR4+0HW/SSVm9oUp4lamlp1hech
	DSzyBbq+jeZMscgru1jTmVbwimZfK/oG9R1fA6Sx2fD4Pa1aaVoR2BDyX6lbT5dZXdbFef0ScNB
	u/wPPRtWRO+Q/ITd5zzepz5jqCQ4TqPw6RtSHe70VZXw58ELCch0yPLJwgAYH3Zay
X-Gm-Gg: ASbGnctC7z0Jubsy5quIw1L9BJZOkSfOrp9gW99hNeFnDmxlGtU+DBW1dGdIZxo9unY
	qnCgWxGTo9xJNonmFOKO7vVnJvj99hTik/3Ld7jPkb5GnPiq4Cb+zc8T8AkLDycSDA+Tk3uFnNy
	/X2jH2MmdfHaRQpYP4Kt/i8OXVrEgP15KN8eO0QBBxO/lFIDYoH1oVapSHGknr4jeZRsegk0A79
	tdrb1ZPrwAIa23Y+XaeUH+pTqT09RZb+FsWMcaa+UE6MfIN7/cv7DSncE8Jlzmb1Rnc4dm6NYQW
	bUh0Dn8rzr5TdKmZgzH0MQjPLGkR1TcZWLegtdWr022uqxH9MvxJgMHHy6k=
X-Received: by 2002:ac8:7f86:0:b0:471:92fb:7b6f with SMTP id d75a77b69052e-471afe4e2d1mr29685361cf.8.1739403910836;
        Wed, 12 Feb 2025 15:45:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZBbAM9Rfat+qt0Iy9OnSiRwVlgMt4KfOiA9bSD+573lkKNBEBgs8o9+PItWL0wgmfwvh8MA==
X-Received: by 2002:ac8:7f86:0:b0:471:92fb:7b6f with SMTP id d75a77b69052e-471afe4e2d1mr29685241cf.8.1739403910552;
        Wed, 12 Feb 2025 15:45:10 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5339d94asm14393566b.143.2025.02.12.15.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 15:45:09 -0800 (PST)
Message-ID: <e2b31450-c428-43c3-b25c-3ec130171011@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 00:45:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: qcom: msm8960: Add BAM
To: Rudraksha Gupta <guptarud@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sam Day <me@samcday.com>
References: <20250209-expressatt-bam-v2-1-e6c01c5d8292@gmail.com>
 <e0ef29dd-afe4-4ad7-95db-d21326744c92@oss.qualcomm.com>
 <CABhZbsXo69FL-xUfg3a20RybO_uRmsOKyMJ2w3qnpk+8pYyUqw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CABhZbsXo69FL-xUfg3a20RybO_uRmsOKyMJ2w3qnpk+8pYyUqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IJxFS0MYB9MGOoj9_BTph_taLGOuDQVE
X-Proofpoint-GUID: IJxFS0MYB9MGOoj9_BTph_taLGOuDQVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=809 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502120167

On 12.02.2025 2:59 AM, Rudraksha Gupta wrote:
>>> +             sdcc3bam: dma-controller@12182000 {
>>> +                     compatible = "qcom,bam-v1.3.0";
>>> +                     reg = <0x12182000 0x2000>;
>>
>> The BAM controller is 0x4000-long
> 
> 
> Seems like my device splats with this requested change:
> 
> Diff: https://pastebin.com/AwzHPCLG
> Log: https://pastebin.com/WQswkndX

Did you keep your changes that shortened the sd controllers address space?

Konrad

