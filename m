Return-Path: <linux-arm-msm+bounces-61004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AD4AD59F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 17:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C89E13A2395
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 15:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14A61A83E8;
	Wed, 11 Jun 2025 15:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oAa3HckZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BF71AAA11
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 15:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654669; cv=none; b=nEc92fM9jV9sYBF0gwsibXtM3figdSqfpft8SwZfjDq58cRYHxArFLwCoQg0SMulsqC0uIqXt20cYS0bdwTSJqyMvML1oEnNrQ2NA/eIystCPvk5mePbD130pjYZ4ZjpKNZUzQk0xEF9lxRyArxQikKpF9IiL5tlbiNmQJ3lM24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654669; c=relaxed/simple;
	bh=xIY+8vOXdTA2r3NFwtuqB6f0FhcbF1mjiXLO5Kqlg/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TjuMMW8VOAlUKr0+ipf8go2MYkZZn74+A3wIr624Ob9TOY+bS4iuZxIeeVPgFFPFPXNY/2w5F/yuuiF397gSBWaCeeYlK8JXI0WCkAQugtc2S7Ljr0f472LLjJ6quU92enyTiAHgA998HuoQHoeUG/OGS+54qevuk4+IMw0nTM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oAa3HckZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DEll019616
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 15:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XRHkflpiDITTbNLmPmmf2fFvfeQDPpqdt8UJpTn703A=; b=oAa3HckZ02gycP0B
	Byr9IfZpMhU9dSCUa9WSbADnqkgFESYBvfzroEyhEKPxbUkp+4xlqcymVkIPe9g4
	GwtnAupEP7Fyea331nGAu8o9zV3zH6Ri1UmqSauXGAZKE+KtPcq7oKEcC3UKD1Sk
	EGmVTdKQy9h/0SlbNK6sLXuPoLTq37e69OaSZfWEYKBvytOoJbvU6CMqgximyKEs
	w5K6mhovWagsqY/qHKyhClvFe4ypvGDCLLkZFdWL+YCaB4jdqWM+Oy/EO+gXIIei
	cjxs6b2JbfYEMsnNY2ry+91q+YjFgq0zZEj1+iKakyOIQ0o1iZ2L5C/JyYn2E+M4
	tATx6w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcncwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 15:11:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb030f541bso1596966d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 08:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749654666; x=1750259466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XRHkflpiDITTbNLmPmmf2fFvfeQDPpqdt8UJpTn703A=;
        b=Use3ZmMEUsuM2tM/krxJIFvtRCRdy2tZN4bQtJz8i3/Ebw3cJ2YT8xabo+0K2/YTJS
         VnqrH2WXKBkFtYYke3UclwOUltcUW7k19wuAr3NvLzOM/5GWGfpJID9mI6+0J3vH8mGv
         hlAFxrGgWDGTw5KYVX8/CinKTQniBRrksIZSY8Lu1L/9OqWWjUmWpPuWDbbJLPqbdPzK
         IzfWqf4ztuCnWDwFRskkd3fau3xZBCj6PaWaMONQ85p2YiM4BVzwmXM34OVAzygHmRTW
         h4RqtM9Qqc9vAW35qKocMLK7RhUt40auwmrp1h5bAuo+pF7Nd77kvw3D4ALL8liE+QFJ
         PDeA==
X-Gm-Message-State: AOJu0Ywu9lngBqveNNi4juoytdE7WmPciG0dD8vjNDGK7neuBWTtB4sp
	Lga1SVvg9OwnUzgPngcy8T8TzY09xo7c1fTZstkKFI7nmO3pbCuRKUxA8wbUYpI86iRNAtJRhum
	HpA6Nuv+iOhhr71VXTBxibGdIMwsTT2dXAHwvfu4tM4V+caiQccf3oDZ70YAyggzPYecj
X-Gm-Gg: ASbGnctYfDyC/iJjpArEWez97m5e3JEdKjErfJGzl/vKiygs/pRToWXbeUPGiNgasi0
	cwwP/tr07oXeIW7j5Gr8oQ0aS81DJvZOnKSIQEdwYrxHSIb5n18JAq8gUrUFvrqlHpIdEMOuwQ2
	0+CCwrk8kasJBbXcQWNlQhiLUKXUoyoZxC6aAj/QHO6VI2H/Aq6HMWGiqBY5xs3Gyqjzi9HsYhz
	KEEXPVt/MmTA0kNARc0P7sTLydM/pSNV4PdpW8U6Byoz82lQiy8wqMLkTsfWSzYo1h5aTw3bswb
	K1rHkni5sn3pxFZ57L5sUO/XhcdN3t22ZDoUJPr9I4Qo1UHzDSzb5PgnqLgp9GN0osI1grq/yLd
	CP+I=
X-Received: by 2002:a05:620a:c44:b0:7d0:9a77:fb0b with SMTP id af79cd13be357-7d3a888175amr184309385a.12.1749654665969;
        Wed, 11 Jun 2025 08:11:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAMLco/lP1MiIm1Dc5YET2BYjUFpCExzSZhN/HK38bVJxSEhowNFeEa+jpy1xWNrJRJx/r7g==
X-Received: by 2002:a05:620a:c44:b0:7d0:9a77:fb0b with SMTP id af79cd13be357-7d3a888175amr184307285a.12.1749654665540;
        Wed, 11 Jun 2025 08:11:05 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c316sm913363866b.98.2025.06.11.08.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 08:11:05 -0700 (PDT)
Message-ID: <aa9f23c2-8979-4e31-9f18-9be6ed0a45b8@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 17:11:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: x1e80100-hp-x14: amend order of
 nodes
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250610-hp-x14-v3-0-35d5b50efae0@oldschoolsolutions.biz>
 <20250610-hp-x14-v3-3-35d5b50efae0@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250610-hp-x14-v3-3-35d5b50efae0@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEyNiBTYWx0ZWRfX7mTCSeoSx9m/
 njXmw54oWvR7jZ3lYDIyu73nIHXwgYu6qCTyoMTTUWIFFpuy4PKptgxWmDhPeBGGqkqWBGaveD7
 UQsxHqdttRsT4GzgjzTKP8zsua5ei2e9wnGZIKFBD8Nl20duxTOToZ7b+YoIaX4An/cq/ZAOox+
 CeSi4+yMQ1gi4rJyJWWUXVvaJ216HWia6simquCZJTyN4L/YkU9q74h+dtuSF11ps9a55W4l0wB
 bXcHP3UU/pIDlc0wPaUgZSSwqSeXj3XVuQWr53VPigvKUqF4z5SxLHopbox7iJTU+wcxusCZxeY
 yhGHMPzXu54hrMoKteqotcA9g3AH0jC0uyf+UuTzSOF4kQvjA2QaZmnegXOAxKVQGNLfOQn39O5
 BO2UatzCZSQ4Ovv3+ZDueA8uhTdyzPxPPH+yFqxYQEp/9dS0V2xctCRSGume3Vq3JeZ4RKND
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=68499c8b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=vdNxfUKwvXZ3YRcdAeoA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: C-6Ikwx84Z0OsidIyayYJjbFYcl1EiVv
X-Proofpoint-ORIG-GUID: C-6Ikwx84Z0OsidIyayYJjbFYcl1EiVv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=812
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110126

On 6/10/25 7:25 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> amend the order of pmk8550_* nodes afte pmc8380_*
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

