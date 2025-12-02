Return-Path: <linux-arm-msm+bounces-84121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B26C9CA70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 19:34:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBC0C3A76F2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 18:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905B52D6400;
	Tue,  2 Dec 2025 18:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Acg6qRaA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CHSvHRyW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913092D593E
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 18:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764700391; cv=none; b=kmvOBGItIUaTU3U6dj/aQ+NgfZ1GtrMEZlCGpwLDTS92dSuI6+hcsI3qgdJARVrMGraaTfAf/3d/QkMTOoRP72CoCnGFvmztu2Y/xXh16+1eKHLoQ4W8GmtQWH+UUeNvnUf7RvX1OZecIcD1u0HVyQYc7a0Gu4pZFANurJInaVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764700391; c=relaxed/simple;
	bh=vI/iFNrR02atgpRqIRC1zd0lHXjUwRqtFowTFXLxs3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E2ZgpqLDSThG4OhvFy88WtbWX8wS8EjGUDd0+QuLmhnDCs2Lvlrc2OS2lJtJzbVyEnhpVGW9Uwlb/NKwLm7khx3on8jWb/BbZcfPdwHCtBCER7D4TmpiPMzWtXIh5aSPqqDcf9NXEohJEMPzbkbNBRnAgeeAGuHcJjdTf3hvcAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Acg6qRaA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CHSvHRyW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2AVNDN3660392
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 18:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UTZ9ezT7nyFnGD1bPqGMUcjxcyikL5GsbKDV2LwzjBQ=; b=Acg6qRaAnetxcTWZ
	TKy3coOnI7/2Xqwkg+AlWVvbIXKoxxsl/ULSc2VRqXCZqOoRJleLZHLxlIQkNJjk
	x+uni+QH94jBQ2QAl+nqkYH+K4h5nJCd9ZnK8l0Cy/MYUi7CDqhIZAahlOf6RSUV
	VTbxvy2laynmqeUAIAuYOGRq7uP1TypTZUlQ7X+XkFbMPLC7gN88WuEZkHwiCvnD
	axD8dvbx/4x8OQXMQoLt4wHiOnEEWxgN1pFyo/OWsahuMFufv9ZAbI0MuAi1yE19
	af2ecIXqIL0rJMECxiQzI3y3ngvXRW2yb7ckavFilkj1TDy0W1Cbx1zqksPNafAf
	lHLBJQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asxeehj4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 18:33:08 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-93526dc7403so102512241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 10:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764700388; x=1765305188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UTZ9ezT7nyFnGD1bPqGMUcjxcyikL5GsbKDV2LwzjBQ=;
        b=CHSvHRyWqGt61SRVjsZKzQozZA7C3BezdwxIKye9rDRae+EwAGHNP1nkceHibv2kRB
         dpOV4VlQopv0+zZROaZIkjDYZ52/uryF2jexcQh3w2mthrCLKjFjA5lIzlKsU+E2VmBy
         k1RSpDu4Ek7NU5KSpf5Wi/PojnBNvLAP1Le5tO4LBDq18408ldMoBbUKwFwq5n7rqKL8
         c6hWwtFaxZlxCV87jbVlrWthnj95GrQLCK3cnaKr/c16/oE+EcnqVXc4uIw7/QUu8zlr
         f3idaNWcmel+8Njs3O1px9NJ14Vqgm6E6i2XKdYHtwRjZMep51lhJYOpBhU7oldRXfFP
         acUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764700388; x=1765305188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTZ9ezT7nyFnGD1bPqGMUcjxcyikL5GsbKDV2LwzjBQ=;
        b=RqApC4CULe+o2oRqPWMBmt/OEzywv+91ujPAH7KtFbQr9+HKoMwMAMyBWgj8+k93uc
         SfM3F0drENZl/Yqzx54/gOKAS6OzlSkKF3E0Gg1Om1OBgeXX4A65XCl+H6P+/7rEtsqs
         7nJADvp1JFc41Mk7MW4GFr83SsG2vPrQJJB5DCiqfQbVJeeyIRyfkBugftUyIT34wNyo
         /q3DuONwitR/luzuG0V5VwtBe96FyTaLBFwZbknhBYEsBoD60nXfKAb9zZQEs9qRtMoz
         3D0S+etmDO45ZQycO88BN0rRAMf1/cB4kDh4PpqW7R51qhw5xH0WX+aDSAyeSCUw+m6q
         sQxA==
X-Forwarded-Encrypted: i=1; AJvYcCVpMjR9uFgj/NzEV1hHmBVy6zouxfWD2h9ascMvUTSnQIBzy0b5bxYV6fn7cNJGoxenE1b6UnvpYXaB3DxF@vger.kernel.org
X-Gm-Message-State: AOJu0YxlHxnLhN9Y5o4RNMRwMYzKJe/HrL1gQKwTIXVrPhtVuhnf9LLi
	z6SOnBLk9xAt5HHd7Jt4nRZ0yWJ014MFdQAb6KmPPCpfT4vnoK36RXrr0o9675sXFkHRj7flws/
	szyyP3wqHSNcvhzScSOH/7fhoMr1+/3xVo+gUjf7GCIWzRKTpA+JFQZgJl2rNCJ5lOPkc
X-Gm-Gg: ASbGnct2Htb1o4RS/VO20Hcn7WavFbRkec2hUxdlIgkMR/2RTktbbvzIzkfwP8z2ghs
	QsU7Fi04e6TKdPQfobXzpBPOJfqfh2OF5sjRSxaIr7ZFqgMLeDDldNq/iUkBg1Au7ZXdu7D2ZWX
	T+a7s4Hb36wOhl6N39A6whDQO+k262JUe0HYD+TVve8NmChm+qSPGpsvXn46507DcEMGBn3ms2B
	1lUHpMk03w7OUgD/L7NEwhj73EK3y7MGvylNRBFYoSZCvvoeljN5DSUB8Oob229/Sa9BPOWi3hg
	8lwQ8q+qvdG+lEOF8RsBp45G+HlpqCxQ7ojG8q5lfFIKwaon9h3q6lPjVYZdDYDgO92rqaO7HNJ
	J0VrZiertqS0ubrMNrBAbLQdUcc8GcnUTPLVOWNEBymKcmSHkLXYNbX+7ReG0lbFLOA==
X-Received: by 2002:a05:6122:8b8b:b0:559:a30f:1648 with SMTP id 71dfb90a1353d-55b9a9358c4mr8858937e0c.0.1764700387749;
        Tue, 02 Dec 2025 10:33:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpY9cKSl/V+gAyrouw/8QhAjwytVZCUeiBW2NObAM2TSyVQCYY8PvtHzcTjaPD2mc9GE5AYA==
X-Received: by 2002:a05:6122:8b8b:b0:559:a30f:1648 with SMTP id 71dfb90a1353d-55b9a9358c4mr8858904e0c.0.1764700387244;
        Tue, 02 Dec 2025 10:33:07 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647509896d1sm16592100a12.0.2025.12.02.10.33.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 10:33:06 -0800 (PST)
Message-ID: <9dabc745-1464-48f2-8687-2b849a7fca95@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 19:33:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] arm64: dts: qcom: Introduce Kaanapali platform
 device tree
To: Pavel Machek <pavel@ucw.cz>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manish Pandey <manish.pandey@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <aS8uJCnb0xOd6uby@duo.ucw.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aS8uJCnb0xOd6uby@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2UiGzfAkLH2nyYhZ9S1mjwA0jtFzLibq
X-Authority-Analysis: v=2.4 cv=TMRIilla c=1 sm=1 tr=0 ts=692f30e4 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XELJwKCvV24u9bmaNtkA:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: 2UiGzfAkLH2nyYhZ9S1mjwA0jtFzLibq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDE0NyBTYWx0ZWRfX9DzHwsJHSAHW
 CttQmEJQSGvUJU21EE7YcDq8tVTMTheDAfoTtmlqPGkvteDAK4GAYTbh0gAGXn0gaLrZ4nuF7P+
 GkYBhPP3JuLXFNzIr8O0qvCJIXn6pbpACj4WP9/FWpL774nrwyXBMgYYCvMPCfpLTTUJdmp7HKx
 h2/hxBMv7vttN/HwSkzlkczRHOJW1ORbOW53tmtxyXB6pBgfab1Nxt/0LlVPMKye+2kxla4GbrS
 YfxEyvFAfAZXC9xEH02qKjyVPcemfM2LQ6FLdTiKv0T5BAhkuKFBuUBWH4vuj2LjfMGDhg5Gx+h
 zF9ITiDrgE316o133ovz7qoNnrd9mTGglA3rPmMG1CE9n155VYAeBjrwWaL2yNuKu9EYkZi9wTV
 BC9yeUgCqswuaQFkE1CQqeq0v1kwzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020147

On 12/2/25 7:21 PM, Pavel Machek wrote:
> Hi!
> 
>> Introduce the Device Tree for the recently announced Snapdragon SoC from Qualcomm:
>> https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
>>
>> Bindings and base Device Tree for the Kaanapali SoC, MTP (Mobile Test Platform)
>> and QRD (Qualcommm Reference Device) are splited in three:
>>
>> - 1-3: MTP board boot-to-shell with basic function.
>> - 4-16: More feature including PCIE, sdcard, usb, DSPs, PMIC related, tsense, bus, crypto etc. Add QRD board support.
>> - 17-20: Multimedia features including audio, video and camss.
> 
> Thanks for doing this. I assume there devices available with this are
> quite expensive/hard to get at this point?

A number of them seem available at most shops now, but they just came out
recently and they're all flagship phones so understandably it'll probably
take some time before enthusiasts poke at them

Konrad 

