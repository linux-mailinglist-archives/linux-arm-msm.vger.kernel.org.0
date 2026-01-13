Return-Path: <linux-arm-msm+bounces-88712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AD833D1781C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81A6A3015002
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3072D38171A;
	Tue, 13 Jan 2026 09:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="afa6q0Iu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MBaAcbHQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623A63815F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295338; cv=none; b=mE7OBJtEV2PEvQR8239jpYnzZOmrqgmQfSDnzXRuqCvrPCn5Z+y4mIbHMLO/5io4bxDxSFwyat1gC+ApEV/5oQ1SVgz3JuGxNTaRBvgkMGouzawdAxHpFciCgsFIKGh1PwHtMwph9L2rROZIuAxxHwO380/GgNURYoYPTbn6vKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295338; c=relaxed/simple;
	bh=gXgkJa3V5UGosI1pkQpJ+YrOBIT//8Yf2IXQLuo/+6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MGjWTp9H09Y+1Ip1644ku04LdwIqOdNN4I/ynulojDQ73JQnmAR/OfijoVU0dvVSWAufYs1efVijWvsO0nVBrGT3ygayZ5QeSb7yebaVR4Pyxe17GAq5TqOevJddpelakw5LzGRKeWUy+piHhZz2z/C+qIQqIIPaNvf4ij0oLL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afa6q0Iu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBaAcbHQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D1tU2p2751284
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JdLFJ/uQ+pPbnD847vBfISgB9wpnc8AJfS8zIssFmyA=; b=afa6q0Iu6AYRs39j
	lDId8s9uWstKk94BYWmIL55Li7iQdNDnTYQJxwszQOvC/p3fRU7KKfX/tfxVHMUs
	9gkw+sQTqFl59lWvddAw0y0ExnpBVyN5l688Kja+K+0UmJm8bQNZDhGl4Rajm2d7
	DPlmmYrIZp25ko546pP1a/qAHOv+zXVjY3OHpYAHhxVZk1uUv0k8ljmqFFxYAcu1
	nWT2M0VkysMKtSgysLN93eiXlQo1o7vZdrJgxxM67ylKLjhzdQZb4PHBxiOmy5w7
	aeKHPBMFi9HVkV+BlnoIhxZ+yEQb18o28PnOv/9dw20JqW4aNYB+jvcS8doqTw5E
	e7XAnA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnctjs4c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:08:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso69488455ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768295328; x=1768900128; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JdLFJ/uQ+pPbnD847vBfISgB9wpnc8AJfS8zIssFmyA=;
        b=MBaAcbHQyMPb4hS45w30SoLd2Up4eNjs2EG43mkO1+PIWLvGVz/WbzNb4i7lbRznxx
         +HK2WglbT3XdFPoUQG8jKrC0FHYY4/9tv5+06OU3JHq4fFqGAQPQKZMiikg1K7V1Xr0I
         1YV4wfy8+dCJGTQMttbnHZTZZn9RqcZOZO5xIZXVVCXAfQTDuYPGBUXqVmVF31do0k1I
         367gbnL9lqD1NAg+2bd9kOI2EZNYmYqGOtlNw6dgpa/JBqnsyzZpjmWMVyK+4b0I3Dae
         rLQLYbAly86A0BOdMRunnTn86LFCZSykKfgtUtIl06bLRQFDdfz8e1Fmp2XBGMspvdkG
         dVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295328; x=1768900128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JdLFJ/uQ+pPbnD847vBfISgB9wpnc8AJfS8zIssFmyA=;
        b=AsNfTZbOiNA9EDtlcG44WeTtqDvJTMUr7M+rfAv3TsWhJHUELt2qia8ahHYJRmJozL
         8H3iRa/Vw1uOmJGnC6Q8SFg/PQpZ7PtzObmTsZBrLxmdYnQzmLRIBJHJwdtqWont7Kdj
         NzY5k3GlmFAVH7c6OofcG5b2sPXkYpiAO8/YhciUlgy++vVURyf0KPL6SfnPe19JEJHA
         BiUNNEA24YmsDkpFruZDopGXErS2oLFDWocmGIx8DUNkSTFGtxH3v35+rIs4HrorbIQn
         8Iw8CNtTWntta40TLEi90DxvD6airCtZhOWoZ6GJynT6ForMeVng7uA024fO339osncI
         wh7A==
X-Gm-Message-State: AOJu0YxdD5qIXsrwg+XGHHu0qolUP11u/G+NNzUePt7LQqEHnWiw8A4E
	9FnQe5kcI4eEIYClAOIGxlLs6EmYLCERyzklXCakXl1MqXLuIVe8h25WQlhZ/qw2Y+ZjCDgVeJ9
	1Xx7MxEBnkIRHH96SpU0dPbVIcMSv8x6UjctMFzOFhV36vmNSNXjSVC+NhlrVvnHvQgLz
X-Gm-Gg: AY/fxX4nc1TH38a2B4BjOls8d0W7CH7a9OIsAfaY61TekO6Nn2T16eHCyxirIyBZYs8
	mbQPjbV3J2cfYb+p829cLpk4FDIAuupV1CoQvJAVG3zN/nI6Lsxkcos/QG2PMclNu3kxJ/KgzFv
	AfMcWEBLnL4BN7KZxI1ofmCnlrBacmOtXW4226KVHzYIZwOkeNJjmP2e1L19DNlpaSzcX4IVs25
	n7bC0rKumyXpdCbU1WuPx3zh8MCxYiVu61vJlYdi5tKUPP9+tNPZEG1imyYzQRieZmIDPIU9eds
	WA4B+LGl/a7hZfkqhK8rQGEOPwARoRYOiePyzOHGDuLFwbSESH6+9rPx5FCv3LfUaD6WPA6/GOe
	2unBBF7bKdNIts+sc+bU+I+KT66ES5gJ0tnflxr+C7RkXyBIu59cYE8vXotPJohiKEKhbj7Btun
	Q=
X-Received: by 2002:a17:903:3808:b0:2a0:d629:903f with SMTP id d9443c01a7336-2a3ee40d4efmr176710225ad.9.1768295327769;
        Tue, 13 Jan 2026 01:08:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmGwEM2KWTuP/KoPYp2BCVNroXrV/xWdnNyPhKZszuzziSw/e4Q4uYSRWpcmvn8uAcrYeJzQ==
X-Received: by 2002:a17:903:3808:b0:2a0:d629:903f with SMTP id d9443c01a7336-2a3ee40d4efmr176709785ad.9.1768295327099;
        Tue, 13 Jan 2026 01:08:47 -0800 (PST)
Received: from [10.133.33.217] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48dc1sm192622115ad.40.2026.01.13.01.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 01:08:45 -0800 (PST)
Message-ID: <ab0e47c2-ed5f-4c6b-a349-adcb58df2c6e@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 17:08:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: qcom: dts: sm8750: add coresight nodes
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
References: <20251120-add-coresight-nodes-for-pakala-v3-1-03bb7651bc90@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251120-add-coresight-nodes-for-pakala-v3-1-03bb7651bc90@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3NiBTYWx0ZWRfXy/0FBn3OACE7
 tvX43z3rSqJm0eDduFtgcsB9BJuGiFr2pZLTHL5W62tB6bEWePNry1d370Z1I1w9C/y7VUm9lff
 nFStd9vesr09SvS+XzENQiWqPRPQEDJHwtvdbizMVwNMxO9ddsk2AQFf5w+nRUglIFfj5kKaDG7
 FsRu3yLt/ipiBE0geIShJCFIhkN2kq3F3QrnyPF51YsC+KFZAYMLE13Jt/8lVjuMNVleOQMcl8Y
 fG0swUMn/EzQgs3kIQl+YWTezhAk+rkEHFHYKhvZ1sbDgr42O3gvrmbTf0oNjj3SLD9c0OgGcjG
 mTw942ttuPEIQvRZN4QF4kkpPoFjWhej5g1fN3S71JZvxHV6J0/TrV+F0FiLtAEEbsAiKTIwf4S
 kVrfz9cIY+r45RgpHqVTyO5ZaFINMBWMfJ2faS/ZUacxck2jrSEzihIQFboxfRi7a0XG9+Wnhgj
 O6EakCY616EOOtfyiFg==
X-Authority-Analysis: v=2.4 cv=Ls2fC3dc c=1 sm=1 tr=0 ts=69660ba1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=o8teyqYg6mDGP7hff8QA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: u_uQFScnKRuI8ltqHx1VZa7-iT8UFAKZ
X-Proofpoint-GUID: u_uQFScnKRuI8ltqHx1VZa7-iT8UFAKZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130076



On 11/20/2025 9:48 PM, Jie Gan wrote:
> Add CoreSight DT nodes for AOSS, QDSS, CDSP, and Modem blocks to enable
> the STM and TPDM sources to route trace data to the ETF for debugging.
> 

Gentle ping.

> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Changes in v3:
> - replace the turing string with cdsp.
> - Link to v2: https://lore.kernel.org/r/20251120-add-coresight-nodes-for-pakala-v2-1-3f09ec715dea@oss.qualcomm.com
> 
> Changes in v2:
> - fix format issue.
> - Link to v1: https://lore.kernel.org/r/20251117-add-coresight-nodes-for-pakala-v1-1-d26bfaa44fe7@oss.qualcomm.com
> ---
>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 980 +++++++++++++++++++++++++++++++++++
>   1 file changed, 980 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 3f0b57f428bb..f013198a1a0b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -3313,6 +3313,947 @@ tcsrcc: clock-controller@f204008 {
>   			#reset-cells = <1>;
>   		};
>   
> +		stm@10002000 {
> +			compatible = "arm,coresight-stm", "arm,primecell";
> +			reg = <0x0 0x10002000 0x0 0x1000>,
> +			      <0x0 0x37280000 0x0 0x180000>;
> +			reg-names = "stm-base",
> +				    "stm-stimulus-base";
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					stm_out: endpoint {
> +						remote-endpoint = <&funnel_in0_in7>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@10004000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x10004000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					tpda_qdss_in1: endpoint {
> +						remote-endpoint = <&tpdm_spdm_out>;
> +					};
> +				};
> +
> +			};
> +
> +			out-ports {
> +				port {
> +					tpda_qdss_out: endpoint {
> +						remote-endpoint = <&funnel_in0_in6>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1000f000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1000f000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_spdm_out: endpoint {
> +						remote-endpoint = <&tpda_qdss_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10041000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x10041000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					funnel_in0_in0: endpoint {
> +						remote-endpoint = <&tn_ag_out>;
> +					};
> +				};
> +
> +				port@6 {
> +					reg = <6>;
> +
> +					funnel_in0_in6: endpoint {
> +						remote-endpoint = <&tpda_qdss_out>;
> +					};
> +				};
> +
> +				port@7 {
> +					reg = <7>;
> +
> +					funnel_in0_in7: endpoint {
> +						remote-endpoint = <&stm_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel_in0_out: endpoint {
> +						remote-endpoint = <&funnel_aoss_in7>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10800000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10800000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_modem0_out: endpoint {
> +						remote-endpoint = <&tpda_modem_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@10803000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x10803000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					tpda_modem_in0: endpoint {
> +						remote-endpoint = <&tpdm_modem0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					tpda_modem_in1: endpoint {
> +						remote-endpoint = <&tpdm_modem1_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					tpda_modem_out: endpoint {
> +						remote-endpoint = <&funnel_modem_dl_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10804000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x10804000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					funnel_modem_dl_in0: endpoint {
> +						remote-endpoint = <&tpda_modem_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel_modem_dl_out: endpoint {
> +						remote-endpoint = <&tn_ag_in13>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cti@1080b000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x0 0x1080b000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		tpdm@1082c000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1082c000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_gcc_out: endpoint {
> +						remote-endpoint = <&tn_ag_in17>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10841000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10841000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_prng_out: endpoint {
> +						remote-endpoint = <&tn_ag_in18>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1084e000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1084e000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_mm_bcv_out: endpoint {
> +						remote-endpoint = <&tpda_mm_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1084f000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1084f000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_mm_lmh_out: endpoint {
> +						remote-endpoint = <&tpda_mm_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10850000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10850000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_mm_dpm_out: endpoint {
> +						remote-endpoint = <&tpda_mm_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@10851000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x10851000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					tpda_mm_in0: endpoint {
> +						remote-endpoint = <&tpdm_mm_bcv_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					tpda_mm_in1: endpoint {
> +						remote-endpoint = <&tpdm_mm_lmh_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					tpda_mm_in2: endpoint {
> +						remote-endpoint = <&tpdm_mm_dpm_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					tpda_mm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10980000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10980000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_cdsp_out: endpoint {
> +						remote-endpoint = <&tpda_cdsp_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@10986000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x10986000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					tpda_cdsp_in0: endpoint {
> +						remote-endpoint = <&tpdm_cdsp_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					tpda_cdsp_in1: endpoint {
> +						remote-endpoint = <&tpdm_cdsp_llm_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					tpda_cdsp_in2: endpoint {
> +						remote-endpoint = <&tpdm_cdsp_llm2_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					tpda_cdsp_out: endpoint {
> +						remote-endpoint = <&funnel_cdsp_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10987000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x10987000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					funnel_cdsp_in0: endpoint {
> +						remote-endpoint = <&tpda_cdsp_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel_cdsp_out: endpoint {
> +						remote-endpoint = <&tn_ag_in16>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cti@1098b000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x0 0x1098b000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		tpdm@109a3000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x109a3000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-msrs-num = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_pmu_out: endpoint {
> +						remote-endpoint = <&tn_ag_in29>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@109a4000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x109a4000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_ipcc_cmb_out: endpoint {
> +						remote-endpoint = <&tn_ag_in28>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@109a5000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x109a5000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_dl_mm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in25>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@109a6000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x109a6000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_north_dsb_out: endpoint {
> +						remote-endpoint = <&tn_ag_in26>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@109a7000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x109a7000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_south_dsb_out: endpoint {
> +						remote-endpoint = <&tn_ag_in27>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@109a8000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x109a8000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_rdpm_cmb0_out: endpoint {
> +						remote-endpoint = <&tn_ag_in30>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@109a9000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x109a9000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_rdpm_cmb1_out: endpoint {
> +						remote-endpoint = <&tn_ag_in31>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@109aa000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x109aa000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_rdpm_cmb2_out: endpoint {
> +						remote-endpoint = <&tn_ag_in32>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tn@109ab000 {
> +			compatible = "qcom,coresight-tnoc", "arm,primecell";
> +			reg = <0x0 0x109ab000 0x0 0x4200>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					tn_ag_in4: endpoint {
> +						remote-endpoint = <&tpda_mm_out>;
> +					};
> +				};
> +
> +				port@d {
> +					reg = <0xd>;
> +
> +					tn_ag_in13: endpoint {
> +						remote-endpoint = <&funnel_modem_dl_out>;
> +					};
> +				};
> +
> +				port@10 {
> +					reg = <0x10>;
> +
> +					tn_ag_in16: endpoint {
> +						remote-endpoint = <&funnel_cdsp_out>;
> +					};
> +				};
> +
> +				port@11 {
> +					reg = <0x11>;
> +
> +					tn_ag_in17: endpoint {
> +						remote-endpoint = <&tpdm_gcc_out>;
> +					};
> +				};
> +
> +				port@12 {
> +					reg = <0x12>;
> +
> +					tn_ag_in18: endpoint {
> +						remote-endpoint = <&tpdm_prng_out>;
> +					};
> +				};
> +
> +				port@13 {
> +					reg = <0x13>;
> +
> +					tn_ag_in19: endpoint {
> +						remote-endpoint = <&tpdm_qm_out>;
> +					};
> +				};
> +
> +				port@19 {
> +					reg = <0x19>;
> +
> +					tn_ag_in25: endpoint {
> +						remote-endpoint = <&tpdm_dl_mm_out>;
> +					};
> +				};
> +
> +				port@1a {
> +					reg = <0x1a>;
> +
> +					tn_ag_in26: endpoint {
> +						remote-endpoint = <&tpdm_north_dsb_out>;
> +					};
> +				};
> +
> +				port@1b {
> +					reg = <0x1b>;
> +
> +					tn_ag_in27: endpoint {
> +						remote-endpoint = <&tpdm_south_dsb_out>;
> +					};
> +				};
> +
> +				port@1c {
> +					reg = <0x1c>;
> +
> +					tn_ag_in28: endpoint {
> +						remote-endpoint = <&tpdm_ipcc_cmb_out>;
> +					};
> +				};
> +
> +				port@1d {
> +					reg = <0x1d>;
> +
> +					tn_ag_in29: endpoint {
> +						remote-endpoint = <&tpdm_pmu_out>;
> +					};
> +				};
> +
> +				port@1e {
> +					reg = <0x1e>;
> +
> +					tn_ag_in30: endpoint {
> +						remote-endpoint = <&tpdm_rdpm_cmb0_out>;
> +					};
> +				};
> +
> +				port@1f {
> +					reg = <0x1f>;
> +
> +					tn_ag_in31: endpoint {
> +						remote-endpoint = <&tpdm_rdpm_cmb1_out>;
> +					};
> +				};
> +
> +				port@20 {
> +					reg = <0x20>;
> +
> +					tn_ag_in32: endpoint {
> +						remote-endpoint = <&tpdm_rdpm_cmb2_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					tn_ag_out: endpoint {
> +						remote-endpoint = <&funnel_in0_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@109d0000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x109d0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_qm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in19>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10b04000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x10b04000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@6 {
> +					reg = <6>;
> +
> +					funnel_aoss_in6: endpoint {
> +						remote-endpoint = <&tpda_aoss_out>;
> +					};
> +				};
> +
> +				port@7 {
> +					reg = <7>;
> +
> +					funnel_aoss_in7: endpoint {
> +						remote-endpoint = <&funnel_in0_out>;
> +					};
> +				};
> +
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel_aoss_out: endpoint {
> +						remote-endpoint = <&tmc_etf_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tmc@10b05000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x10b05000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					tmc_etf_in: endpoint {
> +						remote-endpoint = <&funnel_aoss_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@10b08000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x10b08000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					tpda_aoss_in0: endpoint {
> +						remote-endpoint = <&tpdm_swao_prio0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					tpda_aoss_in1: endpoint {
> +						remote-endpoint = <&tpdm_swao_prio1_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					tpda_aoss_in2: endpoint {
> +						remote-endpoint = <&tpdm_swao_prio2_out>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +
> +					tpda_aoss_in3: endpoint {
> +						remote-endpoint = <&tpdm_swao_prio3_out>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					tpda_aoss_in4: endpoint {
> +						remote-endpoint =<&tpdm_swao_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					tpda_aoss_out: endpoint {
> +						remote-endpoint = <&funnel_aoss_in6>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10b09000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10b09000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_swao_prio0_out: endpoint {
> +						remote-endpoint = <&tpda_aoss_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10b0a000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10b0a000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_swao_prio1_out: endpoint {
> +						remote-endpoint = <&tpda_aoss_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10b0b000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10b0b000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_swao_prio2_out: endpoint {
> +						remote-endpoint = <&tpda_aoss_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10b0c000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10b0c000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_swao_prio3_out: endpoint {
> +						remote-endpoint = <&tpda_aoss_in3>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@10b0d000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x10b0d000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tpdm_swao_out: endpoint {
> +						remote-endpoint = <&tpda_aoss_in4>;
> +					};
> +				};
> +			};
> +		};
> +
>   		apps_smmu: iommu@15000000 {
>   			compatible = "qcom,sm8750-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>   			reg = <0x0 0x15000000 0x0 0x100000>;
> @@ -4239,4 +5180,43 @@ timer {
>   			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
>   			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>   	};
> +
> +	tpdm-cdsp-llm {
> +		compatible = "qcom,coresight-static-tpdm";
> +		qcom,cmb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				tpdm_cdsp_llm_out: endpoint {
> +					remote-endpoint = <&tpda_cdsp_in1>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-cdsp-llm2 {
> +		compatible = "qcom,coresight-static-tpdm";
> +		qcom,cmb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				tpdm_cdsp_llm2_out: endpoint {
> +					remote-endpoint = <&tpda_cdsp_in2>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-modem1 {
> +		compatible = "qcom,coresight-static-tpdm";
> +		qcom,dsb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				tpdm_modem1_out: endpoint {
> +					remote-endpoint = <&tpda_modem_in1>;
> +				};
> +			};
> +		};
> +	};
>   };
> 
> ---
> base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
> change-id: 20251117-add-coresight-nodes-for-pakala-65620d8ca6e9
> 
> Best regards,


