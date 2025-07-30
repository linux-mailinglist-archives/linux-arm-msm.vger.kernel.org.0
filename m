Return-Path: <linux-arm-msm+bounces-67180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E6FB1640B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 18:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD5D3188AF63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 16:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490FB2DCF64;
	Wed, 30 Jul 2025 16:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JwoG9EM1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976802D660F
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 16:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753891456; cv=none; b=uj/TclRRENMMvdU2k7waic6GOOoHnWeMIO5F/IsPkiGGvbMM3R03QIAFE3QZjnaJmzWPcwCKBusGHyzkiqsqIYM9IqTMeHvWQ9S/COAIe5/lJ+54LN2ixCfLwprQ1R85lvC6g0X5JFdMcW7Y2gTdaXf7OZWDNimkaD2qSti9zrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753891456; c=relaxed/simple;
	bh=sr3vr86B1WN6egX5ufe1jMCAJdnTsepBNRthFxntilc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dZsBUs4pqfyfaTUVLh8uHdKnStHPA+Ofy2msWO9X/g0xI4hrN07TbPlKu/VZvWBPikt+AEHO4oPcZ89gJswaoTYDpB4euUvsUWk8hsBPrMYBV7v0kHrQTOJ6MkSXxn0VarJpM9SqQD/eHGkTn1wPP4epjVUVqWn8ve404kABuPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JwoG9EM1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbVJl017964
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 16:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vEvv3sPokNm+5Tvls5hoRKnz9U+q/8E6FLS31sVCUzQ=; b=JwoG9EM1tZr7rcRP
	xTKJq7md72xo2IERlDEm+qAODSt59eUv5uetLd2vxYsJ0MyZrTiZl8baDLpgTW7i
	9qntRXzozf7YWEMDcz7RlN0CoqqiK0fxLge5TBRqkQdPKVjyNN/+T1liswLfU2IR
	KkPHINTmv7GRsR8HSYknlNwcZtiMBEDrZmSfNwfMkIcLG6HdJIbk4UgVOz3VN5u5
	0Oo6Xx3yUdFSmK0sP13O2grYEseeCGVRatBnj9c8SWBHL4j/iYtKnfPFxHrLtEkI
	FSgBnr09kYrFmsKsPMAE3iZn3C/+96BrjIbFX27g39X30mqO1W9YzT6J2RwTfTux
	8M+bPw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda4akf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 16:04:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23ff7d61fb7so9354085ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 09:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753891452; x=1754496252;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vEvv3sPokNm+5Tvls5hoRKnz9U+q/8E6FLS31sVCUzQ=;
        b=k0oNyhmtktqNen608fZeIhrBmYdUC2Lg0VS5KIhJMbFM1RcZIsLb9OmPzuWKCujCjT
         gHeoX9rEiPsq9T+2bPUqu3L4b9uaPuhKnSPSK/Uce182bJr9ZJOmKRjqwhqNECMH/5df
         FSTQ8ENIa/a4csb1A1hSjM5W+uEDU4s9fx9KtIRum/AU5YBQFeWgTe7MUGtYlNghSxjL
         y8pX8mnVXUyRB90D7sR7VpW3ASHxSSFl+7+WMi9YquMpP6EsI61u6tY83QlpTLx188rG
         VfFqFmQUNFQ9OTgpplqtziB1v06ETDIoCK7SMuYnmmicNytXX0iy9RoXtlSSDBdZTPyi
         uf5A==
X-Gm-Message-State: AOJu0YzPkvY/uICptH8aLe7XEaG4JbH6SMxgYh+VfKHzrA65WUP0QJ3v
	tyK8KjtnNghseC3Vr22cmYS7OYwgpB9Sls6iVTml0TUompUAluM876cQpOCVaEOTn9P74EezPCV
	G+OOG77KbW3gA2pfKaoSAhxV/52KueZy2X8gQfACgYFdqpzbPrI/iFcKIh6l+PGvb98El
X-Gm-Gg: ASbGnct+adAJunZcIgqPL9mDiR2SBSWav0ZYs5mEZ2R35fsI4xQWSe5sOSmPFC9S1zg
	o7ABoID6yuup4u3NbLehzkk9XkFRMnj1DEFanIjyOwy+kS503DMHp6UyJUIv3bYao/xGb/wz0Ku
	mUs4XJhRMVN/D50yOHXa+6DymQwOclxA96kcg5un1Oi9a4KqsIoM0c1trEAUgOe+qGdSiFR05ZH
	pSpG3AngV2zg7LzcMcToh8mIWtonLYU5zNH6BCIYQWTILvPzo9pQSs+iEc66jiBEB3cNzKPQ4bt
	ZCHG9D3GW1bYujX2W2WN351Wvkos3WCFoENXo0HQ7qeqGeDNbiivoagEPp8cafZN
X-Received: by 2002:a17:903:22cf:b0:240:86b2:ae9c with SMTP id d9443c01a7336-24096884152mr66915815ad.14.1753891451788;
        Wed, 30 Jul 2025 09:04:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8Yb95xSZJkf9AVMlWP7JbQuzQGC5knnubldONN4jD2EOrvcArH9iLv1igJvYIL1fbR7bDCw==
X-Received: by 2002:a17:903:22cf:b0:240:86b2:ae9c with SMTP id d9443c01a7336-24096884152mr66915295ad.14.1753891451165;
        Wed, 30 Jul 2025 09:04:11 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2403c96e4cfsm67345655ad.25.2025.07.30.09.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 09:04:10 -0700 (PDT)
Message-ID: <54b36b37-c1a6-4e1b-842d-a1d4872da180@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 21:34:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Add ACD levels for GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250729-topic-sm8650-upstream-gpu-acd-level-v1-1-258090038a41@linaro.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250729-topic-sm8650-upstream-gpu-acd-level-v1-1-258090038a41@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QF3yqREpYqfez9VNcrlZBG4RNTqL-omR
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688a427d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=HRpvt/FSzHA3SJMKks594A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=S8knCjkmKkfcu8I3GasA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: QF3yqREpYqfez9VNcrlZBG4RNTqL-omR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDExNSBTYWx0ZWRfXwkJqpNVDJMWe
 BLD0c+8k3I/LqnCgQFcFL/6cAPgJ1D1CuNKMQi7YpYg5wmraUxq//LqXZvgfDZyquhUm/jTHO/O
 igBWG6H0gw+fSMWUCkavKULiSTkw9xdZiyo20SAcy7dfqAHv6rjVN/7bpfDqKLbh1Io+sPr1o4H
 6dP44tT26izEJ18Dd75SZrhw5bPDilTxd5gTQkoiP+tI07YyDaLy41XbExExO09rQGBYYpwOlOP
 2eacmsyRS5O331aniNJeSpkuucptIAroto511wvRbdrYw8FS6Nwold8H5y6U7b2ZLF3i3I3gp9b
 rSf67dtNJ6OyyOf3V9Bh64tUw5MB6Y5/QUBrPaoACb52m0+WCNY1VzpunRC80YTtn7PYpbBvYpN
 UG0k5pCHjt7oLTUTPS5PCxk+nshglVB9H9oTy1AL3ZE8ujXyGhsH37gRraDyP66nw6/O9DEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_05,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=908 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300115

On 7/29/2025 8:10 PM, Neil Armstrong wrote:
> Update GPU node to include acd level values.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil.

> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 495ea9bfd008500dd2c9f46ceca94cf5f972beca..4cd933219ce008bd1c603c87778e210b6332e29c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4127,72 +4127,84 @@ zap-shader {
>  
>  			/* Speedbin needs more work on A740+, keep only lower freqs */
>  			gpu_opp_table: opp-table {
> -				compatible = "operating-points-v2";
> +				compatible = "operating-points-v2-adreno",
> +					     "operating-points-v2";
>  
>  				opp-231000000 {
>  					opp-hz = /bits/ 64 <231000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
>  					opp-peak-kBps = <2136718>;
> +					qcom,opp-acd-level = <0xc82f5ffd>;
>  				};
>  
>  				opp-310000000 {
>  					opp-hz = /bits/ 64 <310000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
>  					opp-peak-kBps = <2136718>;
> +					qcom,opp-acd-level = <0xc82c5ffd>;
>  				};
>  
>  				opp-366000000 {
>  					opp-hz = /bits/ 64 <366000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
>  					opp-peak-kBps = <6074218>;
> +					qcom,opp-acd-level = <0xc02e5ffd>;
>  				};
>  
>  				opp-422000000 {
>  					opp-hz = /bits/ 64 <422000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
>  					opp-peak-kBps = <8171875>;
> +					qcom,opp-acd-level = <0xc02d5ffd>;
>  				};
>  
>  				opp-500000000 {
>  					opp-hz = /bits/ 64 <500000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
>  					opp-peak-kBps = <8171875>;
> +					qcom,opp-acd-level = <0xc02a5ffd>;
>  				};
>  
>  				opp-578000000 {
>  					opp-hz = /bits/ 64 <578000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
>  					opp-peak-kBps = <8171875>;
> +					qcom,opp-acd-level = <0x882c5ffd>;
>  				};
>  
>  				opp-629000000 {
>  					opp-hz = /bits/ 64 <629000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
>  					opp-peak-kBps = <10687500>;
> +					qcom,opp-acd-level = <0x882a5ffd>;
>  				};
>  
>  				opp-680000000 {
>  					opp-hz = /bits/ 64 <680000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>  					opp-peak-kBps = <12449218>;
> +					qcom,opp-acd-level = <0x882a5ffd>;
>  				};
>  
>  				opp-720000000 {
>  					opp-hz = /bits/ 64 <720000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
>  					opp-peak-kBps = <12449218>;
> +					qcom,opp-acd-level = <0x882a5ffd>;
>  				};
>  
>  				opp-770000000 {
>  					opp-hz = /bits/ 64 <770000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
>  					opp-peak-kBps = <12449218>;
> +					qcom,opp-acd-level = <0x882a5ffd>;
>  				};
>  
>  				opp-834000000 {
>  					opp-hz = /bits/ 64 <834000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
>  					opp-peak-kBps = <14398437>;
> +					qcom,opp-acd-level = <0x882a5ffd>;
>  				};
>  			};
>  		};
> 
> ---
> base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
> change-id: 20250729-topic-sm8650-upstream-gpu-acd-level-1c430e7f158f
> 
> Best regards,


