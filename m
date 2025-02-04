Return-Path: <linux-arm-msm+bounces-46886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11226A27802
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 18:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E42E11880637
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 17:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619C02144DC;
	Tue,  4 Feb 2025 17:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V6ted2xt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6852139BF
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Feb 2025 17:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738689036; cv=none; b=KIK8Tlg8cqcHJRm+CZ7Szn+7MPI0jMvzpZ9HvA6Rgz0UYjtNBjGr55+Ka8l2AcSrb4l50OAyS79YV6u6a8U/AsxU3Y6VRm9c/2ikLPZ7Ek9hs+SkodpZPzjgQ57UkjGhlCf3ZogzhimCGzNJDmyzm0aa0eqm7gY6Mwvi8OJPT8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738689036; c=relaxed/simple;
	bh=WClA2hjGmDTBCXfYuPCorGlY1CPIwSrKiSQprGI71FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YNhktLHaEz+Id90xfCy60quWwRWW3wwc4Wo3+rPsB+9XquWbVWTwPV35qLw6vRyvLuq0DV5NVBKTbTo/TCorZxrjzpLtC3yIGBYDYhILvC6yXznMec4gW7ZDBiGTThgegDpQTjbEEqTDocD3eTDYv+GlaqaQBSMddQAfVnCiFR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V6ted2xt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514FLkI6028352
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Feb 2025 17:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SsDGZBIjvd4ugYUNZOpTcyGwaYThqVWQG2QneGzmYiI=; b=V6ted2xtAeG3Vcfz
	/pgbq9m8UEBriwm6RoMU03F58vepRS12WaPbTvg0Ca7RGl1zpnmYLMkx2DJi3mzf
	VzN+P/ZzbflfTPK95tzgcTJgSbNO5N2hUKgauqWohIBPx8FlEmnBH0VagxWeH0xo
	QFcH3eZfvqEUE4Iuh0LHeN2cRrtFaqx26td5Zhyc5Uvgp2GwJGombRyh0TAuBbFf
	aaCk7FqLAbo+0O05xqQzd5G9Gsg+LrsK96Ne5RMoU9EXlBv8fOPj3Kui9lBRQuSm
	LnDxi5G4L8JVZSV2Ryll5/EL1xHbWbBrVz/3+3zs0yI4qIINQk97dhbra4SzSl8V
	krFarQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kmre0d8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 17:10:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef775ec883so10966934a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 09:10:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738689032; x=1739293832;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SsDGZBIjvd4ugYUNZOpTcyGwaYThqVWQG2QneGzmYiI=;
        b=htW7rDeTFcnRbQDGPo3vmqaJZhDtirNjEvtYOMFIPn61LTVEHoChJJwAfH4NjxvFSO
         OvUIpzMkjRV0APMQBLVwSeTi77Bzztg/gkotsqbLWeWY7v5arBBKVEUzck2RBT5tWYUs
         yPB2vbjER0xpzjS7PWJd+iayfiHIxNTihaj3IwRISZcJmRQwK+5t3mw1hsswCLXsp8XU
         4r+DXi0LVv5WmmfTwPDFy0k+ESRYfMX+H0LoBxAJLvdqA2zk5+FqchMIDeW3omDFmVOB
         Xmn1P/JBZPk5w19zdmcZzI4C/Zw/4f+qyZKp5euhvBYOGn8lsWUlviZ1B1b4GGPG7ZfY
         BAOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSJxeDbstUbpGuZrRIp00AvQ5JeQwJCSocBCUMlqmpCq6NcBG7apb4IGsdOc7976pZG+/HFrzMdMgUkuOL@vger.kernel.org
X-Gm-Message-State: AOJu0YwmdGotTZ4wmb0XxFO4A+WkUV+KxcEZYh6DtFNf2FTr1Gq4V0h4
	5VgyO+shAkmoeJak9uFpBHTyPigFeYtjxoNE9DPl4P7x/OPV8ii42xC65HWby8ll0byix7A5KbV
	WbmtSfxEj5n6FwQZBjImelAoG8LqjZpkmdkLPm72bTyD31h+RwiJWysjEaPx+43pY
X-Gm-Gg: ASbGnctT9qCsnZXnV1udpFZZHK4Q6eCUZZ91J12+sWdyMcV7+XtNPgwokeYkpynz8mz
	DKF8GfzdsIgvyOYCYGx5+a1DWzKbeC45caahk85DZ9EHl7ujOyB5nj8FzRacWhgeeZJCuvz6d46
	WUueELsUsKGZzYGULpKQM76z26R1NgCg2PMmuFrT67dLd8XM0Xk5R7tWvSM2huQc3uc9Ijcv6RS
	DR+mPvI0L3RdwCrO4onrPa1UxNraEcfk8KgmNjDMAaUdOiweqSOvyREa+UH/6XXa/iVmSY29v5E
	5yS6gbd9QZ2UbCjKO2mN+sWSRTHquyTvtdXIEn6aM8o7a2IpyX7IBQJpFmS2
X-Received: by 2002:a17:90b:524a:b0:2ee:90a1:5d42 with SMTP id 98e67ed59e1d1-2f83aa82299mr48464917a91.0.1738689032151;
        Tue, 04 Feb 2025 09:10:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzCWDkniKX+zBYsFG2EMNZzOthXO5bVaro8s2OVGW75t4hi0RRGwvhIGBaMTmjQdoebzT3Zg==
X-Received: by 2002:a17:90b:524a:b0:2ee:90a1:5d42 with SMTP id 98e67ed59e1d1-2f83aa82299mr48464875a91.0.1738689031782;
        Tue, 04 Feb 2025 09:10:31 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bcd19c6sm13781967a91.19.2025.02.04.09.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 09:10:31 -0800 (PST)
Message-ID: <8bda08e8-e63e-4dc1-95f0-793cc5f4ecb3@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 09:10:30 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k: add device-specific firmware for QCM6490 boards
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-firmware@kernel.org, ath11k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250201162052.3858294-1-dmitry.baryshkov@linaro.org>
 <Z6JHWMJFPB8mJfdw@hu-bjorande-lv.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <Z6JHWMJFPB8mJfdw@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BTUj4vsyvKWUBvHCV28L_2xHC8dB_HPO
X-Proofpoint-GUID: BTUj4vsyvKWUBvHCV28L_2xHC8dB_HPO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=878 bulkscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040132

On 2/4/2025 8:59 AM, Bjorn Andersson wrote:
> On Sat, Feb 01, 2025 at 06:20:52PM +0200, Dmitry Baryshkov wrote:
>> Josh, please give a couple of days to let ath11k and MSM maintainers to ACK or
>> NAK this.
>>
> 
> Acked-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


