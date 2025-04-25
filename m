Return-Path: <linux-arm-msm+bounces-55581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B1EA9C34E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F09DE3BFC6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8B92356A0;
	Fri, 25 Apr 2025 09:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fb0THmZo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9600421638A
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573092; cv=none; b=r3MajVju5z2fJQ0t12aDCY8g2nfP+ClZmKWNFz9rxp9/T6R6+eSbVnV9jal4jMyuurDm0YwctAASCJR/HxYkPFZlchO3WolGxXsSaYFa9otedrZz9/xX/dvmi3gBctX6cpKnzdpSkCTXtvYfCJIqrxYYplAs1FBdKXbEt579FJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573092; c=relaxed/simple;
	bh=Yc4BwXcDlBm1F9/eAPkhhmBz3Iwfa2QIOUzglIaGc98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWz3obmNLUiyf7MOF2ahIWDbxxwjnOsSOwTEFmH9Syj4HXtblXPxq7yj5aiBbF+m9rZOulE4CMkDk3FGbqoJzJeGmckJOOAmV7sy5u93sXGzJguG/DbinUtsPIgoo9AmNqR6WFGKRZGbEWVVpiL2ooRh9MZryZET7u1K4yYxKOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fb0THmZo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TQf6012532
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6TOVSLiHysmlmuAA0RHIHbn82IoarWugi9dE7AH6+e8=; b=fb0THmZotVS5nHV8
	0N130J808EBa/0W5Gm8f/hAMIKSxI3bAFiZRZf1zTqz4bmTqelFz8wJU6IfKsbhY
	o9W68ieDv/RsIWpNZ3rbMbjrPlpx87bUbKFMgicGJ4qWnO/9c0EwtyrLJZ8mM7uQ
	7czMfxp8TYtvAS346utC/03lQkvESDO7ytrbF9Qcp5VmBAsWawLAIhb1SpQDmpDt
	WMOae9a6xYXqjWHVMGCZsrloG5kbhOAcMfMQGzjGJaqPQ5CyqbEeih9qObRyiPYK
	DNUfDtC2VAkSuNq/t+LCIT2moIv37QCB/2yvR7xd7JAWlDe5ytyPedxsp0a/M+Z1
	7TfnZg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh18cdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:24:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476783cbdb8so4790871cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 02:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745573088; x=1746177888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6TOVSLiHysmlmuAA0RHIHbn82IoarWugi9dE7AH6+e8=;
        b=wRS/GvpkdHyqgBz8xue/N6yDy/v4NTZ/qW4yaeQ7D8IFBPjO/dsJ22FqyY9mP9n0AM
         f2X3vfBdShPcymUA50G4U0qmofQ6kDbY3kFS6YB6uW8C1Qau3wiVh+ztr/kmOZteyJDe
         w0L9meMWq6oAWeaRlElW14Qo7ajEjFCkNHv9Fb5s/gROz+AcjcERNNEHW/vy/zdZB1td
         aDBqp4oaTU9Gtcjh7MAU5sF95Yp5kiOVsghozH0sDTQQgf7KnbzrnhHx5pOUKx7JUzEf
         Kmi1TmoMQEvrANR9wZI7lxR6buP8qNu6gUImY3Ke7AMvWHA3vYJN8w/HonFYtlnUiRv9
         UpaA==
X-Gm-Message-State: AOJu0YzaTNKRlBfkyb4Lv0ofKysEynzJ9RrkgbWCJ+ayr7ToDiEn42v5
	LkzYsiZ/t3jnqD3aK/+tMH3D5RRFZkYm0RM51237i51f8u9WN/eU3cEV0pC4KCD/nQerJ+N4zor
	xFMKNPPIF/Zuo/Z5HRkFGoLahy6dBusO6Sn9MhvLERHUGQ6NCfNzgZtmvnhjyaAAP
X-Gm-Gg: ASbGncuRIQ7rLOmxmMQU68EIaGq1ClUFDuGSv6HWi4e5nGD0R+OOIl1ns6Bya+z+STy
	E+THcbQifkXFUbq6vOVmwi8Oq+S1dHBNR8DECELXi686eJk2gscnRlg6xYTIx4ArGtTrTK+TigV
	k9gOIcTDcIxs+mLkfIRmyQfDoM7Sdy4mi487hZVTMQ9M9NAyYDa80FKwoRuLn+m/6hO1/47hYOd
	vrZoWueFgXgvLljdjfJgW+F7FZR3M6K/HUYlreS/bwXE4/vhmJUZ27mbAL/oD+LRDqbTXvCMajh
	ozyLcPNW99Owd7yj0phMcny+hqQ=
X-Received: by 2002:a05:622a:1a28:b0:472:1de1:bc59 with SMTP id d75a77b69052e-4801c796973mr7967991cf.6.1745573088544;
        Fri, 25 Apr 2025 02:24:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECDV4NjfiCTRpDdBppQk7mkiFY9COAykAendzS1IIWlk9k/YXc3xDR978i701ANPjxYOXj4Q==
X-Received: by 2002:a05:622a:1a28:b0:472:1de1:bc59 with SMTP id d75a77b69052e-4801c796973mr7967881cf.6.1745573088207;
        Fri, 25 Apr 2025 02:24:48 -0700 (PDT)
Received: from [192.168.65.5] ([78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb0becsm102529766b.167.2025.04.25.02.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 02:24:47 -0700 (PDT)
Message-ID: <e83b58ea-0124-4619-82a5-35134dc0a935@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 11:24:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8750: Add Soundwire nodes
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org>
 <20250424-sm8750-audio-part-2-v1-1-50133a0ec35f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424-sm8750-audio-part-2-v1-1-50133a0ec35f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1yh4gGm2uUhusc_EJPCe8Ce0VX9aOpdd
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680b54e1 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qkmjNN0peoRQDp3El6UA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1yh4gGm2uUhusc_EJPCe8Ce0VX9aOpdd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2OCBTYWx0ZWRfX9276fFn/+3we POUJWTJNCYg9F30aJNj2kkCDanQ4qoj8esHaQhw0dPlhQv+krBrlpebwZ1cpGVP6PHTVy35K+Q9 9LG/VIDiwyJ6C5woJlanneD7+ZA9bTYfvGcw/MohYE/qXkBURsLtR+ZUr6JLUnRTtge7xkh23ys
 fItPHzR9mEoVsbr/2/FdGbFlwFeR84sSUtRNgBRxqfc2fDmtC3Rhzzav04aTR1uS1oeJyIuH+WW OQfcLpsjYFjayFZYCgoFWElHiBp0RLyvxNaMt5Qt60ca6I8saV0/zAYcwom9TCKVzfLjPDKcrZ3 6xVaLgVec6meCE7DxvH21HHEmLhO8uDG0mRAyTc/4Fqp5gmzUAors4QAYNlyYnZUy/vlosfyhQj
 0/+Z9Ze8Na2TPeniYpS5BXavZf3xShFGkX+xt81Jk63yR5iN2SFLuvAWzfCMZ6ID1r9ZhqbA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=785 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250068

On 4/24/25 11:40 AM, Krzysztof Kozlowski wrote:
> Add Soundwire controllers on SM8750, fully compatible with earlier
> SM8650 generation.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 122 +++++++++++++++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 149d2ed17641a085d510f3a8eab5a96304787f0c..1e7aa25c675e76ce6aa571e04d7117b8c2ab25f8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -2257,6 +2257,36 @@ lpass_wsa2macro: codec@6aa0000 {
>  			#sound-dai-cells = <1>;
>  		};
>  
> +		swr3: soundwire@6ab0000 {
> +			compatible = "qcom,soundwire-v2.0.0";

They're v2.1.0, same on 8650, there's a number of new registers

[...]


> +		swr2: soundwire@7630000 {
> +			compatible = "qcom,soundwire-v2.0.0";
> +			reg = <0 0x07630000 0 0x10000>;
> +			interrupts = <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "core", "wakeup";
> +			clocks = <&lpass_txmacro>;
> +			clock-names = "iface";
> +			label = "TX";
> +
> +			pinctrl-0 = <&tx_swr_active>;
> +			pinctrl-names = "default";
> +
> +			qcom,din-ports = <4>;
> +			qcom,dout-ports = <0>;

There's 1 OUT port on this instance

otherwise (modulo the settings I don't have a reference for)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

