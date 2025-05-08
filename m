Return-Path: <linux-arm-msm+bounces-57328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC70AB04CD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 22:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E67747B5B3D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 20:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2EDB28CF41;
	Thu,  8 May 2025 20:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fvs6oQQY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DB828C2A2
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 20:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746736884; cv=none; b=rAVJyt4BpBgPmlRxnMoVF09nxCTD6JuFQCji/N9NAl5oAbEOuF7onLXYrrTcoDUTU8aco1glHUia3D4n1uzYr6Zstn1OSYu8by8Rqq7tvuhE7ZlGMp0H9UFewEbz7bbna48vwqHo3zlZBSIVEXszM+BgeOsgblUEFKKxRaxkYNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746736884; c=relaxed/simple;
	bh=QbQbInT28z8l5bMaj93I+MSq/eE1z7PNcWBODFwxaog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJTYcW7K0D7Gy1Qr1u9AN/lNYCWdZq/iOGeF8N3DC0/O4kRJLUYjpt7kgohWg/cD83KlJsZqrl2jmIcvIeJ+wtsdigYmfR2Qow60WNoJoH9B0x4mEJAC5HoQ7So4bECwZOBjWM7ryDSrf3LqfHPRO+JyVHRADVVljK3dqfh9Iqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fvs6oQQY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DE1hJ014401
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 20:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QbQbInT28z8l5bMaj93I+MSq/eE1z7PNcWBODFwxaog=; b=Fvs6oQQYRHilLitm
	34io+n9UO4rUvBOKUB7nxCA9t046gAkqXD00fsuiZsHacF0viZUOWqjH0QueiUNW
	DOxz5zMb/5bqCLHp9AJQz5QceT1coAvLJtYETJmssPMWa0FN0wV1hI+MGefMTHNq
	ij6bD2+qJml2kCEx5KSEzFjenU3Gxp6fd+e6apcWsgaMcGV8WZuyGU0uqEVuWnjU
	z7opC0sEF9BBJyv2UiHbAwS8VdniWeyNCkG67+C+GZboI7RxCf99HC8XJ8ZN9ab/
	hNJTBbTEVoIq8AekA1IpSejkE12kGqYRV/xOVV8OchtpZncsyxVYvepYzyGp+Tvr
	IZVEOw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4jhft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 20:41:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-742360cec7eso435125b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 13:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746736881; x=1747341681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QbQbInT28z8l5bMaj93I+MSq/eE1z7PNcWBODFwxaog=;
        b=sBX+r6K9vAzMn6jpuVMvB9kjW0rgxF83alQLETImjk/GiGQ0npU8FS7iZfWTgHu5PE
         1iovJ+thoptOv6hHbeI9G9ohi9o6OfMrB0qtOyhIPBzRP3GiaOjtVMeIq1/bBwHS+Au7
         zhuLsLrauU4JAVuTv7/6UM9u/6DwAxs6MASepmSZar+pog7SapLWrMt6/TOlt4664ctJ
         lbu+qvXA5j3rJcSlNiv5xgMyJM7MlAWuLUUeqhq/D7w6ECLvBDRdzpebLjBUYqqQGfWE
         oyswoNJe7Vhddz05dJYMSuuNPnvZlUI5TmYBzWRnz+BWTLY43fSmCXp8aLh77cT0fMDH
         WEbw==
X-Gm-Message-State: AOJu0YybBLxetHvZJ/HzOPDIlWeHrdhYLlmJlGQg9hSRGVTJQ4ZH+zRl
	sc3SOn99rFNozUtIQnWgPI+oyfFQbQB0BPrKRwBss72K8cn1RUZnVmUMmkK++gJ26/BakEOzeWe
	+PysfssVp2zyakRkC44iH9eNkxIlLlYr1P1XxkENurgPa6spHgeeMGLmp7Y4FycP2
X-Gm-Gg: ASbGncs/9SUXRiG06Im1rp651dGiL9dK3gLziIEjdLFZYn91f4KeTD/TbJZetXK27ZL
	82KAOnfHU4bv6GlqQ9PjEonhgLOro46DV0NcJC6J9b+zcwKRm8Ka4/cHheZRTrWO5Gn33egKRxp
	mdHSdvUrtT0bG/6t86rRqbVL+NFhlK4uYbQq/KJLFV1gFLEFsM2aB7tac0q7/AiMUv9ZxJ6NAFb
	ZPLvUnNnSR1xeKS0DBCLMdSxAV/jZDSHjSBor53ViN9/37zu97bpL8peqJrxlIkjyWUWHhUMXau
	wq9wqSF7QJb0naqgJoGEPLDlzGGch+BQiqYRKDfvVromdM3/2gRizaN6ElxKh+RTNNE=
X-Received: by 2002:a05:6a00:a387:b0:736:4e67:d631 with SMTP id d2e1a72fcca58-7423c0847cdmr802802b3a.23.1746736880849;
        Thu, 08 May 2025 13:41:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEprAh+upkBqZbr6AvV6R8fa6aznVOqLH7rPSamRDubjAMwRZxovE7CTUHUv5Q3UkygrNcxiQ==
X-Received: by 2002:a05:6a00:a387:b0:736:4e67:d631 with SMTP id d2e1a72fcca58-7423c0847cdmr802768b3a.23.1746736880454;
        Thu, 08 May 2025 13:41:20 -0700 (PDT)
Received: from [10.71.111.209] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a408bcsm467404b3a.149.2025.05.08.13.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 13:41:19 -0700 (PDT)
Message-ID: <8c6a8e84-a802-442a-89f5-a99261761d20@oss.qualcomm.com>
Date: Thu, 8 May 2025 13:41:18 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: arm: qcom,ids: add SoC ID for SM8750
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250508134635.1627031-1-mukesh.ojha@oss.qualcomm.com>
 <20250508134635.1627031-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
In-Reply-To: <20250508134635.1627031-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0kAEJD9VQJd3PXBRticUgk2WPDTdIKAj
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681d16f2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=J9Vk1PX46GMNcKasQmoA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE4NSBTYWx0ZWRfXwJlN4zZJ+2kQ
 j9Qs2BwhF/TAcegSTVRjT5PMsa2GpYEQMhvsvsXoKbrt8PHmti7ooCXDfXM0FtOg8gJI/lG1LBW
 j1yAB+cLRm30L3S+C6wmElxSyPNTt9Rl038osvd8VqnfA3BFnI5QDPtSQpEKLHsCyr0h0NtHu1g
 sN0q489hbWAt7OF8nB33CY1K3ISaNS8pJBYJ7cYx4cFBhobyIWIfYMVxu7z4qesESGWz5Q6v+XT
 xm9rBncmvXzqaC91RL9LDCpYYS6jrE2DcJP3kMQcRH+7M8m6nm0+pIhM58eEJA1SsPZKjbF3SMW
 JNzPPyWTvY/GyzBEx0ChW0KSr361GlBMv+dZqAB4PzW0f3ldlHFdQlicoyJp+wsxq2ZAQpDQm84
 EleEpTw1uwuU3EaWSp49UekJAi+TCXptIz7ACd1JDhDJK8sQFPP2KP6Vu6YOQdqWlPsiA+Xz
X-Proofpoint-ORIG-GUID: 0kAEJD9VQJd3PXBRticUgk2WPDTdIKAj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_06,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=664
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080185



On 5/8/2025 6:46 AM, Mukesh Ojha wrote:
> Add the unique ID for Qualcomm SM8750 SoC.
> This value is used to differentiate the SoC across qcom targets.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>

Reviewed-by: Melody Olvera <melody.olvera@oss.qualcomm.com>

Thanks,
Melody

