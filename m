Return-Path: <linux-arm-msm+bounces-81918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7909BC5F64C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 22:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BA503BD3DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 21:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9453535C1A4;
	Fri, 14 Nov 2025 21:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YiaIGUJ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OGeEdt4U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDEB35C18F
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 21:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763156379; cv=none; b=MOA4NqJC6G06E2wnlzSi6eOnnPto9zAUz0US3GiBYdQBdqT6iWN4CdLmXkChehlFTVIhRgrz1POaTKoQwUrgwMyUwJgvZq/u64IizQEhyi8xqpfEfCUOLS+/suGMPSr/bpjPL6Em8dLRIwRI+ioLHBGpH0WpnAH323bQHJcEnvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763156379; c=relaxed/simple;
	bh=ZHS1Ve0lJVsZcUbYN/dn1jMxqM5DQVkG29AZCxZ5bnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKd9vYfytjVwCMRf0ewDQskWquQ44tK7QZNI9QgASk02gN8+grvobh0DEo/7eOKYgFIAC8EC4gZXDb7jkRhpsqvSPNVob3jxs2s5sUVcAndvjBps0X1I8gmgzIcqstuaee9vkr7pflcW8Jc9FnsabIU7aU7oofcErK2mP9uhV5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YiaIGUJ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OGeEdt4U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEIQDOH092024
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 21:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	otBe/rMrbE1YTzc5bfCsAUJkZyo7ZMz5fnQzamsyzj8=; b=YiaIGUJ8sIqDa5mH
	MG0jFO4LKjhhRJBwxm1RFoJxh0K1+DPExeyc9m+gB547I62ZGJjxpbcgOC4+i0zl
	o42Ma6s0Eu/IuImXYk0NsmScOG8FwXFD6wr/6lq6cnFZ+zKIBtFB7rSHujaRfMDL
	4pO6FC8zjXYIrdO0ybAZwUrREGXhY3+O628IIWfesTdXuVWRNZvU/VVfJfhl8Z+q
	SgZmN5/SYli2AHpGfezNb2V2p6sNjxOfuFei+cI+L3V5X04TyxWG/9oI6WHMBsQj
	wPjVdxAwPbnXPM80JA5DENY9eE8H3LETcjoAih+AqqX6dxKmp5xXQGWGLYG507al
	rNdC+w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ae6xm9472-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 21:39:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee05927208so245661cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 13:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763156376; x=1763761176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=otBe/rMrbE1YTzc5bfCsAUJkZyo7ZMz5fnQzamsyzj8=;
        b=OGeEdt4U+3Dr5PpPs2FwGGg09ugzmkq+i7UukWcPuaJXp62z44ABoyUtMjIO8JHEyh
         dI6TikH4bGlFW1IZ2cTj5zvWf/804mAW5z914o/kcNY5Ocm+Jo1ln7UNJsJyxkMWXxIO
         pQlmQHNHHLrC9YQLuC5771KiPfgPi3pRC2BX+EMB/1pnjH8hKAhSq/Q6cCi2bYudxx69
         kLgJ816LzLtfEY5UWpRrm1VOuIcFjbTHCwsw/9ZFbi/PoQ3BRZwVJ8Ewtn7v+sNPDQ4K
         fFxFwOVZeKMijbeaCahft5PVgZvqCiGaQUREwtiSCSM8q/LuwmmDbtzYhWcCD1BiIEUM
         3JlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763156376; x=1763761176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otBe/rMrbE1YTzc5bfCsAUJkZyo7ZMz5fnQzamsyzj8=;
        b=uXutyz7Enp/4GQgFCCBdKZLJczfyCURZXbE2GxI/D9PGSCbFbwzR55L3mgrvHII5ei
         8Td4263sGpRfzkAZ7MlJN95YAtW0VGGFr+kH5L3SZqbKgTBKRoj7Ype0jLUlXCZO4vuZ
         PN1TrBjCDtVt6KqL1NvyIgxQ+5X2Er7vrWnnsFHLrNbcWSC0Odo0YV/3YVFdbx8vMqwM
         29gXn1L9B84PV46kajndQVAcGdHtHtMiUIX2YBQz6ucjN54e9HIARZck8/KdpdvuZMB7
         vi+OAmAVtbn5Ci6BD0bwTQqmRc7lfC45zbR6R2WGJqrk2UfgVRWuPQpKUkh7+qIjNN73
         uFmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXciB9s/Wd5mmL716nE2+TgUNzKsJmeompGRsuQms5d6gU8kVPyWvR8DgVlH6YlKFhn9dLP3pJwmKc7AKh6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc2nznpcRCZJuoLNE5uELm8dOAPBjqzST6VDIHZU0NWseMvLOl
	7Q4QOqUMr9WXk5GxhkfSMwjVCXi+pl2ocL1MUl9b62pd0LnYpnop8GIkw8nG7+xbZ/I53WUYJ0s
	V/UaPAd5rTdjNQqNMGPPKIxR82Rq7L3vw63pGHZ1bLoXgZywuhj9a/hCKzYxPy0quoe8d
X-Gm-Gg: ASbGncvvIRtPTFuYeBEU+sPbcukbB9MoCsUkGN4yJ3Sn0RDvuPzfmXRcyzPT/jGbBeH
	gFpVvBEL0L4XFdjWxY8t9P2Z1HaPDbN7sjHpisJqXwvoNEyXpWmH0SOaXeE8aXcU0npkMOpR4WE
	JtEDuC3vxHIDjaUrxpj2UikFfHjs5qg96ri4he0k8lSrV3WQvEyGL3h/rj4FLS8CwmpyxzSp9rw
	CtcHtkiMr35e7kN6vGA9QpfIIZVdjeasiu+nUEnXCl9b9OKRdSW5RAr4AKBfcNeNanKHfuLYcWc
	RiK96mUjVCOelKGVunp2HfbfazbmGD/glC5a7Z0mI5V8pKv8DgSCGhnaJqfp426r4AfIH5O66uG
	IboNIly7YfHGG+M2JzHhjtap4XFinjcq+0ji/MhbssY/TVq0PLSekpUNO
X-Received: by 2002:a05:622a:46:b0:4ec:eef1:52f7 with SMTP id d75a77b69052e-4edf372e061mr45325221cf.11.1763156375983;
        Fri, 14 Nov 2025 13:39:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXCq+Z4cf78DQLJIO/O48dRU1rZcKjnoPmpmh32Tu8KqQvjlBSQTN5wBhCxB6vHlVmhvAlJw==
X-Received: by 2002:a05:622a:46:b0:4ec:eef1:52f7 with SMTP id d75a77b69052e-4edf372e061mr45324901cf.11.1763156375548;
        Fri, 14 Nov 2025 13:39:35 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b19dcsm4295103a12.27.2025.11.14.13.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 13:39:34 -0800 (PST)
Message-ID: <11ea6680-6aeb-49d7-97de-c44fafcc2e8e@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 22:39:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] efi/reboot: Add support for
 EFI_RESET_PLATFORM_SPECIFIC
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-efi@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org,
        mark.rutland@arm.com, andersson@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, shivendra.pratap@oss.qualcomm.com,
        leif.lindholm@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20251114085058.2195900-1-sumit.garg@kernel.org>
 <20251114085058.2195900-2-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114085058.2195900-2-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE3NiBTYWx0ZWRfX+NS/MPDjnsTp
 PKXpKpbK9deT4rsdsjqVrhoqHyvEEovEYp+ysRNl+tTSZ4SOhyUUNebeShHe24cpNsPQvh0qRM3
 vXzZmkMSYhMbDcPRnzTj52MbSoH7Qv8kBwltpI0MT2eWARcxnEmg+LOgnh+4pW/H14FRyR6Qfd1
 AUZKg+ykq+oILMxdtTog4ckrdQCx/FuIvZd2bxrypVy6Rs+tVYIu4Qeiv0txD97E8E9ahxZutr5
 +i0PDvvI2ve+n0ELULiX5+/SIgi5mKmMujCqls6WBKRgEvap9ubke9TnLZQ+APPPaIlX3oujq7d
 LZVCp3Y91iqpktwrvOccjA+z+RWVUOukiTnXo+vzWZKxGxzPDBbjFgIe/gPjOy2LldfwRR2+ATA
 Vp+eZStsBalXMzm3HlqqbDeyGJOIwA==
X-Proofpoint-ORIG-GUID: BC2LLIfiOKI9tmNWHN9cpM37cTXKzog-
X-Authority-Analysis: v=2.4 cv=NZHrFmD4 c=1 sm=1 tr=0 ts=6917a199 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=IJHIyZBPcXzIKyMZlaoA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: BC2LLIfiOKI9tmNWHN9cpM37cTXKzog-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140176

On 11/14/25 9:50 AM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> UEFI specification provides support for EfiResetPlatformSpecific reset
> type as follows:
> 
> "
> ResetSystem:
> 
> Calling this interface with ResetType of EfiResetPlatformSpecific
> causes a system-wide reset. The exact type of the reset is defined
> by the EFI_GUID that follows the Null-terminated Unicode string passed
> into ResetData. If the platform does not recognize the EFI_GUID in
> ResetData the platform must pick a supported reset type to perform.
> The platform may optionally log the parameters from any non-normal
> reset that occurs.
> "
> 
> Lets use the ResetData to pass the platform specific reboot command
> issued and leave it's interpretation to UEFI implementation following
> the specification.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

