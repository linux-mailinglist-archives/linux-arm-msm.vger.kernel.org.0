Return-Path: <linux-arm-msm+bounces-87596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3CFCF6450
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 02:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 259CA304D8DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 01:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34221EF39E;
	Tue,  6 Jan 2026 01:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LayIF0Q7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dHsradVn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528B87640E
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 01:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767663001; cv=none; b=Zrb/G7jSMqp/jkQWsPDYHbrAG7La/FHyKBcJpyLQnY83CbM7CSIegfpewsEeCvH6cSNyF2U4UAtyVL/sAM+pEPbv/ovY8stIIxd667e0QQsDgrTjzpgp7c5gQ/wh3556r3Q9cavd5A88esy2rgPycnSfHNzNElJqosgf5rA+ilk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767663001; c=relaxed/simple;
	bh=j24mNQooiAFErYeESu2vAfQJZcAiCYndswDhrOTwICk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OL1ft/7Y5SrBJuUAZVrh5SzvLKuRpzQIlfqZozU7r5kJMGO1VzfQJLMYmqKzMAif0aS6Hu+VCFBm8nxvy7H4hQfjqWJYnhh7wwMlbqOFwFt7NhtnnkBDLr8jpno14J7U3/ZkdAcCNPxQchS3SzIjaT2L4opvbAGIyan0prZ9bqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LayIF0Q7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dHsradVn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nQSk2943744
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 01:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cEML6pOrA849wZuEgdOsJGjlKLmi52IL7r85pj59rk4=; b=LayIF0Q7t2nolf+a
	NdwcSYzm2SBMHKdiMK/cOY+kVgcsBBOpRyiA6Iz7jY9UBcAkogn32PPfm/bsKd06
	idKq5o2YYVdebufB2FQZCrBm4ZOfgw2oO+QsZ7HjCEJGbutW4XILAae5IJg4kD45
	g5ArZdHc4ZqbMf6S59PqccTrmpKzbXyfQFjcxSQkk7Hin0qGb66RyxQfZ3WAx1fQ
	xZmWqwcvVpazkZzYpeuuSoWx3CYGMKVtuoKomwU1KwGhngGBB1uVG0B9fJebAYrW
	9j6XhwIBGLHV8G+lFTOnAKnc7SfYTWGLDZM2adcK461BFzdoBsPA+grmziZDIpF/
	ffBPQA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv01h3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 01:29:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0d43fcb2fso14152995ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 17:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767662999; x=1768267799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cEML6pOrA849wZuEgdOsJGjlKLmi52IL7r85pj59rk4=;
        b=dHsradVnLm2k3Y1CLD5RkHPHsU56QRI9JNYhAYATcJshfB3fujIsgvujmX/VF20AIv
         YlN8QfgwApBYilTS/5TzqcNcBDwpxDYjddVy2M0TkCIJpSDMX3XwttXgI+GfG33KiuCY
         UFaRxSiXEAKmdY5W9azPmCfHWkY5c6fFBZq6M2ukwz/vLXG+nbd7exr/0EmVZIMq5cSy
         A84AI06bxyRd+CBlCa2f5XWYtxxYUHYjDLTYbuLT7Id6+pCtthC2e0S0ktmzWinaA6dE
         FQAV0/+l0hngQQYSP7QJvnd/ZBFpKALzpzvHrsMKK/GhHK7VUwR45TCBSJrZwntvd2j+
         gjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767662999; x=1768267799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEML6pOrA849wZuEgdOsJGjlKLmi52IL7r85pj59rk4=;
        b=XPHWZNcNlpqmpX7ekpbFjxux/nBcrRIJArQgHDMCXU+xYA1qeMA5MmxlTgKlvfSmww
         /QLC0rjTulN9jkBKektnmfneEMRXHYDVqMndcOYJiaCrIRkT9aNPP2ntpbWI5gP+w978
         AOR3g328g+zT0UAzTV6tlNH279z9e30qrmMlYrLmLjCnz/UyHwcag4feG7OvvKTwNvKm
         xpFjNOCu1FPUjZYWXcqxMCUQ7UoUajfPOb0DoC4q9EH3u/Jx2+qFKXK3qOE73RSLyASb
         tO4kYM6zJVaaaiwyyml6am+Mj8qSXuQA9EcmxCmpzWYmkrB322J5RU90pXI8P9u4u9t9
         TNuw==
X-Gm-Message-State: AOJu0Yx4hH3LdN0CWoIQSaHK/yhIxKZMeR/xXCDseygZzA18diwREVYh
	l51eBgUiAkd6+82mmBQH2uSSwaNaQhvty/mf6I/hyjS1/EflDx9CHm65yA+MCgu3oYTAA6Hn0yw
	PkI3LqqcDjgMcM3EM0QWGG/CUNEFG5uv4HXET3V0VO6PPBVIxjcG933ZC67JS5HvbHIT+
X-Gm-Gg: AY/fxX7rE7JNwNWz1WIKSYpes6E4lYQKN4ojPa6lQMawc+Mov4Oe6ROo2A3zhV2WVzo
	P+pTuSka/EFoblyMA5nuRjLkuAnBoeUrF6SgjN4eFNwdD1U7Z8hWG5aPfqM3Sui7hE5g5gnZquv
	hbwHwQRETc3p5L8Jw/dY5fb5IjVR42UFEKLFsTHxjoltQ6uam7AIBox3dbdtaND0uMqXhliQ4wf
	khvb28RYIBgO5j8UAJJFRBIgaYXCyx/Oub/OHYHSzJXRuoFI2sG7npPala7Qk85SCsNHV0luaw3
	QZnWdx7cYOofmyUJkmN31WBdcNh2OqNcxWjBjSJMnIKw1gxhplKAtfZZtlcg7OsWqX3U/J8UylQ
	1Y9eMBcMRx/4qDBstE4DgTN6clHL4y4RQJB78m7qRhy92AaWsJ68xZjofV11hpUxX9chr5okyTN
	Q=
X-Received: by 2002:a17:903:2342:b0:298:344:1229 with SMTP id d9443c01a7336-2a3e2e1e544mr12113095ad.55.1767662998871;
        Mon, 05 Jan 2026 17:29:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5+7CG5xgC4gLsroYKzxVVsBNnVADKYWQW7AEKJd7RNZaU9tSR1esDn4MXfLTh2KoFIFE6zQ==
X-Received: by 2002:a17:903:2342:b0:298:344:1229 with SMTP id d9443c01a7336-2a3e2e1e544mr12112765ad.55.1767662998367;
        Mon, 05 Jan 2026 17:29:58 -0800 (PST)
Received: from [10.133.33.149] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd495dsm4208955ad.96.2026.01.05.17.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 17:29:57 -0800 (PST)
Message-ID: <3618ea01-1fc4-4fc8-a0d7-23336c633435@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 09:29:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: monaco: Add CTCU and ETR nodes
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
References: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
 <20251103-enable-ctcu-for-monaco-v4-2-92ff83201584@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251103-enable-ctcu-for-monaco-v4-2-92ff83201584@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695c6597 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=li7pXvKEtyOYx0Cqe80A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: x3A-cQIbbYMRmDhrj4p1sXc3PFZQnXjn
X-Proofpoint-ORIG-GUID: x3A-cQIbbYMRmDhrj4p1sXc3PFZQnXjn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAxMCBTYWx0ZWRfX0obgV1ZB27Aw
 cgLAcbq7Q9O9JPbUwIat4q1RgU549dGWPbjqsFmU+AQHFG88ICqzfy71WVVBHmBApg7VdgqDCgk
 iNjJc/OeLiKxmyQzkvfcYypAJEmh30KPEVne58DsWI1brJsnEoVQawvqfrdKsNJxEuBxKdprenJ
 xqmgWNMVteTE2gACgdfG7kQHfby23y80BZbtLKeZY06BrcBBV8TbTsgZyo4FZisQfo+IczWwFbk
 ES97QKzESBZPL8rQ4oO7JbNogkPvrVzx4k76Qqv3gEibV9d3j7BFc2+fmywrtYBHCtFebCyii7K
 It0AiZ8pRLso4frQ8GUDAQBmgFst/po6efOU+pPxKl3f5Uez7MAbMZl+diGnwv0d+jXUOhDRUE7
 6tRbhyqjGm0rmXRLMk3OEv9BT3DRuaCw2MGIX/nCTgRbqKvMuUsraK/wjzlsmfIW5gROyT4geMs
 v4rlpMRJw0yS8QLrfVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060010



On 11/3/2025 3:06 PM, Jie Gan wrote:
> Add CTCU and ETR nodes in DT to enable expected functionalities.
> 

Gentle ping, this patch should go through QCOM tree.

> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/monaco.dtsi | 153 +++++++++++++++++++++++++++++++++++
>   1 file changed, 153 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index 816fa2af8a9a..1966dfad2dcc 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -2483,6 +2483,35 @@ lpass_ag_noc: interconnect@3c40000 {
>   			qcom,bcm-voters = <&apps_bcm_voter>;
>   		};
>   
> +		ctcu@4001000 {
> +			compatible = "qcom,qcs8300-ctcu", "qcom,sa8775p-ctcu";
> +			reg = <0x0 0x04001000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ctcu_in0: endpoint {
> +						remote-endpoint = <&etr0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					ctcu_in1: endpoint {
> +						remote-endpoint = <&etr1_out>;
> +					};
> +				};
> +			};
> +		};
> +
>   		stm@4002000 {
>   			compatible = "arm,coresight-stm", "arm,primecell";
>   			reg = <0x0 0x04002000 0x0 0x1000>,
> @@ -2677,6 +2706,122 @@ qdss_funnel_out: endpoint {
>   			};
>   		};
>   
> +		replicator@4046000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x04046000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					qdss_rep_in: endpoint {
> +						remote-endpoint = <&swao_rep_out0>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					qdss_rep_out0: endpoint {
> +						remote-endpoint = <&etr_rep_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tmc@4048000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x04048000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			iommus = <&apps_smmu 0x04c0 0x00>;
> +
> +			arm,scatter-gather;
> +
> +			in-ports {
> +				port {
> +					etr0_in: endpoint {
> +						remote-endpoint = <&etr_rep_out0>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					etr0_out: endpoint {
> +						remote-endpoint = <&ctcu_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@404e000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x0404e000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					etr_rep_in: endpoint {
> +						remote-endpoint = <&qdss_rep_out0>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					etr_rep_out0: endpoint {
> +						remote-endpoint = <&etr0_in>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					etr_rep_out1: endpoint {
> +						remote-endpoint = <&etr1_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tmc@404f000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x0404f000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			iommus = <&apps_smmu 0x04a0 0x40>;
> +
> +			arm,scatter-gather;
> +			arm,buffer-size = <0x400000>;
> +
> +			in-ports {
> +				port {
> +					etr1_in: endpoint {
> +						remote-endpoint = <&etr_rep_out1>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					etr1_out: endpoint {
> +						remote-endpoint = <&ctcu_in1>;
> +					};
> +				};
> +			};
> +		};
> +
>   		tpdm@4841000 {
>   			compatible = "qcom,coresight-tpdm", "arm,primecell";
>   			reg = <0x0 0x04841000 0x0 0x1000>;
> @@ -3106,6 +3251,14 @@ out-ports {
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
> +				port@0 {
> +					reg = <0>;
> +
> +					swao_rep_out0: endpoint {
> +						remote-endpoint = <&qdss_rep_in>;
> +					};
> +				};
> +
>   				port@1 {
>   					reg = <1>;
>   
> 


