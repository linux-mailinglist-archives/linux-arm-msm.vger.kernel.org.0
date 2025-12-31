Return-Path: <linux-arm-msm+bounces-87097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6B9CEBE0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 12:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88A87300E7B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 11:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA9331B815;
	Wed, 31 Dec 2025 11:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzAjbr8o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="if7H3RBR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3B83101BB
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 11:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767182085; cv=none; b=IsS5BHKMaes8h2DzP7vRiy/ll6OZPiivGA0lIHyYQ5YBMgGPNo0i0QCc53VnlyVNmr7/AaAhGRTK9xv95kQIhErF6GWf1qFB/GdKv9IUeE2vnLagypbUB5icA65tp6JQ0N+1XpfR6vUQFGNXM7ng79mcKjrNVysKkMgkf1ovszI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767182085; c=relaxed/simple;
	bh=0zP5upKuKQ5lDKq3QT4779thMUVekVUPfSqU0P58sBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rq+3dtSg7y9qkjCOmCsfRY+cWMJU7ExJwPqAtcC5Bj3sNEX0vvK9F5+K8LXFnHj+8jieLosDgMz0CEpnfzOjYzz3TGJytzhbWOr5IaNRAw+OFwde59TS2aBvtOOcPr1GexcZr8N+cfq3DI8lmwsSFasph5R6vjVhS2qICgy/yrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzAjbr8o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=if7H3RBR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUNBgsc1752576
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 11:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j1qCJuW+fO38KCWDHz/g7rRFRh9M8lcvoMgpIEKLPwM=; b=NzAjbr8oxNaqK8b3
	ggtHEV9DEyR3MsiJIhfarjpObo4rS0WGQFnbCCST/6u27XbE5vO9GwU5824q4v6I
	dTgR4GhHXQsp0GnHl1JiHnRGhQzCVO9luOWCY6Q685V4e8IpQfUcLBbLW+OZCa9C
	XqAnxHwD9tk6Nchor2L4AkYhWx+caCIwk/1WnBzaHciwLVEImLbvt1bc0CElgb8B
	cRnFJ5FOE5Fu5jkP+uxIPviQcyVqo32keiYtriTuCk25NnHPMuVGNhAbrTaaEJzO
	t1o4IvqhHSdjt8iU7moDgvPTxpYfnyDugARDuF5PD6JnA91UR0wMPv1CSzHrwgj6
	8SLXaw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0sgv8jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 11:54:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f34b9ab702so28090971cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 03:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767182083; x=1767786883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j1qCJuW+fO38KCWDHz/g7rRFRh9M8lcvoMgpIEKLPwM=;
        b=if7H3RBR/kJ1+IpB7VNoQfXH7MTkM2+QVlBLYuLjwnssFqCbPsy4iLn5US1DgT4x0r
         QOg1D/GzFwZAKzxQqQ3vQQ0EisC199zRvPeGOYP8vqDmNqwFxmA4rPvF4tU8fRjLir7h
         HT5FVke1XxNcfm9inQmpNjaCxU5xDVkM4UeTKN08zR2u1H8ohPWUGjRvNbXiCbiqv7bB
         h2a2nCWCS0u88yTIBG/DEZiGtW226zENqWc2YmAd9Sfzw5CdFxHTHpb0xon58Bk7faHw
         fjvSbPfX79kGGtxhMuD/ydIn0pRKD42vbWpuGLE31xIOyr7rXIu0ORQNsuOPovGZCSTy
         RkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767182083; x=1767786883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1qCJuW+fO38KCWDHz/g7rRFRh9M8lcvoMgpIEKLPwM=;
        b=OZTHlo5UuNnO5O9l3jJSGE5svffw6b2rE+Wy4jQjTRmgLkc/AoHin0Dwv/kZo8k/bl
         +0AvumX0niNs1qjBblz0JSfyTjqwlECVllr+B3VV9zghMwM/0J2aPWRydnsjbAGs+D3n
         /bTZzRs6vKeMKqtz6+zKxueKHkhfP7WWUfIIsrrab7ApAbLkq4IhYbfDrS7AkG1qi1H5
         gTrj7yVeQMsIkTDXSRWJDuQ0P6j0gEPw4+9juVvLd8zhYLjc+x9bRhei5LVomCDuTz+1
         MMlNMydwTM3yFtqKlvbFVfBPqiyg7VmMMgA4WxC6EeC8esMQ6TYgNo9ONxaxNGesNtEr
         p30g==
X-Gm-Message-State: AOJu0YyU9GWb0ghsLQlwbdQIQb9sxe2bkr2uqDd1V5/pU3P+gugpoBnf
	uwlMxPsru9zvRBbDJx03bu9bfel6Ja3TC/4nX8AFolkK4mx6F0Ar0ZCLoCg2nx9brgHgN3jCbic
	ylOzBp5D9s7GpegpaiaEtXcit8+A9GNOuYOLHwxHzZ8r9wPUaN7iC4WwmKKOy4sIQTfW1
X-Gm-Gg: AY/fxX522ObI7fNdx3NVsW+YyqRMeifyDTrmDmm89jorMLVcesK7Em4t5DtuZrknVqP
	g36Y0sIEmHBGyawnuaqJEUd2//epU6tTOp/6dcETjqGj/c/mpQwCnEIRy9PwR90d60+OMBJkCvA
	GgLxSQAmShKnJmyu7k1OMsI8qnI00ulWNROh632WfwUqQCRE9f0x7TeQs8b1I9tDDqhG7yhjQ/x
	kjtzpraVOkUZFGvzqIJZExBFOLOXaNzgFN7z695ZEGxPWjaZfN01VWCjD0ZQhVVtdu7EAPskgWr
	yMxEd7jCjymzs2UCEKPlN0oI5BDDXZuiM8J9Rj7R41B9Dt5SC8W/0DHQ3ZLI3TwMZvtMvZ/ZtTH
	yAc/hf4F7PX7XdLZTaI3JMYWhEqHtwiajEVIlOV+S1+Jd/2d5upJ3sqNDbAVoApV8jw==
X-Received: by 2002:ac8:5a81:0:b0:4f0:299b:c785 with SMTP id d75a77b69052e-4f4abe04451mr371150951cf.11.1767182082908;
        Wed, 31 Dec 2025 03:54:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGJ1FK4Fd4NmUhSbOSc+fWSuv7pniV2b7PVYOuXstMnLJz4znnJPci2xLqqyZATbWEGocdww==
X-Received: by 2002:ac8:5a81:0:b0:4f0:299b:c785 with SMTP id d75a77b69052e-4f4abe04451mr371150781cf.11.1767182082513;
        Wed, 31 Dec 2025 03:54:42 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de1421sm3989946066b.41.2025.12.31.03.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 03:54:42 -0800 (PST)
Message-ID: <7eacdba8-1dec-45ac-b48d-55cc67a98ae7@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 12:54:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: purwa: Drop the Hamoa workaround
 for PDC
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20251231-purwa_pdc-v1-0-2b4979dd88ad@oss.qualcomm.com>
 <20251231-purwa_pdc-v1-2-2b4979dd88ad@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231-purwa_pdc-v1-2-2b4979dd88ad@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwNCBTYWx0ZWRfXzfUGLncmi0uN
 zQoqbcTvDvIj5y/GYqVPfXFxOYvRmh6I8LPq8gvYvT3UFKnZdr7EDbddfBN4qjLGTrqYfHPJpTW
 YLI8Ia1EkZW34QKQg5Nqj34vsmoYKZOhkdrIIxMGQ0taZBFRyjmo4T8Wj1h+OPF53bMhb62MBgA
 KBR7r25ZTJcX/BZ5vdrArTw5TCY9qNWAhEfIGl2gKc6uoa/+q/WBE1qdRvXj7JyNmgEAoLbfuI3
 9K3F/WkvyC2jlY/0uG9cWDD1XTaFKo9hOlupIKcEGqipq8q++6+Ndf4KR+4OFPDlpKq7pV9AMpr
 0Q0oYUnkH+XywS79vdd7W/9BgH7m/oemT7XcUzIhRY6fsupVGexnWcc03ZDOkiEmdeexusJr8uj
 7bus3kJYO5NWA56VrHClFN+DTPNkjNbxVUD5zgoh+AmJRUzenOfRw7VQqxXfwaohM9s8hM8bNpl
 i+oydRpCfAI9E8ijxew==
X-Proofpoint-GUID: 6rJ-lFI56bX-H0DfPb_VpyKuzjaUGbRo
X-Proofpoint-ORIG-GUID: 6rJ-lFI56bX-H0DfPb_VpyKuzjaUGbRo
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=69550f03 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=E_S6SxJbg-Xv3qsyNckA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310104

On 12/31/25 11:18 AM, Maulik Shah wrote:
> Purwa shares the Hamoa (X1E80100) PDC device, but the hardware register
> bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc: Workaround
> hardware register bug on X1E80100") is already fixed in Purwa silicon.
> 
> Hamoa compatible forces the software workaround. Use the Purwa specific
> compatible string for the PDC node to remove the workaround from Purwa.
> 
> Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
> index 2cecd2dd0de8c39f0702d6983bead2bc2adccf9b..e3e2dfedf0b3cad90b767d6b28fb0c60078d192b 100644
> --- a/arch/arm64/boot/dts/qcom/purwa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
> @@ -152,6 +152,10 @@ &pcie6a_phy {
>  	compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy";
>  };
>  
> +&pdc {
> +	compatible = "qcom,x1p42100-pdc", "qcom,pdc";

I think it would make sense to add a comment above the compatible line,
saying that the PDC is largely the same as the bigger brother's, sans
the bug

Konrad

