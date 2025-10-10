Return-Path: <linux-arm-msm+bounces-76800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E6ABCE159
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 19:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DD54189EDA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 17:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B24921D3CD;
	Fri, 10 Oct 2025 17:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RLDfrb1s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D5B217F55
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 17:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760117355; cv=none; b=flSt0oL6J3lga+qt6hYm7UfzIqYHoLM5ygWYjpnEkHvbYjiszmO7uD7LfXu0pSr97c2M1Ld8NrPinE6mPygWLeKLKRuby91Fgz18iymC4RR8rnp4VRRDjaSueqTH4Ii5hwg1UCrDNNUEQ4xHAY4dH5qv4LTTtah+2rlvy8/+19M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760117355; c=relaxed/simple;
	bh=1jCvcJTXVwA5O1ApKoCsAYG/yC8rSzDqgspSodn+WO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wa4mBIV4d7ETXxU/SJGp8lkFdg9FDlibLWzxlf/G4+RZDmsIE7M1Z37DmdDegOpdE7iVZVwJEI1ukJmQjZwn9jvrDfKMYWut0zdtzlOdTODWtVC0shamBKwEzf5ycD6o3vTsuPMXU/f+PTuqzjCfL5DfpKFX1PpXQkfFMNPXPTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RLDfrb1s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AFTtNp032745
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 17:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vm6XdexpWZwlzx/paEBfThj6nvdnnZd+ZlsrP/K4+mE=; b=RLDfrb1su/DFgEtU
	zoxLm3CNAQQEW4VXMs2zsEi0wmTqNABwVnEh9JqTsAXtPoeIbPl6zyV3kTvsKyMV
	xHoQpdGit+tLLK06eKbLeKZIXWPo7gzL/TCJEE/7YQBVVZqBciqNXFvPSM+CRxxJ
	3kdlOYUhSyuHrSamaf/m5qPqnzD9SE/aIi9YUkMu/GJst70xB/Y6o3oCAygkCizl
	BOvi1D2OBf07P517tmbdTgQm61hVab9oVvoeAmXDkPbwH+BP7JtGFFCbMssYB9a7
	TGHj4vyT27UHRcgPhuMJTvHlR3jF/0jOcmwXH0sNHxaBmKCcYxOpr21saUCWYVUB
	Jl2FWg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ky6q1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 17:29:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-865c7dee192so74688985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 10:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760117352; x=1760722152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vm6XdexpWZwlzx/paEBfThj6nvdnnZd+ZlsrP/K4+mE=;
        b=KSdPODPlHUVjlXNfuSIlScRqnI514ADWhyH6keqWgJKcMBF+ckCbXS5u3SQ927OVut
         SjmoH9HjaAwY4EInwTz/WSGMSeYjxLTOSVUB1tdC/OqBQiuWJU+rMjBB65b9CVqbAbth
         C/Q0SzDOR5Obzwc4w9qjqWgdi2/Bp9hDSTiKmw/eco8drf4mKkji92in1BSTq4HFhZqZ
         YqDjfSL5SdGPxjBpFUwd3OG0X5nfGogFAytFz7akKDK9sOzQEZT+/s/puKt+6yiLWc2t
         s1pe+fsIVaIhHbGfy2sQyMiv65ha5ToJ+9a1QV5Cn41Z2PdrXaAw/5IZTMKD09Xw/QIy
         0+Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXBWxzw1BWs8g7gnRQHlT8jNfzSdz1PSZg0F/Rgclw6Qbrm8wM+ZglsWGMJvfJhJZzgorug9TsUGY9ukraF@vger.kernel.org
X-Gm-Message-State: AOJu0YzqpCEo1iePD4ibP2SxKj/4/BedBssY52qyCekljQVIoCdMNzdw
	IiCacgkud2HqNS/BAUm8pWtEFVjOKLrDLVEb50XCyFWiYDBsPo43KokUl3SXEVBtiy+rB1Gul49
	MIDk0gYclM0MLmco11PqrncLE4oC5r04ocDhOAyeZbm8Q4yo04ByoNf7/Syzb8NZxHatp
X-Gm-Gg: ASbGncvCq6/D/Z/wcA6brY4cidhJbp/FVRQQAjtJUzAzFHRUjfQT9aa/tecJCYCtob7
	DeRoDNSwZx0yjNX7xeDf3IHW+3W5vg8oIYcn/18j35E46qfjlwVJcelXm9ZuN2NlH8arcb2tO/1
	wQFQoumhhpvbi4y2puzWnkmssHFQzKhegu+eskDNkAhLxOPYvQSit5NAApRTy7WJ4y3+yVhcQ6b
	zKV9v//Xgsf3nfE8s55dlMW4HIW826JuR5NtuNlhZjM8a53fLnNML+dOI8SkBh7cK2MkRL8PToa
	GjZYdEHnfqca4J6jMUfizlakPC/WEezo2IMV5zyIw4Saqau85/PJUZqjT+zJ8HKWJyG/8FiHOX5
	ZTRpZj3UBAZBDveLzeb1yXg==
X-Received: by 2002:a05:620a:31aa:b0:85a:4bc8:3d2d with SMTP id af79cd13be357-88351fd204emr1274386385a.8.1760117351679;
        Fri, 10 Oct 2025 10:29:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFogdMoGDOLXhTvrD261l4hPgK1+3hErleDIhKiMNxklPDKrnCjnpDVPPlCJiKdHsWHYFcxXw==
X-Received: by 2002:a05:620a:31aa:b0:85a:4bc8:3d2d with SMTP id af79cd13be357-88351fd204emr1274383285a.8.1760117351125;
        Fri, 10 Oct 2025 10:29:11 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cac037sm270610166b.12.2025.10.10.10.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 10:29:10 -0700 (PDT)
Message-ID: <f03e0223-2722-4d5f-897b-91209b6c12fe@oss.qualcomm.com>
Date: Fri, 10 Oct 2025 19:29:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: Add support for Huawei MateBook
 E 2019
To: Jingzhou Zhu <newwheatzjz@zohomail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251008130052.11427-1-newwheatzjz@zohomail.com>
 <6199698.lOV4Wx5bFT@debian-vmware>
 <c6880fe5-029a-4f8d-a08e-81a066a79450@oss.qualcomm.com>
 <2386127.ElGaqSPkdT@debian-vmware>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2386127.ElGaqSPkdT@debian-vmware>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX8AbZnoRqq2t5
 9XFm/tgKIF3j+ETmXs+B5JsiTWEfD7cCoftnLqciAsDQr9exwx8kUkKcDWohwvKHRR9DV8CLtVd
 Zqsrj4rbz0V/CnF+hPuvngMp92wassNOaoY9WixaspDRg7GWst+NNFjq10PRfpQvNuB1+40zw9w
 tXFW6KJn6HOVMSsJXDZSks+xvFVI1s4EXM6S9BiWECgEWUc/9UZDCmg5D2BQXP8VTqXGLKrHQA3
 OZCq8BRU7F4yl0VcGL9jA2xDDhy8Yr/d/Fn3KFT8kqHLef3EG/f7wInJvO8Ley/PEdqCaf5DeJG
 c34RHdhA0UVqoAksQEyTYRfX/XIo+PRw9EKW7F6K9tgqcivI3NIF+6lhII9vm1MfHbfTCiQnbPJ
 EkVZXAQylt88f4n8Jwl4vLH/1MQEFQ==
X-Authority-Analysis: v=2.4 cv=CbcFJbrl c=1 sm=1 tr=0 ts=68e94269 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=6KThAjY6i_W56qehSegA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: pa8-og_va4-qWdntyE8IxmNqlljCC0nn
X-Proofpoint-ORIG-GUID: pa8-og_va4-qWdntyE8IxmNqlljCC0nn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/10/25 4:52 PM, Jingzhou Zhu wrote:
> On Thursday, 9 October 2025 21:58:29 CST, Konrad Dybcio wrote:
>> Please refrain from resending if it's just to apply tags, maintainer
>> tools do it for you
>>
>> Konrad
> 
> Understood. This is my first time to send patches, so I'm not very familiar
> with the tools. Should I wait for the maintainer to pick it up, or is there
> anything else I should do?

I suppose I didn't answer your question fully in the other email.

TLDR: you're good to go, it should be merged in a week or so

Konrad

