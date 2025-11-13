Return-Path: <linux-arm-msm+bounces-81702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32812C59E36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 21:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D36973A986B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 20:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C115231771E;
	Thu, 13 Nov 2025 20:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fuAxD8wc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QEsxltUI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FFF3126C8
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763064016; cv=none; b=gS7RMRK1SWnLyzBSLopSS4agLeukY/Tc/uF4DWuLnc7cw7ri93JmqypoBN+TJyGgqNF9MY1aDzh6Wy9I561VvVIY6qezFbB1tGkU/MnbAJF9eyCVq7oKUQDwdcLloapnh/ba8IM2kdA4341JzuAJiH2mvJhFYdyppZsvwg8AwwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763064016; c=relaxed/simple;
	bh=1DAdQVK6CcKp8rIYP9ca04DjW4Iqw5yNG0Th0nmNrzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sZaffEi0EUzGaK+PAAB/RFkNuOinH4tO9ZX2aSzAfuEwqFcYRz1kRlVAFi4TwbgFq6c03dvE6++3U2uVGM0H5VPwe52Dx9LFBLPTv+JDtjCT4Yg2o6xePcNbkPiJnJNIU0wQQWG6Mgi6WS/j4iY0Sz6LOeH+PFOoQQ+SGR7AWwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fuAxD8wc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QEsxltUI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADH2JQa1007478
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJ7w+mpX/9CJl+Orva8v96dQySUzco1O64PcH/xD3KI=; b=fuAxD8wcsAEwL5NV
	bh1wPbEpv+tKK62AaSEWu70KnScWrWuMyJUhri/6SUyYJmD2GISZk7hmQjrkZAIW
	bKcoENtov0aleRgOVMYAQ4JDtwgqewpHJ0XSY1NSKTu4HAPlNyjVCtjjguMSFGgx
	Dl+3aF/RDg6aysVhZW1VLTpk3CzGeybZYPnOit2k/Jd9mzdf84wifHdfltosinqb
	N8O4SuZaBpnlNEAa0SXtAkWRdqN9Ks65fzTVcjUmlyJRTdEDLF1yGAMAjWN+MnJ8
	YN+RVQZwBxSKx+YAXAlZcWkeG2oPDHRXnvJ05PBji5dMGfCYFjl1qjuG6Qx18FiK
	K9/mRQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adkcnrhu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:00:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso1191114a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 12:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763064014; x=1763668814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OJ7w+mpX/9CJl+Orva8v96dQySUzco1O64PcH/xD3KI=;
        b=QEsxltUIqRuHgCQrh5jY78+h6mdTzsyfIIy6cvFuCs3ZpY1W/NtO7MB1WE6jd55rpS
         gGVkP0NBeGDCHbDkXtIFSQnnWqsBofpa1llHnh/526+cNtpJhvkFalPUHvGaK8wmLUPk
         Iml62RUYuShlZErDLh2iMpjmmV7O4ke93cOf6FAIvcuEqB0w3mZcdZkWaJf0HupUnIji
         jr6daBZ9tvPfrADRBu19NDvAsi+NgwnVuF6EVagEqQ+n1cB/cG0X85eoaZaRXx3ogN8r
         zxm7ZCSebIDyinTxKKRlV/Ety5nCO/adTjU1R/NZei8+4fka62cR0vAXBafMnq9ai/kJ
         vqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763064014; x=1763668814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJ7w+mpX/9CJl+Orva8v96dQySUzco1O64PcH/xD3KI=;
        b=PkoJltDolNebmKAWrBhCU68Sq+IGyyOlxSupcBjLxBa4wiWBVbmDej0Z7Iewnh1CO3
         Jgb7c1kb59+033KzKFahMbtgwgXPFktSD3hMJEQIwWmkvxmZVFGDKINW5N/bBZK6zjZm
         /WoxWm3bGlaqkX52FTt83cPrafxT2ep3nG1aVaEYOnRbyIqsqVftT0K2YVKVeaURtvjF
         EaF4j+VITVnyhneZBHNrJglW5MpVnRNfdkuYEesuAqqZPqV6cazxtVuZ7IFbHi/zkQmR
         bxmxlse0dMSIi1EWOLHUqzErumLddkjFGB+ckCXrIfQQRjbASOhPmf3I4B9F5yQJzwvz
         3XZg==
X-Forwarded-Encrypted: i=1; AJvYcCV5xrWAKALrWflM+AXkuHop8DYxHS0WeX1u7+7m6Yt8qFSOS/rSyUf33VytNgsmBaIVPH6j8f0GR457LL0L@vger.kernel.org
X-Gm-Message-State: AOJu0YwdrYBSMUxmBoLfhawRuSc9/pkncO23dK/b4ZJ8nvY1+puGKQHn
	Ok202IFqeuO7IyBhpvDLeamzJD7uepSTLZAJFOoepZ3n2Pl+gu52UJ277q1HV3BQIHetmIBZE2j
	oWLj+mc/cNPqltvY+pO62PJLywm62UVasdHfYwHEvnF307nxd7FtcG6P1lHykpMyjo71O
X-Gm-Gg: ASbGncvG1Z4//wr8Wnk0auuX9Rilovbik+ASru3hKxTaR72qB35y+k7gplXFt8Lx84G
	/3XWDekhtu81dBgiAqrqoAjI5z5O9LGOMrZqMpJaJaHb5slonAGmlzXEmNaIhNsoeQg2ORbIoSU
	kyH8S6JQxi40xrhxQQsC5EfRByRyLeMsMHvgN/WST6xleeo5nO1KojcWg9mBFgud9H0NP0HAx45
	6n6Gop6ZPCGTgxR/+/gFrZUu4QaOviL1MV1n1pN8M1/Q8voBFow7DG4uf5nZLL+Z6MhCeN9frIY
	BDEMrQ4pl6oGSi/vIJW/s7sd/vpa6L8yI1H5+mEb4SE5VaIL78vOaqtVeLM8vqCqgn67438yFao
	sY+dnQwGbnDAzA9e4IrbSVA==
X-Received: by 2002:a05:6a20:5483:b0:353:1edd:f7a with SMTP id adf61e73a8af0-35ba30634a3mr896576637.59.1763064011758;
        Thu, 13 Nov 2025 12:00:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZ3uM6rWYFMlAKzZmNJ84R9H/A3/jUV3dWp4GW6Y6VWrqLNpi1YOXm3417OaJPss+ncsmlsA==
X-Received: by 2002:a05:6a20:5483:b0:353:1edd:f7a with SMTP id adf61e73a8af0-35ba30634a3mr896525637.59.1763064011030;
        Thu, 13 Nov 2025 12:00:11 -0800 (PST)
Received: from [10.204.104.20] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc37507fc7bsm2929570a12.23.2025.11.13.12.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 12:00:10 -0800 (PST)
Message-ID: <fcd703e5-d483-4369-8149-a25cc733bc2e@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 01:30:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/21] drm/msm/a8xx: Add support for A8x GMU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-10-bef18acd5e94@oss.qualcomm.com>
 <f7e204ac-28b6-46a7-903d-30b7f31dff8b@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <f7e204ac-28b6-46a7-903d-30b7f31dff8b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aTB_3jHMN70suQiCwcOZm1SR6qwgZLP7
X-Authority-Analysis: v=2.4 cv=F6lat6hN c=1 sm=1 tr=0 ts=691638ce cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tMg4Ou186bfY0pTZoTsA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE1NiBTYWx0ZWRfX1IHvtZvmDGFB
 arYAbIjHHxAGoK4/+UbgLLcfjag2pINUdVTARMxWKdXT6GwXyQd2yNwIR6539piHQd2kTZ25uTl
 klFvQV6x7TNoU99jlDpc8fQKNfhUNrixYjTfKtvek5qlQHEqHp9duhHiQ9HkA1Bkblo7UxEFtSn
 biFIj0slq8Dn7iyLq2gyTgK4oK8kp5NrJ1KwuCwZG1qcBu62w0lhRQojNaABku45X5Cvd9yvojk
 Sc2n3YWPEh0IDnd89yCFPEAxfIMQ1erAsh5zJ/Cz9fIGhBX4B79GfSqAF0avpQ73ZwKiEGQ5Xw3
 Gj8VCQRu6KMr5wxpzJU3JDEP3bwbnf5bHZOsiJEGlmadbqryiJMUnXCCa7607mHio/8jDqkFvzU
 3xJWojTg18sM/lC5Ym5TOtmJFkoQDA==
X-Proofpoint-ORIG-GUID: aTB_3jHMN70suQiCwcOZm1SR6qwgZLP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130156

On 11/13/2025 6:40 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> A8x GMU configuration are very similar to A7x. Unfortunately, there are
>> minor shuffling in the register offsets in the GMU CX register region.
>> Apart from that, there is a new HFI message support to pass table like
>> data. This patch adds support for  perf table using this new HFI
>> message.
>>
>> Apart from that, there is a minor rework in a6xx_gmu_rpmh_arc_votes_init()
>> to simplify handling of MxG to MxA fallback along with the additional
>> calculations for the new dependency vote.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>  	/* Make sure there are no outstanding RPMh votes */
>> @@ -990,7 +1022,8 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>>  		val, (val & 1), 100, 1000);
>>  
>> -	if (!adreno_is_a740_family(adreno_gpu))
>> +
>> +	if (!adreno_is_a740_family(adreno_gpu) && !adreno_is_a8xx(adreno_gpu))
> 
> stray double \n above

Ack

> 
> [...]
> 
>>  	/* Check to see if we are doing a cold or warm boot */
>> -	if (adreno_is_a7xx(adreno_gpu)) {
>> +	if (adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adreno_gpu)) {
>>  		status = a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC_TCM_RET_CNTL) == 1 ?
> 
> You skipped writing to this register above - can we count on it
> always being in the right state?

Warmboot is done differently in A8x. We can explore that later. This
fine for now.

> 
> Do we need to map VRB, or is that a topic for the future?

Yes.

-Akhil

> 
> Konrad


