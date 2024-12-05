Return-Path: <linux-arm-msm+bounces-40620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D27BF9E6004
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 22:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6DC5162486
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 21:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202BD1CBE8C;
	Thu,  5 Dec 2024 21:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c72aI9GE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799371BD012
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 21:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733433702; cv=none; b=ZVUFDfD6QvPKBeFhy64ZVqX+132aNq+UHPKEP5xb1g4+S0ePUHoeuQrNLc553EXrFrNZzxUyaUTM8gxqjObGkiK1Ld9a6grqto833iVDUi5D26whN8NFgyeHRQeE91JLLoswD9olY2hi2jHB0SAOVkdtCKvfR9pqQ3luPSddMaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733433702; c=relaxed/simple;
	bh=OXG1ROAvB8Ka+BpsxdTrr6f/QoqTagXp322JhE/Jub8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hqmxffsex/IgOFcSF+ve7c4HyN+uT48ndnPYX4D4+Xr6yqFH/yicsq4g8CWZ0zxipV19FP+YtfCZNfNDIOBVCWaNv7VNutkxHYC+TP8py6sDvTxyOk2Kx3Tm2qgRc/jBv3jNY1ZCvDOsB9SItTUrJd5l8XUmu5UgjeESC/Z7E8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c72aI9GE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaIiE003753
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 21:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9wSKuFAw0pvLNlawQARI7JAUgvlhJLy4giEcuIJ/xFE=; b=c72aI9GE3h1hgefA
	yh2mdztFSppkAR1fa4zj5DaMbyqGfRj0jPqj8JIhkp99f1WQXpukx4oahsSqLJYu
	7M7osg8nhVjzrMu1Wv6eAPeNbQ6Ky5xYBnw1Dsq2l2u8BPAWVWdTrkrNpUR/HCnB
	d6YLbqz3zE5ij5+6ke9BtAcA4qyoiZtdmvVFK3nbr9cDaovu5ezWHcRdpeFjSC2b
	M1kAiz5sKqEPwkkCMs5pql4RVnVSd5YSVMdWYBcLKxnRJcSKaB/XqvOCd2EleTK8
	lEMTH0H/bvkjqWnXB5e7vrXL5KUbCGqept2xv9qktFLzsQTtk+/tKfLlki45OBSn
	q6/CiQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba0khrtp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 21:21:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b67127ab77so12418585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 13:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733433698; x=1734038498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9wSKuFAw0pvLNlawQARI7JAUgvlhJLy4giEcuIJ/xFE=;
        b=GUfAizVJKilhG2OU0YTAd/MdL4kNCOUMGcbqe99J6CLLVjJ7DPzjJFX4Daww0GuHdM
         1vSnw1wBiUNk1EA88tvJ8Uw5mLmnILYEiHOUsvLTSxILrDtJM5r3CKKfPUI0yXQJUVDx
         Qyblj0ltI6SMnnDZSzJdXtmuJsod0b618cUavFxD+OTUUBa/hvZcPM6xhUKbaAR6M5wb
         sltU5EzBilItooWvcZyZVwyguSeBJFRVGPLeEt9C+Z1bxcyEVxNMcqy55jZyScu51H7V
         dSjoYKAfPCoPJDXBusNd/RzZCU71iZyvRabxUpeG2MZgBUjxtbbiWNsy3U7o1KZ5tx8F
         BiTA==
X-Forwarded-Encrypted: i=1; AJvYcCX2a8GD8tXW/dTSyq41j6FmgVG92a8Fjb8XIptINkEMog8IHFqANwTrnCWS1ajgVSjG4bsZWpNM1h3GkBpZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxOyFftZk728OxecL8yJoVe7TWotnwocs4BeS3Yhuloj/DWFmiY
	FTigUBLnbMb5rCQbw2dOWgd6xB+fTJvO9qYlNSsNo2x3j0YjB+stZcxBnoJUGWY1Zc2998evQCf
	hAS8FsTAODD6Yfgyv3Xgrqc8Xm4N8QC436GXq+WPUrCcxfKeszfH1nw8WQ/WJHGKCL0W6hFAY
X-Gm-Gg: ASbGncthV3hFdApjNvE8HSUwwaCv8VCspg/YFzWC9SOaatyMMZeZVUXKk8WBiun630O
	RXzpUdjS3covKKbHofxZOxJejxFv157H9wRl06FSrzAxKegnEEm8gEb6jq5vLrZvYs0f1NBi1Cx
	cFdC7dMr16prQFQHt5uJPvR9wGxwYDZsuDHesr24C04uDh6EvIalKQYRO2S3wwxn86+U+jrKYJJ
	arIPzw3eMMMBm0CIWwlE+ltZulKCXNUeMj8G59tSVVk/wnXGu8nGAH9qhxpEMITNFc7SLNY8KwT
	A++m1hFApUgVDOYnoNG2yBZVkJrRGS0=
X-Received: by 2002:a05:620a:40d1:b0:7b3:2107:2eef with SMTP id af79cd13be357-7b6bcbb4a89mr43686385a.16.1733433698167;
        Thu, 05 Dec 2024 13:21:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGP2eroqw5GjfjqU4teCdxLTjTM2852lowFJw5191BqDO0Ct4lPnhyAhDYPqgGpdYtEezYmZg==
X-Received: by 2002:a05:620a:40d1:b0:7b3:2107:2eef with SMTP id af79cd13be357-7b6bcbb4a89mr43685085a.16.1733433697790;
        Thu, 05 Dec 2024 13:21:37 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e4dbfesm142253866b.6.2024.12.05.13.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 13:21:37 -0800 (PST)
Message-ID: <d4f7ca97-b37e-4b8f-918c-9976e4a9cf41@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 22:21:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: qcs615: add UFS node
To: Xin Liu <quic_liuxin@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, quic_jiegan@quicinc.com,
        quic_aiquny@quicinc.com, quic_tingweiz@quicinc.com,
        quic_sayalil@quicinc.com
References: <20241122064428.278752-1-quic_liuxin@quicinc.com>
 <20241122064428.278752-3-quic_liuxin@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241122064428.278752-3-quic_liuxin@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cIvbNCcqj7uNFK4EfozJtT1yhOU_8d5p
X-Proofpoint-GUID: cIvbNCcqj7uNFK4EfozJtT1yhOU_8d5p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050159

On 22.11.2024 7:44 AM, Xin Liu wrote:
> From: Sayali Lokhande <quic_sayalil@quicinc.com>
> 
> Add the UFS Host Controller node and its PHY for QCS615 SoC.
> 
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> ---

[...]

> +
> +			operating-points-v2 = <&ufs_opp_table>;
> +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;

QCOM_ICC_TAG_ACTIVE_ONLY for the cpu path

> +			interconnect-names = "ufs-ddr",
> +					     "cpu-ufs";
> +
> +			power-domains = <&gcc UFS_PHY_GDSC>;
> +			required-opps = <&rpmhpd_opp_nom>;

this contradicts the levels in the OPP table:

> +
> +			iommus = <&apps_smmu 0x300 0x0>;
> +			dma-coherent;
> +
> +			lanes-per-direction = <1>;
> +
> +			phys = <&ufs_mem_phy>;
> +			phy-names = "ufsphy";
> +
> +			#reset-cells = <1>;
> +
> +			status = "disabled";
> +
> +			ufs_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-50000000 {
> +					opp-hz = /bits/ 64 <50000000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <37500000>,
> +						 /bits/ 64 <75000000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};
> +

Konrad

