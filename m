Return-Path: <linux-arm-msm+bounces-84479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D6CCA7BCC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 14:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2052030170DE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 13:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4C7316901;
	Fri,  5 Dec 2025 13:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDFlrWWT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XkZSx5Ad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912A23328E2
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 13:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764940898; cv=none; b=ol+R1ZrMb6f/mcw7qXyvlDiVraKgiiEnVh1qphxqtaem0zvcTNw/FbzufhQZsxZ0gwUyuEJlBXgCUVCwEv+X+ETd/wgBfXnPXN9ep2H1uGnbkhsNoEVj6iojkgA5QcX/3wvZu9ADBPxEu0NVi6S1qzsyIlUy/mHXq8XRcuK78UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764940898; c=relaxed/simple;
	bh=nYvVQEJBjh8afPA9K59iU4VVZOuSD4o5uwpJiFHPR7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pQMd29epcxvQbSdSSRLQ9yaWxkSeY5siW3XRPqOgCwqb0ccRyWMtbnbK0dWLtpjm38HowHjZQxVNjSxa7wHJIgtpnMPtB+rMd6aVX0ZwR1wV6mq10KvDNVHb7xAbaVOC0icbyL3cz/LWTsKiu+53l6HNAyZBGkJkFXZRBf+i1dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDFlrWWT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XkZSx5Ad; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B58kcCW2516952
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 13:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gRZDO4HCJfFnAgJ+vp5YULHmT7Wu7PN3T4LxwhKqMPw=; b=lDFlrWWThBrePVMO
	g70gdSt/tjhsiOj6nUcnub2O+DLUA1qjEvAnJm4JsXwz+v84//90Y9QL3TLdKHGX
	kvH/1ezvVkaBRndMtg7/ND7zHyDZJtZQ1BkZbY5cBE65Eqjx6iENZEynXQ9Z6aI3
	Grv9dA/b+8N/XTZjNf0zKssifB76Ul/m4sQ+Zwd6CZsXUuENiT9YA0kLHsxOZ6pO
	560Gj3BF7kzEcT/4TRByaZ2w9OGSLuqS6FyEhzq1jwE1Ur2EO4a696ufyye9hI/W
	v9xMtazqc/ubBArNuXw0QnkWD71hArI6pJfn65Zuha4wHjTh7CatVf1MQw4BH7S9
	WZlTsg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auj7n293j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 13:21:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b10c2ea0b5so66982185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 05:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764940894; x=1765545694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gRZDO4HCJfFnAgJ+vp5YULHmT7Wu7PN3T4LxwhKqMPw=;
        b=XkZSx5Adsa61Zqq9m7TvZlJwVPZbbzEMMlL9f6UZt1bzRI/ErHU1jeT6pcvYthygpy
         /Rwe0lgbMfIYFMdMs2tfuLKiV66N7YGD2yzpdol7HDaGY/SNXtyDhqtjHeWGFE9jIu5B
         VPEXBwS+1T0YuFd7FXjd7crWKVoIQJS2vGmUIoiMlHzHCrUVIuU1KE2j8NfGxNmBpzhS
         O0kqnHPm5VRFKK66RWBe2o5P6c+OFbqSuuRL3sCema1YlnpGnbwMk1MHXVQzNpuog52u
         Ht03Hgaw0TxB0jo+cnAiJK0YbEcAiCz66mW2dBdmSsNun5BDtZ5SP/NSLLqXxcRSOv0e
         zHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764940894; x=1765545694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gRZDO4HCJfFnAgJ+vp5YULHmT7Wu7PN3T4LxwhKqMPw=;
        b=DaLNLzY1UUvNcHojLbxfyTzscOy8xKZ37A6pCfr5xM/rALAq6LiaVxEL7ssIEIZj+S
         C8sy2rrUyS00CsvvsFxDx8v7Np/BHRv7/hqjY19j4RoZzsoRM5Yr35bFehMTAim3MeDZ
         En8fEUQ0Qb48ESPSKJ2867a4ktbb0gNkcCEInKI4Y3m/Y53Bai3CBNCA7oerXJxsyo9F
         9GCfT6YY2TKu4cqHx7PVOhuHLz8ow0G/QiS0YcSmcOb/C3MSM2c+n+mmRaIkGFhI+Cl7
         8B7KRjUMqeZXJyJgS17PBtpNGyN6XlH4YpUkZcEXOuHk0fEqTRjIBItC0YIh7muaxrWi
         zlsQ==
X-Gm-Message-State: AOJu0YwlIMUjOIiUIDSNzB6gHbRoUXVKo5O2DvBpaWKCOKnsjfnfuHR3
	Od4IO5MqqkV6pp8jHGUNT/q33JfRYeIeKH+1Hf2etyw1q/afuRd4fs1H/PSgyXfSrPOM1YwQxFY
	iwaaLm9Drhb0naseQhKLKfszP8MyJCqZUk4GjDY0LiXoFi4QZse5UwKy23y1dRh3Fg69t
X-Gm-Gg: ASbGncv+dmpN3n2Xg39fsqFI97dyFsAlUGRzGzh5Y3ltqOUqMUviVXko4IUUMhyZhwj
	c+e6FKrrsk0n/kBF8IFouTOELqlwUP2ZawV0gJij/gzY4LRfkIf5i7ABitmyLJtDEwmyngHaEAN
	1WbckIaaaSMfW++FkaS9OvY7N8J3/UXHJ+s+DNMCy5ZhJV46YZlGvBYVC59Rf9jyRa8+G45RzBX
	FDQHOtMbUbJd/PHFEfnUg4quPzqn6vg8lM6hHM1ZgEImL3tivaEZDieTc07VkaHOtvqVzEEM7+d
	+LIi2boPFnULAQN+V0F9HI9yy7/hcMAKJtmd97Kp/OCvRIEbLADNxnmNZb34dClYWMsqNpaWxyC
	zoIOI/hMk1idie+UEOGTqJpbBQH2E0ARBuxPYjvfOegrcT/HqFanqwnBn2zUmENqnoA==
X-Received: by 2002:a05:620a:4455:b0:891:5527:8f17 with SMTP id af79cd13be357-8b5e554b750mr1008902885a.3.1764940893961;
        Fri, 05 Dec 2025 05:21:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3GlEgJk76XvDzjO6gNbaHZY1bXHLQhk8vN/3yTUg1LJUOlGh3PumQT7/V4+yQDby5+2DiWA==
X-Received: by 2002:a05:620a:4455:b0:891:5527:8f17 with SMTP id af79cd13be357-8b5e554b750mr1008899385a.3.1764940893390;
        Fri, 05 Dec 2025 05:21:33 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49e10edsm362094066b.59.2025.12.05.05.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 05:21:32 -0800 (PST)
Message-ID: <f5186dc1-b16c-4cc7-9f36-37e179a85af9@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 14:21:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251205-add-coresight-nodes-for-kaanapali-v1-1-d3d2099b9b24@oss.qualcomm.com>
 <93a4071c-d2dc-451f-bc4d-defeafe383ea@oss.qualcomm.com>
 <b08bfb85-3aa2-4fa9-afd7-a27c3f5e8a1a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b08bfb85-3aa2-4fa9-afd7-a27c3f5e8a1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DOSCIiNb c=1 sm=1 tr=0 ts=6932dc5e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=HxmCrEKvKwsK9YbBhZYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Mf2x0fV3Ey9Xkuz9LpJmEJjnRrj3Q1fq
X-Proofpoint-GUID: Mf2x0fV3Ey9Xkuz9LpJmEJjnRrj3Q1fq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5NSBTYWx0ZWRfXxsaebv3VN5sf
 o/M1jHjhm/JE+W9+RiAR/R5N8RgNe5DjEqSt5KJxFZ8GpBDivH1M14E5DLw9or8msPUDV1yCcAE
 GACxSckfzh2S5mM0MQgdI9ukc34HAY6NbyffVVJhenk0OFIKujBJ6voVLhrJpugtYyQSzEee722
 s/+8sKgpCQw25t8LuZdkLj2IyuKwn6ZB1CqvUs75p6BdtdJu5/3bZHpFb/l9FoH93CMGdeYX/lV
 T0ktEFQMyEmgj+0RuvRn59JxbUGzPtuM7atmx+zckoqr61d5YB8AtfZaKjOrmohq5i16ABt9mlG
 y4khSSjHQByT94jKvukA/5tZiotCK2+rFHHxM0R3xpB5tvO+68AElMZtTO6Anv9rTj8aA/KUX+n
 YIKMQ+KF5k6aXjG05mguZ0UV3s47kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050095

On 12/5/25 2:18 PM, Jie Gan wrote:
> 
> 
> On 12/5/2025 7:20 PM, Konrad Dybcio wrote:
>> On 12/5/25 9:36 AM, Jie Gan wrote:
>>> Add CoreSight nodes to enable trace paths such as TPDM->ETF and STM->ETF.
>>> These devices are part of the AOSS, CDSP, QDSS, modem and some small
>>> subsystems, such as DCC, GCC, ipcc and so on.
>>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---

[...]

>> This list however should deter you from sending.. it's impossible for the
>> maintainers to resolve a list this long for you and there's a high chance
>> there will be changes/rebases required because any subset of these patches
>> you depend on may change during their reviews
>>
> 
> Yes, that's the question. The good news is below two patch series already got reviewed.
> 
> - gcc: https://lore.kernel.org/all/20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com/
> - ipcc: https://lore.kernel.org/all/20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com/
> Can I have your review-by tag after fix the order of the mentioned node?
> Then I will send a new version with the tag after the dependency is being cleaned.

Yes, with the order fixed please add my

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

