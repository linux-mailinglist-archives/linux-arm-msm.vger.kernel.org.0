Return-Path: <linux-arm-msm+bounces-87850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF20CFD654
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98AF43007C67
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582C930F543;
	Wed,  7 Jan 2026 11:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mlGKUlRU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NBiIk2iD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C383101A8
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 11:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767785357; cv=none; b=i86AgQZmFANluQJhiOdZ5g8nP6meMwuYSVVi6kktVE/dovg8pc4Rw1E3fYx2b2QbannSl6ed4UkVOlS0sr4LlvghYL+oN0tVj0RdWvuRnUexnvGjDDTD8u6OpSKNcsS6u4bmeHWM5/Nfv7WpPrbp+F+OBbqPiAxeOBO+BA2WouE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767785357; c=relaxed/simple;
	bh=qx7YB2uCJDFqAQpv18gw/aj2WVZy6YsXTZm5XoNIPl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8MEEViFzKx8AKY7ZTcBBa93TrjV81T/RwLGvPfmPqhdGlIEykcRN/tr3poAtBygeMHUt+YknJL3eLs0Dvn+S95qZ+Yl7AyLW0pipx4DM2Ady5uPElf3XMTvCqfQ8hpypA3PwJQDdG5KJxuZ1Mfj6dFKYKRiGDK974zbstsRjYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mlGKUlRU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NBiIk2iD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6078dq0W2577905
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 11:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKzSjGaF7bD5k+WIY55UCJcaAoPYulLP8uG7sW65uYA=; b=mlGKUlRUStT1qaCA
	GMHHkzUnGWXckvHbKJspTDrnwjzuqaEvTgl3s/IChcCkCnBfuzAsXeDRlkeEwVwy
	Z//wrD9WSe/iLpYVCuFIDxXjhE0rfCjdvEerKKu2RbcDvQZZzMWeqHMnYwOcpMED
	75DiHBYyC4XGVy4KNHjh+WAkw2cjBX2F/J36diKbm209HtvFMbJrNK2UUiC6jbDF
	qvtIHoskXM+s+7w7trcQoWmVP8Urzj2CC6Atl8/TLXyLhiCqzczfU14uqhp2rMIh
	SUlO6biQ+Wd1eD+A5kyV30l2QZIG91/SQLXMQyQi8zvwSoAi5H+3LEgiSrqGrcBD
	2aa7Mw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhm658hhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 11:29:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f357ab5757so6400291cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 03:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767785348; x=1768390148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wKzSjGaF7bD5k+WIY55UCJcaAoPYulLP8uG7sW65uYA=;
        b=NBiIk2iDa4RVeyY4sBnnd//kc5hqhys5o97MVIs/XlqfMRASF9te7+NblV20GUk7Wh
         PDVFssKypAJWMJiVilNaG9Zp3NTfSsKxoLA/0EVCxcX5RBskXdbKgy+IkDBmGMV4bRUO
         j1XSMzkDJZn8bV1xhQWIXY6Af5goYGOJl7S0u8O2F+6FkkfxMkVHTa1vYIYBTO18rQeP
         MDpWq/w7NqBSbrkU4GEqdH4X7LkP2EIdNHTQms0LMC4JJ4DaxGgaKaEbXT9WwUdymRQJ
         nDCR4AgUBXzsi3jfhnS3tBGG+JDpV2R5J5k6xJ6KaYKYq/2QF8sjAErmLnK7LS/vkyWq
         mLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767785348; x=1768390148;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKzSjGaF7bD5k+WIY55UCJcaAoPYulLP8uG7sW65uYA=;
        b=sC6JpVkWvpseTALVmwHEHFZPbLcT2FUeBOEa5MqPs6TUcIIdrTo8mYbNRTX6/DPrOt
         mRoycDIYVj5pYLEGl7NRNmGdnwTPnhqgQryrmoLLDrjvE4bkVr1XrIPtMXV3zIgkf25S
         hxLy/ukqTgjHE7nNn8L9iUaqrcyjItlSw/fOPkBb6NfNbirrIOYnC+ubR+l3Ck3CjEww
         PjfB4q/oqTJA+UmFv8GNbdelwDyz36fKHsbSEiahb04/1lgDblu5e8nCLZmnBSi9by+r
         7CW4Tjl5SCaqeRmEKBS5SlxNxFNF7fBVS0flXrRfFrghgrwLddMRC+7E3lLxfUK0FquM
         fcqQ==
X-Gm-Message-State: AOJu0YxLG3Hla7+QX9RAKO7Hby7g0e/7gjp/rRl8cnH6b1SR1mDWRnPw
	mDTBY8l+MRsymtXLfggU/84YP88Fw0Q1NlxAHaACDXYB+xpeSLE9ZvLsJVMg1HlXInqO728LidF
	LwaJw5nCA23kjQfFFXKG/nUcdqHYr6WuOc9+95j1b/9pTftzZW61pQuNx07ieHvd3PDLn
X-Gm-Gg: AY/fxX5EeBO8mfXK60RYabNElnkVmhU2XTWoD5LCkC3cYaS5AIanZUwu4mErnTt92US
	LH3gv3Fmm3Dcnga8fwGCdgMNarxS3U8joz2eYyqmF/2uyEvtsl54tcxPoK56ptX0iZFld0WSt76
	UCpT1sAeSH3cWPgZvfv41itDxhJF1FEcVOsdO/1IXl2zgzympFEp4yiknoONtAfoDnXPiTuvvKH
	qwwXTwZi4vhD0Ud7sHcheTgzgg+K7cSOsdItbPfKrv/Wuh3iZeL6HJRZb4V+rOqkYjtLAMW+TF0
	/o+Vz9ilAnLNbMvw7ApNjCOl4D7zZa0AZnzjqQvduA3dTG1LL+yZpbvh+T+GoKLQ9QI/f+s+d6A
	mK/XW+vAHTxiRzv3ZZZgAvVwcoT2BpN5DtqDH0xZEVlUVKG08T6nduYfJRPzEVlt0FfQ=
X-Received: by 2002:ac8:7c4b:0:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4ffb47e2d4bmr22185791cf.1.1767785347995;
        Wed, 07 Jan 2026 03:29:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYgZdo8iwXTOCIW3E2J4dEnpnotNVTj21lWXc2ad8NivOuU76cYXL83C6hJVc9tz96g+r+TA==
X-Received: by 2002:ac8:7c4b:0:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4ffb47e2d4bmr22185671cf.1.1767785347623;
        Wed, 07 Jan 2026 03:29:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf65c07sm4444854a12.23.2026.01.07.03.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 03:29:07 -0800 (PST)
Message-ID: <73bcf4c8-3d49-4b55-a771-0c5c1ef54380@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 12:29:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: agatti: Address Gunyah memory
 alignment needs
To: Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
 <20251229071258.456254-2-sumit.garg@kernel.org>
 <ahbbg3pffedrjzvksgz2jv7lwajwlcxc6nsmmtunwc4346eawa@xayff4ozvdbn>
 <aVtQHftDmENIAxrb@sumit-xelite>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aVtQHftDmENIAxrb@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XpL3+FF9 c=1 sm=1 tr=0 ts=695e4384 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=L4FEu4VOam2RnATWhIUA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: vuwdF5lAoHtUiid4R1IuvEkyjm9A9U03
X-Proofpoint-GUID: vuwdF5lAoHtUiid4R1IuvEkyjm9A9U03
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MiBTYWx0ZWRfX3pvryeQjfFTH
 ZZLY8LS61EgVShmuvpqwb1KCX8kI/GyVCaq2caciYRpBdaBMDybAYYpHd2Rv0mpXBxI03dxs7K5
 PscpE70zpGjgmLtwjNyR1t3IkXNz/GQCpnmZReVwrxgv4qpZ4T0R9/NWtH1KwvYZKq51Z+jUKmn
 WZoyaTLzPwXQm0kzXLhqHscmjYKaQJhedZSj0b7IDGkFHVdObJn2dwrn9n6Nhbk4BbWlnEw0LPU
 ZQ9+pEfKfd5SJS35e4BuhGRDsWKax4ESXbm9aeL4iJ2W0xpjR4sh22uJlKkV0LDwvSnmbok5K5Y
 gKzj6v6qpY0paV51wKhJq3bBWKBrUrlHRVinzTs08bikqyHI+ZcSScDadfMArJ+Jgg+k+Tf4Sed
 iavDB5DfzHuNwRO/O9/rnV1PskyOr/XwNfmB3dIzUvpH4g1MH79i/w8sY8I1fBb+umjBKs4UxNC
 VYg9PU4UAuihoV5XS9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070092

On 1/5/26 6:46 AM, Sumit Garg wrote:
> On Sat, Jan 03, 2026 at 09:49:04AM -0600, Bjorn Andersson wrote:
>> On Mon, Dec 29, 2025 at 12:42:58PM +0530, Sumit Garg wrote:
>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>
>>> Gunyah hypervisor requires it's memory start address to be 2MB aligned.
>>> So the address map for Agatti is updated to incorporate that requirement.
>>> This should be a backwards compatible DT change which should work with
>>> legacy QHEE based firmware stack too.
>>>
>>
>> How come this isn't conveyed to the operating system using the UEFI
>> memory map?
>>
> 
> I agree that with EFI boot, the information is getting conveyed via EFI
> memory map. But there will be non-EFI boot scenarios as well in case of
> U-Boot. And moreover I suppose we need to keep the reserved memory
> ranges in DT updated to reflect the actual memory map.

Can U-Boot not do the same by altering /reserved-memory or /memory/reg?

Konrad

