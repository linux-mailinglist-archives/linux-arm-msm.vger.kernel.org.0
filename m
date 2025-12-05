Return-Path: <linux-arm-msm+bounces-84483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A782DCA7C89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 14:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D06F300A34A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 13:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F5C2F6907;
	Fri,  5 Dec 2025 13:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EpOL5MBy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cD4wueGb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411DD320A0D
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764941925; cv=none; b=i8nZ/Va4jLcyGNMBomQ1LS8O/obI8LoRqkCn9AfHFy2wclkI+18Hd/QzQcQQno7oWccXWnH3yhFtCgtcu/TDx9mDN8XwGH14VyQA+GT8SWtPkWoZgwryvKH/eKnBG/2uqBgoFEu9OZEo6TwQHZieym8xrRLRSr6k8qq7jQVB6W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764941925; c=relaxed/simple;
	bh=sBcOslpNAjhd6z2z+m80mBFdSUn/RE4DONIPfmuaDVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EACzgjg1CJiwNoGzb8OT7KHmDQBpUcidsF5uW4N/j+GOFg+d7LerDmYaXrPB1YIKAOY5v+LM2KThCrB6xKMkfat1Lb12kioLV5ycR0teDxQVWQWP4dLYey/Ig2mI5Jg7rCBM9WREDlainr8cD5EvD16NnrO9KYImsl4IZ7LaPgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EpOL5MBy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cD4wueGb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5AiL0v3135729
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 13:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nHjHcUcpbDPcu42f9fAzjin0mYkBgXYv8fj2EHzGDfo=; b=EpOL5MByICEk0tuB
	4ZZDm/bGhp+jVum5iJ0D57NRGq5zIx3Xnp1vAFOfnSpPl6fdd9hDiCl6Mv6qpdyk
	FQtj4YjtcTnmnCImNHaKA7ARRELmeXBlEApjWnqxZjr/GwTkfAlHaSDG+Lonyu5+
	imlMSZz6GH6iOwbTrv8CV8YgyGaoj82Qdk97bEjjWJn+vYWHNtPQilsLlkR6khs0
	yVqpccUocQUsQb2d9ivAnCkTthB7kxRpxfsoXmoQNiHGv8wQ6jBOC/VuDsELp8a8
	zKaVXGNwhDPOGg38b4CG9Xy7ZEIeFJg7lmMz15avMB7SZESOE/d7PjT92DF7MX+j
	PNO4JA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aupa8srt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 13:38:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b10c2ea0b5so68079585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 05:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764941918; x=1765546718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nHjHcUcpbDPcu42f9fAzjin0mYkBgXYv8fj2EHzGDfo=;
        b=cD4wueGbAZ8BSAyNuRvhT9EoRvblbn4vIJTVnj3y+lJThOKkurrX6xrNLerIqhfrDI
         VLIoZssYyN4VIcrNdKXJf04CENc50F7IYxurq60TfHy+NPT7AFYSKVJ/ncBEU40NeH0C
         jmPHmOuR/fE+hh+5IOExxy/bxInzA/XnolnelDww6ZWgE/oWD3i+WTOFvg/WEhIRg79e
         ZFGNVsDfjfTbBh8sel82OuAtYWuYgAY/jww7OIadIDMLJ2wti2z7vVPCFqJHvCUtnc2H
         O+XWtctZ8jnz8PL5RXBvEp8BGFkbsxMfiTX9Yy/TBTjFhlHD3xs9pC+nJNcmsPzEDvpz
         qA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764941918; x=1765546718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHjHcUcpbDPcu42f9fAzjin0mYkBgXYv8fj2EHzGDfo=;
        b=H1kqXVVl1WzAuAkRLAMR9ByYX+kZX0YLDOGzT7f6sWNyQlvzA0qNhWDes5ggUXR0pa
         MzIWUO40inqjY31Z9rqaXAUvnT2YaINSuK9Txu8QzcKeux3ytdQuTArr8zdHPcuBLk7T
         aLulUfG8zb+P4qIUCRgcJxB3m5D+lXhJNCuWimv4fsF0uB7th8b6+VjlRPUASbY8CnW0
         6IhzrsEqQ8xCc5+jtdj5dLqQDTfGqBtIn7ExzQZRi0W3Tfv0v4TUEMB2/VLANY6oF7S8
         D4RlPcu775HmAw3CgCob6wotuSKAP23X6ckp/2S8VTr5Sn1ardHlEVIPuGrM1zKDuYgq
         i2SA==
X-Forwarded-Encrypted: i=1; AJvYcCXo8FRNm7YRMMeXtqrZGD1CVs8A069jNiiRa+C/90QqltmtAYK29Lpxr0XMjYtK9LdfcpTjOBC8IA0UIlu9@vger.kernel.org
X-Gm-Message-State: AOJu0YzY52UrQC+Hv7x1IiAiZ18onL5OBxPp2EBJr6TMdLsHkN4DB2q0
	/H30nY+3l5mGxdj2Hezqr620PBXZIL/p5yiRLgYrj27ADS1KwCkm+WxDkB3Qv8d4ZcDDjvbMzMV
	roneasIfQyyhsih9mXvKCpNIV1X3LBOxBMuewAlyVZ6RHSLTgVcA3LuQUgS5qe9ZJQcPQ
X-Gm-Gg: ASbGncsUrXAcoa3942SylRMRUTxYaOGUfTX5Qwh4Wwm0rHuxkm+GtPv7HZZzoV1JwdS
	XBZjSm39pVDPdy/gq8AEiJZlJ0Mb4uZcf/WSeaeni7VQjrNsG77tCDHlNpKLBZJMnZyikzQouTo
	+di2mLzmywr5opucVnchxdX0EZNM8WYxeNNeTeFl+cnwMJWbEUt/YC9Yiksie1rVSdDa75wkNpA
	JXsUOHkA2lV6PChhOeitModVJv7BWcD1faFHVsg1qXdYUBROKX0oMSggixoWdNkFIfSGErJpnAc
	lDShpYT4whvZWchSv9kzLxz+lRQ04/Rxnuw45OSzKnNeCYvtmsRgRYo0/SmaPDyjR6CVdYAxkM1
	OaIx6S0n+GaJAzIJl/5TKPxlNct9DyQ88VJzewyyW+MneZgOpXzapfdA8BaTIEwQfRQ==
X-Received: by 2002:a05:620a:7009:b0:891:c59a:a9c0 with SMTP id af79cd13be357-8b5e5b14437mr1084706685a.5.1764941917827;
        Fri, 05 Dec 2025 05:38:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNEButls6SSRF71W1h3BBOmn6wdrkOJxd6jqEIhpxh4Mw9EtC01v8zGvqbJYoZBgBXtUpdQQ==
X-Received: by 2002:a05:620a:7009:b0:891:c59a:a9c0 with SMTP id af79cd13be357-8b5e5b14437mr1084702585a.5.1764941917287;
        Fri, 05 Dec 2025 05:38:37 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4498865sm377916366b.17.2025.12.05.05.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 05:38:35 -0800 (PST)
Message-ID: <95d5d066-0fd0-4fad-bf83-64deae6b5ce0@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 14:38:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] iommu/arm-smmu: add actlr settings for mdss on
 Qualcomm platforms
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        will@kernel.org, robin.murphy@arm.com, joro@8bytes.org
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251202125447.2102658-1-charan.kalla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251202125447.2102658-1-charan.kalla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZqDg6t7G c=1 sm=1 tr=0 ts=6932e05e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8Kug02PE9PhwNHeq3GEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5NyBTYWx0ZWRfX6z7Yh+iJEBbI
 37Hmfgr1nQHzNFC9KKd22R9EXJsP3frS1BRQlbTrKoUUqu8j0gztI2EQXGV0GSvNddisB3WLEIK
 icblEjEWXQ3lEtww8hUJ+Xblw8HVCotFky3ppKmmn1FzDEzRgpNYTSLFr2THd+nRGBR/6zHCAUC
 VodyREgwnuXMvzUkRHWAoVECkG1WnYmgbPrWWxev1JLPzckW2wX67NBAiuW9fowBjsFTlgHqClM
 a+Z04mibV5t2xiE0DVdln4ys+ypn7p3A7a2ZQ5G0zbPRjBxBTdj7GvG8kL5UrE/mD3JRb5Op3eF
 gQPd5VNL2f0NjdRSHFf/Q+ZSfcysSXnvqYivXfcNqZpvDmSZ7rJiB/4bdRZ7R/2CT/2rIFWaBaR
 jtYK2lc8T6yvi38bQtDu5OQr4NWw9w==
X-Proofpoint-ORIG-GUID: 28DlkN66IIEcR2V1Fe7mWPx5Ti4elgIs
X-Proofpoint-GUID: 28DlkN66IIEcR2V1Fe7mWPx5Ti4elgIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050097

On 12/2/25 1:54 PM, Charan Teja Kalla wrote:
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
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> ---
> Changes from V3:
>  1) Add actlr setting for missing sc8180x & sm6115.

Thanks for digging them all up!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

