Return-Path: <linux-arm-msm+bounces-85497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79408CC796B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8717130848B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07EF33DED4;
	Wed, 17 Dec 2025 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oTcWSqkb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RHmgNxJT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5EC32A3C2
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765973594; cv=none; b=E9XO6jlCd9z2uhh3PgbDPi7w8NGyEr7HmNf8caem/UYlkU7Ane+y98N6HYXndIymDo8Y0rXlOL/jXhj1nDEBiOSVT0kIxg4K42sQzVI+t1b6RyFwTsgW7Y4btHpVTDElwso9dztFZPF9C3f5nTWeR5AqITjseN1vYvoxcNm2B08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765973594; c=relaxed/simple;
	bh=aGe86kWkfD3nvG8oBci9toKNq0ktbkQOHU4AB26yg7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=afuh2UXucTEWurLaQBpfEvaYK69WHL1ddoYCSh6ED7S9Rz1aaQdOxueWNlwizRXO+5JQQmNdzNM8wuF+Ac76FA5xK11IxGfmP6NqdJn1xTJvx/KuHYfgU5t+Cd54hR64yXrtIfcEPf9MkbMvlmZdB/W4UJu6263smL4WiiAnqhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oTcWSqkb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RHmgNxJT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCDBfP2448421
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S5xgaoTT69/pBHPgbjFkA4EHKqWZuC60C9uOsst3bQ8=; b=oTcWSqkbsxGmFqcV
	DKUxPRuWDotNrXy9NN6FyIIqTPEINRlgdnyMVT44Lym0NS6udIUyMLxX2o7ECUbX
	3fXFEXkPE/1XsfXGA/W0F9sMfVgzACEaXtqLYMpgtYnMPXuQu4F6jK6RzDRK22C7
	GH6tQ+zpdBdKmJ68+al2GmL2nUXHI7pY5kwGVhXLYFtMVeMKXRuNM/DF9EZdwrxW
	XHrKoLGJpQ77NTWLNhKK0ZBFwQ09lgVw31bWwSU+UnahwQMWzAM7b+ZfE6CgTZ8J
	dIUQixMoNwmkWqJmuTzAeMS4p6kI9b7ru4UMb0c9ecdF4E89pkajgDuVeF43gw/w
	YPaV2A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fe2aaww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:13:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f34c24e2cbso3768051cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 04:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765973563; x=1766578363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S5xgaoTT69/pBHPgbjFkA4EHKqWZuC60C9uOsst3bQ8=;
        b=RHmgNxJTarPRp59DQ+JI7cNReInQ3PJY80o32rUMHnFJJ3Tjhln6+RdBtLR34x3p9j
         x8uXg88KJqWpWq9wZcbRli/hzQS6k9aG1n77vndm8goznRv1hhkjt3tndgoUlETKRSLj
         syz6W1UwJulL/D+gmamAAdkWjnbnLrlXSe9mh0j0JaWswX8VuzBOp+UBARsqiDgS3CV7
         W2OnBZ5z2maGo0WThLLg0n/aq3kAI0DmiURs6t76NX9/EZckK4dQ0JB+ea45acpeDrr/
         ofe+GuJ5pQoURGziZ+sH6bKVYqyPwuMJtW/wxGaCoSSy3mMyKZB4No6rxoGrNIOTweX3
         KgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765973563; x=1766578363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S5xgaoTT69/pBHPgbjFkA4EHKqWZuC60C9uOsst3bQ8=;
        b=OzpTR5B1xlJ6La0JWvbh04vXKm9r2BT1Ezxk9eh9v9ehLICKqrA9aCKHFgnf92oBTi
         4aMvno2KC1n83ynFM7umc0SGQJy8OEo6EUbcH2+WnYOVb69nvsiBZovAoFn5V3T8PYht
         fiI7KUDk3srLEUwxg9MzEqSS7/EvxOvnVm4NFIyGgw8CNv5iUyM8/LaE+xAj8ZTV2nAn
         VXxwr9guh7JmEND+NXxCye4J7dmzLsDgz4r1eRwh9+Bciww/ycrRyDeldzzyo7qCf33l
         nJhtKVdDJJC6OckbdG4Lg4iLVBUzJrgHZabt1qOB7Qk/4KkRSLCK5qs3CmzZwyBrId5H
         FhXw==
X-Forwarded-Encrypted: i=1; AJvYcCWnc5FElkJVlxuFGbnfwLmSU4iUdD2Ib0Z/uam0rLGcY5aN9LgazKsx6IIV+3cLb49p6IsXxdBrq0zgsk4i@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0H2/BB8C4S/NK0HF3oSyA6Q1JtgXclcPH8aNec7bXMh0pHfuC
	X7NAfL4DyOmkt92eRrHrMiQklPjIGl6J27pqovA6NEE9+VFue8IUc2R59gdOqr/q5C4D5qybVd+
	am/dln6s8rUBTlYGaaa7AUQX2h7FtEJ3WKd+Dy/hZ+1i67aOWN/L4XcsEuc/DihxnGrlr
X-Gm-Gg: AY/fxX73iVOFDACU+qktQbPxDL92r3CQEV31Jq0oxLXEHpeelIi1GBdfs97o9/5aIQt
	2XTJVcI8d3LGMmhbq1sgsKZD6bFhq9+7V7RwFOqwfRB9QksyuYYujp0KLzDVcOj5s6dD9oGwKpc
	m/VncL6jjnJ3s3mRo+56kVqbQ0SrATBtrBxSQkNn7zb1ww9hOp1heGm1E7MYQjb3oBcoSstgVPD
	KII0RSf9OW1ZU18vhe1K3L5rxfgX5xGBMKgSzarTyna6HG+StTQwO6MgD3nxb3kgzGi0PTyQMaB
	Rgl7jjTGwUYOyH6DIBJbIomU8Fxt62/IfXVdAxeUdVN3tJTN87JzCbaU9lGmeVt7tHdckC7cdiy
	pSFk47g57sVzut/gajF6qwMY2YdJEdzqeEz9kbnnzfr8UNAK3N5uecEuE/dgLWvBHyA==
X-Received: by 2002:ac8:584a:0:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4f1d062fccbmr159588631cf.6.1765973563353;
        Wed, 17 Dec 2025 04:12:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5eVGC3ZWYSUKoHlLO+PfDj5QMt25oSCp8OK57mCn7+0Tam8KJf/1iWxw5fxtG/X/1ogAfiA==
X-Received: by 2002:ac8:584a:0:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4f1d062fccbmr159588381cf.6.1765973562909;
        Wed, 17 Dec 2025 04:12:42 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29f6cbsm1991353966b.5.2025.12.17.04.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 04:12:42 -0800 (PST)
Message-ID: <c786d33d-6c6c-4932-8593-857e7054dfda@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 13:12:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] arm64: dts: qcom: Add initial Milos dtsi
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
 <20251210-sm7635-fp6-initial-v4-8-b05fddd8b45c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251210-sm7635-fp6-initial-v4-8-b05fddd8b45c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wGCUQomKWIWtMDItkO84TJXeKF-O94Lj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5NSBTYWx0ZWRfX86r+4bw04OjU
 8T1QAkaTlQOgGZ3+pkZTraKUfHJuEcdm7Em14sRuLrJ2SqBoTC9w/bqFflqbtJR8z+JntSueIVR
 I095VFQo16M01hP7DvXau5fP1ft9uwK2G1V1LsLwSWNH0GZa3DdRwHg7iI52k2eiSaVAy3JwVDB
 MhMg/dbKTQVW00XK+XVLW9P1uLwGhVtb/rRnM6/XFTvBe9zdU7FPEtVj3pQ7En+7tNNFxqzr+NT
 04nRNKY0X1s3PdaHdrS0UWhe7uRIBsYr51ujXZIq+x8a+cmQQ5QjNtI9rU6vhoMEmonOo9D339+
 C9/cQV/3KiHW/sDzRolgzg3POycWzo5tF4rm58wQJqGvBbbA5iZxv2XbI+V5PfQXL41b06ueHGh
 QzWDttfQtRtZ4463UbKqOhpPEoU6Jw==
X-Proofpoint-ORIG-GUID: wGCUQomKWIWtMDItkO84TJXeKF-O94Lj
X-Authority-Analysis: v=2.4 cv=HpN72kTS c=1 sm=1 tr=0 ts=69429e57 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WSIVeowOIUgBBEAWWbIA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170095

On 12/10/25 2:43 AM, Luca Weiss wrote:
> Add a devicetree description for the Milos SoC, which is for example
> Snapdragon 7s Gen 3 (SM7635).
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

