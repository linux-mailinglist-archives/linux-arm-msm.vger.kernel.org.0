Return-Path: <linux-arm-msm+bounces-81620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 64374C57D07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 14:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 318FE355FA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 13:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F70236435;
	Thu, 13 Nov 2025 13:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+LpV72S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1HEkC3b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396A921D3F3
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 13:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763042134; cv=none; b=fDkCAbgLe5Y11OQF7d19BKUK+DcjT7S6A/YNMRw3ID7/CucKIpvBOzAqcWy/HBaSbS+YXBUQev0KwXEIQpbh2iugbEfG1cvkFABkYbNCidUZ1AXJJv/oEHwRXIBdMY9iT5VvHe8c7Ss6gwpS9KFH/Me7u4kOiPzBu8pna8KbFBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763042134; c=relaxed/simple;
	bh=BWyO42d1hYYLVvQCQ4tlS39gf3pek+5rN+OLpq5Jr90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ioWoakcedCckQgn3eu2jdSKgnL2E2l7JkUgUWKP9GjT2FDySipVc+bSdGQJFtBU57w/7IpXHSJqANqgtqIM+sXLtGN8KdtmA1WyNMF4/gB94w2cMNkkg4Fwe4oaWc5PKMR3qYpn9FTRuVPIbjolstflB+vnjWe83F57K4rN67FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+LpV72S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1HEkC3b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD6qsBV3873844
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 13:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PYq90gPok05Ftan3q4LlS4ySOfx7eLDR6jvQPaWFLaI=; b=J+LpV72SJATiLwN1
	sdxH62ruSbqsh8Ic+tb9+6OSbVfKojMtQ9Hy5e3qylgM3nE8Foxy+CMV7PJpRfl1
	9g469/SlTULJgYFUJ4FXrskSFLr/XCjU2JraFCHDLP+TGY0iYzHgS3LRBvGEEWAr
	ZegyHa0zEhrMAw2K6xm/0oiTYFw7++RJodiCPb7V6hWkfD8qF/zbEDCeT2xAHJNE
	Vpp530YmDV4Q/TXy1oR6ixQ6necnTQFHqsueeVhAJM4BgEIwZz+SHQhaiPEOeJIn
	MVOnfZuQF7iifHbRAVX9Cy8RdR+57iBBe+PrcffE4p6GZFYo3BmKYmkX1r7z5zi4
	P5JNXw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adaeus8hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 13:55:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297dfae179bso20809295ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 05:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763042132; x=1763646932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PYq90gPok05Ftan3q4LlS4ySOfx7eLDR6jvQPaWFLaI=;
        b=R1HEkC3bTiqF0qHDJL4lWC30vq1m1PXI++Efqx8fqJKBsVpcXZDRXfLxGPfRYXzNGL
         09u3Z7R6UNrJoRdHAXg8wEzlwPH19jVqWklHA0wHVAg4/ZiiuC42svQhVzTeFqVaoyP1
         WReYQ/0VFWwyUDbw83eFRERcDK61xl1/HCv6zRH+4BCPyof7rCdobsI/LQBwdPgqsNER
         bVMQiSQb6Cz9ptIQSy/CTg2JGCz5SPXrUKfM8M75e6JYwsG44Eqonj4DGOorEChk0ZkA
         aatIxZkEiAbTtbetZ7h61YVpXs5n7UfMb0cgsB1sOLqsXhni5JjCJE+vMbopADmmPQzr
         JN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763042132; x=1763646932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYq90gPok05Ftan3q4LlS4ySOfx7eLDR6jvQPaWFLaI=;
        b=Mm7c8L1mGDs6Al12TtnPkCgiKwyhe4t56bEcl+JaGodkRrIRk2joDvkrTbNft+r+87
         N5fRyjHkZC80rFeXL09b+hjyQunShrKNtE837yWzuIgKXYmEBPQRhbr+nJUIBExJtTE5
         EQooaQHbarymYs/+GuHZvxDncIxEtriGbWjXuW/TQ1bkMEazhTWbv+s/TC787QxTAAoq
         sTcdQs8XO9tNUIa8QmgvrfAH4pQ+iXnnTTrLKPxWd9ts4iyIwMiABGl6YGmmMMmS6plE
         veBZAtLSrj4wMaTbQyyY9dedM7wVj5OHT/68XAjCaHfuHBBBBhRgEULB1lQQ9o84v92w
         yBRA==
X-Forwarded-Encrypted: i=1; AJvYcCVOxb+MEnJW+Yi2c7ACV3uG9bNjJ7wiT3ax4cBAm6uxaM/LezOq9ogTvKr9ZuONN/jtZvID3j/Ib1a+ER53@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0zQFGJP6VYRBqRPuO87CO8EaHWkBS26npwTw7TAlcr9qp6jDx
	EJIlRPHGEdPTuA5bnNVQwaqXekcEtm9J6C9XGajvcPZ4BUneeqY3zZ01sNlj5j4ks4Q2hx4cfYK
	e8WaGw/qTdmfOrWirIZ6syqhY3MrKSZ+oJ23glN+mmdyneHJK7ClaEOv8ZIF8HPilFYn8
X-Gm-Gg: ASbGncsGTaJ4qF7tbGUxU8IxbGiWfTdIex/GLKtwTVmOjVQ4jxcV3CX70C37FK4yx9v
	b1csDuGKIFliEB7diAHeXkKsHb+XsDtf1cRVkqRLZIJBVu443dhZf8mrjLq14ux5Er9rR2ZIP7D
	uOl6xD5YzQordcIt+P7WhcW3qmTyCJDLWoRA7EojC9FIAZfprJoYwvP+siAOhsfgGpk9Gg7zjzO
	y5uWgr95h19mQX32OR7aoOcwOzy9cCAEhQY4sTfAQw10553N9BmQ7NW1ehyhKBJBzThDNH4hNH0
	QP9fMvMteKndqNZDvQXY6dN4XUv4v6r+58l4+5tTTWdE2KAl8KcWzUgpIvZDK76DK0OO6zVQD5A
	tIA4pjtRtCsUMLLzq8rOE4c1rYkzt
X-Received: by 2002:a17:902:d583:b0:295:592e:7633 with SMTP id d9443c01a7336-2984eda9ademr94497365ad.29.1763042131772;
        Thu, 13 Nov 2025 05:55:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHT1ffqRPXlTOuOE+KE3Wz2kdPEseeGi4tLYYplf2iHM7EojlOZXfQ+bTEJ192e9zzGd1U2mQ==
X-Received: by 2002:a17:902:d583:b0:295:592e:7633 with SMTP id d9443c01a7336-2984eda9ademr94496775ad.29.1763042131113;
        Thu, 13 Nov 2025 05:55:31 -0800 (PST)
Received: from [192.168.1.5] ([106.212.255.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm26803425ad.36.2025.11.13.05.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 05:55:30 -0800 (PST)
Message-ID: <1db3d7f5-0cdf-449c-bbc3-dc40c89ab27f@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 19:25:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>
Cc: robdclark@gmail.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
        krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
        dmitry.baryshkov@linaro.org, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Eric Chanudet <echanude@redhat.com>
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
 <CALE0LRupg93WsBVc62Lqt-T9qmK5MdEYoScxyP7=ttKJYXAsUA@mail.gmail.com>
 <33826089-54b5-47bc-8a5b-6004c7a276b8@oss.qualcomm.com>
 <5a1aaf4a-c5d5-42e1-9044-d12a6c231904@oss.qualcomm.com>
Content-Language: en-US
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
In-Reply-To: <5a1aaf4a-c5d5-42e1-9044-d12a6c231904@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7WRQOZ1ZQifzTNn-Xcl14PDZG_wGmLTJ
X-Proofpoint-GUID: 7WRQOZ1ZQifzTNn-Xcl14PDZG_wGmLTJ
X-Authority-Analysis: v=2.4 cv=JPI2csKb c=1 sm=1 tr=0 ts=6915e354 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=pJoDNl42m32kJ7anCML+mQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=UTFmerWDhw6whTtWHmAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDEwNiBTYWx0ZWRfX1d9iV4dsoBcl
 EMjeEoGTjU2u7w7RSniM7OSNKqOeHSZIJgSiC++zXTYbG6U+TMxSQml4f2a9DOgOKbuJW3wMNeQ
 PiNBSK+P8J4IC+3SgQvkRayLw2Q27zF2pb1g1SFrVUPsuwBW36xYT4dZqu/YKWLzkpXedoiOaVQ
 JGyozj8zlhYV7EDq8G2GSMCK1GeW8Mj5GkXbnfyaEhLZyyUaoeIMU8pKSFSYLAJxuVwIT3K9PDG
 5RpHEICj2ZW+O4Bh4r3GFTFeLVwpC5dXObrc6CzP3R+qzXxVAWG8JhIDgYPMb0z5aGi4fbdYNrL
 h70GjBLMEfWvRJqDcedIwxUzyo/nGUWRQyzk8pXXdkPaRD7I75j0IWTkIapOUZaQJs5isIsvnOD
 8aMqopGkwCocLGVWgx3p9DwVKyZ2XA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130106



On 11/12/2025 7:04 PM, Konrad Dybcio wrote:
>> Hi Eric,
>>
>> If a device has multiple SIDs, all serving the same functionality and grouped under the same "iommus" field, for example:
>>
>> iommus = <&apps_smmu, 0x2141, 0x0>,
>>           <&apps_smmu, 0x25c1, 0x0>,
>>           <&apps_smmu, 0x2161, 0x0>;
>>
>> In this case, all the SIDs will be associated with the same context bank. Even if the three SIDs have different ACTLR settings, since SMMU_CB_ACTLR is per CB setting, all SIDs attached to that bank will share the same ACTLR configuration. This is why we designed it to be "per device / per compatible".
> Does that suggest the settings may be slightly suboptimal?
> 
Or it is limitation to use the ACTLR?

> There's some work being done to allow more granular association of
> the passed SIDs:
> 
> https://lore.kernel.org/linux-arm-msm/20250928171718.436440-1-
> charan.kalla@oss.qualcomm.com/
Sorry, I am unable to link this limitation for actlr setting with the
work. Can you elaborate please?

IIUC, unless the SIDs are totally separated per actlr settings and
attached to CB(which are limited), this can't be achieved...but may be a
question here to check is it really a __valid__ to associate a different
actlr settings SID to use the same CB?


