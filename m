Return-Path: <linux-arm-msm+bounces-84433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B090CA70FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 11:04:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85AAB307A206
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 09:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7CD283FE5;
	Fri,  5 Dec 2025 09:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ISx7Fw35";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ljm0A5L6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74223314D0A
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764928758; cv=none; b=U+YN6khAKiC/9CcQ5+vcxZBHw2HHy7LBH6CLVYQJO07Bd71vl7oQ9LmfrJCbUqjzuD0xs6wN4xr9PRnRjOpSlvHUk8iGfP4ZvTUSOMbA0m20gPL+uzZGhaRG2W+xIRWQe838JuRxTQoP9xxGQU1I+H8S8S87s9iF02gdTcLIwUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764928758; c=relaxed/simple;
	bh=7bfq2TSle3k0LnaRhJTXusG/gbDjmiprkSipMvwpQ3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MYjZSVM2oiPF0PLgK+ZqYl3HsbIakOImg/7CxEVIg/xPTdoAx63jh364ff9Xjs9y0wxAP0FQT4b7OBEDneGZU16jRrBGLWlfv4IasjBawwOUHQOHgajYGQ6A5H8Lm0AfhiK09B6YAIA8y02gRUJgq+MInIy8FKC5Ezq/iDpe8SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ISx7Fw35; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ljm0A5L6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B553nbw3522548
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 09:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LfjkxvihORQQ98r2FuMz6ihB2BvCC0Y9UxySzLl6k1A=; b=ISx7Fw35AsW4SF00
	kubrP+m3LnxDLNrzhLIFw/L7edyoRLeO/6Hfx3T3nuVZhEWBPMDcDzWpAk5LADTk
	1GfS1gSzDEuscOvsh3d5mL33meRRtAM0wyFV6jUp0CpL4Tk8CV4WrgqgGWor/4j6
	x/jo+AuJC+QMFzSb6+nPmJon8qGcs1BhlelTi9U4s457aSNEA7K8RBtzSC31577i
	CSsGhxuzeTbVFkFjGFAM6ob6vz01k3pPWDEpGpvd3lCH/5Xdg8PzKOPYQi03KFMK
	EJoRIDdB7mH7HCiyhfgF5iZI5zYwn9gEnlsOEEDL8BVoHYPueQUHdobUkfDePxH8
	9gKTvw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aurwvgs8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 09:59:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88820c4d03aso5211696d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 01:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764928749; x=1765533549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LfjkxvihORQQ98r2FuMz6ihB2BvCC0Y9UxySzLl6k1A=;
        b=Ljm0A5L6SlxgXyywoka5lIhGv9IL5yjIVPibZkAvyTAaayozev0YjB5DUvjaEok3UE
         zVaX0+irx9ZaF02/5TtVgjzAA+dIs7imkZw0X/6o0CSv3g6XHRx0vTo/SSWFxROUO/8I
         08RG/+QWhnVr9SYqiJ+23TfO97tmFMNKIWUXiz8lRGlSYvbkBfmnKaTDN5ZIgrZTRene
         q1eROqFAjx90AC8AGP6soc24njNuaX8RjmAiGoiuGBRd/UZPSzbyrRQTEPbjkv2s5Hep
         sJQ3hpPqlxRjeFjfEP1JM4OwAky6eSxxLM6tyNV30zIfPKFkMe/dghQKbWzvgc1kPbRg
         G0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764928749; x=1765533549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfjkxvihORQQ98r2FuMz6ihB2BvCC0Y9UxySzLl6k1A=;
        b=sBuRvOFFb1NtLGwoQY7E6J0oJk+TWByULDkK0wNNSqZ05Nv0Z1Fvl+xuJInUKOyUn8
         /XpDYS1Fo8lgrDmqcJCEdbYGIeCuyQSqP0zWFmy86vkCS2Wp4HCyxAMXSY8cad40o9BM
         PJtTPi5/E9gZM8ztrljaC8Hv821WLPzGF5PWSsxU+YHLaYbWh8oVziER517SGPUmIPPR
         cFMJPzSSVrHFJUWeYG3OmsP7UisRaHhAFS3Dqn1dLItNE5eubkQXx1W7hMSCKiubQ0g0
         GvruDNmXCq/oyDzV3ukT6/Tqf2eZjOHIrqAScQUaqQbgPWfoSMAHS7uzWM+ETjDKpuHT
         xJ3w==
X-Forwarded-Encrypted: i=1; AJvYcCUg0hJKgaSI4vjYT1WVVFp/+ZAYAyR1pk6u4zw27yR2k5BSmjq0o8ND2ufwxAKqDLy6bQs+sivuyocbYDvJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxFgm7qjygoWPfa8jko3xMI3Fkmgshi8BoksVwoHm3VxaMd4qvf
	c1XtKznx3i1BcP82iRYCtAKIWxV4jijXyGk4ga8cEkHQ/KDcgegKX3zyaldn18l8BAfDl9MY5oI
	FA92OKRIZTETBXbafAlGU+bMbFed/7AbtMlNckZFamCpPXuNejIsnWbE70TSQdXK+yNO9
X-Gm-Gg: ASbGncsw7pELMDQPVLeBlVlZUfoM0TGFW4+9+xKLQVUS0qO+VSoR1jzEsY66u0SSrve
	O60GM4eC8bPCclUNlaFnjYRfcUVy81xm0Ib3/3Eh3DthVx3qxnDDMUURpHoqBCK+6LBfmBUDstX
	vDuKZgB3vCwRr/izvKT2Ad8Y49HvP98vi7BubmDpSVwaiIYs1j5lpOtbUrHPAZ+DiKyoLRGEg7f
	n75bIRxGdM1RQ79KgpVAljuI9+K0uLbJXpHT3b9IoHHTwtQKG+C64Ktt0OXGN0GrOJ8b5JmlAsH
	IUzoMA2kUkXGcXd1DA3wVEk3GQ67zGXF2YvcGd4fQa7Uv4woDG2O9rnJAMVKbhxGeKLW39rNUTW
	tXYfcZsXvTrxDmiISkRto0BOlFG6tNcwQ1d0AOUgJeYsRtdk+OWOupJBixZ5NT+mlMw==
X-Received: by 2002:a05:620a:269b:b0:89d:4a69:1502 with SMTP id af79cd13be357-8b5f8c0c5d9mr868902585a.3.1764928749444;
        Fri, 05 Dec 2025 01:59:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpspM+ICmsmP9vWvYbDUrEEZofcGz0pLj1H9yb6JeVlYBv+ycT9u3vhjBrWF01Uj3As0jMDA==
X-Received: by 2002:a05:620a:269b:b0:89d:4a69:1502 with SMTP id af79cd13be357-8b5f8c0c5d9mr868900785a.3.1764928749071;
        Fri, 05 Dec 2025 01:59:09 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49772c6sm333401766b.44.2025.12.05.01.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 01:59:08 -0800 (PST)
Message-ID: <f556c32d-acae-498f-8abe-d79e99bb0d9b@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 10:59:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 6/8] media: qcom: camss: csiphy-3ph: Add Gen2
 v1.2.1 MIPI CSI-2 C-PHY init
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
 <20251204-qcom-cphy-v2-6-6b35ef8b071e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204-qcom-cphy-v2-6-6b35ef8b071e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3MiBTYWx0ZWRfXxJOv3xkjZIhr
 8fNIP8GrSdIB97njW5upfn6WxU9NjdRYq3Dlnjv3jIOGHexVj9ZLKTJ4GZ54uKK7BhnKlDoLM5n
 K+biNZXjHjoJ4aBfRL9qbqfLPuw2HUEZZvJiDLeokFkZujKUX/aY9QckYKTBokZTLdiFsjYzQTj
 UDbieYi0rFKkKMXHvV3fJXcGLj6PaUEVSvdijXcaKI6fAxGonq0JCif0MZb/P8irCtCMCAAYWUR
 kLtz8CIAz8rzF1/7y8DtEKpUO5Y52L9xseFvq7cAbdjAEGpC4DlrKt6QcUpcXEzJGMZtsUSHZ7/
 K1AcXCKkcpVfR2DtMpW1ik/CCz5bbe+69+XV5sSVdurtlEm4a2jlYsK26F9jioyAY+5YIsZTzsX
 4sIVpdCu7JhjGRY0hkXa/M4tipQqAw==
X-Authority-Analysis: v=2.4 cv=Yd2wJgRf c=1 sm=1 tr=0 ts=6932acee cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=ZFB94F4s4OxtCDoo8YAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: bhbslHGkPIRlZ5JvcT0emu5pgPGMxt40
X-Proofpoint-ORIG-GUID: bhbslHGkPIRlZ5JvcT0emu5pgPGMxt40
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050072

On 12/4/25 5:32 PM, David Heidelberg via B4 Relay wrote:
> From: Luca Weiss <luca.weiss@fairphone.com>
> 
> Add a PHY configuration sequence for the sm8250 which uses a Qualcomm
> Gen 2 version 1.2.1 CSI-2 PHY.
> 
> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
> mode. This configuration supports three-phase C-PHY mode.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Matches what I can find 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

