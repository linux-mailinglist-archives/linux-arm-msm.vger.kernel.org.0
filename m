Return-Path: <linux-arm-msm+bounces-87184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06702CEE1EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 11:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7C8C3003491
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 10:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7962D5C83;
	Fri,  2 Jan 2026 10:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izxvA3bk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfajbwq+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7713C2D23AD
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 10:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767348188; cv=none; b=B8szJXmuvWGZW15vzkkIRVhuoebdVgZ30HXd+JGydfbHxFunOf4MgT0kT01R3BfkfE4+wCmMt0mb7/xKitLQZ2LBEjogBVtKLA634qkdO407EXQ8JlBR4lm9ga833dyTlIlyEglCwxwMtP1TcjtfIU3nQ/OC0kGj1/YiU4/GfdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767348188; c=relaxed/simple;
	bh=pibIXk12tTANSpjXLzL+g/XsflS9ixcBlLhRmqgS/X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JwRtPeA/IgysIj2LMRCUtBdIojYhiDvMx2dXX9O1ayChdc4G6G2kShPzYFOJ4WCAEW0/b8Up4EdEg6IyPV060dJWyjFRv5lCKI1wk/fCJvP9DpsxeKYTIPWZjJr2TdhiW9N2ePB1mZN7KM4T8j0g641xW1oBHaAW5GKi0eSPwEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izxvA3bk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfajbwq+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029VxRW637501
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 10:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aZbAWGAfQr1/HGu/dqhGNiF3rdYBuBrHg6LI4HJEAGA=; b=izxvA3bk/V2xDLoK
	G09/eGAzR2vR7mSYAqkwr21TL7ykMGbAk+8uAiWPJGkjufcr08+Y+SNSoTX3bcZ2
	KSHh72xX+lq2wRJ5w/efX1QUIZ2igr1okL2xKUvDjtt7ikzI3qjRS51Fm6mmyd/C
	0aFAk+S0AyXanyKN7FdbNOSuGdN4npEm+ZdBwRug6wzuxDZFEYbZDPJ813FpgFxL
	iYjMGmcnvGc7V0RFDMX7L5x+FMU3iwEhpnCburBctYphlPyDvpe1M6WvFg1/uEJX
	oP12UvjtjKF9h2eyRkh77BKx6cY7A3PGTNzPMknNhLkCQl3IdSIDrF3/2tVNuAO8
	tqB+wA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd3v8ugyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 10:03:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a09845b7faso178132335ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 02:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767348184; x=1767952984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aZbAWGAfQr1/HGu/dqhGNiF3rdYBuBrHg6LI4HJEAGA=;
        b=dfajbwq+sTGtjJp8ROlQ7fHQGRoBUUGIuEUYbr7ephDWLad+UHZUOjYNZNgWRmwdoE
         vvFzHYi6v2sOMd/bf0uaN+QW7rxy3SKysEAlgzXmR5CcWUShN7ZBtdgLehqeUfdjI0RO
         xp2ZPS40lYUhO27GQfenq1EzX31Ap5HGbX/88Lu4Cg/tNM/UqrhbvvCShk/DranZ5X3I
         5cPIqu/VBz8cnlNoN24HSNl+papWnymKIvfMckB7GX2fLDkMLkQVu194iS4SmHWRKlMq
         mn0UtKka9Gc1MDxluhtRb/uNzo/XETuOyKc/Kkmz4lbzoDjyx+DZ+6nggOgaHQmc2o4p
         I0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767348184; x=1767952984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZbAWGAfQr1/HGu/dqhGNiF3rdYBuBrHg6LI4HJEAGA=;
        b=AiG/jnsvh978iwVmna3qE2L7uvdswfFtPPF1TWzhhblLRz5Z9F7Rg4zRVLjVuNqsUo
         Gk2fWY8uvb0CBgDTa3mapeu8cvNe7ktHYYDEbNKkYl7NvmiddU7jwyxLR9b/tn17sz6/
         cXpVMK8X3r501/4Jd77OgxZxXgrNXUYpc+vfKra3Ybo6p4FCaE5obRvDfXh9RV1uCrxW
         CDo3ypx62maElzm0xrZVdfuQ+q3OLNKmnoWWGgv80R/+q0bM1X+J8ibHRO4ktXffl6jW
         dXCsJrHkVHdpb7FxsOa4Z0ZwHZUBds+/JUfTT2UQRg8RDIXSl6BWTgFB71t6hq+rfpKc
         Gxpw==
X-Forwarded-Encrypted: i=1; AJvYcCUyjiSWROR17OOsqzBIydltSru+7kHgTfT/jQ1OB/HyEF8oarU+0Lr9e+Wb8WfhstYKBHZw2idxJNP4jyTZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwTq0lmFuyNHYOUzAify1JiB9IaiVNL5QHCTxczxCg70TvO7dk4
	/wax8eo2DpHEAfHMnAhNFzBTfpvnolz38TO6cD2nBXdyDBfL0y8+GkaJpVUsBXF8ngSzI8IN888
	Ufu1ogMmMYfjo7TYruweu+EdiyVXsgpPtY1ZnCz/Hf8kAcnoSelTkEIFap+g55+1Qzin3
X-Gm-Gg: AY/fxX5vIjMjUyKOJSoBfGblsxK9yR/Up3tZFlB/VfQU7R8Q2vgzhTqntds18nKvKnZ
	0ASqBN90Dh/cQxwRrGe6Zl6oFpVJ3dQiGk+jchZ9exFJFt7Utq9rpm6Y2FeVVPm/+tcspfL8Y5L
	gtaYE0m/1NiBatoO6qSzN7FPXatGcTnsidl6tkwuu0auKyVqfXgfInVfuao08awWRhDiNoSUv/k
	NWypoSoAwX3TPa9xeg5EP85BNwLBS5nYBP811hdKpE3b0Vj2hOX3f4PrfrMSYUwL3C5msxMkPDC
	R7yk0Kpmx2ycykjNsumkaFQCmR4vDQLNLhzwrCwlIBblBn34uNyphpvAYmeaNhcYR97OgkISyEj
	rwrrQoH44ZpYNA7MU4Gd4c9aY+xLm8Qn3uf9TRZo9zt0=
X-Received: by 2002:a17:902:f684:b0:2a1:3ee3:c6ae with SMTP id d9443c01a7336-2a2f293faedmr377988745ad.59.1767348184085;
        Fri, 02 Jan 2026 02:03:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEn4yMH16ngFDkg/GTXnGR5Rl9Xfysrq8xt0p8bXK7bRk0YW5rNVzRdBtt67mLtdiJCh5phmA==
X-Received: by 2002:a17:902:f684:b0:2a1:3ee3:c6ae with SMTP id d9443c01a7336-2a2f293faedmr377988475ad.59.1767348183559;
        Fri, 02 Jan 2026 02:03:03 -0800 (PST)
Received: from [10.204.101.164] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d88asm365778595ad.48.2026.01.02.02.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 02:03:03 -0800 (PST)
Message-ID: <5fdf6122-3c2b-44fb-b8ea-9e554208a56d@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 15:32:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: agatti: Fix IOMMU DT properties
To: Sumit Garg <sumit.garg@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, linux-kernel@vger.kernel.org,
        Prakash Gupta <guptap@qti.qualcomm.com>
References: <20251229070712.456138-1-sumit.garg@oss.qualcomm.com>
 <CAGptzHOftKG_3h3KegrYuNiaDFCUHC8oS+eN2JyBDh=aRMod4g@mail.gmail.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <CAGptzHOftKG_3h3KegrYuNiaDFCUHC8oS+eN2JyBDh=aRMod4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA4OCBTYWx0ZWRfX+d5cCCtyVvwX
 BO9w0RA9mkO+ehuWQRvUaR+tNsvzb02sxW/XWI6d1jubbQjAG5DlpekuUMm1CWcZ63+4t6etMmN
 51n0AB1pm7KZPIwywcn4L3Ru1YDq0Ui+Ap6fp5peTCcfbAxo3ggFTePo0ky1bdkWCvbnsHn0lcD
 k7TtidRawgmMAB/WH/+QCs4gtNjjrNxdX3f0j3kMFBmtHKa7B8uLMCqL1NkNwGsTkPFM9IuhGRP
 nVaz+hV2CEkr3qazjyOA1EqFK3f9qK/+CiHm5grlE5bC3wKvumgY371KnyDYK/NeVcYQbe3TIzZ
 Y9guT4qP/TrHOJ+N/tCO6zNPB3MuRWkVYx+tsUAOcgZrpSKQPmk8tbHAY16aOG8lreHFXmX0pjA
 Xvz7HHKW/uEvjR+tv74L15HpoX8g7mGt2ljZFsCLJrJnyykTEAYcQs0MxNzmY3NGoV5kgLZcV2S
 KzD4DUZW7lZ9U53QyUA==
X-Authority-Analysis: v=2.4 cv=JdOxbEKV c=1 sm=1 tr=0 ts=695797d9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9AdMxfjQAAAA:20
 a=Uex5WGqezaL_9rCxZfUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: hOUbE9JZGqDDcDeL-4DMyh2NagoE1iQr
X-Proofpoint-ORIG-GUID: hOUbE9JZGqDDcDeL-4DMyh2NagoE1iQr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020088


On 12/29/2025 12:50 PM, Sumit Garg wrote:
> Hey Everyone,
> 
> On Mon, Dec 29, 2025 at 12:37 PM Sumit Garg <sumit.garg@oss.qualcomm.com> wrote:
>>
>> Fix IOMMU DT propeties for GPU, display and video peripherals via
>> dropping SMMU stream IDs which relates to secure context bank.
>>
>> This problem only surfaced when the Gunyah based firmware stack is
>> ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
>> Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
>> as a fault by Gunyah hypervisor which were previously ignored by QHEE
>> hypervisor.
>>
>> The DT changes should be backwards compatible with legacy QHEE based
>> firmware stack too.
>>
>> Suggested-by: Prakash Gupta <guptap@qti.qualcomm.com>
>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++--------
>>   1 file changed, 3 insertions(+), 8 deletions(-)
>>
> 
> Looks like I messed up this patch-set with email delivery leading to
> non-delivery. I resent it properly again here [1]. Apologies for the
> noise.
> 
> [1] https://lore.kernel.org/lkml/20251229070712.456138-1-sumit.garg@oss.qualcomm.com/
> 
> -Sumit
> 
>> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
>> index 8bf5c5583fc2..e705eb24160a 100644
>> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
>> @@ -1613,8 +1613,7 @@ gpu: gpu@5900000 {
>>                                           &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
>>                          interconnect-names = "gfx-mem";
>>
>> -                       iommus = <&adreno_smmu 0 1>,
>> -                                <&adreno_smmu 2 0>;
>> +                       iommus = <&adreno_smmu 0 1>;
>>                          operating-points-v2 = <&gpu_opp_table>;
>>                          power-domains = <&rpmpd QCM2290_VDDCX>;
>>                          qcom,gmu = <&gmu_wrapper>;
>> @@ -1895,8 +1894,7 @@ mdss: display-subsystem@5e00000 {
>>
>>                          power-domains = <&dispcc MDSS_GDSC>;
>>
>> -                       iommus = <&apps_smmu 0x420 0x2>,
>> -                                <&apps_smmu 0x421 0x0>;
>> +                       iommus = <&apps_smmu 0x420 0x2>;
>>                          interconnects = <&mmrt_virt MASTER_MDP0 RPM_ALWAYS_TAG
>>                                           &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
>>                                          <&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
>> @@ -2339,10 +2337,7 @@ venus: video-codec@5a00000 {
>>
>>                          memory-region = <&pil_video_mem>;
>>                          iommus = <&apps_smmu 0x860 0x0>,
>> -                                <&apps_smmu 0x880 0x0>,
>> -                                <&apps_smmu 0x861 0x04>,
>> -                                <&apps_smmu 0x863 0x0>,
>> -                                <&apps_smmu 0x804 0xe0>;
>> +                                <&apps_smmu 0x880 0x0>;

Are you planning to update the binding [1] with this change ? If so, how 
to handle the case of iommus for gunyah based vs non-gunyah based ?

[1] 
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/media/qcom%2Cqcm2290-venus.yaml#L45

Regards,
Vikash
>>
>>                          interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
>>                                           &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
>> --
>> 2.51.0
>>


