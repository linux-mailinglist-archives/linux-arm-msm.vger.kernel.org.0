Return-Path: <linux-arm-msm+bounces-81285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 40845C4E481
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 15:04:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D8E634E3C3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 14:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD3B30AAC1;
	Tue, 11 Nov 2025 14:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hf+dU4YR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="emR6qel7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E842A306B39
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 14:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762869763; cv=none; b=Njlz6kQPZTqMUgESrgRBOqcGIcqgG5HlMW4A98QfXlqE72GfowX8x+/EA2+nUyrWEkBj7+QZZj7SWFcadaZmkJK0vo3lWwbbTsZ1nJ4HR7XilDaG2DOwWauCqDlpLbIExyaFuy+ndGM25bNp4ysbd4IJsNRlrmXhNZsdCMD72oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762869763; c=relaxed/simple;
	bh=3zBadCHd+/KC7ZT3xoUIUn7dtJivjsgHW8BdJhLYvtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VtKfbEa15LrARlpvOfS65qB0Qrz4ZCf7yA/QDTU7tfoxkWkzkfnVyZjP3CzHgRdSvib1yZ1eCpTpRocotYvj++p7fGFFBfsJXPBI9EhqE11peIuqGgzK/+1NmqO0g2PkFjIT4yFsY+Aes2BfwP10a2IrFcjq858pK7djXD/Pi4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hf+dU4YR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=emR6qel7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGYll2231957
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 14:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJWfgwNrtdyvBnMHITe3KIM5EMQeUThouMLka/eC6JE=; b=Hf+dU4YRLIcNKlJ2
	gsE2oqcvGqftfY55dYlz2tvEImqUMg+zak1iZQw0gFeTs24slS4jAFe6jb8f8+s3
	G/bJSaTa8zUmXad5g3x02ijwM289tY6YlMfeaalZxvaNKGl5P4BpkkPOZ7VJtzMs
	itGgCaNkaiHDoIrhUakom2LYrr/timiYMyFOOcvpgbt14f+xBXvlTkD6M4Jn4zyL
	a0+7M+Qs5gFTZLTR4x7omxmi6jhI/j6dWkLerdIpheuOA4yMwSZtqUSqEpYJufR0
	ckkMop/c7WlX09PYtktzACIcslNqrIZEk7hrsbIsryTI6WvIxtWBYAt6x099Zx2n
	Se3/0w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abkwsb6ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 14:02:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2958c80fcabso114168995ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 06:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762869760; x=1763474560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AJWfgwNrtdyvBnMHITe3KIM5EMQeUThouMLka/eC6JE=;
        b=emR6qel7VVWnIURrX7J4nd2wKVUtkaUflaQ2QOw053ycVoyu+Vm98ng+mU1F4htMxm
         do8AFGmK/Skaz5tA18N3Th7iLMa4d8PVa9h3sCIVW5eMIFbL/gAKJ9AKeoOSgRakHMjf
         DYry3F5uGfOiRlEDL9d3FVaS7W/ZJPh4Zyn6qbfzVVEeU4/wg0L3Pbf+Bm7+NMygaTa7
         ZjotTURV35NbmOW0PhXACQripAczDlwf+bJ5mUeoEoUI/QXRk4C1XuzQZrYqdMNmPEHM
         R5YimNc3rTdLdgDkXyjHQFdyfsYivXLdcTKOG6fLeAM2/sSsDV+oXH1Nmp0Xzoqyv8Js
         IbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762869760; x=1763474560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJWfgwNrtdyvBnMHITe3KIM5EMQeUThouMLka/eC6JE=;
        b=X4R2FmikU2HMiqeCClhOH2QIiCTFZ/D+44U5eXIBloX09jB0fZo4DyPl5gr38/jPfi
         YfNt241l55Kx8giA6AKj1qVQ7l4s96oGgjZm6blqahzyGHwryorkJkVFks/ll9uB6oId
         iZh4UVRJ44uZYDSa6S4x/gGW5hiKzHO5iodBhtEalMRlOJ1s/VfZRIogLy5KSWddQwJ7
         Osdc+mS+uamLWoUrxZjjjSGr+RLXVXnkC2JqQGKecX8OQN/SOLkIZ+JKYosQhxj3FUbb
         VBX/iowp5zU2AnZ1RNH/5HTkkJvNTRmVQD+JXdqW2BCd8oGXElx3V0pfclywI59IwwZB
         4nVA==
X-Forwarded-Encrypted: i=1; AJvYcCXS1GAecb9qk4lPmgkNxDLu7tj3P26yAhQECByYnWromplmn0AIzTCTV9sVlXUzaKz+EW4XPSnd1pqEmZDJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxmunmJvZgk/CO2BEXGtLey5CBfzqtWQja7o8KxKXolCy0/pmF0
	VxRmKyodWk+U2OFokjX1vy9AubZkwpCrxpw+ItasXT/fmjH2wTMz32UgOfgIVx9sKbMmHBQ0u+b
	0+2uza8JwmnYpLzDID6mEU2RcbpNQ4GrwU7g2GP8mmYoHFI4HoRD4HroycKFtgoNSGjia
X-Gm-Gg: ASbGncvS2lBusRk6EdNfsBTgt4RWQYyP/FT0EY3FPNMZ+wNdyJShO/cGln3t5qDWfEt
	UuSLerIWdEJMUdVnkauq3BzXRZDE3P3sdQ2vP/08qFHcp7aHY48cDrmPDp67Ym6ZZYovFyoCMi5
	uqRT/S1QoV+ekzKx4+2IbdMGXLm2Vk9A8RPpyeMFLSVpFxG1EWAem5VE9gLHAJWNUNAtSvXbAgF
	RY+oXrA1Yg2XO9tCzGniYhv1qY83G4H+DHkrOWSOxD2dVYWP1nvUdpSNsQU3UV0jukxDiucW1Aa
	AYAGse3ab7uvtsjmw/z/RW6CqPwMvWOAU5rENG21bbtP6cR2CKHCy6gT6gtNpgP74XSob8MkKmW
	a1SnHsuYuPPI1/pluBeytgXkMeq4=
X-Received: by 2002:a17:903:2f8e:b0:296:4d61:6cdb with SMTP id d9443c01a7336-297e5655113mr148629085ad.27.1762869758182;
        Tue, 11 Nov 2025 06:02:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiZPxmew9Sypb7WTasJeWopHkpr+MEmcvloHkOX1op3HrOtm8qCTT3mhOislac4qaeDoTYnQ==
X-Received: by 2002:a17:903:2f8e:b0:296:4d61:6cdb with SMTP id d9443c01a7336-297e5655113mr148628355ad.27.1762869757396;
        Tue, 11 Nov 2025 06:02:37 -0800 (PST)
Received: from [10.219.56.14] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9ff848bsm15461660b3a.29.2025.11.11.06.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 06:02:36 -0800 (PST)
Message-ID: <c4b1df46-e4b6-4d95-971c-7aaf33bd35f1@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 19:32:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: add actlr settings for mdss and fastrpc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, dmitry.baryshkov@oss.qualcomm.com
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bibek.patro@oss.qualcomm.com
References: <20251105075307.1658329-1-charan.kalla@oss.qualcomm.com>
 <eb596f7a-e13b-4edd-8ee7-05424ea3d9e5@oss.qualcomm.com>
Content-Language: en-US
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
In-Reply-To: <eb596f7a-e13b-4edd-8ee7-05424ea3d9e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDExMyBTYWx0ZWRfX+MjNDS0qAVQt
 ePc54nX22fMq1MffK3eMaO+9doWOL4rGDxJ6Vy11ska8AhVz1yEZrxQPjKd7lMkPW1nzLrww1Hp
 BR8EH46V4HSDxH9kAJpQA3ngiTzLOThedvAQZ9Lz2wyEyIGH3iDGjjyF8YVa9Hp8PiGldqRQZDA
 w5/UAhIMzTy8ucvGlOjhzrHgLH73XF+Of4t5ylMrveJ128JTr82E9qMO+mgeG77gRVzvGhzSDzq
 l8F1U20QJx6DaAXqgkNpIh1kEcJq3z4MPEc2jDTlGP841NtYquMXZS/jR7pyexUWVV3KtlDrIkK
 Q0kIwTp98tPWp04s9TSFT3uRrshoTkeAHuUZkkWZQOmxMu/zvUGKeQZRpHxQAHdQMSz5o0ndQNj
 e4CkYk0YHDo6waG51hAxEib3sgtkjQ==
X-Authority-Analysis: v=2.4 cv=Vosuwu2n c=1 sm=1 tr=0 ts=69134200 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=K3xFcsKITfcsgejFPk0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: TR3GvKOYXfSt2yy4HeU1Q_R5GmLv04zb
X-Proofpoint-ORIG-GUID: TR3GvKOYXfSt2yy4HeU1Q_R5GmLv04zb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511110113



On 11/5/2025 2:44 PM, Konrad Dybcio wrote:
>> +	{ .compatible = "qcom,fastrpc-compute-cb",
>> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> This will be globally applied to all smmu-v2 targets with fastrpc,
> starting from MSM8996 ending at Kaanapali and everything inbetween
> 
> Are these settings always valid?
Oops, you are correct...this settings are not always applicable it seems.

Example: lpass compute and cdsp compute node uses the
"qcom,fastrpc-compute-cb", but it is for the later that ACTLR settings
are valid.

Then for these cases, should we be extending the actlr match array with
additional compatible string and then add them in all the device nodes
that require actlr setting? example:

@@ -3119,7 +3119,8 @@ fastrpc {
      compute-cb@1 {
-         compatible = "qcom,fastrpc-compute-cb";
+         compatible = "qcom,fastrpc-compute-cb",
+                      "qcom,fastrpc-compute-cb-actlr";


--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -49,7 +49,7 @@ static const struct of_device_id
qcom_smmu_actlr_client_of_match[] = {
+       { .compatible = "qcom,fastrpc-compute-cb-actlr",
                        .data = (const void *) (PREFETCH_DEEP | CPRE |
CMTLB) },
        { }


or any other better way, please lmk.

Thanks,
Charan



