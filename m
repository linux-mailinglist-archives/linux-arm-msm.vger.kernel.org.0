Return-Path: <linux-arm-msm+bounces-80854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C6CC43A36
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 09:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 383933AD214
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 08:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE872C032C;
	Sun,  9 Nov 2025 08:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/TDAH3j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TfwF6KHO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5E51D88D0
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Nov 2025 08:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762677450; cv=none; b=c/LAPeLy8oLZPvnVzzURtNN4zZPokIuoijWjT5sjTY28S4x3o3ZQZUqGiYxUbadYwRcBf2nt7GgW17jSMbmAiE0XC262wmVWy09rK51O3ZlvT4XFVB0yl1f9UXMHVra6/y/j00r8nCJqAZIdExokwqiG8eZJ40wRLkMWF6jUdbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762677450; c=relaxed/simple;
	bh=A4tGv4a+kosuNZwrt6td+1ntnL8Js9JLYGY5ugpkjh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eQ7l7j0XtnnahYfYLRs+aQ+iTj2S+35dB01D/Qbq+lpmskHBdK4MgdQn/lvKfRaQv0MvCdgCKPIGsUILlH6eN+OxUB52Fol209DdmIoEHu4FgmSNtk3YwOVdZE+rE6fMBrbCekMl8fBa47geUNAYCuYI//wi9jUJiVs6k58n4gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/TDAH3j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TfwF6KHO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A96dYQp3932127
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Nov 2025 08:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5vtrCHIV3tGX/aHdrbiRnkOFgxeHUrk6TNFoRHkYZBM=; b=o/TDAH3jzThCXnWz
	87pGSgmdHvTAPV3D8dscde5Fj1IwSzl4k1up6wpQrS1kKLfTFBNiWd5ZNzp14TH8
	4qcWFTJBq3/oiKiYUu8JlaVltx1ulhNHXYu4lbVZb31HYLP9Ks245f/eaOfsMHTN
	adTSAgunnRtpIs6fovun404uMcEQRx45c3yxBedIwCJoVVcXx3d1K1uBwD6iO+oP
	/qpxl9XjAyO2lXrFX7PqGHo/lwS6N337FGjG4hcX5o+2cciq+/EBr2tTP+z67KoM
	rF1CQvZ10B3glURySEAo2OuyWxMW9FAZM70/7IpR1jj2EfWnO5LIusL4hmrZN/3w
	4txLzA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xw59uae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 08:37:27 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ba4c6ac8406so1671645a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 00:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762677447; x=1763282247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5vtrCHIV3tGX/aHdrbiRnkOFgxeHUrk6TNFoRHkYZBM=;
        b=TfwF6KHOOlqZEhMNaL7q+k2wzOXk4BxetNhOOMCM/Y4GG+tkNBTrR4g2BvF7+qAoP7
         Gu8vfQs8R3x8rcDaHcaiXXpLjFx4nrlynDwRTqyokNQ9NSuikJ7OAERb6wYsZTakD5MU
         M9ddxQxTNwYttzOo2o6ia36Mhg10KxNf48LYQ8U5zwE9yIcuCBHtLhJcoJ0EM0EWgzNQ
         JsqM3XzmQBIQpeEE0oRKPWCxpve8B2AjAQ5zYfTkoav2rZ4WKKCp4P71waebCEp58kNT
         PsNDVwAKv4Kw+SEYH3pdgtfkT5X2fDuSISjS5QK0vkhmyUvATm6VVUFqpTw7d5NDWUEE
         z9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762677447; x=1763282247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vtrCHIV3tGX/aHdrbiRnkOFgxeHUrk6TNFoRHkYZBM=;
        b=RORIWw6Dmr+V8jRwUCqMIfnxWRT3rEKBvKMZ5QG4ZRAkPjemp+yQRv/cyepBe34b/K
         SyE1ShWbbpCpRQacjgG9D7LPfppk289JmE38kXNK35IOvmF9d/JQrlh7jgJbwy4YzcbQ
         4PHKZbydQSIvx0d0eLECsI8G0IQ5W463yuICsXg17/x6xmn2pCFIkOIkKTjUvdaV6NEB
         BMNnZMNQ6WCKsjGvDjKzH5undP9SQGfg8PZXgqYyMfwkD7xI8QNFXfMrvIcAxRbBr6dR
         LfaMT8hbC3xcZjc1fmhDEsES3Pre7FdfGO+0XMTS2Qsdiu3efoNCppJw/4GiPSeKB3MZ
         KrYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhTTJZBCPatD6AHUOLC2N8NlHs2+6BMUn5apk9ceu5iDJC0lVNt043PDLb9hcngJCqD0Ngbe3Y0n68f+CG@vger.kernel.org
X-Gm-Message-State: AOJu0YwU8qKYd2dSGU9EL+reLfZxRMeIcY6Q7nyjyQWmxuW8RHJnX3x+
	KF3r5bs8w69Ft1gLY9s9ZJIZ6gM/TgBQif310mmnGo9cU6wUn4+74bTSAVzcylJrGbegum0dLpA
	JlA3TRil0k77OkcHFoAW0TEcg7EA150snplA+gmZmQNmbgo1+rjxBMR6otnS+NqlVJUM7
X-Gm-Gg: ASbGncsomSRcuNsoXtzcVFKVoqOM1kpuaMzZnk6/IJJ3FYqQTlAo9Nf1KQI2h/rk2wU
	yYRvbfUFQnE8LgZHFVsGpTVuUdOdhawrDPfnEdEkKVxk2WFtxZBJzyyvQStcpSQe54ur7jHwL7t
	HEjXC3PglTle7zVx3+kZqioAGO5RaQLvZ2gxtR0SMLnV6XcgH3Zr9Ch8KSmwrmuX/PhdnL8ewvW
	gTTJ6qZdQIwXexzemRb45iX6ihNAGIbzfs77rqQ7QucUGKDvUrIOwunU4zQFMXklc1KU4HY7kDj
	+glSSPzfT1BOCu/MAfIR58fw1yB/GRda3/MwHq998XBeKsQ0mTUvMdvHL6sqpeqL8AhL9WJOtLF
	ZSFrCF2rJ06B7BrfBG36SOe0yklnJGmpmN4KMsqMQy0Ssvte6bRTB3zGOURHdjma+
X-Received: by 2002:a17:902:f681:b0:295:5da6:6014 with SMTP id d9443c01a7336-297e5659932mr61934585ad.22.1762677446919;
        Sun, 09 Nov 2025 00:37:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHq71za6tPtpBRE50nvuoVMRlPWw1zs7VbanBMtzoP5o5KupYbs1O/4Jsv4fFrfY2toq9BdcA==
X-Received: by 2002:a17:902:f681:b0:295:5da6:6014 with SMTP id d9443c01a7336-297e5659932mr61934375ad.22.1762677446407;
        Sun, 09 Nov 2025 00:37:26 -0800 (PST)
Received: from [10.133.33.224] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b801sm111076075ad.7.2025.11.09.00.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 00:37:25 -0800 (PST)
Message-ID: <2ff919e3-8bce-4519-abb3-3ef8df06e6f1@oss.qualcomm.com>
Date: Sun, 9 Nov 2025 16:37:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-binding: arm: add CTCU device for hamoa
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
 <20251106-enable-etr-and-ctcu-for-hamoa-v2-1-cdb3a18753aa@oss.qualcomm.com>
 <20251106-imaginary-speedy-agama-c8f437@kuoka>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251106-imaginary-speedy-agama-c8f437@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DPMddsvHRVQJAFV17Zm11MsBt4nrorzF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDA3NSBTYWx0ZWRfXziPjgmwG0fkS
 TXWnCYho9iSDEO5UYnMFizHPvjYcglvEF0G3A8iPOOy78BIRQnSPEPlE3kdMzMxeAVR39qnyLf1
 OIaK1PS74ku5Z5o4WQTx6ekPwjCRP1VNspeBeKWpk0aBVC+nAGxScXlzh9me75kh7qTxHX86Jbb
 8PgWUQdBBLQAZiteKOLa7BF49HeNObaFp3MjRMKA6Tme8Dofy6dyoICh1R4vnDQbEE9YsBi0/Xw
 W+XNA+IcgevnOtAwtCgEPiqunARdZAyoZNeI19CZ3Myx+MVG0sMyWdlSghpChkI9tNoRtHVBXkk
 HZr7Jw+bPGhFvcDUUyt3kwKKk46ZFyhONoQvGmIBHGJ9b8MgVSgJjJkq5AOnS/QjCNZg0+3a4Kf
 2YyGGo+Nl0gtqJV0p4QmRLaVqPR9Yg==
X-Proofpoint-GUID: DPMddsvHRVQJAFV17Zm11MsBt4nrorzF
X-Authority-Analysis: v=2.4 cv=FoQIPmrq c=1 sm=1 tr=0 ts=691052c7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5OoSBQWy4bDub-yfWMYA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090075



On 11/6/2025 4:27 PM, Krzysztof Kozlowski wrote:
> On Thu, Nov 06, 2025 at 09:57:25AM +0800, Jie Gan wrote:
>> Document the CTCU compatible for Hamoa, enabling support for the
>> CTCU device on the Hamoa platform.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
> 
> Nothing changes, so same comment.

Got your comment. I had add the dependency in cover-letter. Seems it 
would be better add it within the patch itself. Will address the comment 
in next version.

Thanks,
Jie

> 
> Best regards,
> Krzysztof
> 


