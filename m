Return-Path: <linux-arm-msm+bounces-86532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE291CDBD3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1D3B302E142
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B80F0333431;
	Wed, 24 Dec 2025 09:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQUzVLYg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gZshVdb8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C83C332EC7
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766569201; cv=none; b=fd87cQO8PgipscZn7z0VYq1+6Oef+nWYngimtKNU05B5Az6AkIYcusRYdRLmiDKp+NujK/sf3X1TGHwqesAeHR73niZPHdQ7F/HY7eWu02S/7d3gxXArmI7eLao0ZdYrCbLI0v7YndKIOdOI7G/FGAliVb4r+e+Q0hp+qfJSo0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766569201; c=relaxed/simple;
	bh=sMut28raWl5D+RZBR55zz/EjGU1U5gpPeI3gXlleM/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=johAhjfZPu5i1GhtWiYEDm5OFYM3LT/KETcKzhza9Zak1g/o898p7RxfzVfffW8kBtYPPd5RSVks4VtsLn4pVgnZP1gptLoeipdMHc75IhjM+tAE/UnShh0AwYxvK+TBFnXvJygbL9s9YHnVAbccTZLz9w/9U7wcJbQP8Rq0hqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQUzVLYg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gZshVdb8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO17X8k1597821
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l2IfdP6FCsVU089p/pdPHqKB
	S0mUXX1UUSOJ6//s0hc=; b=jQUzVLYghge0OEYfBmiv4nujBZ8OviV3diXoCHqg
	Hu9q1iHtwVLN+06dCqUWEWMNgPKAHWSkqmyvaOOgZsBJcWAE9tx8jwrb2FCVFyk+
	zwoIk38bE4wfgZlUx0C/TNvRBJNxMmW0lBkbAjd9UhmFswqWnL4/I6CIoX/ZUB4Y
	d/Gbo7rf9g4FxwvUq89+1WaJKAOecPmZiJI6p/hwbHm4R/EwLxmq+2fA20oiv8xf
	bBLTwIvRlFOpcZB7jIJ1/0M2cVTkhvVAq1WJj1rAM8IEVeZAW4rrT4oKyWDlz5ie
	1eAPUT1DARniwWMVDiymvCU23fxAvVLxrJimfQuGO9jXrA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683h6sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:39:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed782d4c7dso100307501cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766569198; x=1767173998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l2IfdP6FCsVU089p/pdPHqKBS0mUXX1UUSOJ6//s0hc=;
        b=gZshVdb8faQtL3MeA6tCQTiKo1BT0eXyMm2cqk5JrRAI4jhS4KYpEFtjuMSsGYjfAI
         cUrdPHO//wph5EJ57eckhuQPvQChSqwsUH1NdklTSSRqVyx1PJ/ZsEwOjDJlYJW12ikC
         retPtD2gNAfG7Pa4c7IpHz+RHS0eLkH+J1kO6MgEsjqZZ+UTbD5uR4lDZqAhRFOcFKt0
         cGOq7zBT4uUnpLbR/B1WWjKePaFiFezCWgQX6kzznkKA8x26qYwKF5eftyQeVFtKjHmg
         9VFG43D9vvFgd+cMu53v2mPEY2zUqJcwVJiM5/PUZ+8EhWBcEDE0ozTwh5d+u0wmy1cx
         Lh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766569198; x=1767173998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2IfdP6FCsVU089p/pdPHqKBS0mUXX1UUSOJ6//s0hc=;
        b=btizVs3zFzql2XsvcJ8pgulUCNmOhu+Blg34Mk2GaanuQA6HSMAszFt2BOzblvoES8
         kOQd6oq1nU5hQznU4dUTDEjp0rUzcYz9tfVcBgP6ixNzWFgnGke+kIwFfAqxI8UN9Iad
         uEhvA6Up4wv4MywbIQbPsjpwsGhXBAERTw6xHKxQBlUAI5YUk91QFWhnWvxKQ6/O8uVO
         BNPEoNW5kHxWjnViK/T/5Sj6LrfP/b/gPsk4J+zbBe682Nw6ZnBMDMWrMB6B3R67/qUw
         QLsJwUvwAaZ6b4xiXxq2nB3mk61cKeFi1mDV0aBkgLwT4uRldDPQ2TLLNj6MBCqNHspC
         U84g==
X-Forwarded-Encrypted: i=1; AJvYcCWemZ8C5+kmArCO9M2UYnZfbMOa9DzvZulIIkEMQmq2gh4HoKpzX3xwO4iFK+xDqKKcUqdOc58X5R65ItFj@vger.kernel.org
X-Gm-Message-State: AOJu0YyttuS6BBEsOaNvj5wYSVRnUOcg/MQ3hhAJ5pvXOzAwg7LBG+JW
	WaG8JeXUlW/oleuEMeYOtDsTOS8vIS1VDu3yHeJ7wbMF7S3ax9xUyRUxSD8MUzZScQ+Ac0ohx+R
	exo0JxqTRHW8rnFw46MYLk94G5IcF413iB1Wuot/T5l5aS4tVLhnluuEcdNHZwlC9Vdmq
X-Gm-Gg: AY/fxX7NX6EE/fnnF12PC+i1OFsKtmGWhQzW8Rrycte3HsYf6jqrhUO0y+A5/5yqjUl
	BDD+9iTZARdzXum5wRMV+M9kmpucIYNgou4+JEC3EPjebphKtqqlMcJMjDTPAnLNmPIqS8q6v0y
	gHVGD6vEp4T5bcdBoWjYM6JozVXtuBP36aZeGHJ7Bt6lqHAjrhJXhrYR+Pdsp+YtPbmJlHoM8tz
	/opWidCHBVaAWeCpdLUou4xxhl3M1DmCSFO4ArV+Gwg0m+rLmjTX2luQYqVEnhBF0HOEDZ55wXi
	DA5+fTzydeTuA1gT5McjxT8iha09QAsJb0Gy96Cvpb96EfMJj93JtskPvpAlMVKO1o+WK2Rh87H
	m3BVY1VcBDALYKQOdaU/xMw==
X-Received: by 2002:a05:622a:4f:b0:4ee:45e1:24e3 with SMTP id d75a77b69052e-4f4abdb9010mr222208511cf.67.1766569198271;
        Wed, 24 Dec 2025 01:39:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHra55PV2MeGMATSHSAXYiadPpG207zj4WuZLxRUUz4zDUNpI0+kqJz0Fht5vDyN4ou5lREA==
X-Received: by 2002:a05:622a:4f:b0:4ee:45e1:24e3 with SMTP id d75a77b69052e-4f4abdb9010mr222208331cf.67.1766569197618;
        Wed, 24 Dec 2025 01:39:57 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ae2d5dsm1740618866b.27.2025.12.24.01.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:39:57 -0800 (PST)
Date: Wed, 24 Dec 2025 11:39:55 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Use lowercase hex
Message-ID: <hod6q6ckqjaus3kyc6cq7d47ss5hn6siwhdq2ulgkk3jah3sg6@ff257wmlb364>
References: <20251223152559.155703-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251223152559.155703-6-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223152559.155703-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: iJJFCrcAifuxVitSgtchmC_VWuugFDRL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MiBTYWx0ZWRfX2UZglwKthaCm
 XQp2Y7kaB1PU4oczbie3S6uymIv3eMFJ2PJeI0FU94r9/Of/9m/1zCAg8PT6JQKZKZDupOm4wHH
 uELgfcycJj03y7Mdp1tf9pB3zM8ZlPoueQhw6tL0VCPJN9LlO8H1fh6STZ9S5RKrr0xjj9/HMVL
 9EFqFmkzd3urP2JuuilDyIAvU4yvuhPO2x/ijrQu/8AN38oyzSs04cdUdf0usq8TumY9YRD6fhT
 yNi7fMTY5j8muAlldGSnzhmOO+7PJGZmZT8PqGz30OMAHXfFrOndMQ1zCA8KapQL7NSmCN4/6o8
 TatyF3SuwQnrAEMIkWIjJZ5+703YzN0WXjmSDbEEFqQtOdpSoXheLm/xYMfJr/vf789+jM/dTRW
 POAU+UacJRSrpNJ6Rxz4a1EYJVhUFJg2NKmhjtSrcAsxf38zdmELmOMED56hLlxF8caqVOZGk9U
 ht4xXDedccUGZZjf4dg==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694bb4ef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=k3IfduSUFSsBsgMvupkA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: iJJFCrcAifuxVitSgtchmC_VWuugFDRL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240082

On 25-12-23 16:26:02, Krzysztof Kozlowski wrote:
> The DTS code coding style expects lowercase hex for values and unit
> addresses.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

