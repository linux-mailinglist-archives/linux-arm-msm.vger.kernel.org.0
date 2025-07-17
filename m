Return-Path: <linux-arm-msm+bounces-65546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0C1B095B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 22:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F1C73A89E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 20:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0621FBCB2;
	Thu, 17 Jul 2025 20:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/SLgeZb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F076FB9
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752784227; cv=none; b=r/3mZnlepdyzMu63dRhFfwizb2q6YxPUUP59xETGemfVBFz1yoCEhQxcCRn+zunnQvct+oNpR9PehTtLxmQ1eGXQ9AHpMHzcxGmP3f5+N+i9MJWfbCpJQ6cEoVsbdM2D+inKlVnZfA2NZUtThangRoHGyyCV+yJA/w5wC5iaT6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752784227; c=relaxed/simple;
	bh=yXaZJh1s97QoYyV0dVGHOmfFM5k9la8f3WzB5GWF94k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a5RvpIAVwKiRO0Bz/7bkiUj0eXQzVG2kOtiDQywp/W9gc4K7KQ2H5bR8KRZvVshNmVlg3XCX47eOexeteO3RAN6rjxBe9e2EtwZmkXdFGbohOyPvOjf2J0vKRoh63YvL388BNpcn0d6dAN263zci435e8zflyUubS5PE+RZgoHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/SLgeZb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HJ31l4030397
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CApBvgecuTLwhooPFQ9wWb7BYDsOgt6qyTee0GMRDwY=; b=F/SLgeZb6J3acNlw
	fg3DMnKLtiYoPw1xQN1Dj2lUccY73AoQCaRtkjHlgN1g54GjeQp4O2FH1NbdM9JE
	T0pT5l8Qm4j7P1qFBbLAu+h3Hwlt5JsOaClIESX0V6FpwFmwGOdpeZZrYY737Ess
	UoLyNo8kAFVoikcl4Dt4qXKDRa0VY38UfHqggQ7Tq452aXCstjGyGKdY8MCADWAM
	vsSPswkPqdagEDbVQTXYkD86IkGo9s/9DBiNWLFjepYIwdwcBj7sE2eziYNYNERr
	SJLrs4IwZPrvatGqz02XKyrekimQ+IQwm51O50gkw+tHId+JTESk0yNIXY2Oz/44
	t/cbeg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7nx7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:30:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab5e4f4600so2814831cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 13:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752784224; x=1753389024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CApBvgecuTLwhooPFQ9wWb7BYDsOgt6qyTee0GMRDwY=;
        b=pE8YFxaONKuDxVRVlEy4fW6Nytb8LMvtk8JbJy9CGHE1bZvxHxOwxraE1Ipyp53W3k
         RmfesU7GhGjoAEy54HcGaUifaqgL2SEeg4Nv6LCgzxUF3A4W30VVf/Kb+fnIUmQ7r2J+
         44Cz2dyxSbthavcilTVHzWIfKkTuw4AXJxTxYmWt1pmwAUVt0A901Rb/sF/UYmlewvOD
         MasEZ8Y5eRRp1UYcZyvwWlcaXoDkzN7X2rDhmNS2gJkUkLeuoMm42F6OelYGJVvWN4tn
         nxHdI8yBqPNTIteKLAKD5mvPNm+/m46C4b+rcjxV6ZgnXO/xkgPesvuzqdVwVLBpf4pI
         F2jQ==
X-Forwarded-Encrypted: i=1; AJvYcCV44Thkp1ZOuvIUXM9dQ43ZrkejQu38kLV9+dObRZ1kLmH7bqG9JH/MEpWhrS5ngt++azH1ctIxs7sKEtBy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx006k94pdoCp3yNBtOpJhcC7kCD9M5c+MprWH8QbHUK2bc7WgX
	lT9ho9VcPwtUtu/YosNyMxmxuB/mlbuosTJ1x2uMFYWrks9+W0opXbP+tbOrZ8JQP7nc0TTG1LO
	CCH2A2px/6qkJCbAjZaRoARy6UTTR23aXVJ8HwqT+7IXNzwZCcDwrsQqQcjY/fhpK6W5f
X-Gm-Gg: ASbGncu+bGX/8AQAQJGBEnpmy3Hm3G8fzu2STlcoKWfZLBE3a9R1doTAeNqKJe3eMLc
	VD+4i08mf8askhbtu+9SzA0kvfKvirSfHh0VOAdecFZ6+4ZzYPszOWs0lWc+UpxeTldvwJq9/ih
	W7rrggGbd6+ohjDrRFR1LW5ohdkYnme+EBqDhBR9ZZSBCpnlpGYRhgL2G2uT93GgAvkZpfQUBkV
	ETkYUwCYFJVIQPfbVoQMrHowkSDsJlRIDfRyY3Q5YlSUsJlVD3i6gg6sdmn6S/d1/NZE0tkY2Tk
	NvfFeFc9ZFvSqJcZiMS5dR6UiRfxM+x2icB/uhyKObBdqwN66d4Rl0socDl4LIJnp4ELYYiUOFh
	v2ixGdjPLxySBtBPoCpr4
X-Received: by 2002:a05:620a:2b49:b0:7e3:3419:90d with SMTP id af79cd13be357-7e342adfc02mr464596685a.7.1752784223645;
        Thu, 17 Jul 2025 13:30:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFh7efxMPiaABCqMznB8bM0sGwzfCMhBakRHFLmRQQii5O7L2SQZ/AT4w5DU1nWhvzljOpuBg==
X-Received: by 2002:a05:620a:2b49:b0:7e3:3419:90d with SMTP id af79cd13be357-7e342adfc02mr464595485a.7.1752784223247;
        Thu, 17 Jul 2025 13:30:23 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294013sm1420624566b.118.2025.07.17.13.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 13:30:12 -0700 (PDT)
Message-ID: <5e3dcc7b-c929-4f2c-86d7-dd57b08eb939@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 22:30:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8250-xiaomi-pipa: Drop unused
 bq27z561
To: Arseniy Velikanov <me@adomerle.pw>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luka Panio <lukapanio@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <ffc3b329-6d46-41f3-9780-05369d29f9c3@adomerle.pw>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ffc3b329-6d46-41f3-9780-05369d29f9c3@adomerle.pw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE4MSBTYWx0ZWRfX1syj7bnjT5gx
 oRF6QlVLuxtIgsxC/M1jL+S++hGAaSyzoVVXx+bnsQ7ihJMrT6K2j85wXyKJWqBQnRHlFV+DIu+
 EtHj57Ap5aEk4YAywf0wXo0NfrAUYBQ8SLWsY3C+MkuKHTghpq7Rw6/+BYbCZCRbr+eYefzFbCB
 0CL97AeOxrXhp7Dv7T/0ABm+lP1rT0aKv+RV+4VgERYHfxZ7gZhf4oY+lGW/B1scNEj7wC2x3hp
 OVHYA3Td8YG97eUserODaSHrxPomTd/cUfICH7Qm8cTIh+xwSaSUyaMWc5agkEiuxlH/zNb3WUF
 3D6XZ4XlQymosId22hBHyeOGDRNWSNz4Zr3pZxsCiCztfu9LW9Nt8uzZzUGKktgCi3O/vCsN+UY
 +OXESGXsvLzDYIn259zfyweL/LmqHbnUYTSWzs1qMrGt+IF8nr2+oUDcfwODLZMWiv5gz6QS
X-Proofpoint-GUID: baDbrmBwmEoioFiXiuqy-WkWAZ9iwW8l
X-Proofpoint-ORIG-GUID: baDbrmBwmEoioFiXiuqy-WkWAZ9iwW8l
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=68795d60 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=Fl1iwlySYO9TATX8aXYA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170181

On 7/16/25 8:18 PM, Arseniy Velikanov wrote:
> On 16.07.2025 20:00, Konrad Dybcio wrote:
>> Since it's actually onboard, it would be fair to assume it's there
>> for a reason.. Does it also report nonsense when running a
>> downstream build?
> Well, as I said before (looks like i sent reply wrongly), it's disabled
> in the vendor's kernel config:
> https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/pipa-t-oss/arch/arm64/configs/vendor/pipa_user_defconfig#L413
> 
> Also, pmic fuel gauge, which works with the WIP driver in our
> close-to-mainline fork reports mixed information for a dual-cell
> battery, instead of each cell individually, and I think
> this is a more right way.

OK this is a more convincing answer, thanks for confirming

Konrad

