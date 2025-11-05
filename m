Return-Path: <linux-arm-msm+bounces-80418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF88AC34BB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 10:17:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB68618865EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 09:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E883E2FD7BA;
	Wed,  5 Nov 2025 09:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IpLjVI8G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PIBARwtY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289172FD7CA
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762334083; cv=none; b=TYMyrw2ctar5tCY/yG6UQEz3VpJCmk2KXxUS1+3JS7i/3vqwaXxLyb2AFAhdpvEkukMUFl8hpcTBT0EQqnEvOT4X96GK6AtbbXWFZBx46ND6EdL3wgmKuth8VLhTdcHd6jru8Ips9UHqYWacelGs2+TlQKZrNG/+/4OyZJx/h6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762334083; c=relaxed/simple;
	bh=/f6gnPiDQVtkReGCpJUIX4l9kppjz5w+Ypzn6fBJGf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SkXLw5ao47Wt9X+PGxPgkG8LA89j/Z8EueT6669uD1fyqSqhZHMXemUV9P4KUXwXOjFJvsksH0lDbvXwfB7MCKbj7Hl/mYAzHbKgPdJ4IyAf3Dl1VFpkISQbcJ+g5GXseRYszIunq4PqqBr5kd/khtyxDwphb+TGMNBwcjkhjtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IpLjVI8G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PIBARwtY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A54ZPbr4058160
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 09:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zB4b3sxSbheBbYOZ0Cg6VV5suwUnxR1Yw3auDzIvZZ0=; b=IpLjVI8GlPRF17Za
	O7tBG1lFcNCsHn51PdUDeedvuu/9c2CLlvdcE/knaIfIGIXhHjrP78xQ/F8KXCOM
	NoFgnrJTXncR+jRs5DxdvY8zbm/GEnwahoOQbBQPbLGClndwEwlpp4inbAhp2uaQ
	5IYHfJkq2I5k2BiioF/A2/HnOfSYhn0G+vI6cAc5nIQF9BMGiieHiwSdiSN74yIw
	BDwY3Gc30Sr9gkQZxx0Zn6iyw82MM5BBfkbDFB31JgPRrjoThzThGvsB6VqGvi7x
	I+EprkI6CqAkyxbiJLbsmkog2BSG6FahM8N2v51IQ+JeBw7CrA3SVBU/zj/E2bMO
	vaxtrw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7yp60q2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 09:14:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8934ae68aso27611111cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 01:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762334080; x=1762938880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zB4b3sxSbheBbYOZ0Cg6VV5suwUnxR1Yw3auDzIvZZ0=;
        b=PIBARwtY6RZPoU5kF889r64DB6tLqfUoC2NZl1Eabk3bYf/CjRV69aZeipyJKZJCrB
         Q5VhN7DZWaPThxN39vpN7ZsRceF+d+BqLiD5Gl+GTeoiKwZSQGne3v6l3xH1IR0EsJoo
         So/KFiMVFBbXj3utRg0ZdqjlCXgLRff23vMwhQei7EjMnXpGzc+fLTPLnWFLXglRDEt/
         lb0zJDux4OnYV1yKNqOLBREslVSWHS7go66fWWIPnhjeQ6pyE5qfZTRguc8Um1R+/9aS
         FBXOlZ+LZwXyRXykz1k7gjx3+JuH6lIuIBs1i1EcuoU6mOaLXokFfE8rkVII+iqlT4cD
         btlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762334080; x=1762938880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zB4b3sxSbheBbYOZ0Cg6VV5suwUnxR1Yw3auDzIvZZ0=;
        b=e//hrVPTg5en/FldXCu/sfsDtXz/x6mXKlGDRbZgXGKpZIyzt363fONzUXMCkGFjyw
         5PI81wwneJ+G1TO9nOsdnVv0P5s+Nxu20yNB9FSD/XRFV2M0jHv/4lQuzEp/ySdD4rtc
         RnqdoN7dSsKUNSqq7q2aBMHPfMqsCQ/s8//+i0rx0xXd4Vfw+aCd73LG5WbUs7LXHlcv
         QKnRS8FhIFqY5i87lIUQ5xOKvIIyliBuocqbCAp+dMm1fYUsLmK9y+3MjGqZr7lOoV4m
         Vu6Sg5xcPuNMgoORSaTDZifgwdubQW+IgXENQzSRcX0cNOthKHC2wzfu58ib+auCfWCw
         beRA==
X-Forwarded-Encrypted: i=1; AJvYcCV4iQAG36SnBR2CIqP74yVOnOWfcVFDn+GaPFR9NUMZNUek194Sr/xjyPAIn0gJxinCYaK0oCkW1Dw5XeGx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1GwDPVIbhg+vCcjEx/xkejNjnBivWeJJiWFzIvxWSiKEUEFUA
	UrJtizPs+DUtKFtIY4aQZ9YQKcFlAU61YbqERysMnUEeVqymS8BxWsysZJmCXqJloZGcsoIToPI
	7DhgbpcDGhcn256hNDNTb9nJlql92IdhCVb08Dk6KTYnYxXEjr4ZFV5DeV9g2PBp6uAVm
X-Gm-Gg: ASbGncvW3Xar8jAF4PtPxtm4kyy5M26rePmA7F8WHsKsJAJ3L9eo9DuZcL5lQOrSHe2
	MC/ExeX0PXdLe74rdXuETKK2K2b6mqVKRDoS6bI27CYLwqemDwI0dePh3anvv9NP86qOatY7JKe
	jqs1EVWD5WCxoKp6axfZ5lIRJ7kBw26Ej8ypSDx4LURjqpEvuVSe9z03Qoc/8wRw4IZR0YXZ1Fl
	/ZPn4kAdMc9hhZ9++0E+xER5pzGAdGMolTv2qyv481tgf7DYxCYKNDrv0/ddi5Cj6ib9gAivuez
	Qu3L1nM4J94SLR2/uwzQuKKNZO2vrtLecnqlh+q28GzNGg0kKgrC2W19QrvA/9lEY04NNo3J24v
	k6zR6mdMhumQLSR+Arv2Hyz3mugfZCzLQQLbXKPJd7HCB+/0KkQ4uLhvq
X-Received: by 2002:a05:622a:306:b0:4ed:70bd:d9e2 with SMTP id d75a77b69052e-4ed71b0c0bemr20671641cf.0.1762334080444;
        Wed, 05 Nov 2025 01:14:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmtSI3CAHA+k1D8XrOBNP1lVPWy2EaQ/BbbivT/VBaf8u+Sr4kLRQ8RzgcFfgQj/lftw8C6Q==
X-Received: by 2002:a05:622a:306:b0:4ed:70bd:d9e2 with SMTP id d75a77b69052e-4ed71b0c0bemr20671501cf.0.1762334079984;
        Wed, 05 Nov 2025 01:14:39 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723f6e06e2sm456019866b.40.2025.11.05.01.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 01:14:39 -0800 (PST)
Message-ID: <eb596f7a-e13b-4edd-8ee7-05424ea3d9e5@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 10:14:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: add actlr settings for mdss and fastrpc
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, dmitry.baryshkov@oss.qualcomm.com
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251105075307.1658329-1-charan.kalla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251105075307.1658329-1-charan.kalla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kgamZFrmfwH0027kJ2MIcDTpGneKnHPN
X-Proofpoint-ORIG-GUID: kgamZFrmfwH0027kJ2MIcDTpGneKnHPN
X-Authority-Analysis: v=2.4 cv=TsrrRTXh c=1 sm=1 tr=0 ts=690b1581 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LtfW4vqWST33oogqdjEA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA2OCBTYWx0ZWRfX4+WHK4tHL/aY
 xVN+e1kIYrzs1zfSp9f6pmStzYkbkrqlZmxkEcHBH4A2xOLTDSdtzl1E6OJCASzTdhgDtcpSgWu
 tK1pxIWRCexjPWxNxmBAdLmjpp2lcvyGhgQrjVCKP5qo+aGafnMxe0Vy4F0THzHN/RrvTPSz/13
 1dxLayLFVVcOOw4UHIbnD5xXA9M0ZQeimYqzRnOiViVw8WgXbM11reiPHcrmLkyCCizTdCXFFa3
 v0wX5hVWBBtE4sGQW46wtL+BYN5f5BpN13WGvQj/Yo3UaGn2ZKylpDRQInTm4EIRxj7GE60EJlJ
 L7ofDW3MM08UCpYMSPg+76WlEC6bI9n3VmVWfOPd80hYLX6wLTfWQK4P3stpZntqfm76GhLQM1q
 zFcoaofkZtlwqzadLN9P11cs75V1Uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050068

On 11/5/25 8:53 AM, Charan Teja Kalla wrote:
> Add ACTLR settings for the device nodes with below compatibility
> and is mainly targeted for sa8775p:

The commit subject should mention it's the lemans MDSS specifically
> 1) sa8775p-mdss
> 2) qcom,fastrpc-compute-cb
> 
> As a side note, "qcom,fastrpc" compatibility is already defined but that
> seems inept as the devices that will be attached to the SMMU is going to
> be with "qcom,fastrpc-compute-cb" compat string.

If you say it's a NOP after all, please split the fastrpc change into
a separate commit explaining the issue and removing the wrong entry

> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index c21a401c71eb..c76f6076f487 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -47,6 +47,10 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>  			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>  	{ .compatible = "qcom,sm8550-mdss",
>  			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> +	{ .compatible = "qcom,sa8775p-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },

This list should be sorted alphanumerically

> +	{ .compatible = "qcom,fastrpc-compute-cb",
> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },

This will be globally applied to all smmu-v2 targets with fastrpc,
starting from MSM8996 ending at Kaanapali and everything inbetween

Are these settings always valid?

Konrad

