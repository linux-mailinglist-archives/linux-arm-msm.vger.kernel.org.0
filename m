Return-Path: <linux-arm-msm+bounces-88267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 982E5D08F0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 12:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E348F303C604
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 11:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF74635CBBB;
	Fri,  9 Jan 2026 11:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TkGDZOum";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EtJoyuJa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5051135C1B5
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 11:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767958164; cv=none; b=Hn/vwupsZCIX7wIBG30+xJ6JuKIDlYRm28TqQnom6XoHG/AN7mFdjKA6QxSXN7rrX4G74BjoAhy/qTTOgsCyMFMRvrovjwsrqGhFwUqlZP4q2NlPpqf0MK3LeD64Q3yxrm1idbwK4YruAU4BblGfx8ETon4R2Ki3iy+6whB78/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767958164; c=relaxed/simple;
	bh=WyCg106nGKR6N0qQgLVpFXQ3QrbcvI3T9MBEnnP3Uqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c483JLLvEGJvybYrEal+cVQElaVINwn3T3u3arQeRWzfNodU0JiWElW86fW2GU+B4ZvdUic3iSxOExG/nm1o4cYrRHmztix1D/s1v6I5iFsOLR5REdVGnzfujoXNfIOKv0aUCiJVPg7LrJn7WLjSTJUUVues0aeqM+J9ibPaK+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkGDZOum; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EtJoyuJa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609B2sIq1062748
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 11:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BVW+etPTwHng1TzFtm9HNMleUWiaF3BSfRIIx9dFhSU=; b=TkGDZOumltMRFjsF
	ICltrjTdVAFUG62nJ8XJen9TX3bKmgEACfOP8mq6ZuzjuweaqgTTd3ft6I09NCNb
	763ipdEueEENWJZGUWHdCh14/bYywB9nKK37ynCNLHUb2FFc0iSqJSd6qPfF951h
	OjqXOnZ0xHNj7gb9glr3/74gAGzNRB9WiCUY6uZ8utRU8qUZugrGvmsIG19PKXoq
	kawlVvYrFh5yO1lKG5blir+ujYEThkMRfrIhUidvAQiMlC8DlN2/9ZrYl+9i7Ugf
	gU6vL5NYGEkqf4zHUxWB5KyBY/ol38pbm1AaXqedUJZVuxCWN93N0/STEXx09/5b
	hIa4Dg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bk0f6827a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 11:29:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b895b520a2so3957745b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 03:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767958160; x=1768562960; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BVW+etPTwHng1TzFtm9HNMleUWiaF3BSfRIIx9dFhSU=;
        b=EtJoyuJamiVn1aeHOhfnCJgAb/BX6e156wSK+qExEynoORyW4pGNEuQUhi3BhGrW9z
         YY50Hd3aPtnqAIX8GPZvDP6MdMLCm++rsokme2kSMkMWBRDZKmVAp5RKbYF/zyz5BxhN
         AYcuPnO1yGYoO7CwMlhSiYcevpixy5+PCL7ZI5JZdzLmhUQVfklM0Fuvl95GhwLLYSAF
         tyM6ncJ3tDLF5mKx9WtnliR4KOo56270MhIpBmPtVmsh40iCOPMGIOw8ydE/9uBorEHc
         QfSWRuHnIdUvYaDXohOiWxlvRBRCHc1bjlnE5QfFeRkcR/m5HHIHqV2AKHMkTOoNzMoj
         lk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767958160; x=1768562960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVW+etPTwHng1TzFtm9HNMleUWiaF3BSfRIIx9dFhSU=;
        b=KL+7Guf1ksN88QxuXkfbMq5WZxTyXDyIqqAxh7u9rGwJbSsFbvPRFhX7tMqF7z7VpN
         whJQpgqKolQihiV6y5crrpc8V98/3/T0SQO4qY8JNlLLhPsdtNM9QQu+MXtOncxtECud
         2AlqHKTalDK1SJq/LtfY88bI1QOGxUfsjApPorAKTq3GKHf1yU8cR5FRG4MIjVKjdFJi
         p9hPrExfEm/vK3sa0Z9SNmyGA6hI3+c6tDNNs4czr2Juj9S3hE9WY+DCu+1eOSqjOrO/
         cWwGUQPR6ELs+cbviUbdd7MMOTm6zMwm6YIAw+ceRDOWyLO4/kjNP6T3DSzCrODSF949
         c0qA==
X-Forwarded-Encrypted: i=1; AJvYcCWFWA5i4l6uikZXPfTYvt+gxKUc+jzafaVD9w1m05cVcybaNH5rV0oU9QtOBVKy3xuLW9Eyq/wLpMN+CQMu@vger.kernel.org
X-Gm-Message-State: AOJu0YzCpbkZzXIEIFZPjB6M+3r775VomTj82kdYmNNJwPIKxXigj/77
	+RJMaKo947OEatHJnXmkssU+42PzX+DeZBYzUKWPWWLweCgyzLR3HivVhdK9XHQjjfOSLDWXqRr
	Vd4/+wLDFsoAfzX5hgbx/GX5CMvpjzx8qR1IUpSuP2W2JtreN8HLyP3GE4kOKMzX9jRaE
X-Gm-Gg: AY/fxX7kEjfs0v/i15B/o4yugADzQN8T8jnvhAz084IkNikDskfcHTcoY5jzDDDwZtt
	HHSA1Him+OMjlqizuaPhp9xeUWBiAUvEj3MOYHcFVTvDTuGMHiHTk+15leuUK7iepclIj+9KscD
	vUTwHwJ6acZLzFUxOfzkmV9Zdy+Bq/mkJZK2gcYri+yQQQeARvQCxxO3Hr37BPOy+vrY6WfpuhS
	w+NHS3YkHAkauUmFI/+pxEQZuveFs6DQLrpjSlSGzwHJZbeAWZQqCWXG1a9NgfbrEJ07f0iseKU
	oOzjdprdUagDH7NG6sYQ2/HuOPYhImyZnp6bJybC7ubdGM6IhakthG9bqyGhZmwUehXW6ThQZ8H
	7CS5oA8aoJp8XOrRzJrRxhUcgc+mCWhBr6LhF
X-Received: by 2002:a05:6a00:4387:b0:781:17ee:602 with SMTP id d2e1a72fcca58-81b7f4ef1b0mr8391926b3a.28.1767958159723;
        Fri, 09 Jan 2026 03:29:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXnYjMu4puvMm6nxYJUa98/3GAc9CeW5FaojpFB0W6CqLL53DeHyB5cvLk9bH+2EKkXFdCqg==
X-Received: by 2002:a05:6a00:4387:b0:781:17ee:602 with SMTP id d2e1a72fcca58-81b7f4ef1b0mr8391899b3a.28.1767958159142;
        Fri, 09 Jan 2026 03:29:19 -0800 (PST)
Received: from [10.219.57.14] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e46339579sm1667009b3a.18.2026.01.09.03.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 03:29:18 -0800 (PST)
Message-ID: <b0a39971-5616-4768-b08f-b359cabd2f6e@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 16:59:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] iommu/arm-smmu-qcom: add actlr settings for mdss on
 Qualcomm platforms
To: Will Deacon <will@kernel.org>, konrad.dybcio@oss.qualcomm.com,
        robin.clark@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        robin.murphy@arm.com, joro@8bytes.org
Cc: catalin.marinas@arm.com, kernel-team@android.com, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20251209052323.1133495-1-bibek.patro@oss.qualcomm.com>
 <176764799410.1451727.17568755330994660848.b4-ty@kernel.org>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <176764799410.1451727.17568755330994660848.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P803RyAu c=1 sm=1 tr=0 ts=6960e690 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=y7gZjIUQjNkmgTN75kQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4NCBTYWx0ZWRfXwNmIoAjpQrTb
 hPZwHDexNIMG60Tiskp1tFHeydY7heP+bRCwLPIgUVtnOLlfYTN0bB5sp3FaLI21nyG4GHYo0/D
 kZepRLQAPrw0cjUV9SiSUzrEIoWwrDwnBQlEHxojR7uFJffb+22BYNSiD2GgUcMl82ioYN/S+nh
 cE0jsF5zENIV41VhVb+++/SWsd+U+nQg60PxUlGXUl9mATvPzvV7cgxHtuTVtUlEYAm4XczVRHW
 uGDUctyRJzJFWT9XjKULs/Q8niu+iRe+h1v7Vt95LHNw6+7iqQYVR/OJs6wM3qEge3iCyJ69hFt
 OPopz2r93Stk+XjynD863oLvvzxXCBDL6hNyLCaI13QvVsBA3MJJtC6eWa/O1bb76akxv/gIpmb
 eH6+KPSx3pLcNgB+ExCEnLocwa7aoUjNPjoa1bwuJgFIj+eBjxqU0C6jaCR3JzgE46GUMeH7qFU
 fTP89cZAT7Ektl04X3g==
X-Proofpoint-GUID: M7U08yki9dbbsJuq3qLzD_I1HA8aJwoy
X-Proofpoint-ORIG-GUID: M7U08yki9dbbsJuq3qLzD_I1HA8aJwoy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090084



On 1/6/2026 4:28 AM, Will Deacon wrote:
> On Tue, 09 Dec 2025 10:53:23 +0530, bibek.patro@oss.qualcomm.com wrote:
>> Add ACTLR settings for missing MDSS devices on Qualcomm platforms.
>>
>> These are QoS settings and are specific to per SoC thus different
>> settings, eg: some have shallow prefetch while others have no
>> prefetch.
>>
>> Aswell, this prefetch feature is not implemented for all the
>> platforms, capturing to those are implemented to the best of my
>> knowledge.
>>
>> [...]
> 
> Applied to iommu (arm/smmu/updates), thanks!
> 

Hi Will,

While reviewing the applied patch, I noticed that during the transition 
from v2 [1] to v3 [2], one of the SoC entries (sa8775p) appears to have 
been dropped while addressing the review comments.

Sorry for not catching this earlier.

Would it be acceptable at this stage to send a v6 including the diff below?
Alternatively, if it’s easier on your side, please feel free to squash 
this into the existing patch currently applied in your tree.

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c 
b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 456d5146831e..718d102356d9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -43,6 +43,8 @@ static const struct of_device_id 
qcom_smmu_actlr_client_of_match[] = {
                         .data = (const void *) (PREFETCH_DEEP | CPRE | 
CMTLB) },
         { .compatible = "qcom,qcm2290-mdss",
                         .data = (const void *) (PREFETCH_SHALLOW | CPRE 
| CMTLB) },
+       { .compatible = "qcom,sa8775p-mdss",
+                       .data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
         { .compatible = "qcom,sc7280-mdss",
                         .data = (const void *) (PREFETCH_SHALLOW | CPRE 
| CMTLB) },
         { .compatible = "qcom,sc7280-venus",

If neither approach looks suitable, I can send a standalone follow‑up 
patch, either on top of your tree[3] or on tip.

[1]: 
https://lore.kernel.org/lkml/20251118171822.3539062-1-charan.kalla@oss.qualcomm.com/#t
[2]: 
https://lore.kernel.org/all/20251124171030.323989-1-charan.kalla@oss.qualcomm.com/
[3]: 
https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git/log/?h=arm/smmu/updates

Thanks & regards,
Bibek


> [1/1] iommu/arm-smmu-qcom: Add actlr settings for mdss on Qualcomm platforms
>        https://git.kernel.org/iommu/c/f91879fdf70b
> 
> Cheers,




