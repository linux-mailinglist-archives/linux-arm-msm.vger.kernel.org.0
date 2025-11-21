Return-Path: <linux-arm-msm+bounces-82867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E22EC7A405
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 15:44:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id D12B52E376
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 14:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09134350A1D;
	Fri, 21 Nov 2025 14:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6USKL4+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SY5zXADo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B94F34D90E
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735305; cv=none; b=PODnU/WT59TsOfUlWW+HQVQnDxd99IbzU6qvKzke2qAbMfzd5Koi3UR3mpSlynzfqqwqxNn38VdqG7mhgEt+eDzuw4sm2YwaXtERm2DYgOJ+5B8tyz89Bg2JQ8O7eZY2NLts/v/HwL0kUtVFNZnAKVPpEgp6Zp67zdzqst5ibNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735305; c=relaxed/simple;
	bh=iGPu+yHKYnpDzXDtlaWpzQqdcb2xPICidiPxYTntGIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FBE67XwxxSo3RcNkw5RHY27r3jDj6yFh1IcX2w9hkPBJoHD3PS+4UPlJXUmuzb/EcKQM0RUx67TqBiZPZSr/R0oB+IWrDa+ZJHU5Wq0T/A0+MjHdhTYhfQAwiFxGF4vnSswKEBHCxGPxcVBWA/GXum7gvQhPnlsPw9ugbPMWsB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6USKL4+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SY5zXADo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALC0bcd2756808
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5K5SRumAJrB0iRG20ERiS5RWix6rhVRMy+dUouMmg4g=; b=G6USKL4+tUrS7GeK
	fsX++3gfNKzvTHRHYuKvKviuB6j0IlpxHQDmCR7oZLgijUhXWGebJSeXiQqrOR9O
	pjdmrRBYUjh/NP8OF64xPiyJEKwBcuGx9dntCa2JmoLiyX1ghzwTuNyl3JlwosIH
	hOsIUEd5f9CHxIMjeHnnaa8ER4fbZooisecQJS/NrFxVSx9H5LDAkZmEqPf2a4dM
	rL0z/eFUpGhqKSbJV4CtvJzD0eugSBFjXuXEd9JuZVvmsiQB4BXsmwbgtK8WFqRm
	VkykxlNi0Fa50QRhjJI5VBaBUVZkl3qaF31Bj89y1HlVyVBqe+LMstxFygn+dIzP
	8LpVPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhy61quf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:28:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b21f4ce5a6so33069885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 06:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763735303; x=1764340103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5K5SRumAJrB0iRG20ERiS5RWix6rhVRMy+dUouMmg4g=;
        b=SY5zXADoL05fppSHBWv5IYS2rZjWH8Rax1IsoJFGuUlaa8OYVdtLCGaw9JsQt6E72R
         x5e2kk1gSCSpIUzboFp64zY16aWIeVQKLR5LDE42a7yn424rKD17J2tIf/W8/LfxQ3Lc
         aDbSFf3S63uTDkpKlJMdSmZ11oMeyMoquzg+P+5WqfMkHjqRgQjjpmgiYVegRAg1UvhF
         LYwe1B5hN7m50w8dMkSMHYoQPKKevUemrzVFRmuzKb1md0bskpRLKu8E0UmGfAqnua2d
         bfqj57xOWns9tYkHKpHalIoYhm1VqtLhwqydSVGW6wWTysn3y9Gq/eqb2NaS9ApxOPHa
         cL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763735303; x=1764340103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5K5SRumAJrB0iRG20ERiS5RWix6rhVRMy+dUouMmg4g=;
        b=s/KsJAAsUM0Hhn9ap/gKIPbo3ToMM80T7aVETdySBZGEV1vXZ2YC6mNAr3npu/CKWk
         qCJbLnYUTBx8w9lUuNPKBjq9Jt4D6Pnsf7iSoJ+jgKQetowV51Ep4KFCvonAv9AZISdC
         n+LN4cCTy72jb4I9KeMbNERHpnf/fFbxeFpOvyeVB3eOWXMvEYH7iBSzONUYQsH0/VKh
         dk6ig53PM3w5uPqHuGlzE1srO4e/KmNnA2ixJhzizTeCBA2HeUkahvRw7pXam1g4ITG9
         9lDjInP3Vwsxux2kEDXObXZrtU6/ZE+AgqbVm7+7Z2/Eb2WSEYlcNH1aPIK63qPjQJUf
         kCRA==
X-Gm-Message-State: AOJu0Yw70Ldc3F1I0rRCfWHx08mNft9CNYzCRvo+fiwiif6v5x5MsIMk
	/WgxdbRMSdZVgszg+y80nu69Z6BQgLrnMSPzy9gRVFpaH0TSayofAxS/Kxa8axy+wCkv8yiEY9S
	FumipwdxaQDMN8L755MGqQEebfkvGjBLrGpHU9+fPgrOTFtz/hWCs6kVtm706FoCt1fHL
X-Gm-Gg: ASbGncu/aLe6F83+m4mMAaEmaLuTLVL0r/ouksZ6Rq1VV4y5XtcxwAu4wHEgEicObVz
	caneebi/n7tFxOv46a3EKd4oj780Itm5xfRVAURpsgz7I5O3Mn+gk+K/LIfCogMv7esoig5A6rH
	IMl+GGQ+/s/rX0msb3RRAdinN63eTARZ4GhZ6U3d8foPyf0cDC454EQSrY4ok8qUAo7AYIKUJBZ
	+s7alBH9WUeEmrWW0RFdtO0tjRtCLES0aS0iwNHBn50qVEW6tZGZ7XYPsCZbELehVswppzJmOpS
	Mhoz+39lHVsBvl18fs3zymIb6BbQR+/+nlxF1ZLJUd02bPo2pFnETXWyo/W5pZLGw350iB8nqQH
	N4d9ZaBIendZS/XqRixJXcE29wWZWg2haPy4mxMB2my/rXFJcpYJHKdd4L52rOfQ5MmM=
X-Received: by 2002:a05:620a:1aa1:b0:8b2:ddd3:adae with SMTP id af79cd13be357-8b33cfc6cd2mr198062185a.0.1763735302545;
        Fri, 21 Nov 2025 06:28:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtPv1RIHH133fUxhbb5eKXKSklczMTYQlSQEAg6JCksgzSAciPqOMlITjDcBsuK8vE72yasA==
X-Received: by 2002:a05:620a:1aa1:b0:8b2:ddd3:adae with SMTP id af79cd13be357-8b33cfc6cd2mr198058685a.0.1763735301980;
        Fri, 21 Nov 2025 06:28:21 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b765f840a30sm324380666b.58.2025.11.21.06.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 06:28:21 -0800 (PST)
Message-ID: <78c5ab7c-6100-46c0-8315-f239680fee3f@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 15:28:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] ARM: dts: qcom: msm8960: expressatt: Add
 Accelerometer
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121-expressatt_nfc_accel_magn_light-v2-0-54ce493cc6cf@gmail.com>
 <20251121-expressatt_nfc_accel_magn_light-v2-5-54ce493cc6cf@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-expressatt_nfc_accel_magn_light-v2-5-54ce493cc6cf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Lb0xKzfi c=1 sm=1 tr=0 ts=69207707 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=INxY3ozUAYpN26jWuhcA:9 a=QEXdDO2ut3YA:10 a=p80W13QwkFgA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: kPCpjOXYS7Nwvk8GJgncWAn36DV0C6-5
X-Proofpoint-GUID: kPCpjOXYS7Nwvk8GJgncWAn36DV0C6-5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEwNSBTYWx0ZWRfX+6W3AZk8yTa7
 Dks75y7MmpFVJ105xeCQ1xjxZPmFXvFtRGaNEEe5oAiFRWuPZR8eCrp9YcXdiVzB99ys5iVyNht
 1MA3ev735wxqzt3Hzan7VfUKDwRVrCLEtUsQ95CRpxQcatS84bY2rOky0xW6eYEVU5/zdEhAoiF
 gjaM7brZ25IkftOQmxt+Mi4MJJHkTMMgVYthHFQCuRuUcas8r1SRkhyj6jMqshecoNmeAIY8saX
 w32dpOwqx2Zb/CQq2050zYv4a5nYzoNtMrdYXiuR4enFK4U9mIwuP+ddG8EaSj/ow+qLNopcFby
 W3ocpes7zJwuLarVPGuoO1kDT7zYvl7EVXmdF301o3LcTmk68rkwD6Go3tnuPuHlpZYZIEo7rT4
 +KthetjMYBXZ5qJ21vPAcSSXnpY6Xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210105

On 11/21/25 12:44 PM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add the Bosch Accelerometer. Mount Matrix is left as a TODO.
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

