Return-Path: <linux-arm-msm+bounces-88262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50156D08CD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 12:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFD453053BFB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 11:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C15233B971;
	Fri,  9 Jan 2026 11:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHD7/fCf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kKDetumn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E2833BBA9
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 11:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956546; cv=none; b=LzRrycEFWzy6j38EPLwjUVeyxrk1eylHjXKVxd4KtD78ak8cv1XiHskGcRs3AehM9aHkn+Nfcu8EtjE0yaDJPtbydxgdLu7wYrvzBiYw4V8lgvLjVKYNJ61BChLIhMqTZz93xLMPMCcK96g+8cU7iVY2lRcKRnZpy46kTQZvBF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956546; c=relaxed/simple;
	bh=FqZzeJElzO0rCzJz88AUbGG4Ue3lkUahvP2lMZJXq/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKyLi3QxLQDMg9ysrUo2UVT6zfPy/v5dG8pqSKNhnn3PI8kbUlGUcWhzCbRv3ib6lP9vWiC2AO/kI6DMc1jitjwUzcpLhWxER6wyH7TWNhhWBGNSYmKvzpYu97poHFqrcrg2jLFnhao+xyQcKa8PFCpl8lkwZJueknoCeJXDQ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHD7/fCf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kKDetumn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6096ET673019530
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 11:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GaJKIpZsmBkgWWZNLcb1c5XpnSAJ62BYR2TerfncxGM=; b=OHD7/fCfhck/wVKX
	qXXTB8v2fewQ1KGOw4qvyFvuY+0ggJqBTL+bYqttKbz3HWMX7tM+xwT7bTHx6MeO
	uYg0/sxLuDeSxI6FtoeNubHie2OyPI0xn7aXvaXoYhs83pw+Q5WerMcsieDA+Ups
	H6SRYrWjUWDiS/gFvnpS/egCIRirUQt9Ia9g4BVbtAOabiyTU0Flpvt4F6+2M+78
	k0jmHC6W0DJUNSG0x14qpyFrnd2nKIIdi/+ooc/+liDQR+3hVFF7aoH+suCLW/tm
	XeNPFVJK5QelweMozEbUrT5/CPJApZKJLPlU6ksbmCGtfEKq+Fp+iPOA8tkapzEg
	9p+I3g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjk3jeqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 11:02:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81c43a20b32so1945365b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 03:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767956543; x=1768561343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GaJKIpZsmBkgWWZNLcb1c5XpnSAJ62BYR2TerfncxGM=;
        b=kKDetumnQaaSPengy6ZFBRX7CR9sXzKVawUwMymbPQqqD50epEQsD3kQiJ86wYcTB7
         xTO8xpUwJ1QWh5IjEnNDDb9llxLWljYEfJs7X+womz2dXPlIz0IZMAucIYhgyW/K2Ubo
         7olkhX7/riaBkVlUE+3P4TsoidF6ks7rfKmdG9A8I8GBRol8+DYE29+BP16XX69+vKCU
         aU7YCnJJ5kqvte+Z9ggDMF9BELJHvlZIDkwLIfTOVYfnIFslqzTIF1JP4oDCSRy+1bPZ
         fUQ7ONbjNoGfqrJJ6ziWwZQOAK4Qbk83SZk70T5VFzkECgSKt8UZtb+z0CLtXiV47Kyg
         Gr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956543; x=1768561343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaJKIpZsmBkgWWZNLcb1c5XpnSAJ62BYR2TerfncxGM=;
        b=jfeFQ2OGEueM4TAHf+6G6jx5OpIbZdJfy9uyoG6dAkJmonmZ2mVXxJDgxI6Qoc1DJM
         w/tiwchvWMXKl3Lji3XH5zrifcS7MdoPBiucPS/7KNUtg1nNevx7Mm9MI+B3SAWoYMN9
         6iTmRU/Eldvk1zCgvAAJJnfdVtEt8K8WbpWOmaNA2ehv+mmvQS3AWcp0VP08PYMEUYfa
         EdWYIP/o3pbDXeK4BPHpMcdU31KuzwkHmTVGTJUfpBYEEYJSC2sbK2w5/wp0hl7SzwO6
         zGv/s1Re7dZUV4v7WbtiVRcJMfjZNPNKsTi5VpAL+cMxG1MYSGQMeN/pr2s9bgK11nz5
         0PKQ==
X-Gm-Message-State: AOJu0YwsPi553aig/adRRSLyXhqTagrFqbQhXRuvFUxkkLG5eVNKSZsK
	rn50RBu1PoHLIouywKh6LFPWDuFv08kiFln82oqHlqt+Gus7rErj7sYu2ySl8ay4Ag5XpyQT5O9
	x7mgjmqXSOaKqX1J9aumJHfqlHgJDBQId6uX8lJyBDpHVlPDBHQIS8ue/G+C6rPnvhHB8
X-Gm-Gg: AY/fxX7+kq/tgGw+PPiPHioMR8ovKek2SZAlUPHjATjENzZNT2+8EwLRL5fZoQH/URI
	rPTEC3Gsv9K+WFI1ufh6g5cAb1m74qfb0hKw2yr5TCkoJHiIfkC9bWDGas/kVJginqguP2Bhbjj
	45M/5dJ7z28Ps4YVI1T+7OxhoPr5AR1Sa52Mu7GWjpZlpmwoEnbMazZdewyXW9og1YDgm+M0zAV
	YIl7Vui1wTP30opjte6CxbLgrnfZqcebW5d1p+Wq+bjRgnKMlPhWjO+TgCNMhx4AGXxFd4UBpdp
	RFSrMVRAD+x+dp7R7npdosdlCi6pj6Lj3qjKSbAPlCArHVCj1uSOCPTj4b28YSqY0uzWSp5VOqi
	5TH90B0bTBl3dwsORzpevWgLVARS8FykyVFyJ4AFOFU5C0aIqDL5YrX/Fz7P4GQ76sG7Me6uEe1
	w=
X-Received: by 2002:a05:6a00:4103:b0:7aa:d7dd:b7dc with SMTP id d2e1a72fcca58-81b7e2533b1mr8155998b3a.31.1767956543215;
        Fri, 09 Jan 2026 03:02:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvzGy2x+UxsDPmAc468Dm6CNM2dqZklwm+9aRR7rID6M+AjfaOMAx6/J2tyslW9MWyLhttkg==
X-Received: by 2002:a05:6a00:4103:b0:7aa:d7dd:b7dc with SMTP id d2e1a72fcca58-81b7e2533b1mr8155952b3a.31.1767956542566;
        Fri, 09 Jan 2026 03:02:22 -0800 (PST)
Received: from [10.133.33.228] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bb4c8186sm10172179b3a.29.2026.01.09.03.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 03:02:22 -0800 (PST)
Message-ID: <a6d44ed8-828a-4fc6-bb6b-6cd7f8760f66@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 19:02:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: monaco: Add CTCU and ETR nodes
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, Rob Herring <robh@kernel.org>,
        James Clark <james.clark@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
 <20251103-enable-ctcu-for-monaco-v4-2-92ff83201584@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251103-enable-ctcu-for-monaco-v4-2-92ff83201584@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Zd3ERUdud-tx1lzKmrXwv341Zxihj6SH
X-Authority-Analysis: v=2.4 cv=EazFgfmC c=1 sm=1 tr=0 ts=6960e040 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=li7pXvKEtyOYx0Cqe80A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: Zd3ERUdud-tx1lzKmrXwv341Zxihj6SH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4MCBTYWx0ZWRfX8aRj2pWLHNP9
 lnR5XynDZ0oCLmZqY+ycfZzgpHSPazsPy9N6ALVcFentEV+2RVftWMG8mQYS44BDzdEZQtQ8Nfk
 PXki/J1EMekfALbuRrjmudo4M8l3ut+IfhLsmBdtFyPeTBeLFvRW7kTxMr4nc+pCwdmP7Vn3gRW
 WsF7ByNuA/KC22SI6ZPrYmuPno6O95aUX9PjOtnMyQK+l0fRXSmhhrNIet4m7NZPlx1shXA3hHS
 TCx68G3BnQyNPP1W8OzZ+utR6KydL0dUiCd44eoBcm3V4BCxHxAFVLEHGbqO2a3d5q6RPBa2GD7
 f4FDN179hPU53vJJfXY5b2rIKtPbgH1E+VfBIzr+IkLx/wXJC+4jx/c0HgX0sOU68T+6xw3xlvn
 ukC9OKR13NUQVB19/LlKgelvvRZgs7Vb/kj+YAJ5GtB9IHdpwwLm4GowPq7NWgNxCl6j14i8Nbl
 5unoUTUp1tbfMo/UnVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090080



On 11/3/2025 3:06 PM, Jie Gan wrote:
> Add CTCU and ETR nodes in DT to enable expected functionalities.
> 

Gentle ping. Do we have a chance to apply this patch?

Thanks,
Jie

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


