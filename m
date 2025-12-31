Return-Path: <linux-arm-msm+bounces-87113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7118CEBFB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 13:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66F3130088B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 12:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8EF925A357;
	Wed, 31 Dec 2025 12:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mf8BWIeK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADB8MoYd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9F625DAEA
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767184377; cv=none; b=UBRdrvzDelCi3VDWd4ArqJt4+PufOaRNHG0qZ3Z8arCnghApCS6M2FqYZizeNlLQ1xLtZfsclptDE71bZ1d4g8sCO/TWJaqH6kXmMebY4Sd5YpJF0/r0TBMHNSHVhCzNOnmL6EoR8dLcY26GRxuQnNIhfV3DWV+DmJeeEDF8vIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767184377; c=relaxed/simple;
	bh=ocwk98ebP18x4J5Gue7LXL3yvqHWJ7jrGUYf9KdE/aI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dOuK4lA7K+xesZyvhHnzonvLILq1B+MNvqnpatLwkShuHjruPdWkMEc6IwfLKy1uZw7zIV21WEnxQTfeYYr7Ki3O80BtNLKeN7MDJ82lF61wvcth53ElOzEwUCD1eYlxDUd872WsaXPHvwUDV5MJRlnJrtIfKwjDbDEIjVl70iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mf8BWIeK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADB8MoYd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVAOBGv2284829
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4f8Ohw9RlteCxQUZWgjNwsvJ9mz8ifExO0etY46Zc8M=; b=Mf8BWIeKAvQe/vR7
	XXcsyrzDDeXRbGwbyIcvrrI+8xxscN5FGGqfKkQd0BL1RUa8cEBVjVIavnIANnst
	4R/vlv7ZrOvS5z45YaU2cui7dYJWN011Y6rboAMo9BHyuTrAQBQJvth0wNNqT7IK
	UR/hAlSHab8yfhDWTc2dSqBWyxBvKyFrh7GtERgKOR2Ld618G9eB8MRInVZ9uwFp
	b+wT55CfXP+PgbD5FG6U/9IUWQgg/Rb147EYHh2Zfqwcfbhacvd4GMaXCbGLoTA/
	lrb+nsR979AV3G4e7l6WK4+8NqFVAGpBswPgdE7DpcQf/0cSfYGy0E2QMWXppeau
	25fZMQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc06gvdpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:32:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b9f3eaae4bso352960285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767184374; x=1767789174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4f8Ohw9RlteCxQUZWgjNwsvJ9mz8ifExO0etY46Zc8M=;
        b=ADB8MoYdKCGEQSbhJufFlBeaH9Ec5k/0S825nBfEO5pILruOhca+LbzrOVUeDMqASX
         K34FVN+4OtgU/3LKwGjqtvayXhsXv0wwMkbd8iu0z6JCy+l5JYycxIU3NYkKoFN+4lny
         SBzJprFzHrVoElkGUdfEveq/YyrG9jVF/b/gNESaOfgq52fXgUXDBLCFKOTPbwNU1395
         8GYhG9PYInYRe6QmphyYH0DwBwS/ZqWxcIy565+/biPvLqqoflsXN+QBGvQob1Ryyubs
         S2xgyNt8c4qdHLRE8GFy/QPFeXgrM1SUX20QcH9Lq4eJFKOQZmepM7s/pWKfz3kkiCH3
         4MuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767184374; x=1767789174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4f8Ohw9RlteCxQUZWgjNwsvJ9mz8ifExO0etY46Zc8M=;
        b=s7V1Yrc1ljVZaVGiAQJyfry1NKbEtu2ImAQh1DPPMdLTgL8T4wfvfOpiWjgqI1UF0i
         X8Cz7iP69mFA79MVHFv9gvUurvpXCNsCtEjcxOCGjsDJpU40+I5CqzVAnv4D7tqy8pyB
         Fk8MKRRGTbuciuhuMEWk9NXYVIhK0xcYCSObXR/iXAGHUapyPzrAjkBQZA+b86T0lib1
         QD6BDdwxs0gwIz68NvJPNrVEqIR6mu3OAdEO+civxEKGXnXvWdvG0Envh1PEu5PzeXMs
         S+/2QrEgFSIFvsZ/9CNlQnnV/dfZAh2QCmRlUEZFsmQLH3nR4k/Yp14Zq+OaH+e2/KbW
         /Zxg==
X-Forwarded-Encrypted: i=1; AJvYcCUFfD5eh4DeLObazI2unXBf0TS8kHUleztJ2Icjv8c1Xwkjw7YCFPiUgI77L/0tHzqOJdsICRsfv9t1QcmI@vger.kernel.org
X-Gm-Message-State: AOJu0YwNakug2bFgr257Ls6cxA8cZE83/+eRBdoa5tzY3B2pz+VPlVI8
	8okqmUaPOH3i85BRBI9L6nEvwygBBZ4LiBagJ1I61jO4I+GzdLEfLQ5oD1cPBBC+oM/2b2Qzash
	egGqOVXV9Il49MP6byigZDiVlUt+VR/3oE4MUtUtjJSbjugTED+4FRsYVIEtAenamBLsV
X-Gm-Gg: AY/fxX57ZWhviFvLDyRUCDKD9CDY9A33AkcxheBOhL0r6XPDzC2mDQfkX62zcbmZ653
	o1uR7CAmqqCpwt88oSQOkW4KT4rpjgkg5IEmRTiwADD/G1cxZRMauEbfrxj7u4iKx6KZgEnz+QC
	opkf4MOGFP/xHXu0Oawx8Vzl7KgAnV/tKY1rDpseVBsvISKxptZiUiMkPp6zDexOfjPbmJ6iIj/
	/7w+uZK/gO4fECVdEZnsmQ3ZWWVNxUbUiGiU5NoO17uI4y624YiwSwPeXqayzk6yCVazY3Iy89M
	ozirCt8h/khcLQbpq7pr0MHyyKJmvQT39u9aOki6tg0ahPHVl1+aDxPP1veH6/ZmqHl0eAu0tBP
	yRf3yVxo4NzghpgNl5K9hoHQbUAAX2CxC79fMSKsZ3LziFQpnhzP6njW+8tXAoc5J0A==
X-Received: by 2002:ac8:5744:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f4abdcbf88mr407672101cf.8.1767184374616;
        Wed, 31 Dec 2025 04:32:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlGFbMPjijBA1sn/PHyiGytwNZHCVbgS7+Ai/QZREe094f4YBz9CVh7hBVFNBuxiBhBIr4AA==
X-Received: by 2002:ac8:5744:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f4abdcbf88mr407671821cf.8.1767184374182;
        Wed, 31 Dec 2025 04:32:54 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f519c0sm3908703966b.71.2025.12.31.04.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:32:53 -0800 (PST)
Message-ID: <4ffc63e0-ffbd-452f-a5ec-2a5b2720e66f@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:32:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/6] arm64: dts: qcom: ipq5332: add nodes to bring up
 q6
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>
References: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
 <20251219031010.2919875-6-varadarajan.narayanan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219031010.2919875-6-varadarajan.narayanan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZAjkjjeSULuy8-MPadbv7MNtghkTu-uq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwOSBTYWx0ZWRfX5VbDO7rcAIeb
 i+oLa4r6j4suqtLQ+7RgPIHkNv8jtkWSnzgc4rYy8KFr5rwfx3nDcbqhYFus0c+EizPttbmvM7H
 xGrQcg9BcmkBhRbNghCdYvx5eGzUKZCGiFThXgRvb+EKSSR+NoXKOKeriTDO7YMwngMIr3vj5lS
 ZzxhW1SxHOQ/mHMh7rgKIOHBQxDsL3TH5Sd16RqlYzCekjMqABsnkPvBvYFNhgyYvP5pKmpSmbr
 /UvAqUSUfRAb9D5l32LWCEnXN7+ZzguWgRgSaJjoqY1JiuD6POZ7KovZ0vb0k3DryS0trhjxxKR
 ELNNm9LVXhrPvwWnFGLbZUEoeHnCZY01kxVyaMM5qMx1+JUrK/pv+duz0H2iy+Az0Es80bwdsHx
 yTALtTZqDtG8Ivy40xENQ+Z33Nvnew1W2Z4HXmQk010VW9jACTipNpwKQxQfpoKOOMH9xK9vzMz
 atYoAe9cDkFHvs1bAXg==
X-Authority-Analysis: v=2.4 cv=A45h/qWG c=1 sm=1 tr=0 ts=695517f7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8
 a=s3MJbU7F5wKsRGJXuN0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ZAjkjjeSULuy8-MPadbv7MNtghkTu-uq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310109

On 12/19/25 4:10 AM, Varadarajan Narayanan wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

My rb was lost somewhere since v5

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

