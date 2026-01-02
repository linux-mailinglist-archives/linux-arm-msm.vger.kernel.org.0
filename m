Return-Path: <linux-arm-msm+bounces-87170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C1DCEE038
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 09:23:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EE5B3004D18
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 08:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4B02D0C7E;
	Fri,  2 Jan 2026 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xn47xScO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AQ97Wwbn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1547B2D061D
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 08:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767342226; cv=none; b=kx6Uapl2AjTr2NMbg1pIb/gsS7pCGTszr2l3AvZIvSsIYk5lo04sIDFif1QDv75At3+IicIq8mOiKgNjeosZug0XiLCmRqkzT6OO71HANNMReP+6RkOpErd1piU5y43BJZYUvMp7S2mfp/mDx5PhhuljRhKF9hev7Z2CnVsXp/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767342226; c=relaxed/simple;
	bh=5+LsnwH8Hhj8QpJaydOA1DdFzaIysrTX2p1YgoGdMbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WrktEzgX0VbNLcdlt+aich5xv6lYb0iDWh3qfSXmZ5uLOk/14JPqC9AsOeL82nTfniBH7L/kRUu6+ZMLSjbcs+fgdIFEPIMMpsSB7497jxeu3gPEAT9NDtI8SEtMIsFW1BH9kD4HR68H2siXXxqgQrvTu85+eLlXdOb+zj8CDVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xn47xScO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQ97Wwbn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60288RVt2138958
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 08:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t19VCHyA+6puRXgRu5jbgBfiRPrElHIT/LgwB7H22yE=; b=Xn47xScOse4BaMa4
	3eH7/6BvMQ8R6J/7Gg1uBR90aEyXUq6qGDaqYfjIVj9HpVDRdA7Ga3I7anvvXfCA
	/MMXARWayfhQUimWgz0NTx0agEjX1TdJ51X1lIMVaoplDgfjS6ubXn531rp4iv5l
	tp0RegtXfAE3QDFRatuGhcWTt4EHywUPXUY8mcZbNUerY1qmjNk9IRlAEqAyXFTW
	4zqyU9aBHmg+oHs9VoT38unhWVA8mp1sk22AIy5gqUWTts/RGH+1lxmEHbaEVEcD
	TYRrAkz+IzkTuxZ2Z93+enFNXEclHjxGKZEToNH7YyogQUIoOfyL5htJDfDZ/99L
	burjCw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bdsc9shbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 08:23:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0dabc192eso274816575ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 00:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767342223; x=1767947023; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t19VCHyA+6puRXgRu5jbgBfiRPrElHIT/LgwB7H22yE=;
        b=AQ97WwbnKX5y4JEZGTdEsPM6lkhoxBmMckeok0VlnDSQqfcpaEJer2kc2EyTzG4jFL
         KoE4zJwjI/cFJgnhUqznV5x/52BTZta3lZXOuxMezQHo1eIUgg+j5qx1XjGOPbkexUOU
         0hXpek2PlNVlik5tLhOUXVZ5Omx88OfBSYy7bwN1t3kTcMC1fndkeiTE2rT4NLDJDVr5
         QrCkdCcOQ6W+FbTcj+uFbSwN0IR93DHk7t2XtQLr+2/fHkKHx6/OOKTgwBRXZPJZR3Vp
         UlvktfTR3/6lJvh4o+g3TpTR1bUnNPuA0bMMiYjmx5G5eHVE17ei4Jiy8Tlj05w8yZy6
         l6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767342223; x=1767947023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t19VCHyA+6puRXgRu5jbgBfiRPrElHIT/LgwB7H22yE=;
        b=AsGqVjFTnyZekGo7u4kqZApoSGCTbSE+qPYEJyTVYDFZ684kdkUnh/Za7RA4GQt8vp
         Bh1pB3qZ7XqetWzrjKuxzytvY/TxdkVh2Dn+p40B69A/9+tm0v5gt5k6XZyGDkus44jA
         mIBttLkO4QXf0//WjoeFFsn+m4cngFQIsCFmO0PMoEysiMQP7gAZqivjYGxwyFR2eqd3
         0eeOkfQVMnwMfGcTSLoiCHOV739JN4qwEWGjy0W3fr/8neUSYqbR/KuLSiBueiv1sc1J
         isQLWbHuRxRXIKdjb5Qmh9gxR/lRmaWm0LnX/Xormh6772goFijLdD69V4Hgq1vYN73+
         R0RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfZG/OFeIaGfUSPkZLWc6sNoPDqiBCP5kt6AEqA2a2KZtKmCSR+1YkovQo7WN6tw90whwRK6HrKYHXAGAw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7iLFtQOQjNqTK6LEGpQznCR+P7OyKzenkRa+N0qu2Fx2n4zJN
	rvMAqsXMJMAfDwslKFxnwU1fNK4BkYtdW+Xq4HIKZ69NBuau0mLqVGe0zOpPX8sqWtgvaxnZv7y
	hOJVo1LsmQM/HgowqLKDpkFDhYR3lJ1uKf29vXB3ENNWSO7a9LkJLrnyTwXONGz4CP8/I
X-Gm-Gg: AY/fxX7dISApiUZK1LrV2d3n9V3bk1bXTCFCG9zgnsKjaXzO9RogWcTZANoH9MbkkM3
	eTtR4OizIlWYNcR4/gNzYsMIwyaEnA2L/7qx42Q9jK2RNs9F+xiLWsD4p4gpnmhQM9Novadc2Lt
	5kIp/KC+aKuE2MFon0ehQsaY4AvHfzb9reB3RDPcUlC4yAKXzVCAEKSCE3ZyfQrNAuCavai+kR9
	QGvu48dp4rxks7Bm0X/zrkKtWRGFWO/jYDnMf5lD/ebWW6l0cBzxFXSeNvvhiyGLqVEigLRcNNr
	/Nb6AkjUJNu+RZums81vmVQ5rEXTTmEp+WvLKvoiKplmE0LoyRf6Ej7BykBOEWZJmwisjrl/tyh
	e7TV0YOUXExrfM+yJxNKcogkj2Yp9BecFdS2t
X-Received: by 2002:a17:903:2306:b0:295:fe17:83e with SMTP id d9443c01a7336-2a2f221ed26mr358798985ad.19.1767342223296;
        Fri, 02 Jan 2026 00:23:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOi+SxzktmVPKzdXAl+fgvR8EFyDqnt9n30EmQADNghpbS6vilTLEme0CFoPHjOzlb7lzAjg==
X-Received: by 2002:a17:903:2306:b0:295:fe17:83e with SMTP id d9443c01a7336-2a2f221ed26mr358798825ad.19.1767342222783;
        Fri, 02 Jan 2026 00:23:42 -0800 (PST)
Received: from [10.219.57.14] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5ddedsm365065375ad.79.2026.01.02.00.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 00:23:42 -0800 (PST)
Message-ID: <e0ba7db5-a64f-4845-9d12-fe66d1d5d575@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 13:53:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] iommu/arm-smmu-qcom: add actlr settings for mdss on
 Qualcomm platforms
To: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, will@kernel.org,
        robin.murphy@arm.com, joro@8bytes.org,
        Bjorn Andersson <andersson@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20251209052323.1133495-1-bibek.patro@oss.qualcomm.com>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <20251209052323.1133495-1-bibek.patro@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kmkHv3rL1NF6kPsZtbnW_OkIzhnefe57
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA3NyBTYWx0ZWRfX6vVbBgSERX7c
 EMTiT/3AI6HmflSCkcs42AUARoeC0Y6Z6qroSJf4Pg9B32+ikzF0ALP0+O6dzp8AraWwl2NFxe7
 H8xqupSp94WBvYTvz839A+Hww3uTGr+OiLFXRuTZ64k+4qrFcc+1/dEME7t3MDpSNZzS7Y9yq5R
 KWiooDkGLG2tXedPgoz/f8QMn9Snavtx911IYKf502GOOA+D31ARhwNs4qlstt4eBVoGMO0Fvbw
 lANh57e8OkHpgOVn/DttI2lw+gsOLd2e+X+0jC/mBeGQvAo5Q1JISXzxpmLOhNOnLkLtR5MmFRF
 9wnfnvOcDPlg+CuH+4G1dDubKqRxNbL4/RF2VmjcvnwM4bWGKwvb+H9A9ALO5q0CiG4fBmlNBN/
 QN5+KbLtOBGvsgX0ZUwunDY9lQFWmi9dSy8205HBH4Ke8ijfikFi4nfvvCalVi5jglSc2K6dFy2
 2rSriK+FINyiRKkzw+g==
X-Proofpoint-GUID: kmkHv3rL1NF6kPsZtbnW_OkIzhnefe57
X-Authority-Analysis: v=2.4 cv=Hq972kTS c=1 sm=1 tr=0 ts=69578090 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=IbTvDgxCcU_WzWRXJZAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020077

Hi all,

Resurfacing this patch in case it was overlooked due to the holidays and 
Plumbers.
As per Dmitry’s suggestion [1] , I’m sharing the v5 revision, which 
incorporates Bjorn’s feedback on v4.

[1]: 
https://lore.kernel.org/all/CAO9ioeW0fafwRnxvDJ7yHGcQYbgfkfRF1BMTpXpG=8tSKRptdw@mail.gmail.com/#t

Thanks & regards,
Bibek

On 12/9/2025 10:53 AM, bibek.patro@oss.qualcomm.com wrote:
> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> 
> Add ACTLR settings for missing MDSS devices on Qualcomm platforms.
> 
> These are QoS settings and are specific to per SoC thus different
> settings, eg: some have shallow prefetch while others have no
> prefetch.
> 
> Aswell, this prefetch feature is not implemented for all the
> platforms, capturing to those are implemented to the best of my
> knowledge.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
> Changes from V4:
>   1) Change subject prefix to "iommu/arm-smmu-qcom:"
>   based on the changes. -- Bjorn
> https://lore.kernel.org/all/20251202125447.2102658-1-charan.kalla@oss.qualcomm.com/
> 
> Changes from V3:
>   1) Add actlr setting for missing sc8180x & sm6115.
>   2) Improved commit message.
> https://lore.kernel.org/all/20251124171030.323989-1-charan.kalla@oss.qualcomm.com/
> 
> Changes from V2:
>   1) Add actlr settings for all the mdss devices on Qualcomm platforms.
>   2) Improved the commit message that explain why different ACTLR
>      settings
> https://lore.kernel.org/lkml/20251118171822.3539062-1-charan.kalla@oss.qualcomm.com/#t
> 
> Changes from V1:
>    1) Added actlr setting only for MDSS and dropped for fastrpc. --
> konrad
>    2) ACTLR table is updated per alphanumeric order -- konrad
>    https://lore.kernel.org/all/20251105075307.1658329-1-charan.kalla@oss.qualcomm.com/
> 
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 26 ++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 57c097e87613..c6645df97bbc 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -41,12 +41,38 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>   			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>   	{ .compatible = "qcom,fastrpc",
>   			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> +	{ .compatible = "qcom,qcm2290-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>   	{ .compatible = "qcom,sc7280-mdss",
>   			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>   	{ .compatible = "qcom,sc7280-venus",
>   			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sc8180x-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sc8280xp-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm6115-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm6125-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm6350-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm8150-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm8250-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm8350-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm8450-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>   	{ .compatible = "qcom,sm8550-mdss",
>   			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> +	{ .compatible = "qcom,sm8650-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> +	{ .compatible = "qcom,sm8750-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> +	{ .compatible = "qcom,x1e80100-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>   	{ }
>   };
>   


