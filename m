Return-Path: <linux-arm-msm+bounces-35955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4B59B0D6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 20:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0BCC1F259CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 18:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F4220D4EA;
	Fri, 25 Oct 2024 18:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQr6gSn5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01F320D51C
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729881229; cv=none; b=MHUDnNfg7YDbWGIwJh7YpPREoQvtUtJxMVRoQt9Y2AnHzzoIxjSGHluI7Nnb7biMvGm3BixKFC6yLFvtsbaVF0hlEaoN2/E3jkr3DxBRnDQfFwWP+8CBB/vmhKJ+ZytuR7b2ETVSo8MroAYylK4EZj3WHpgnk0/4q3bmu6S7JmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729881229; c=relaxed/simple;
	bh=C1E8frnjMeEQSy8Pqyg4K5aFpsibcSd31aK+iCCZ3dA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h9/HiArd0WIm+MzfIpEa0z0vwBoZ5gpEIOdSABV7Us30JLfr2f21q/IcKNx5ljN3nY8/644OZ00X4rnE1h+r4qroGPrTGkMdkyPXDNnEXRM4td/gikEVdq2voHXhXVFcO3GkTy7zzQCc1FYvCj5Ub6Gdic933c6BIuzV9vtRkm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQr6gSn5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PBkm2j025869
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YrhtYMGo6oB+Fh3IVUbINDP/3iPpzWJ+iflfs3uTsao=; b=EQr6gSn5M0viTC4A
	rE8Zb8dRdxwkvc5EmZjNoQnOTG0Re+SZStLVEkzwv42J6GIVpLHHIeTZ5r8g2kv4
	euEK6T+R1qPPavZNm9xDCfjOkdJYxw5LNN2b5lfmtOwLZqhS6winmC8pMoMOoWAm
	ws7l2luJOFOBQrG/pCHbkMILZQKY7nwPetsm/fGPz6U0YZmI9kEBI4kRZURm7BZN
	WBIQBMrCaUqneefBOiU1EIYKCC8woKq2iy+N+pTM2lcpVk313FA7yP18wFpdTmWh
	ARemsALE5PbYJTMlgPG8ob4TYm1Pvoxzmjyj0gaYqLyXBZq8QGma9RmA1CrY0PIm
	8azGGg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3wt4n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:33:44 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-4a46a91412dso97729137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 11:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729881224; x=1730486024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YrhtYMGo6oB+Fh3IVUbINDP/3iPpzWJ+iflfs3uTsao=;
        b=GbaeHqM6XbarXHqNdth/ty/FO9zA6lI35ijBZLMN5n5SN+m1yXzJn+zwyIgAmPeXc2
         xA3tRFVKtEK2D56Ot25XypyL9L9S+K9zMN/R7ba1weoAkAiajRa/lQO0uNGoDFouF2wR
         yzsnqloPJRF9WLjowz2MYuB24z4ltuE2Y9y40wXEPU0HiPqwaju68XeG41jPI4062RZi
         PRX6LuAPXnKxOSgeTuw8mswQH/URSaPBPdi1sQRNjHlMwD3iYSbvWSD/KF1p8GCOE3dX
         +kdZqoJt0ltEG4RRfUluKqo4lBtWqmraRquilzvT6PY0AZ37+Kwhfaym96IGXQRsdoFa
         Exww==
X-Forwarded-Encrypted: i=1; AJvYcCXqh2VFPtNBuGfRzglvDufTGYJkkuYVQ9fo4dYTzAk6bNzujLEJKSQrFVlxgqbM+CkWYhnO7azk7jPKElxE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5fnM5JhXCBJzGvvtSGVvojjZqyWIgmYLM6ci513mA5PDMzb7B
	kJvsonCQGcbyKfqunQha+n2aHjWDJR9J4FEQDmE1Dwi8VCzBG7iHtNuw+xOGLKY6TOz3YrnT8co
	xDxGcKbJKXg2rcDvDQ0Cn5dTEWDj737x2q4sTL2jWVvNDwD8qj6iCIUipcNdd7o8Y
X-Received: by 2002:a05:6102:358d:b0:49d:4538:be24 with SMTP id ada2fe7eead31-4a8cfd69f9cmr248204137.6.1729881223990;
        Fri, 25 Oct 2024 11:33:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpgeCSyeMgeGBpUzgGyBg9YoUfZTE/wNtpSmO+wzQcSnouAf+xQwCdivKcj6OqaJrksIp1pA==
X-Received: by 2002:a05:6102:358d:b0:49d:4538:be24 with SMTP id ada2fe7eead31-4a8cfd69f9cmr248187137.6.1729881223686;
        Fri, 25 Oct 2024 11:33:43 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1e75ff3bsm96012066b.1.2024.10.25.11.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 11:33:42 -0700 (PDT)
Message-ID: <321296ae-7190-4c54-b36d-92105b49f61b@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 20:33:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: x1e80100: Describe the SDHC
 controllers
To: Abel Vesa <abel.vesa@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241022-x1e80100-qcp-sdhc-v3-0-46c401e32cbf@linaro.org>
 <20241022-x1e80100-qcp-sdhc-v3-1-46c401e32cbf@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241022-x1e80100-qcp-sdhc-v3-1-46c401e32cbf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jqV9z5fV1XdgfysnXqrzvzAKPkrYEwla
X-Proofpoint-ORIG-GUID: jqV9z5fV1XdgfysnXqrzvzAKPkrYEwla
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250141

On 22.10.2024 12:46 PM, Abel Vesa wrote:
> Describe the two SHDC v5 controllers found on x1e80100 platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 102 +++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 0e6802c1d2d8375987c614ec69c440e2f38d25c6..2d0befd6ba0ea11fdf2305d23c0cd8743de303dc 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3887,6 +3887,108 @@ lpass_lpicx_noc: interconnect@7430000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		sdhc_2: mmc@8804000 {
> +			compatible = "qcom,x1e80100-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0 0x08804000 0 0x1000>;
> +
> +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
> +				 <&gcc GCC_SDCC2_APPS_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "iface", "core", "xo";
> +			iommus = <&apps_smmu 0x520 0>;
> +			qcom,dll-config = <0x0007642c>;
> +			qcom,ddr-config = <0x80040868>;
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +			operating-points-v2 = <&sdhc2_opp_table>;
> +
> +			interconnects = <&aggre2_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1 0>,

QCOM_ICC_TAG_ALWAYS

> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDCC_2 0>;

QCOM_ICC_TAG_ACTIVE_ONLY (this is a CPU-x path)

for both nodes

Konrad

