Return-Path: <linux-arm-msm+bounces-75094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2FEB9F425
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 14:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BFFC7B878C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C194A21;
	Thu, 25 Sep 2025 12:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXBOKK4l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3802E7F06
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758803423; cv=none; b=c80TAVCCzqb/IDwNq1UUMjJwoBed9owbe1x29amG6quHHg7YV8F0b59RS0X8oVnrzQDDpGQ2/ky5IcGjy2vJJCW26m07+nVw/FSPTS397VMxdOqqv5Lqd/nAWDS4lnZ9b24zHeuZBwRblsGZA/B2MA+RHUewk470A1bAdaQYjzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758803423; c=relaxed/simple;
	bh=R4M5M2ZmY8QaDCzPxbnLSp+trikKIHyJO3YsILvnS0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WNAYuZnh2A3RI466CCSapJiNGdu4QYw+5Ob8U8NuNdwwBGsnYHBpLtifVqpgoDWeHzv75gC+CSbjiuldvY4R2siqvkUqrhu9glH/oGP/7QhFfqONE4bYbY6IJcQEGUrZi4K5hVf88lMqVqVEXqXZjKvf0pHCcOzTOxVKEwaTCd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXBOKK4l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9q3vq025366
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	amZgcpccGdLC5wwiHqTQ+/EdBT17Aozy3dL4P9t6E1g=; b=LXBOKK4lW71Ysdnz
	q69RaiLAMMEVeCay1OW3BYJO9kK62CVPaheOhHIDrba7zJ6CZD1G4YHVueUuSuB3
	mBn1w4Rp46hd2I+dV7n5du4OnicpKJaUpOCySM5VZKqy/xIL74tTdHHNkPvOFy27
	5PzgubvvYI1YfxwfpiBAqfh1dxR90bmeWEwBkWda7dakCEWcPioH2sPgaC5Vkls1
	oFbkcPCd0QptKNhkQXWzceiId1Br2Cs88QORTpNjA2axVhg+eZPZWj1pCBA3beG1
	MHkXX0h01MiCdOEOCByUVy9fbRDsaP/zz8joXeYL2bVYsIPO7116bnXkLnJ9Vo3o
	/LtSTA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyf0ct9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:30:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4c39b8cb20fso3188061cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 05:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758803419; x=1759408219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=amZgcpccGdLC5wwiHqTQ+/EdBT17Aozy3dL4P9t6E1g=;
        b=oGWh0JGYmN4uxBguOlBhWnpgxdlXxVVC/KXzyobW76n27KwbMRGh01q6OD8qUEvAin
         /9PREWUEtRnTpPWovWJ6TLr+KqNbMTw+F5E5PogMfLmBNKXaCvyfm3J3Skou4/w88sJL
         fUQIoZTfw0pvv5h3++aCfvv3fYTiYqyYjQgqR/W9OrARcDlaqXJQFrWa8PZwOVpsb32I
         yeRdRIMzsy8c5epAkZ2n8uVgjsoADJ/6ARYwpNopGVFmjcWQJ68jz9Ckdf2zCyl0ZbsY
         TNDp0mGIw+wXzRG68HVlLbwdc4uyjVbNKMG+acKNIZv+roNm7+o+OJDnaZmEDTS15wGO
         mp9A==
X-Gm-Message-State: AOJu0YxAogMMBgyKkdq5G/jgb1vKTwSC5s1rGN0NiBGH4wyk6GluwEZc
	avk4gKMmNyflj4Igy0Aq7ebTVRXjb2ElDwvRBpflS2kBcxk3bQ1N3XumpkPQjg+5JiJCjWvTjDs
	5cHKfWiJ7X7livSl0ojkE1/FkTQydcrBi+eC9ZasNwj/qWAAa/gaPucadY9qSZCa9weHV
X-Gm-Gg: ASbGncs5eVT2UOtkZzGMvJoU/1gKmtJdhHer+0yMBA9fLE8mo+mixuZHc2bvp3IVP+Q
	6bAIMit7toAVjpFyb3+Meiy6NZhr+HX4bpGx1sPGwPxTX/+Rp9Yy8AJA7AjISCCc8Ef+2Hh//4F
	8YK9uuQ2Wc5fXch4yoOgWp8yzimwi2cHjpBmSAsc8F+TO3qfyF0G5DpL4tfC2uE2/TAvYx3fX2R
	Apown2GjJxpJhkCbkZWUSPa/aAkd31ix7wgFKwh9Qnx1ctBbxajQ1fVZT7gGuSwX41w8K39cRBu
	9HRXzYMjOlXzHYSbWYKcJXQhyb5OnuyzGR741eXeTcVE6xl0whk4zFM0I4PxTh3lp9o+CblMj/9
	ZyN/jvWAUngUrZesozx4xgg==
X-Received: by 2002:ac8:5f0a:0:b0:4d8:2245:e23f with SMTP id d75a77b69052e-4da4b61615dmr29844431cf.10.1758803419226;
        Thu, 25 Sep 2025 05:30:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6euFUgVfoOSGViTvXNdmeEkohF6qNoOdRCv/QUVcIdRorA7aKF9PTXogf6x9XlmUrcxL0YQ==
X-Received: by 2002:ac8:5f0a:0:b0:4d8:2245:e23f with SMTP id d75a77b69052e-4da4b61615dmr29843321cf.10.1758803417562;
        Thu, 25 Sep 2025 05:30:17 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629a29sm1149714a12.7.2025.09.25.05.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 05:30:17 -0700 (PDT)
Message-ID: <bff00962-f417-4e6e-8c59-614870bd3a7d@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 14:30:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/20] arm64: dts: qcom: kaanapali: Add support for audio
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-17-3fdbc4b9e1b1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-knp-dts-v1-17-3fdbc4b9e1b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3kGnEXhDM9pOAf-KuXbgIIIocr0nwYZj
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d535dc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_ouoMj-Ftme1J9xZixYA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX0rFY1j+3Oxbn
 BsiTXh8Fq1V1J3AfQDoTzU/5FKK/Ziq7OKH0bcJTckRCa8As5tVpOTIauuNYPxeyhfhQTG+IY97
 COOL5kPiglTJyW10s+nhb7lnYQ/9UhXmnFvm2dhV70dyDIumjlZs8r48RvB11ZdluZsK2viMe3M
 54wbcRJxDCA6DCLgOZaqmgkDe88JyrNK4f4l4svLIq8oitMbYLDEHT5i4/jDFSWNMsjrEJBv6I+
 ZFoqtLMe3WpbwQRAkmwo/y3BAxDNhN0XvycV5IDpxmN196rQ5kfCRwCkIUCqPsrwg4pwxcrTFno
 dyORtw6JWlsDVNOYRpR2DZvSmjFXS22sfiwMHrQJI8iD2vGVfr17pfNTkMSnuAmkgp1TvdhVp4Y
 j2LscDVR
X-Proofpoint-ORIG-GUID: 3kGnEXhDM9pOAf-KuXbgIIIocr0nwYZj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

On 9/25/25 2:17 AM, Jingyi Wang wrote:
> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> 
> Introduce audio support for Kaanapali SoC by adding LPASS macro codecs,
> TLMM pin controller and SoundWire controller with similar hardware
> implementation to SM8750 platform. Also add GPR (Generic Pack Router) node
> along with support for APM (Audio Process Manager) and PRM
> (Proxy Resource Manager) audio services.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

