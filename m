Return-Path: <linux-arm-msm+bounces-89411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF4AD3241C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 15:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04225311E0AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 13:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C289028B7EA;
	Fri, 16 Jan 2026 13:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgfXFS5S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DVftt1GI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8F028468E
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 13:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768571905; cv=none; b=YFDKGl2fH9PvGb+Jx5kqkQeW/PTew5KdV5Uo1zYDmI5cj0uW+tuWNbkMdf2LidjmY/5ENgHm8TY8HwHCOgcibUEAqNe9JheO95lh86pCkEaVX1egkpYtlEZeYO/JZTIP84kEMQ7IGNLjMkEUUL8mzSuZ8T8lffIS2q8ZKmZx1yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768571905; c=relaxed/simple;
	bh=kfQSZHrSVdF5x1/EhlvZZ8On2MIbxaieC0nBq36IeUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BsZ27un2gF2JQNrFHVmGcWUEGut5+6hn1UB0f5mfbUOBpC+dB+8MQUn9IL9eqCgAYVJ++v4oS/Rb3JHZUVJnY7W6KF8AqlLQLI/h3OO74xdDMVHYj6CVoBfYeUbIXo2B+Tr9x2Xh7I5W3QXm0/LikHSqh39gqWGXokPO5luUaPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgfXFS5S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DVftt1GI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8GrtW2615142
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 13:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IajFANFp4pMuuPZKB8iLv8HMo1BZW4PXkR6TrNFXv14=; b=DgfXFS5SmidKS0C2
	Ynf2tWaTErOuTlC92hSvrMjVt/x+ikHkQ9dbHp//Pzf0d/kGE/yRE+a/0FJvZHNt
	+MBQt67r9af/ddpx+G4ERzuYLzSYb9wwUp4qoQff7QbxntPlckqIAkkXqczcmQ5e
	mTXo2qcoQeaVFF+nuWxbPfhtl/xZ+Oh9NDiqYQvGmVFC0SSj0sN9oJyoOqFY9+mW
	1aBwwRzhjLu2vzvOD5WuIkHfuD2OHN7Jaua7MweNiawwFJx/TrX80riNxrV1exH2
	qkYKUWH7h/KOivDYFoT7FQiB+/s1lHG88XcrT9D/TEFWsQ8EpiNioVyMDTdX/mGH
	3gUUUQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq977tdrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 13:58:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2fdf3a190so29173785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 05:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768571902; x=1769176702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IajFANFp4pMuuPZKB8iLv8HMo1BZW4PXkR6TrNFXv14=;
        b=DVftt1GIPpE75/qMzLk5Srcq3ezodJWUUnO6BHOntZ7OhUvi7yByhwqUb+RrzowEXR
         pB5or6D4YScZ1O4VcOXGdEZv7Ja7sIphNuGEHqJlaHYSpf96LX0T1gZoedpiOtbyp57m
         RnZh9ox9FNPJUm6lSudNY9FvdCRVUq6Jd7VTZckaeFHaKadjHpu4Robs0Bskd9in8L/g
         44ferOXpJUS6i2WainBp+bmILi5+EzdrANlc5bHBL2OMGDOqvdizm6xm1NghMNG5e/zW
         1BDdCKwb2QArHZr1F7Tj2a0+3CAtQkztr0dyPpTAqEfHvzTosD71JXGYYA371A3/Jg0A
         WSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768571902; x=1769176702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IajFANFp4pMuuPZKB8iLv8HMo1BZW4PXkR6TrNFXv14=;
        b=rNvTUkdymiKOIfB66gz+Eak/80GmSE3YORGnKr7EBjtNXcbRg5eJVk70ddjTfAkHTE
         InEbAlB3s6XrqXmJjidWHHSxcIZyKlAWhN3P2J1caGF39xrwYdwD53iWsJDTfI3axlBI
         I5L/UpN/sC6S4SaPqHy6AwVGIPDxpIwp5cInkrbKlo5dpp5UZgmpMod5m+HmQ+Ecgcrf
         Bw94yBE+YjdBB27T4zNwAadt+V7tkp/XtE4yKp/svag/n+Q7uNE38erf8/OjT0vAzmqy
         +7B1iHPBbrseJtJS/Lvc4rxnjN1ZEHqDeDyEXQyZpfiso7MIQRtYJj+pSLOvTx8nwRns
         dp4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsTm4uoppeIwXQkcYIVMaIR8Rb992rQlBJ7k07qCbjfVRfB5bHbDK3WJqy4qSiCeawVp6ox/y1EkXH8sJ/@vger.kernel.org
X-Gm-Message-State: AOJu0YzoB0ciIZIqD5iMWNY2XlxDOt71mY8ZxeS1wdEHG0AbTaUU4xHy
	v1AKg8Wu+VnhYpgsPT394V/0oqRKdQbj50LlK9bhToPfJ/N92DO9dp3J8uOsCukqAj32FiQFtQG
	ouk4GZMLVGc4C9HMbaEq8nfqaHwpwKuyFPQ+B05mzbLBnP09O+zwSZx6YzsnbRiJbwwsR
X-Gm-Gg: AY/fxX4l/Ii7LbxbR1pHyiWLeQJ2MvMLN0vC2zfbaaXBf0gro8cMFRScng9kOGLBl04
	4/fg/gSmB/rIDumLKsIt2xWATYe1lFUb6qFvm+ASVNO96MU6dcCJryJqwx+tu7awKK/LQmFuHK6
	MpjkV+FE0+pqrRYlVhsNookDbLsaF/jxmbsHXLUCKuCDf6MYQJt+0WHF2y80EAT/p14d072x2SZ
	asLPVZGCKB4iCYwPsy8a8+lMajs0XhlvxbIZsB+5TlyhhqNm3FJdSaC4Gs02coiI40eXMma7ZiH
	wnxBE4mVJ3PTYh8XKVFRJOjH4hSbQn3GdCSlMHntcW6dyzXM+bQYyDPEnna0XyP6jQZErD2oREO
	l3koxIei/IwgFRgVXKD9LXb4Y/EQFBKLTib26URtkgkEYzrlHJzB3afQSc82lqT9m0b0=
X-Received: by 2002:a05:620a:44c1:b0:8c5:2b02:83ee with SMTP id af79cd13be357-8c6a678095bmr319994585a.6.1768571902393;
        Fri, 16 Jan 2026 05:58:22 -0800 (PST)
X-Received: by 2002:a05:620a:44c1:b0:8c5:2b02:83ee with SMTP id af79cd13be357-8c6a678095bmr319991885a.6.1768571901943;
        Fri, 16 Jan 2026 05:58:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39c38asm772659e87.84.2026.01.16.05.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 05:58:21 -0800 (PST)
Message-ID: <b558d5b3-78f7-41ae-8cfa-f54fcfbaaddf@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 14:58:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: eeprom: at24: Add compatible for Puya
 P24C128F
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-1-28e01128da9c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-cci-v1-1-28e01128da9c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6PbsHyWYFmNsO11q-oQrkMQcW-a0RVMd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA5OCBTYWx0ZWRfXztebm0WvcwYB
 Jx9zHD9/EZ6Z3jHg/gScQ7UVHJF0pZXJAcUsYBYCvZErR6bJpPHRNYHMFj2jC1+OuQbnlkot4xd
 Zo057dQs6LYwe1/Ka9fY7I/Nyn7zQdoK60h8inbHI21RI/+744wywMwOsbUoNTIMfTJeiWH9HrC
 2qwYFI2ceu9QY+1rVHq5J3FKX7+0NAOFZqPukgkibCzai903Yc7lqMef2kjFM6PGSB+rHlscg01
 8NeaESx0PQa0MIbCeZADBqmo0ut7fCap6JxE+9gdzYy9pfs2NjcMhsVQvZZjoO9ldRws7qn3Gf7
 Tm1yapNvkObO+VysgkBxZSdsdYpOCR/FepURXiSVeifNyBuJFdd8rKdJXd+h0f1tOQS2sqXgg8E
 tCQ0GrV+9zWXovKUO90aKDKCu8hfhWL6kr7b0gRs8sRjt/MpQeegVlXH49wRaIZTIgx0Eosrfnf
 QlwvN3sWtuPZy9qMfXA==
X-Proofpoint-GUID: 6PbsHyWYFmNsO11q-oQrkMQcW-a0RVMd
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=696a43fe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_05,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160098

On 1/16/26 2:38 PM, Luca Weiss wrote:
> Add the compatible for an 128Kb EEPROM from Puya.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


