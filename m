Return-Path: <linux-arm-msm+bounces-68687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E96B22184
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 10:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D71A720F0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 08:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E8D2E267E;
	Tue, 12 Aug 2025 08:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SgNbkgDq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FE52E2DEF
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987501; cv=none; b=TJOSgQH/c44svEHdi5jINJpoYucFFOXJKZn9A1ikRfCKXECPRL8eIp6LHKQ/CxFKGOyuPX7B+m1C7QrKjc5t7p9Ypz3RQUIaQAhH8Ag2kMCGmYwsGAKa5YHxzaKS+AW2vjX6sJ53Q7Jy52U05bve2WD5r6YSx2XslgFnp1GSQec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987501; c=relaxed/simple;
	bh=3FmUf3Hp30CS50cj34xwa1ruTjcKGUB3eCltwPgVm10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=su6yFpOOgntPHCCCWH+fLtgXU6OmIMuynUNLqgMs0ClekRxnqxXI6J116JjNjabSblNord7tk/3Fk8zSrF4pwhFw2FrMGvr2D2j+/GsnZ/R5DtH0cd9w0rBWEXF4+OzguXZW5RYjGd+TMJJqG6C1QX8LFeXhI8LZgAirOWSBI+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SgNbkgDq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C4an03019037
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWWmZRGTBwubXompLpnOIPrbDAFgCGljYAqe2x5V7LM=; b=SgNbkgDqi7XDEWln
	RZr9DtJhRQpkMIQ5zjVNGLh+FVDF90W6U5RfWZPcG3/dBZuXr+V1Xevvyl5WYipg
	e6hc171zifFPw7sZ86EXhisHppXmm3jLNdFct3Mdi+jdT6w/1rpmJzh8uI2Emd5E
	xacGeF/n4bxZdd337sULWgy9EWhsygD7qe1CAzKB+K4HDU3HGDtufNjSOQPIPfA2
	8bMeRSz64+zHIsnnGwgU/rGdCQM1cnqdxlADMSFoFZPouj6JReE2LR7/MCIrf9P3
	mMigss7rehYm6kdb/kN9LbdhBJ/aG6EnycSBoVQhEqWFOZZe5DtKvXz2byxGD18K
	i/nEvg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduyd93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:31:39 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76c19d1e510so4963562b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 01:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987498; x=1755592298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GWWmZRGTBwubXompLpnOIPrbDAFgCGljYAqe2x5V7LM=;
        b=Ns1vIbsuupp4gPs5SbTtcXaaApPnSG1ezZie56b84mBabgbeMilohEQu8iQL33zpqv
         JI9aw+FXLpB6PGjMs2cI9S9f4v9PoptHH0/QdIXNkZIBSfU+d7P84AaKELBcU5zwR6NN
         9fIu2ot19c30S4dTd2iXDoUTpMmKNvGAFkyIXz40mB0QpTbxMP6GoSKv0K7nXh6rkD4A
         xorxmvyfRtQBEcYVHIeUU2JmVeutNBPWAFsZgZBLXWqa8g87XDvhf9+ftuUPHcVqet4z
         Mayv1lXUiwkCbSoQDSQJpyoOeZd/nKjvi4bu2wqucK7EEZh2IF4BMMk1mfk/o2piKcF4
         pZVw==
X-Gm-Message-State: AOJu0Yzu309/ZsQvG/HnnG6Y86TPwg0Z9jzPmA3bDSFwibeQiFfELMgv
	6lpu46GLR35rr3Xw7WvgOnvaMQBnP+g0YRQdlsfRXTPMZkAHV/2yYqFgl/eZqDIvZ+jAAqGkifM
	ce2AEv0DBk4+ujkXJXD4V+bcuQntDiMnGWhhvHxV8PZycUkZ/sUVEIRoOeNv5Zp28ph1v
X-Gm-Gg: ASbGncsHV7AKXOcYDIlmx/lcoAa2/YL179uAzdPOtRuSC4m9tFmkISuoBx4NzgCvzRt
	2nspV1jaQpWBTMchNzw5dGXyvfraLbu21LdGwttYCH5jf2mskw88bsriOUIN3jvjmv2Bxmv1z9/
	YpAs0OKe0s5uwqBqQlEQYeuF6WjRj+9OD2D6fTxtEvGR1h7O/5Ew5dYSwiq2RzS0/GpD6RoektK
	a7mKFTFB2RlpDnAZzvTzZSrZFuoUGJANytT+9nH2mpfGry8IvPVm5alK92kvgVvccgD7XYIJCUp
	iXJwBEUtOFveoVZzi99+Ktv+KOe1DCUUiIQHpswgmurljLkvoh7i4QIfb7Jov1zJpdDqjDk49cE
	Xnhgj7aOoCS0LdwMXIvpcJolK70Ub
X-Received: by 2002:a05:6a00:b86:b0:76b:f318:2d41 with SMTP id d2e1a72fcca58-76e0de53d0bmr3499983b3a.7.1754987497650;
        Tue, 12 Aug 2025 01:31:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMlyo0ZIuqdKYZz9q+kCc6x7EFMtEPl2fYK55x280gUgeOGPCcKX8cqv6uh3bg01xS6rsZvQ==
X-Received: by 2002:a05:6a00:b86:b0:76b:f318:2d41 with SMTP id d2e1a72fcca58-76e0de53d0bmr3499949b3a.7.1754987497144;
        Tue, 12 Aug 2025 01:31:37 -0700 (PDT)
Received: from [10.133.33.66] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce6f319sm28833238b3a.18.2025.08.12.01.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 01:31:36 -0700 (PDT)
Message-ID: <e9c9005f-dab3-4bed-999d-9a7563f5f2cd@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 16:31:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Update pcie phy bindings
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, jingoohan1@gmail.com,
        mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
        bhelgaas@google.com, johan+linaro@kernel.org, vkoul@kernel.org,
        kishon@kernel.org, neil.armstrong@linaro.org, abel.vesa@linaro.org,
        kw@linux.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
References: <20250725102231.3608298-1-ziyue.zhang@oss.qualcomm.com>
 <20250725102231.3608298-2-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
In-Reply-To: <20250725102231.3608298-2-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689afbeb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=FKzoDJ5KnSRyQqape44A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: GdN01X5lcwgf0GDE-XjZkpsT0V18XPRl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX5wEMmv/dgu0R
 pBps61rpM6d+6W+5IHMj9uWZ3DudEau2NRovO9hgU5Ep4V8jwwAoD4CTRiCSFqcf3C8a+XK5B1C
 l1ZPSAg1KdTfK3HhTFZgTo2yBOPokMpqel3OPC5WEHH3MgQRZhYaCltHC/SZ3ldjlp8X0z02spu
 PWi5f+61UNraIMuVDUgq/JeZqDLMNAe+IaltnKur/BBUfYIn41Z5uXwC6c+OBFboit+JaiOrbVq
 Zkv0XzDHTZ8CpymfyzesvetGcP6MXRhmfr3M4qlaAzkjxeMqlmsH0diIOF0XjCf74eta5H3rRBg
 zKZ9Kys/GLqPBESGYStaeeFF1c54+svFv8Yo3SKTLmTgLDbwWNVudaSjyZT6bj1C5qm4MVHsdNV
 4mBQB+lK
X-Proofpoint-GUID: GdN01X5lcwgf0GDE-XjZkpsT0V18XPRl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025


On 7/25/2025 6:22 PM, Ziyue Zhang wrote:
> The gcc_aux_clk is required by the PCIe controller but not by the PCIe
> PHY. In PCIe PHY, the source of aux_clk used in low-power mode should
> be gcc_phy_aux_clk. Hence, remove gcc_aux_clk and replace it with
> gcc_phy_aux_clk.
>
> Fixes: fd2d4e4c1986 ("dt-bindings: phy: qcom,qmp: Add sa8775p QMP PCIe PHY")
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> index a1ae8c7988c8..b6f140bf5b3b 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> @@ -176,6 +176,8 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,sa8775p-qmp-gen4x2-pcie-phy
> +              - qcom,sa8775p-qmp-gen4x4-pcie-phy
>                 - qcom,sc8280xp-qmp-gen3x1-pcie-phy
>                 - qcom,sc8280xp-qmp-gen3x2-pcie-phy
>                 - qcom,sc8280xp-qmp-gen3x4-pcie-phy
> @@ -197,8 +199,6 @@ allOf:
>             contains:
>               enum:
>                 - qcom,qcs8300-qmp-gen4x2-pcie-phy
> -              - qcom,sa8775p-qmp-gen4x2-pcie-phy
> -              - qcom,sa8775p-qmp-gen4x4-pcie-phy
>       then:
>         properties:
>           clocks:
Hi Maintainers,

It seems the patche get reviewed tag for a long time, can you give this

series further comment or help me to merge them ?
Thanks very much.

BRs
Ziyue

