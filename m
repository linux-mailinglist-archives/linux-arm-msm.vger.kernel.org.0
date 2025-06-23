Return-Path: <linux-arm-msm+bounces-62033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32960AE3D07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 12:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34BF017534A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 10:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CEF248F7C;
	Mon, 23 Jun 2025 10:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVuRj2zA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809CE248F4A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674980; cv=none; b=WPUOnOAWV5BrJFbHTbAsjy00U+CArO+9CLIYhdP0otP2vE+zYLeQDWagouSZdii2qTkb5oNNhCqQvSkOTDyRjsC3j0OQuzyXPp3KNapfMHs2wabM9nOFOV+fXE11m/rGF3iV26TPIKNS/a2+cd+1fvjDFsDh66/DfYV5H9cMwdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674980; c=relaxed/simple;
	bh=jqB5RXeiCy2yxvpHqTiyoT+mAboYbVQIXqhgiMQcyzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qg+7bzEpepv2QtB+rLFVgtbK5NR/tG83eGQaIut3T1qkbpInuR/1SMYWJpDQilUkzPk2zHCbvPr8oiCnKzBrsE2zCORDh5ykYvBo1xJiR9sMFpxohPg9sKUv5rnSz7Bx2KbW5JeltY762okOP/0s+I+DFCwCG8SqD6bfQlmDkmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVuRj2zA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9gv24017715
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	78ZQ1vr+4TJZ9LcD4aXxyiueI6fILqj2qthFui2TXx0=; b=HVuRj2zAB6h+roFK
	tJswB5HZNAJ8dTFpUQsOEHwiZdQn/rkiiR3AuPjG1D2NF6d5agIwSNDsFS+Ntnee
	Nvu31Ct9lL4qcicnT5KzbxcUxwRXy0lGzzDA3MKdhJU6G/nfNGH9Vh0rths5ZiwC
	EQw6cLZd1T7oLI/7I/HfK7/jAE351TED7ZR8o0lM8xpwve35suVqYJYYn27xE74A
	bKQfRv6inRg/zF02UqeXIVu2LR1K14yRQgdXvxVG3WpgamPcTTWFxGwdX9irI2qQ
	EdkB/Bj5/p5Tn3zCCV1a1TuaE9PC3+NPzOraVvsJ/fNQLU/Nt6IFOVFBZPCW8now
	CiFFIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5he05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:36:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5af539464so114540685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 03:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750674977; x=1751279777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=78ZQ1vr+4TJZ9LcD4aXxyiueI6fILqj2qthFui2TXx0=;
        b=Sw0iIomFtsMT1G/z+TDKq1ETZ0YkauOFZuKmfOtW+YzAN47ps7jl+ztn9A8gCe8XkG
         rmd8pWTunXq9luKNqSyREBlZJD3pr09jeOcLpq+WFp9mor4LFxaH/kOVN33LWCf4sAkW
         4p8SX11SZig1kyZOfcN9BwuunkIVDtfziLZn6KryWVfU6/a5VLGvg0rBQsBdHgi8NdmI
         pv3hrca8CUBzDmVSVwgfZRQyA4NudfJ6uZdZX9MNwtm5jOA3Z0gBHqwQFQuGF19LVxvM
         +zH+lT1ejuNYC6hYcn9A8g2LE467EGGc3L0UaaYPIeY+dVJZaMvwr00sCzUczXV/Z4bj
         Zz+A==
X-Gm-Message-State: AOJu0YzE7YpCKlewESsB0fPGZExZVgIAT/ZYO7RyDSNvJ6J/ySVBrvUf
	Ggb+kUVu+w1ltcXIjxWOTwMHSh3tfzaXNTCZiSYi18PCYmPLNMM6XMEYDWBEJJkF5deKxWQq3qk
	WMvZZ4I9jRkRLPs6xFXccsox7lF8bV7pFcfuao0m9z87p0b75KGXqST0VNZAjt3DoLOnf
X-Gm-Gg: ASbGncur3a3T9hpgOHyRtK5wDZlD4SIgJF8VUPIMWl/M/GACOf/EtoKdg+Rc3qbQtQm
	hObPQufBsVR6OquCR/+am+zL0X1q1P/EjxalePhJfM9VXAV6yjHed4C8s44eoDfKEb3B+0TZS6B
	VNHUB8uKNc0JVDxzirvfbmfKKR8Y2tJGucLLJqf3ZNSjtMFCa+8OSzrbPYGlDbNJeDD0FRi3Z7b
	ps+m1oAfofOM9sEyBTDe4dNrp6ZWWWtUPEoPywF+kiOcs9ORi3sp5k1EsAYC+2OrSJ2AtKHmDdG
	cZsjgZBvADfUkJFdZqk/ztcGv889g0ej06+5Nqa4xMO8fWsLtZU1ToEq8T7Wz1q81oXxxVF8JWI
	fe1k=
X-Received: by 2002:a05:622a:9:b0:4a6:fb4d:b4e with SMTP id d75a77b69052e-4a77a27a4bcmr70701981cf.13.1750674977229;
        Mon, 23 Jun 2025 03:36:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERfb+THWbpuzGEe8wq5BdPRAx8kEqGpZc5Z1zw42lxTetsNLxPB2ZpXeQscW936xCLuoVGqw==
X-Received: by 2002:a05:622a:9:b0:4a6:fb4d:b4e with SMTP id d75a77b69052e-4a77a27a4bcmr70701671cf.13.1750674976523;
        Mon, 23 Jun 2025 03:36:16 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cc09b5sm5840626a12.61.2025.06.23.03.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:36:16 -0700 (PDT)
Message-ID: <1dcf0478-49d2-425e-9fc2-137ab3f89eb4@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 12:36:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sdm850-lenovo-yoga-c630: fix RTC
 offset info
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
 <20250621-more-qseecom-v2-4-6e8f635640c5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250621-more-qseecom-v2-4-6e8f635640c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wujQmTyoMVslGsvSQLTP7CgQ-VA1W_uh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2MyBTYWx0ZWRfX5OTfuFhv/mzr
 i6LiAENmvcI7F0yEqfNJerBAaWqib2HoKAlKIIJ4AvHaFZCztfLBXUex2753Q/QNN3yF2svC0cq
 3uK5xmh7zqJ0JKhidsvu48NCTy4xqT26yUvEdMEEJ7/I6QCg7xx2+Klq/+9BnAgW10U7zxVv11g
 TbagomdUWxGvtf95QKwEgo96+P9aJdlXp6CiO6Igj8z0XumFNWrTXLWPjl5LqOBrTWVzTAQRbab
 BoiV9wDyaJPTPCUMymZ13IWtMv6SJ3T+B63d9C///uuoz3lyaUWa/siEgz4C65M+Y2xr2wL+4tt
 bwpCwbuRH0k3yos5GIH8KiVH8kTVoKT6AdRki05Mq+6quXkSW2xu64R4/FvH8DYiHnnfURJ/8by
 eMBf8xEL6uvZS7mZW/+voO30yWmo8Q9cFwxuGSUDLW2iyCEYoIF9fhQvYS/Qc6uW8MFkDbj4
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=68592e22 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=VbgocMZr7HyCK-CFy7MA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: wujQmTyoMVslGsvSQLTP7CgQ-VA1W_uh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=698 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230063

On 6/21/25 9:56 PM, Dmitry Baryshkov wrote:
> Lenovo Yoga C630 as most of the other WoA devices stores RTC offset in
> the UEFI variable. Add corresponding property to the RTC device in order
> to make RTC driver wait for UEFI variables to become available and then
> read offset value from the corresponding variable.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

