Return-Path: <linux-arm-msm+bounces-52024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8154CA697FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 19:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22AF017256D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 18:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BECF1FB3;
	Wed, 19 Mar 2025 18:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EyRlfbwg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F7620AF67
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 18:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742408665; cv=none; b=up9vyZza+ihYycnySdRqe9i0/9UrqOAyXb8odV40QHSVkTH4O36ciVgatw6Bso/cUX9Fyq7TdKJWJeic3f+s/YxbQFSPWSKwvM+GSf4JHrViSMOm1mUN0u0C3VFWAM/1tRZ9YzSlSKoVh6AEXc94aCwequlxFMl1yFrkU0q5RqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742408665; c=relaxed/simple;
	bh=7KETAKskCNUSSa6jjE/I0aXBJS1+6lDvWI/M9noogvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LnKL35JPOplG0PiD3H2cbrihP8F6cm2QAGBsDgshLIoj+8qGWFDXDHCZP4vrBGgHgALV2tXWkiB8Rh4bea1tT2gIl71dbnYM6BPmFGLllKEtwlu7WlaOcPQKJzSbDeyfWueGjJN1pw8bfjLW4fz91YteI3lPNs4apDnwdayGTDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EyRlfbwg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JDTfMp013654
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 18:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wATSJrX3Sh4uYukiW4vZV78z12tm57FOPZK9qSlUs1Q=; b=EyRlfbwgZRB7hKQE
	tACX+dDGq5LS7BuMmviRaqgzH7ZVdLBVb+SRJaWl/mPF1bgRr6KqAKIY8F3zihgF
	8nhcWl5O3i0hID4dj9jnhfHjfFy83i788K8c6eTzTLN9I6n7dZjJ3GOT8zf+SgK9
	LFNK7+fmNXToegH0fBBlJziW0jbfUI35lSBL/5E8hQExB/GCTvxB1QM2aYp6BBGs
	3IxFqonqFrc9Oo6rP3YN49oYj+5hJ5Yuw+0A9ttH15eP7lNbxQn1d8mEy8gBFFnA
	3jbQ5Eoc4kPl48uV+6Pl44L3v0ATTpw2ZUKjcQquKZTo2ycuGRW5hRlM9Mxd25oY
	jLPeqw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtpgke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 18:24:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-224191d9228so142408085ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 11:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742408656; x=1743013456;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wATSJrX3Sh4uYukiW4vZV78z12tm57FOPZK9qSlUs1Q=;
        b=AvlC+aIyjRrZPo+CZK6RdPHACuOpnNzc111aoDYsVMqaGhw1ohOSgtVu5JvRKXw0l9
         7MLg80bHN43zgGKanQkav5gX+xTFBg8DpfhMK7h5TJrQGZyCPj53OUf9B56jnc7afwy2
         b0ifj4myIpGfkA/EOGPCQkpj8AdVhnWid05LxNwF5uKdjLEGeXrWTnc5x4oEqHg8oFZt
         2PXEDXHvgqfsoAd0jOIJnuQi/qfzywmERtnsseSDL4K8aMTViB0c+8EPcUZ4jkil9hDm
         Ij4pE1Z6UNLjchX6zYW1YrduCTLdIX7KUKjyOWJ16n/OFkkQUttCUJvvW96kISTmV77H
         JdVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgzVqF+A9yoJXk6QGzVwjMjVyi3ORCpcSUWVRSF12S7pPTV1cN+j9eAdeRGnfTCt1rFfdPxZn8oNUk5Xbh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4rOgOke+1riQnDi95Aj5S0D5W7EvXfpikU+/JYARaFZ/4lAiN
	If0H3Hi8w/E2QAyzGD6aw4IWip980omL4V6Et8eyQ2VF3YJF55v5qprKuIOjPmOuXW1V7QUj88B
	GbFkgy/oLSN78HLtutT0ujtB444fHS4OIiqn/JSWCPiXwO4s1/1ZmJdFrqBlCqV1J
X-Gm-Gg: ASbGncsbd0WN2m1Y7HZEDHPHJ51Rjezz/s+vVrWc2F22lxGnvO5PPAkf18JJn7/G0nr
	66PZOcTjV9Ps1rknFjifKp9s5U1GXunZ8pAjcQXdxkRZRG48sMqqyzc9xo1p1IID2z5FbvgKJT1
	1GBcGtCKOV7B29qrJ8BVUku79axetY1RejRPivM179dopeiWUhWdkFeYkXiXd0682a9e1q7Akwu
	WEM2RPAGQAQlVHey+gfvrXf3yfVwMCy9Wr/HWnli4Z6dcu6aBw6A6zTPoE7QemlIwYh1mBeJGCR
	OFGMAENW3xxCQyHLLiwY2GIisXb1xTuAh5DJOSZRyoWVIlr6DGNZHu5wWp5OFDGy62xZzqw=
X-Received: by 2002:a05:6a00:ac8:b0:736:ab49:a6e4 with SMTP id d2e1a72fcca58-7377a81ff63mr308948b3a.1.1742408656514;
        Wed, 19 Mar 2025 11:24:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjLDkR1zw4g6QPoBXUuz5/uk73dvuiCo5Bz6Vswwcg0+6FTlNg2a5r0Jd3e1WLi5Sgi95LYw==
X-Received: by 2002:a05:6a00:ac8:b0:736:ab49:a6e4 with SMTP id d2e1a72fcca58-7377a81ff63mr308927b3a.1.1742408656137;
        Wed, 19 Mar 2025 11:24:16 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116b1103sm12025324b3a.167.2025.03.19.11.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 11:24:15 -0700 (PDT)
Message-ID: <76fea254-ad81-425b-83b6-30b34448a8c4@oss.qualcomm.com>
Date: Wed, 19 Mar 2025 11:24:14 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
To: Baochen Qiang <quic_bqiang@quicinc.com>, neil.armstrong@linaro.org,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
 <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
 <a5ebfdfb-107f-407f-b557-522b074c904f@linaro.org>
 <38cd738c-1a2a-4382-80f8-d57feb7c829d@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <38cd738c-1a2a-4382-80f8-d57feb7c829d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xG90MgSOTUWFKfq28r4r-ub74E4DC_E5
X-Proofpoint-ORIG-GUID: xG90MgSOTUWFKfq28r4r-ub74E4DC_E5
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67db0bd1 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=qC_FGOx9AAAA:8 a=BmAr-5jgUtIGqfj2Gp8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190124

On 3/19/2025 2:46 AM, Baochen Qiang wrote:
>>>>>> fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00156-
>>>>>> QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> this FW version is not upstream yet, why are you testing with it?
> 
> Generally we only support upstrmea driver + upstream FW.

Thanks for pointing this out Baochen. I was wondering why I wasn't seeing any
issues on my laptop. As others have commented, due to differences between
firmware configuration and release processes, please avoid using firmware that
isn't in https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware (which
gets promoted to linux-firmware).

/jeff

