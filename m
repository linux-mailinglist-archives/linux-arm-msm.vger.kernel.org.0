Return-Path: <linux-arm-msm+bounces-80977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0CAC46052
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E9E1188539E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 10:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01353002CA;
	Mon, 10 Nov 2025 10:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D/MhN+5F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ceG2CcIf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F621EF0B9
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762771388; cv=none; b=mVsRr+4VbmWPgWCB7oEgIU/iavgS0QLdY/JgxEdqPRqj66WhebQfQPkHjoUnNKGA8X4dc89urTNxtP85fmasbmxiKK4fLgNmsBOZ0IDESxuMJyy7EgtsqWKdTIe3MSje0OVB2InGZlNFt3RfJddtJGfsd0tvErdPj/vnWe1V6y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762771388; c=relaxed/simple;
	bh=l/d4o3X8P1bYWlrd8hxgMx9JxIkugvcZh3aQV+PLkjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OYtaL1dPtAyP7UQYnZppvFiq+6akzrnX0NN5qj7k07eBBUs42wQGmFlcsvYptFaiRV4RF2CN/H8B7gQep9WtfbEhZjp5TzIpopyRLWj9CGDy7DN0MC0b9PBSOFV4ma+5hs++kwPwdRDX8Vfgwx0dL4FwMpBn1Se5xWdjcXULO58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D/MhN+5F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ceG2CcIf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA6SLKe2407325
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eSqXKqt4w5CGKMXelCEmeHZsf36l7BOGUQpou8ggYx8=; b=D/MhN+5FBDmQwyrk
	yi8sgc/Z54izzyQvKikz3VpJaZAEosoUWlESfrTOsSbpkE7HwWTuuQpmgusrDQdY
	vbqd+7oqP9K97GOyzT3kEazUqnyODoaRT9E72MJDwkFGwZ2zin+TQ9qwcjDrkHPV
	ibm/DiITFTiA+r8bzgysLVaG5o2vtuUyvRMjlhtHXg7MdK2B9QtgOULdaSBwbJMe
	9Oym9tBjAuT4P5MAaq2v+uCtSSmDShgROhL4wpz7zmoqqp2dqr7ND7DOQDkFLR96
	44iX0YOEn3lAkp9LBanGb3QQeUP/80rAHKpjM8pyhpldsDaH2q4eCRBwXuQ2qdM0
	kfm+Tg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abatd8t95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:43:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-295592eb5dbso26268455ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 02:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762771386; x=1763376186; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eSqXKqt4w5CGKMXelCEmeHZsf36l7BOGUQpou8ggYx8=;
        b=ceG2CcIf8uvQQcPAEKfdGoDhgIdALZL2S0OwocMRt3k0FZuSjjdPhlWq8GhhH9LcV6
         lVco9yNe4WIuKzDWbghF00pd9dE/QpibRB4v9L/IYPfBR8CA/NsrKg9pifcen4Rn3wsi
         6KBSbj0DapgQ6hyVjnpYfKqkfAbkcuWn3Y47qkxlBskD8LUCeIg5SjtC+Vgpnw8fgB7f
         e+yjGSqOLn0vgKxEupJXi0YRZcYv1RI5RLEBikYGzRSa4ohuwUaYGPaRnYT2Pi/tFou1
         sljOd/goIfqJPzwc/UXRJ4Gn9CW57e5dg5+jrP8RBQoTGyLqPYvEaDmU0EHqjXM822/C
         JolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762771386; x=1763376186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eSqXKqt4w5CGKMXelCEmeHZsf36l7BOGUQpou8ggYx8=;
        b=h12Y6mCYP8QAL13iySWCDJKUHxodtlRzXwe4fkxybGVT1y/eckZUShB3UadsD2IfwJ
         ELe/AfrZnIKuABTKilmxri1i9by2KpXJPY+QfGCDLtIiHsaW0GULs8K14AHw+bpynTqs
         nu+GAuXFNOhglY1W+6yr2QzMAKKOzaG9JqwKPPVGWoWpeYUbTBlhWhzn1gUkkhf+ZyKE
         s0qq5hGrj4vHJUUXiN6MJvRxkRyHusyStD0LlIjgq9M89/otlBlumqzBYpKcKW16UVbV
         gsDc4foICITdlTPYkw6jx9L0wMjSchs2F17loOyKLecScIaKwPwCgzcew1WNuFvVXuc7
         xGZA==
X-Forwarded-Encrypted: i=1; AJvYcCUNSVXZ83AFNnnOB4fMQ9SP4ySFcmr79AXUCVeDStw7gEazDfu73PpZugmT/ds9fCrBaKZ6p2SREfKNdcpQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwH2T6hFRAQDh+m8HOJRczh1nPtqfnyxSuCrg4wbLmE2J8ejlNv
	FWg91ZTKSbXGiqWGGS1qW3uaRBw9ICkng2vV7K6E0ZgIFRrtArvW03EG/5kPkvXGl/D13QDE6iZ
	9jgcTa9YPFbWIgxsGMzfKTTfP++hcRBOYaAyrpZq6RJK6N8ck6U1u4+rXqcKnzkzR8Evv
X-Gm-Gg: ASbGncuvR4wyydCI762mmZLtnPobqBzu1mKDVgYDXHsJvJliUOGz1MlbAoaFiYZjhbM
	M+yle3G0Tqwix0hpVkvVzQnaGwWhrN0w0oxPaP9MV4ZPUBI1RLPDesa1xb1DD4bYNSXTV2ulozd
	36I5anVzT6zVNxshGilxE2g2kqZ9ePVw1PZH7r5k6olI8L4rDIMAngL1CAXbJmkninWkhiA84me
	J6p9qWFEwwCtzEc+oaH42RKQ9nyyMFrFfFPbMJCWW1+z5uCU7ykybSorTI7aRqIMcvrvRhoOjrx
	gZwkGvlAJ4KOa/TMx/jLFDInkAj9/0fCLoHc1YgPXa7xIzPyYf6ZULKSu+bHkGu11uOrmjY84xw
	qELxr0Y8EQfs8EC+t3C1Tog==
X-Received: by 2002:a17:902:f790:b0:295:9a46:a1d0 with SMTP id d9443c01a7336-297e56df960mr102724305ad.45.1762771385972;
        Mon, 10 Nov 2025 02:43:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEF/4A52+hPm+KGskAyqtu2lioNjT9Bv0FG/S2i/1sn1bpC5Zjl0LIeTPyJfY/iBBpamPtPaQ==
X-Received: by 2002:a17:902:f790:b0:295:9a46:a1d0 with SMTP id d9443c01a7336-297e56df960mr102723845ad.45.1762771385447;
        Mon, 10 Nov 2025 02:43:05 -0800 (PST)
Received: from [10.204.104.20] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297ddde1e7esm82040835ad.77.2025.11.10.02.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 02:43:05 -0800 (PST)
Message-ID: <1d31c371-0b74-4584-9f2b-dafa76197492@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 16:12:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <quic_jiezh@quicinc.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251107-qcs615-spin-2-v2-5-a2d7c4fbf6e6@oss.qualcomm.com>
 <defc450a-1699-4682-a41e-59035bafccbe@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <defc450a-1699-4682-a41e-59035bafccbe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EzB5eHBOGBvS29kzRfD7yUNHAaeH7spy
X-Authority-Analysis: v=2.4 cv=eZowvrEH c=1 sm=1 tr=0 ts=6911c1ba cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=I_p1zpMzltXwdS2KmfMA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: EzB5eHBOGBvS29kzRfD7yUNHAaeH7spy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA5MyBTYWx0ZWRfX9ubUeJirViXE
 LrBptUPDyCwM9Hc/Pr+11y4/BXvJ/NHGGUqW0EJOWZ1/0DWYN6WlX4yqFGc7ctdFAPA+K1pi3dT
 lVXbXW8wk/L7C6iTpMsz85rdm9tPxRgEyso2ddxovtI6ZVogZEGGIzu+ifELrd41J4Rj7WOsmzj
 ZgenXEJ4dclz6wpJZnTp5kX5akYWsF7EmcvoWPwnMxiH0CGQaVMjM/TR+Dinr42MtiDfa1jZ+Mx
 s22/1ZLtIgiID0we8qazExuKsvb01BjvPboIPGAiPs4C48X2zDTNrpl5W6CO4zTnGN9zvv5KmDV
 8/bfuGAXTl0XYZ0kNiFHwNn+E19u3uRBXlDX92jnUGNSEnoNjLtuTQEci8/aisJh7bP/BNVDqXG
 qA0xyWX0dIHz7plb/qlwn8FHh+hbPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100093

On 11/7/2025 2:31 PM, Konrad Dybcio wrote:
> On 11/6/25 9:50 PM, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Add gpu and rgmu nodes for qcs615 chipset.
>>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		rgmu: rgmu@506a000 {
>> +			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
>> +			reg = <0x0 0x0506a000 0x0 0x34000>;
>> +			reg-names = "gmu";
>> +
>> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
>> +				 <&gpucc GPU_CC_CXO_CLK>,
>> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
>> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
> 
> Is this last clock really necessary?

Downstream votes for this. So we are aligning with that.

-Akhil

> 
> Konrad
> 



