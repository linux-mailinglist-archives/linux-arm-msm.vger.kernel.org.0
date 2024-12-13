Return-Path: <linux-arm-msm+bounces-42066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C249F101F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:02:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E04B216B7C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8291E633C;
	Fri, 13 Dec 2024 14:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YMyBstRg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FF11E5018
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734101864; cv=none; b=Onx0zhPysH+85getPw8O4+lZdxFPt9ToYIMuWcEo5VOsyIPpp2A257t3HOWzVdT7EkuY/keE277Q37n8bLkliI2+8hnQ0MU3n6JJUCPN+iIW9FNqeuiFwqWt/FBYyTBeq0vmvDK4LhEO3RujU2jNEZOzHLbMTkVo7fh9svnoGkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734101864; c=relaxed/simple;
	bh=2wbusRXsQuSNC7B/G7v9dU51tNviFif89ZayEn5EW14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bDYkh4ugdx51RLz8SjuTdzHV2iTbvH84cNUo9X4rtVXMHjvk7ExNOi8DgmSf8bUxqBM3c9fXmYKCxSwT8Dhuvt0OwGonwl1gg4ZBQpxKhLqfEfU3wqb9TPg32S6A+zZfGRIMTzXGLBgtwTfrb91ouYKtJFs+zj0NZZRTyRleZD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YMyBstRg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD9ni6k017428
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yy+BqQEvdcyQQobfQdkXsHodirxNgq3Fxt9gXerLzbw=; b=YMyBstRgGmznZRrM
	4IartXijBTa7hGTO93F0KYAQqrWq7mN/KcjCo5DF1Stg0H59a21C6sJ2soWL+jhR
	jH4DOyLZM3wZuaCC996nwZzEcR8+VDBV69J7oTJEYOuWOcdJIJj/sDfBapEPpkiS
	IEplGxZyulKFXgk34H20bXE9eYlniqGXp2d/EjeLLIzhGR6TGTfLc6/Yjop9YkRO
	tXgS+uo3Wx8MWR1WY6jXn5IH/sZvpIoR75eVLwT+mYUiQu7L5IZZ5QQxt+puEcm+
	wLdFyIaM5BSyAGFE0ir8hIhGFDxe8w/ze6W5q4ZD2BjOHT8di6zIJSPRL3oJAIDM
	SHgosQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjmt0uw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:57:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b66edf3284so17225485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 06:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734101861; x=1734706661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yy+BqQEvdcyQQobfQdkXsHodirxNgq3Fxt9gXerLzbw=;
        b=Kdj6BcXcURQDVIDo1223uXtybZE/qGSPzmZ3RgdHumrb3OIauvxulcYDGTkY0uH3ms
         aKYtPjOJeQFPmLrk8sugczkUeZ6VjX5abot9LG7aSXVoiEiWewTKBAMCrjzSmOfcEeNQ
         vvrbVrHu1ME2Yv+X2wmZ2cGyI1cnqj+rPnobwimtotWQUD081M9iPdrlbgiTjHUtxd6U
         UJgaww8pfx3Q7c9O3k7Lv0biP1ouUPmCYzzd7qUMfb9aclloBEy/UqS2OK3pGTpsXlDB
         78uqzDPGyCamstAWcY77pQEGpVnEBxqJRUBQuhUhdNsdJLI+ja7njHHa9mAKJvHgD9rL
         meLQ==
X-Gm-Message-State: AOJu0YxGFTRraDlxxPC84cSyE+tkmfqF36V36BK+4dUwI61uEmhQyqRc
	WUGeL5dT/wtOiFU2yOXUTas7d8m9HRJ6fHvXl4W8sG8ElXqMrM4ImKhDjo67C0Zqax+jKlyDfur
	tVorTYSt59F7+3bntARnNleNUxgqgnTzUJv9IPYgMk46+46AJpYZrfiThJBHXNScV
X-Gm-Gg: ASbGncs5EYc2V/JelyBhbZE5fkvfbU0DB4qQ+LIlI1YGDkM7bmSMm/AGDoFf2DIdYSz
	BO1CWv8S6tDJBFTLHaVUZmJa7gfeeX6bCwdFN2apsgjxP5dI+wyLr3IsXZGmtmK+gQR5Y41Lm+Y
	jwSQe9Pubo4viFSu7uClarepCVWM+XQ+5rMzPFhgbOVGSoli9LXSIF8tyf3iUY7TI95ibYw1vjI
	SjGmzQ1zXzWUsay9yP1DISpCaupYdSJGRg2CNQijSvVHOjAea7Evt7z8AtjhsoXdF6AQ3AwuqaN
	3GFJwC8j9h3BhzQksKmk1sGwJxXoouoxNuJl
X-Received: by 2002:a05:620a:4714:b0:7b6:e196:2219 with SMTP id af79cd13be357-7b6fbec47admr173852985a.2.1734101861178;
        Fri, 13 Dec 2024 06:57:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAimFcstVhPN2cuWe2dozek2VKAfYeR6Wf341B+nTNgMTxY3HBZFRX09MtFPmAK3JgpfclwA==
X-Received: by 2002:a05:620a:4714:b0:7b6:e196:2219 with SMTP id af79cd13be357-7b6fbec47admr173851185a.2.1734101860837;
        Fri, 13 Dec 2024 06:57:40 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa65d18510asm936966766b.122.2024.12.13.06.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 06:57:40 -0800 (PST)
Message-ID: <77b74653-7cbd-4dac-8faa-5f181b60e161@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 15:57:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/23] arm64: dts: qcom: sm6115: Fix MPSS memory length
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa
 <abel.vesa@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
 <20241213-dts-qcom-cdsp-mpss-base-address-v3-21-2e0036fccd8d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241213-dts-qcom-cdsp-mpss-base-address-v3-21-2e0036fccd8d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: S6q5ztMvAqZlwPUL_-F2XK34f0QUOsk2
X-Proofpoint-ORIG-GUID: S6q5ztMvAqZlwPUL_-F2XK34f0QUOsk2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=833 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412130106

On 13.12.2024 3:54 PM, Krzysztof Kozlowski wrote:
> The address space in MPSS/Modem PAS (Peripheral Authentication Service)
> remoteproc node should point to the QDSP PUB address space
> (QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x100 was
> copied from older DTS, but it grew since then.
> 
> This should have no functional impact on Linux users, because PAS loader
> does not use this address space at all.
> 
> Cc: stable@vger.kernel.org
> Fixes: 96ce9227fdbc ("arm64: dts: qcom: sm6115: Add remoteproc nodes")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

