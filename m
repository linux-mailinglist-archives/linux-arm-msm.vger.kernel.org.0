Return-Path: <linux-arm-msm+bounces-85498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2029FCC791A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A24BB31187C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEEC34107D;
	Wed, 17 Dec 2025 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZFrSypy5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DzNcqd9w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11D934250F
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765973680; cv=none; b=hpMRd4IaqjjTKbtH2k3Pkk47X7haPFiblq+fiaIzcX2aFXGEoYGBR+5AoMbbQUsLDRsGm30MMMAdYiMt9akRJ+fPsYnnF8la4JZhpRx8Tmn+VIVFgEcEJ5UORve3MiTDdRTw6YPNuAPIw8NUTadEDy2lXm/T/LEeRccEFNUhJX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765973680; c=relaxed/simple;
	bh=FOhOqH7toKWDzEVlR9pUeDZO7isCrYW9YHhCfh7mb4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=favbOTzTHLICiI1Rh9g1pJQFwPG4Z4mvteoECWWX9RT57yZi4xqnwA+Dwoel5Rh6aPxWwFPHiKbHbYa1OppSrYv5KHqbjNduLVj5qjRClRycXhWL+gNHfaXQfq2xEnELpaLgPyd63MU52kRTFrj5E0rItr+At8x1j9Eb64nThUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZFrSypy5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DzNcqd9w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCDSp22657916
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TiIbU7CAhhv+5oiifZDjVX1Qm9RbZdgxoYbJ4QOuiwo=; b=ZFrSypy5utuA2YbI
	hI8cL76CIrAck3oThQeoP95f1+GFPSx7sQFPCz3grsZ/eH91tuvM0GyS+Wk+ANJs
	74NsKs1oenO2QQtHFUvYJuEW3/gyAt00nQnwYoSKip3Hw/dCkREL2hs+CBFHh4+l
	Uv5oyCqzcWOB6rLSfOxpF0aI514PvPGy5QnZl62UJmumw8zZbPOLhAmVdQG6Vxx6
	GNa2JUE6llKuxKckHwVDRBUnimC+CNsD5HquA56ZqKzcz0sMFV4DTxs0bc3NKmJ1
	1rjtN/CyTXi+yIBveOlLhaCbiZJGReais+zPbBPh8nN72tIcExM1htXrOb5C5/yo
	XkcCjw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3myj1hd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:14:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edaa289e0dso21796941cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 04:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765973677; x=1766578477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TiIbU7CAhhv+5oiifZDjVX1Qm9RbZdgxoYbJ4QOuiwo=;
        b=DzNcqd9wdgg91+8wciqJ6aareK7wxNv10+40Afrcnrjou/bR6VvbcHEX2V4QivL/nY
         Azf4Sl/DcLhMIAkBMk9CMaL+UgvuQezeQfND+fGgId4S4X6j4XXsKNLhz+JGxyDr9N2Y
         V3fmoWG/AE/6bKp/YJ075YMLPVRmi9cggXDtoIkmSACeBHPF7L8UZd5GI68MaK5dyHEs
         ryBDIOVPoeswan38pxfwpRHadyRcdHvpKFs0SI/4vz9nGMwOBxjpSB0TDZ1cJEjUR9jE
         qbi9I0VwTwwjnEPQ4tPRhstU+gWNBh8kx/aTR65n9g9wGJmCO5fgNizoI6BHexlZXoRI
         fKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765973677; x=1766578477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TiIbU7CAhhv+5oiifZDjVX1Qm9RbZdgxoYbJ4QOuiwo=;
        b=JINt6WLsXF5a168hqZVSMZFX97q0fRkCGFXNEE9VSrgJjKnZq6GXWxJqTYzMjR+J+E
         PHzNQwSbqlzseNupcbDOzMGSH6U5dEb2m5SJ4R7HeGajjpAADJIustxrc4ulTQDXF19X
         f5Ut+ZItGHtX3otPvP1ilEjmDzgRu1k/wBe2mNVCaPZpTtlgUOFAJy8jFoA8Cb6nSgcG
         oUhuWW1A8C3WWdqLqtjABR0AfIXkcwnIoJC2EXYyVqd6OWgX6Z04JfFS8wgjlbpiRMiG
         Xhfz9sKND8JxrblR1PB4FuI1EGzNv4QDIFt0pad+7c2gOygq+nBqVL0aW6YhldeiQlLO
         c/CA==
X-Forwarded-Encrypted: i=1; AJvYcCUak1mR5j9yoHQmqakOmlssGo87l2P7LBDGLd6gIl+Rb7qGt1pTd2lsdSE3Soe/eAFgQfkxxH4oM5xK6/92@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsn+Y3rWaCY0jMPVcLPQtOvpen/PyvGXPbi19ytgcdOjS6MBbN
	KNNEYcHeKRittWqoX3fa5i5au5WPt1PGu1ssWU8F9wppef5ETyeHGTCD/VJ9wWH6B6tjbfRNQ8k
	f5/DBLzQhHHxvNEeVF7KKs1991m604ZCN3WGvkSVu4/5YrCbG7OQvhRX7zhNAXvV+lbgW6e+zq9
	w8
X-Gm-Gg: AY/fxX4IUMH9as+c00SSuZKwxCJy1A/tASEaik+qxfwwvOTzRYZen7FIbXZnBGzyRv0
	OYDJOoOenBhrsLdr0AJdpPnDKCqoOTc9pOZa5r0e7Gzoczb1xF1gk84U+4JC6zmVdLEl8rhEYL2
	otqM86jAHKpskuVhpknLF9hmJkba6ZRUZOVOAArOUKjfZZdBQfWE3iUbZV+pszQDy7f3ko3huBn
	AYc7zpfh+ARxC6K2wcskx9pYq4xf7ozvLbnncdLGxRoyhxWHyxyASLNGtWFqpM9rxPWYXXI+rAP
	FaJXrIqk6pUt11FHUsRUJ++e0kKFIK3/phkYVcQMIR1oX5WUHnCtEskrgOy+spqAOke48qAdKJF
	qspjC1DjczUdh/7pVrMhGhUiMF1w6XGAU7KsQurwATliikke+8YCayAL3Okqy4HADbA==
X-Received: by 2002:a05:622a:610:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4f1d0655504mr188695351cf.11.1765973677019;
        Wed, 17 Dec 2025 04:14:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXVGpRhIxu3Mf8+ixHHNkLitg1sBzNFn+khIqfYf9Z5J9ROjGkK+V2r9lo/OeYRDeOI3YbBw==
X-Received: by 2002:a05:622a:610:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4f1d0655504mr188695061cf.11.1765973676600;
        Wed, 17 Dec 2025 04:14:36 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2ed80dsm1945925566b.16.2025.12.17.04.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 04:14:36 -0800 (PST)
Message-ID: <8466d783-faf4-4b33-8822-1477cbdec288@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 13:14:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] arm64: dts: qcom: Add The Fairphone (Gen. 6)
To: Luca Weiss <luca.weiss@fairphone.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
References: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
 <20251210-sm7635-fp6-initial-v4-9-b05fddd8b45c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251210-sm7635-fp6-initial-v4-9-b05fddd8b45c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5NSBTYWx0ZWRfX68bzAinKMxph
 WkShalHjjHXfBwNvMBcVKiCg5LbBnSxntca0R50Ktz8SourGDZybmlMBrNGyjT3H++pBlGzhI9u
 LfayddWwF3yH9swd2HxigETURfvB74Mbw/+0s1J5NRIylHNsPoCrmGgVRChTCZ7O667WJzm9YFz
 PNTejVbXiwyHYB7BckxOMDDQsILZdx/dMLYaeMNy1rqenpDbMdX0s59KxAkUhXyR3B0gSS0MbmK
 yYgeJ6F0IgAF9I6KTuun5nEP+A+AoE5ct+LYPhs3Vj8C3QF02dyz3av26SvlPZKAc5kS3pvmM/M
 y/yne1/Nwm9hZrlys2hWhdA0XBDoWV4NhtQE4LAeoZWZgSiDiFdymFP37oYtijPQtFkfuTozevy
 7A8MQmnGVP9CpOYAvbHIYKxRuf20mA==
X-Proofpoint-ORIG-GUID: Ltyl_mvxL3jLL7ABDRTcPYELJU36O-im
X-Authority-Analysis: v=2.4 cv=CtOys34D c=1 sm=1 tr=0 ts=69429eae cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=deFlHvtSqnmsrBg3ijIA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: Ltyl_mvxL3jLL7ABDRTcPYELJU36O-im
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170095

On 12/10/25 2:43 AM, Luca Weiss wrote:
> Add a devicetree for The Fairphone (Gen. 6) smartphone, which is based
> on the Milos/SM7635 SoC.
> 
> Supported functionality as of this initial submission:
> * Debug UART
> * Regulators (PM7550, PM8550VS, PMR735B, PM8008)
> * Remoteprocs (ADSP, CDSP, MPSS, WPSS)
> * Power Button, Volume Keys, Switch
> * PMIC-GLINK (Charger, Fuel gauge, USB-C mode switching)
> * Camera flash/torch LED
> * SD card
> * USB
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

