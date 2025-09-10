Return-Path: <linux-arm-msm+bounces-72981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D51A5B516BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 14:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7B897B566C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 12:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D951A17736;
	Wed, 10 Sep 2025 12:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wj/r7+F2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7DE3176E4
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 12:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757506910; cv=none; b=rpOqm7/3+opsyFqJd5Ussf8t9Oy1w4tBl00i4RH4a6oxJWcHBUEvLE0WZtdAegDyrMGQH5OLODL7cD3jUUucUwriEvOX25A6SM/u4suHo4+uKajnWmrBqp5ES8to4fF871pr+VdFhZ95k3+UKEHqWqT9MzjzE0QYtMQyn2N/1RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757506910; c=relaxed/simple;
	bh=X6KFvaVVEp/dLB58ZazXkEEJ/edkPXleLAnQlioyPKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EG+kPW/kFWIL1Cvu1aioqblKp85ikeU/Fi2bGIZZFS/ho5y+4BovPqalibfPvG+lAoQes314otb5Att9U4FFlhX/V33cUd+R3fPPzkKdRxcdgMkqc56Kg3ZmjSs7YEKDmiQycUBTBDBpoIAlzXVriO7mhn5n4+9JnLVPYYEra+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wj/r7+F2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFE7o012513
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 12:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0vMWTcElNgxy4rtHU4PlXXcjyINdBlSlLR0M7KQ8Dho=; b=Wj/r7+F20oSLhcZm
	gR7IlHEw0gGVfncRIWGRYXpijto16adl9ymBPXPuthfLEojRI5Av1bSHNvA49oIj
	aCUo37w1MOdFQk2HGeF+I4PlPmtIitFaGpFFNZwwkJQ+sYMmaUVYmGwHwgduKqyo
	88dNq3C8/tWeLOKZiMmzocJYh2hsmr24WCHA86087SNLdxn07jII9v5S86iR9b5s
	WTNpjisCL/gnTjGLu6uqZAK4S2AVnURN7MXCr8nJbzcj6xRTrDHQK13KyqOHy0g3
	9WWrWrFoZiHu31WeP+ksnlF1BMVx2VVBarAQln7F8AZZBIiMDx5iQqldQ5r5t+4/
	2YFssw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsbwxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 12:21:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b3ca5e94d3so11378111cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 05:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757506907; x=1758111707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0vMWTcElNgxy4rtHU4PlXXcjyINdBlSlLR0M7KQ8Dho=;
        b=wC+/2LUOX+KJtFI35L0sAV9Hpnm39V1G0rK3RFmDv8j6xHPjdVHz2SdMLJOnFFSgRn
         Kdzi5xcZ4ELn2JS/uDNS/zPJCK2EAV5cc7BQ5eXM65gCKMwLZzvFRyp7ixtM8YFXhjxy
         nf5rmQlPWyzCSgRgfhgMyFWkPKWTDqDH3nK4/Hf1fseX3u8V5cp5EFTrrirwiSPlYpv3
         xeKzLv3qsritkx7ZTW7LDQUfJbBYA34M6ELLioB017lRJ/3pAN6/VYJWtErOzL1Fet4N
         H0rhM8kOS2aaiTUj+rNWid/YY6EOk1jGbpjexrcPren575HAGSquUdNHDqP4kV1l39g6
         XbhA==
X-Forwarded-Encrypted: i=1; AJvYcCXFwPGiaHkhXuwAvpdB5bFTYcUtxYRCyV71skm6vEO5nitN9zZuTtrskCCHUfpBSiH7FeGSWHSbNV6PxhU/@vger.kernel.org
X-Gm-Message-State: AOJu0YwlJbDRyTZPxXmiYc8qL48avULeWaZktaaaFmim13hzIDAmfGWB
	ZIE0loFg/t3ylZxikszf/oyRmTMmimiQ/6WcaTUZLMLOHbdVs5dKKhniaOwzZ/6r1P1eok7TMH+
	Ti4MmZPG5l4KZTFpl42+r+ov0PsxGLconF0dmSx2p4AREcK9TG3NM7YCDoMQmYZLSLqyT
X-Gm-Gg: ASbGncsPq0xN7n/M6bQyOkf6IHi/c8ec28B+zTr/KOau6fXJvJCW6OKCSK+a/vRg/9V
	HziVhg5Fv9SbiP/Wife0cGd+S9qAdXajDNSPSjto8OdZKG8L+vsk5yL889O1e2PRpVWQ3m91/PZ
	tfRNyDRmc/H2qT0uVITFZb6Icjr2a2UhUxBGY0RvgREJbHEnClDvpUGYmINkhfp0UWC/f8IMBka
	8YMO9RA9jtNuGMK+GqjiUVwat1eo32anBiOfrTvo8Rpvw+ZvKm71ju2OhiVydZD2EdQCkgfgI1+
	Jzce5HA5UuhUE4V/WRakusmALbhZXvhhCErbSp86v+1KHHVAz7ker1vxFecZq5vKEmcgazWU3bV
	JJmF39TaaMgR8lZkV9d1WAw==
X-Received: by 2002:a05:622a:1787:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4b5f848d05bmr107672741cf.7.1757506906958;
        Wed, 10 Sep 2025 05:21:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQM2ETnZwgBv+qedS1fE1v5n9TD61CTWqUhCz41J601U3LDyveBpzWSkY3wpyOOnfMzFjhOw==
X-Received: by 2002:a05:622a:1787:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4b5f848d05bmr107672451cf.7.1757506906461;
        Wed, 10 Sep 2025 05:21:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b078334e86fsm158892366b.56.2025.09.10.05.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 05:21:45 -0700 (PDT)
Message-ID: <1f979b86-b45a-46dc-b926-64f5b1b84f7b@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 14:21:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: sc8280xp-x13s: enable camera
 privacy indicator
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus
 <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Thompson <danielt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        threeway@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-4-bb90a0f897d5@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250910-leds-v5-4-bb90a0f897d5@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 27Ejm2eVobhZb2zEpUtYWQwkwkliipWx
X-Proofpoint-GUID: 27Ejm2eVobhZb2zEpUtYWQwkwkliipWx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXxE9/yZGKcdtN
 xraSZx7WSIpqlvIs7f54L/RZ/+nhDEhAb/Q7p0pSYTsqB/KooG4OYSYEXIxY5voq9818K5qudnY
 SUN+Hmgm0CI8uCPi3fWKg/5UkrvheGwle/dignsV7FfaSdbHifC8aRQsyhU6KMb7qFT5KZAS5ni
 2+9Vgo7B9r0y75glDbJvA5eXUhO/Qm1+DogutrkQB9ApvM9O1CsI9ABw5QVTp8hq9yimeJOR2gu
 ISabyGukV1uTY5Ewm5tZBpL2/x+zqbHySFo2uASKFOxbY3ddKCtzppuHAAa0ubdt3fA9QbkZE3c
 b8O1L82CX/V7dRtd4D8kkjOVbI8UO6bVZIMu+YrJce/9LEZhEFbPZhutvCBlr/zgVMRcdhuhlUz
 Umzdw+xz
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c16d5c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=I76Qk8w-AAAA:8 a=EUspDBNiAAAA:8
 a=q3hGUckLsqYRD40seJgA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On 9/10/25 2:01 PM, Aleksandrs Vinarskis wrote:
> Leverage newly introduced 'leds' and 'led-names' properties to pass
> indicator's phandle and function to v4l2 subnode. The latter supports
> privacy led since couple of years ago under 'privacy-led' designation.
> Unlike initially proposed trigger-source based approach, this solution
> cannot be easily bypassed from userspace, thus reducing privacy
> concerns.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


