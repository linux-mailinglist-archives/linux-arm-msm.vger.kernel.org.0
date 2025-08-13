Return-Path: <linux-arm-msm+bounces-68892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 464A2B24084
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 07:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C1B21AA2BF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 05:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083AF213E9F;
	Wed, 13 Aug 2025 05:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5swJDKA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4EB271443
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 05:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755063946; cv=none; b=BDHEiA2ca8auIM9SRGGVf12lBYgzf6D+pox9e9hCxdaj/6bWerMSSVo6Ut4TZ6/IVrbVqthyGYTK6wJc9jso2AMGNbIyUeLoYhgreV6ezxdEHFzuM8J6wgDg5SWHlmkCPt/roDx5WVmery1QQYmX6IRgmTgd5Y3iExq3pz4X6WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755063946; c=relaxed/simple;
	bh=zGwOTcUsz1xirDMHVrkdX/vvxQbHA7GU3AGFpslLXF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VG73x8mccwP8DeBTlZCApre+QK7x/oeGQKwozCqI7KAG40RtaKPMnECNLs0QRUny9eHLc7kV6Z+gSZXDw8Gm7YIco7L6yY1yKwcOBeQArw4wyb9gkbJfY9I13fJwFsillLiXtu747LfbiGXyEPeqCljrt1jbVM6soyhAmr3dkAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5swJDKA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3nbkZ011576
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 05:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Don7/I9Uj7z5dTSOT5GELdMDcLUsYu7/Ujb3hm5duA0=; b=E5swJDKAH1uztF3G
	lhdB7KhgUNjRtjT0vfqGP4EW5tfyQXb90bo8ttURhP7m5PCr8GhE+nv5695XNviu
	zfP76HrSLq3E2bITYiGck0fyfcen8joBvJzgorzFTQbfJy+PRaJ7bs4eriJsUyqj
	kgmRAz2ADTxUFbiDtE2KgfVakZudUdInTwq1imnO9HsJ+d0T0abxgt9Ry2+nd46M
	u/ZYVzH34R4u9ZtikKyVEY7H31YArJGDrkqRcs0mtVDgBMV1y1/485Yoy1m+bOXv
	KdnnnGmY6ZwQgHs0HUS/3z1XkgnoiHDZKNpx3GkqNl4k5nOIQBmxvRIV72kD886w
	S6q2Xg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjpd0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 05:45:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24004ac2ecdso98288275ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 22:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755063943; x=1755668743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Don7/I9Uj7z5dTSOT5GELdMDcLUsYu7/Ujb3hm5duA0=;
        b=utZNShCq7wa2O8jYwQy+yqGmhgMD+4OFy/3Ssq6D8msS14mUNK/HM3RJNPl2rhFSsG
         iBDN0+9fTcgstCZPHLCGhGas4y5h7LxyFgCKNI0CyvI1tfDSZKpj4fKB3nChn2et8aA+
         VILgLeVPVaJ0fXeuHUBSEs/R1og65CPtqTzOi8JPnV2XqBsmCb2nwiGt8ze6vGzMB7UW
         gcT9vWQhLGrivhpZh+fAS3xpBxQ/n0/AwECQCgnnkEzYEw8TrEDIMchoSNSXp78lMP3J
         s/GOS+UjAtZMdoRyaRpeQ3Ng/AwZFb0NRUGdgwdhikA7lUJi6yYmXf6v18zyvUtkkY54
         Pwzg==
X-Forwarded-Encrypted: i=1; AJvYcCWNYKNk2mjtwe48s9Nt5MG8katO5bygP5RodBQXYYd07sOk26wh3QskBKxHTaXvmpaSbQPaScZCT8nWnMnO@vger.kernel.org
X-Gm-Message-State: AOJu0YzpiVb0TzhYiSjq7/pumTOrP7dMvREOrKadEMpjZi1nJ69iukJD
	QT5HnLEwZQDzm7fUP5vBfAIXp+gXT/0vdKAyPygmTsCnEbl2HeQdAQxKtnSfQP6GN5gxNOl6JMj
	c5vI5x9j9UEYmW56fFRGw4GwjHc6be+93lqLQ8Un3UIhJi67AEgN3y+C8L7Ef20gUKqCK
X-Gm-Gg: ASbGncu624Zp3IxJ2C3xzax4YwJVSpmOS8myyXMN4tq7O6QAH5mudjiqaVOk/ag2PNS
	/mrA5yr1/eLAn4leHBilkeq/SFq7j0FTWf9zhGw33k5Jv3+yD6fdarkoXELDW+l2foQjieYDUdr
	8qRRYQ1PTuHdk0c0vVhEQEsE81hSoZGz8AOLn21azUIHrJQ5QH3PrwIuHFTmdq7teHmFdB1DGsC
	vdns0Vb8GTQUzVfYVRKl9UKtdaNb8QmIi5Z4+Zp/apwUc2Ph54KES5rRrUG3bdmFvOLzcUeFvw1
	n50dlfNqYxsyKZPyIanGae+sJ/DgzhxaEGCaAxzVYXlCyW+7pOmr5rICwo3nxymzyHNvUlk=
X-Received: by 2002:a17:903:2f8f:b0:240:8262:1a46 with SMTP id d9443c01a7336-2430d10f333mr24296855ad.25.1755063943173;
        Tue, 12 Aug 2025 22:45:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKxGK3btWcsA2MMJlDGujnyNgU79WdDiyIV0PIuwBRiNdl1y38tWiB/pb09bnsoSZftYKpXw==
X-Received: by 2002:a17:903:2f8f:b0:240:8262:1a46 with SMTP id d9443c01a7336-2430d10f333mr24296635ad.25.1755063942755;
        Tue, 12 Aug 2025 22:45:42 -0700 (PDT)
Received: from [192.168.1.7] ([223.230.83.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a51esm317556405ad.115.2025.08.12.22.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 22:45:42 -0700 (PDT)
Message-ID: <7c96f881-23ae-484c-82b8-d388a5c637ca@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 11:15:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sa8775p: Add clocks for QoS
 configuration
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20250808140300.14784-1-odelu.kukatla@oss.qualcomm.com>
 <20250808140300.14784-4-odelu.kukatla@oss.qualcomm.com>
 <857f56a9-0fe7-4c10-a55d-b00740a8be02@oss.qualcomm.com>
Content-Language: en-US
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
In-Reply-To: <857f56a9-0fe7-4c10-a55d-b00740a8be02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX76tumA9+QLOd
 yDt/8yTaucWuYeZUMiv+y4Uhpi2HD8r3Eo4MRJQbWft6CoB/ubi7hPQCVPLMTJt1463ZLopepj0
 mfnj/eaKcFrY4L8Q8uUS36Gz/zlx77YlDriZp2Wx8Q89HDEeqnwwFs2Rn1ftVSwb9/E1Vk1A2VB
 D9SbZeZuuSJFU/pb8p1Z79vCJF7tlooHta44RWSJZ7iw+zo+wAwED31jXTJJA7gykXO6AaqJnFe
 JeXpLEat1ShWNuyki55MajXhRhcY+VAHs1J1LLk3jTjhJAaxuMljl7/5UkIeJ1PHe5RG+hZ4zzn
 9sPxwHtDr1xK/jaqX6ofRl+K1SsnTBfDCkVBsDD6PvJa7TcyBFbBVshi22td6C18zL6F1tJyhii
 oxQq06h4
X-Proofpoint-GUID: Kf9Yynvc2-_QgSsUoJSetKi4snRLknfr
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689c2688 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=SiMmawhtwnuHYgKqZ0PRSA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=XLPuD3OmIq6EDVKOuGgA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Kf9Yynvc2-_QgSsUoJSetKi4snRLknfr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074



On 8/12/2025 3:21 PM, Konrad Dybcio wrote:
> On 8/8/25 4:03 PM, Odelu Kukatla wrote:
>> Add register addresses and clocks which need to be enabled for
>> configuring QoS on sa8775p SoC.
>>
>> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		system_noc: interconnect@01680000 {
> 
> stray leading zero
> 
Thanks for the review, i will address this in next revision.> I also see there's a camera noc.. are these controlled internally
> by Titan nowadays?
> 
Yes, camera NoC is controlled internally.
> Konrad


