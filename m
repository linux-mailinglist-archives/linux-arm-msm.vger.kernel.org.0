Return-Path: <linux-arm-msm+bounces-63197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA2CAEF631
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 13:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CC411C00162
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 11:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A403B272806;
	Tue,  1 Jul 2025 11:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TkDKsZ5G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BB42727F7
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 11:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368299; cv=none; b=rNvqblJh31GFkkUTLQRu2SNoa0ytZUjGI2RwLPmbx//9Gm1SBd/2wNuiWSI5XZTGAITbO7RLfWhCcxADvaUBIi/KsWHXaGF3q1rlt96+bp4appNbpGf6voKpx+vbzYU4nD4WCgLU3SS8yb6mkUYDGxWpLaDuUJuElqLcKkuwBgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368299; c=relaxed/simple;
	bh=9WDZ1BqFOD3xKFamAF7RAiKGsLzFKTCGgUcxfHNHCNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QyGIe3O9UyzAyxedE2n1n+dBJRXLJgjOKDVzcMfYJcWwODgzuHkD9dp2u6I5d6oKEBUtLiGSvT7faZXD6aMI6z5zL5FicILT2C4uxy48DG595esRL/nwlbS3sfkcyYCcuzxZyBZuPWjcSRTKfaj+WLOVA4n4eVU+VIemyxZx7jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkDKsZ5G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619pTRx028431
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 11:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TrlZZdJIO7yzkVy8vnZqCokz+DnJKjhGP7uK8AgE5nA=; b=TkDKsZ5GUyt1B7T5
	OkxgZeG+x5ohTlr9KIpnlY91Rn8FNGsduMA1IxqbdHGMhHWGRrADlo/AlluuILv+
	al/tPZi9aJo1Y10Ci7aHm6CurQwwhc9+FF7veETzgWDW7dBO33gtpJBrXIscUq7A
	0QgcW3C2CmffluQ1XI/1Rw2m/GIMn0nWgOnZia/IWpa/Oydj/BKHZLGY9St/79lu
	9fmpEAb50Yo10hKlpX+6vQMp/mLMOJ3m2PGxX8fhneMQzQ41vV223/o6UDcETKpi
	HAAKpptQC21BlXlEyfUocHhzlX0hnXgujVIqSKaTXjqkoNC88cCmdj0pKfXdmqx4
	QGNm2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvrjw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 11:11:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d097083cc3so145663685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 04:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751368296; x=1751973096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TrlZZdJIO7yzkVy8vnZqCokz+DnJKjhGP7uK8AgE5nA=;
        b=Alxn98jvXZhTLp7t5gVS8VDLa7aSilQMFtZ09VxbZIxlYh/3YuR4EyoGG0p2pq2Woy
         QaM6V8Z5fwq6O8XW45tyZZJMqhbp1ZO4Pbyka5bkqPYcaBwGXe5MZMqjFmOZj+unJmOd
         y6HitsPsonC0LQPuu96+/lPrw5X4IYSIEMCIbAODnrE+rwpF/nvEQ5DxmYQzSpEm06Le
         hh9ncGJyF1Oz/87PuNizeZLa2iBvP/go0FVF1XV+MmRwYtbvNsZJzEmkrwHhBf7XagFL
         BMuvieTmMXRWrtXc6V/csN5wjoFydhzSZhoOVtOf6rdEU8IVTDEhyEtWPUi6XJIuXdb6
         twjQ==
X-Gm-Message-State: AOJu0YzmTNnj51rbqeqO9xboroLyKYHQmkWr6faTeXV45h/0R2jhwWAa
	LekVFnShDRnfKOAcx8R9IR1BkmOrdeCfreelDqcH6KedwLD46Z46Tp9R3qjrR5AeO/Jf5AZvGPa
	NKtYd837fyd/e+JBakYwlErSqLB5//+y+EPOZArU+JaVKZCmZ8SfEGRdlgY1GrApAvgQRN0CKus
	l1
X-Gm-Gg: ASbGncuGP7UqeocdfQwg7N7iMOYyuxiR380/3XHaQQTz/WVKna0GAnX24Ax7O8+B2yZ
	AyI3dTzi6+30CYGv+aBtOhNHElZJsEuzFVmUqcfaOU7YHbL8DcSFpooFK5vfyWU4aRpHFeXWQHp
	FiASko9cr0ldv/eu28319JNA+i4MjyBSxsTqoHKa30Eg0lfYYyCmOOzfji3j7RgXtxbelfvsmpD
	MqDamL0PmGtWhowGU/kATZbKo5anDowEjILTfSnAn1y4x+odKsPWf7d5b2XdPvsQk6qVEw9LoDH
	FSdCTdNZ/aLleTSQCaVjoOCS/+BB1OJx8lCbl9zGOj3bSPzWDSYcKr/OTYB9hAoqbfnutdnn3Ee
	eVZxIpZj6
X-Received: by 2002:a05:620a:29cf:b0:7d4:4a59:6e8f with SMTP id af79cd13be357-7d4677a1ef6mr127730585a.15.1751368296006;
        Tue, 01 Jul 2025 04:11:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0enYbn2hSOvbfPZgODz/DO0dsSgkRNbwZ7zhkY+8pN41BaLMoLizJRBjD4L/DazCQBLleTg==
X-Received: by 2002:a05:620a:29cf:b0:7d4:4a59:6e8f with SMTP id af79cd13be357-7d4677a1ef6mr127720585a.15.1751368292723;
        Tue, 01 Jul 2025 04:11:32 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae36327ce4asm772552166b.163.2025.07.01.04.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 04:11:32 -0700 (PDT)
Message-ID: <242d353e-99a1-4ce8-9435-8b2addcf1276@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 13:11:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: qcom: fix GPIO lookup flags for i2c-gpio
 SDA and SCL pins
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250701-qcom-gpio-lookup-open-drain-v1-0-9678c4352f11@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250701-qcom-gpio-lookup-open-drain-v1-0-9678c4352f11@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IV6nDld2XIr7ObeZv6m1b71CZWuwfcIK
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6863c269 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=OvpKPoiE28FR6mlLKbkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: IV6nDld2XIr7ObeZv6m1b71CZWuwfcIK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2OCBTYWx0ZWRfX5SmAi4MPOky4
 wztjRhRCg+omLUpiGLslLTtv/tiT27bLbVPH/2EyfM1tZCNAyWvyjhZfYFLvNzSNAy9NAYOc5S+
 jcqdYRFYZwx3VWvfC48mT1tf4gTU6dnc1lPybcyF60xGJXAZf1vON/C69N9qTVXE9j2EuKWQIOU
 75E+/gIGlC6xYFGBJAL2UKj9XTCuNhAGmOtYyaXO83DFUKtSPbQHjnrfZe2nwi7cdcoiop5tRn4
 Tnyjp3ErM/xFK33qPzAZ5jeH8glqIXlJO3LPN+hqob+sO2dhOnXpmbgVnwcPTQNKrlKOlgjX2zV
 Ua0JFjYXXKwSZY2414e45+EmFAVv35Kf/C+mraAGDkuEdS21PZE3MaywYNHfK0rnWQfGUBnXI3m
 Jxe+z0IXEocyEnAkdb6ZP5wSU+/EuBAPt26hlUEHmO5/+DQXzTCPmxMpWz8iEXUWsuF3KuCj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=623 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010068



On 01-Jul-25 11:01, Bartosz Golaszewski wrote:
> There are three platforms in the QCom DTS tree that are missing the
> open-drain lookup flag in their DT nodes associated with the i2c-gpio
> device whose driver enforces open-drain outputs. This causes the GPIO
> core to emit warnings such as:
> 
> [    5.153550] gpio-528 (sda): enforced open drain please flag it properly in DT/ACPI DSDT/board file
> [    5.166373] gpio-529 (scl): enforced open drain please flag it properly in DT/ACPI DSDT/board file
> 
> Silence the warnings by adding appriopriate flags.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

For the series:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

