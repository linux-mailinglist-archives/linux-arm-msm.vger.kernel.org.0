Return-Path: <linux-arm-msm+bounces-68360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE18B207BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 13:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A01D84E1DA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 11:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3FF2D3A97;
	Mon, 11 Aug 2025 11:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YcuDWubB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4E22D3A71
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754911609; cv=none; b=Q0U3CMUDI0M972WPgbz0mqduoTvsuX1JoPSrUn/xXmvgfeBdPPqnZcUdKtAlkj2jNB/VWkN1uwnUKQhc3fsi5O3YBglyOu1HRO2swqIKAZjp31VoVCJVjbhUjkbltoYl2ksFFLHliBOWWN+1KGMW4WfNnt1k7rFz+7gDQU+Tz1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754911609; c=relaxed/simple;
	bh=SjIiRwkUuW69/oZGblmkKyoI/24xQdAns+MvUBljizU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBh5AdZ6+ysGkOXjKH5rGTs4jVV+estSJbKb8n2PIIApQRGPYowAc2z8bIdvGPk5Tj+djDEZbMf7HD9Fox20xRcmIDhpDmkMcOd0Y4GjztV9Ep8qGMuvnGdzlocTnNmuj1J2pGv9zpZHjziZ82pvAZ/z4o4idpAnlD6/yBcHvBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YcuDWubB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dIFi005393
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X3MpL2rgvGRtzT3qycNG0CQC8CXqgfD3OIxhOY8bvSY=; b=YcuDWubBPQXZRXRs
	2mlcuWkYLTqabLlUE9PSRqp31qGmPvZjqCba5DZjJ0Dy+j3xi6PDMGn3DHRcKI+m
	RenByX2TmikuXUpqKqf+YBujkFj65lWZJQLH1KJZnKyev6DIsZg/9tUvAr1GngZt
	AFs9fCF9Mwh9dBssMCB9pqFhx0U25ec8+rcsCzNiXJ+pi1kdYjhI0DzGENXRZl8g
	2n292MVtixdPWU5eBm6aAXVSuLSX1zaR6Hl1abf5lyTPzNe8XKMferF5evURVCHd
	aEXb+fdYM6oidzxtoj8WWAF5VRxgAjJTPskHzYZVwavR/uswnoeGzxAHttp3kt/F
	uKClFA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx2e2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:26:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70941c8a17aso13063316d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 04:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911606; x=1755516406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X3MpL2rgvGRtzT3qycNG0CQC8CXqgfD3OIxhOY8bvSY=;
        b=wL52Gq9z2zQhs+tpm4KJ1TSaZAUsZgNAuUqWnSDNu4VS5jbFr1YBH6rGUKy4prdWZT
         pfuwg4of1u8AXxD4CJTi+xe/aF5205hiEkmHf5inokaGzX6fZqObiINCHgwxNijffkAJ
         MUxIEs6+ebJM8IwafYhMtBXSun1BdSLGnYU41FJjq5WtCo0OFTiCJZfspvZknckgy24e
         4lHQ20qYs6GTkDY66eLuQ/oyQhYbuouLs0opfHGfiC97S2KLfIcl6SNmrdE6dEIKXamC
         crJy4Ua7cNFAsdAiKXblkgz1PRT2oDC5eiyoRJbg5A6+DuZt25jNi5Cb2OOJfwhxJccO
         HD5g==
X-Forwarded-Encrypted: i=1; AJvYcCUsBFmOLrUQ3r46kOzXSxelQyF1M9xsfFGX+ShASCjO6FKFuRfkcRnbpQF4MNKFA09tVjD8OsVRfFi4yCMh@vger.kernel.org
X-Gm-Message-State: AOJu0YyAhG0/e4U3m4dgqHsxG7YX1e43Qkj4GfUycMEK5GtIA3kNknrL
	NRlTWOzIglW+bilj5ocS+K7jXCvRnoyND632FK6tIcxKf0fH+7Yv01XzLbpwHEFRmABkoUwiquf
	laTXTaXzHKRODJOGWaNSwPBjvoZ8UPfeGawOPSeZFaPdJvvCmKkQeB8MoFxbJjaOY+T2f
X-Gm-Gg: ASbGnct5JEQ0Sso3rk8OZ9qQhTfBri9M5nfU2FdvVI4FV7NVt+GUP8s4zaOej9rFh77
	BLhWYrgvUvsl4zQSFph4gS0E2jcH6nyk934IJTh6gv6n1nOLuRJY04JlWvRn3xIiTp9MyUR/QJA
	Sh2A9mtlCznHcpGwzQN5TEZ3wUVPu8yTuJ4y9PKNUYiL41ymdO6M2ZCZtX+E5/t7zmTB5PUa87m
	NOgEXiOfpj+ZNH2TxRlMQMnS5N6CVanZAuxHowgLpwFHub+ms6vqbQ7gtug2wpVYGXljeU31zAd
	S0epUiBiGhfwpl3xGoX4gI1kKtPvrRhdG5Is/5LmevIHG7dFlLYlHr6UzHA6HoMOSjJTWDUgS6/
	FTO1Lv0uQTC33F7ldew==
X-Received: by 2002:a05:620a:2596:b0:7e6:6ed8:be6e with SMTP id af79cd13be357-7e83b69fc23mr475557285a.2.1754911605923;
        Mon, 11 Aug 2025 04:26:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyjAl0KldBBqrP2dkmKQEiG85HhgslHvNvUuKaCDwmYjM+dyvf+iuE8pKHOehKA/6xP5UTMg==
X-Received: by 2002:a05:620a:2596:b0:7e6:6ed8:be6e with SMTP id af79cd13be357-7e83b69fc23mr475554885a.2.1754911605480;
        Mon, 11 Aug 2025 04:26:45 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c076sm1978002966b.102.2025.08.11.04.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:26:44 -0700 (PDT)
Message-ID: <23b8ef03-58ef-4cc1-a467-0fa0cccddf31@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 13:26:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: msm8953: Re-sort tlmm pinctrl
 states
To: Luca Weiss <luca@lucaweiss.eu>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-4-e83f104cabfc@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-msm8953-cci-v1-4-e83f104cabfc@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX3PSTxmaYTv9/
 f2uFIJt4VFUu0W7FBj4Do7gqrkL31/CK44pSFSBon3PVOuwI6AMnYKbm7CwusKMIy9IgyeZZOdq
 OfmsgU3UaUC1vt801jUT7bapdXmn4nMUt/kOFnu8UvpfXQ2ivhUyXNo4F0cdf64EO6IBGE5PMCs
 HLQqHvq3a93lZ9UNDHjHJuHupF9+dRJ/iT7vIiDp2ntA+WGJ5iMy2UZGfDIGjWKzzqyNsR7BCRn
 iP7pd1I0EY+6qUB1CK87JOeFj84lCfEmqccbV+PSzokm7sLlaYzvYbvsbAm/VENShggbY+sE+dU
 JJxDTRFvmTRzBlRhXDooYJV/U6lIjpWRvG3SHfzusRz5/LLrKfap3E04O95a6ezSsVxynN/JyX6
 znLrtxQN
X-Proofpoint-GUID: vAG8SzyOx2mSSDLoI8Q95bt-8ElRCXns
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=6899d376 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=o2iUG9rTFtLDcKp-zFwA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: vAG8SzyOx2mSSDLoI8Q95bt-8ElRCXns
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On 8/10/25 5:37 PM, Luca Weiss wrote:
> Follow the Devicetree Sources Coding Style and sort the pinctrl nodes by
> the pins property. This makes it simpler to add new pinctrl states in
> the future.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

