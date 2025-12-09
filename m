Return-Path: <linux-arm-msm+bounces-84735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88446CAF0E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 07:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CB8530285B5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 06:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F18326E6FA;
	Tue,  9 Dec 2025 06:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aDTdNil6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YA/y5ngK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EE22405E1
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 06:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765262511; cv=none; b=Fn6dRoazcJlOz72TJyJMZCMhMal08gJ7Dp6H567u/XCaNAmwSFh3G0FXoteayfoAbLPogpuXxUKHYv5gwY+CIZ7N+lsPA+odXzZ50PJ4mffJ6U3+ikXfCepoI5iT9K7F4ej+Jqdx0UiLj2u8A07wRZI1BgQIRwxi4sR77lGYtMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765262511; c=relaxed/simple;
	bh=KH6hWSgvjuS0F9qErjJBEDopbbcsLU2q5He+sFKe4vk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rQeueSXP3Z5Q0QJhO1Iq4LA1I37L0p7Bk9DPJoa3m5Mqc2fZVPvhBTbGTvGiPKOcXcau3Wzps+q0DuJQES+AackgWId4ueBE3Axm7EoL0ksXkS/J2NqVCs4wPgvQjhm1jNQHYzeu0FU9gWmxVxvq/XKkBd7t4pGe3k6yWHsJgRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aDTdNil6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YA/y5ngK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NWwKZ2366828
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 06:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6yuaVMOqG7XZlR/VK/ZkhoEx8/ZaLkTsrEEAnpbVHiA=; b=aDTdNil6MLQnvVkY
	DVxCZBt+zRG8/JbDQQOp5SyJl9K8uvGMrHc/NelSktwZ5f02wa/hf/p+11NNN981
	6pLRjSxmZT3IDe8UWbrk5IWc8/AVNRzv3AFEn+VkYB9IRllvOQ5OBDe2j8JEokOY
	RmxpDBH1Vwv5fwRyEngc7V/YvuXxHEk5KDqXiUTSuyC0drsnOyzqvLHpIkkX49pv
	84fbTXiY8SnxzeyY2qo0rKTZLAKMD2Q0XEOMP4P5WuVaVh403ZFGCuuFr8DFZYxx
	Mi/4Zm8fPrUtJ3D1/5HLkORu5AqG9fOmF7BjhUevAGWRsi1D9AvqZXH+tfBbXan4
	8u3PJg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax4fqhnjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 06:41:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29e921af9easo12388065ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 22:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765262507; x=1765867307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yuaVMOqG7XZlR/VK/ZkhoEx8/ZaLkTsrEEAnpbVHiA=;
        b=YA/y5ngKQPGI3N/3p7TZPao0kSz2y6/OwLwnwec6S0JhWfD9x5h4ECSbbyKK9sMMDc
         z/gVF13LVkdlFIhuWGwhi2LIABmTP51k34i3YUvU+p+Ay5E9TiONK0wrMoxa5Dr2N97j
         CKO4Z4f/rZO3gWwk63CplERhLfRe9ReHq0JPUgNAVD99DrPWgbZ4bZ5AmFKD7B8pkrOz
         9tee3n/g8Ofu0IuLz0oylCpbxLX9V8XqnuHkjF2aBBFZZSfdxlJ0kynCrnl6dhJVk3nB
         lXc0bD1TGUSFkPVV6pFZfLB3Zac4sFJaO9hT8MtBs0hmFpAicpUukaRBwVilzAZJ3XSX
         DCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765262507; x=1765867307;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6yuaVMOqG7XZlR/VK/ZkhoEx8/ZaLkTsrEEAnpbVHiA=;
        b=dCT/Pn/PBtThitEXY0Wi1GIoQ3BhwNNCzZ/MfndF9oHKw/2xI1xnlWNXf94FVLU1CP
         yHqnklC3shSHV3I5kGJablfGA7CkV4UhTQuimcoyE8o7ogWq8RPXKrhALokwJh5vZ7VO
         eakvsgcsV+J0qeFuseUfMKyeHioM+jqO69XfA9zLzWdLmdQr53rk07iGaYtPWj6Cmz7x
         UvicBV2is9VkaDljrmXS1eu6tONuAQbN7Zp4bQuDgiqsXYSMeB8vMw6Gdgmcvo0Sl13a
         9S95Yn+YNjipyfQxhA2ySMdLt/nuqr4a+34BO0+NCoA2iG67hHqBYRoxpLrfZyv7dVw7
         POpQ==
X-Gm-Message-State: AOJu0YzabzJMeg5vEruS3vpVG+MF8vAmRpDZFvlfgvJ+rIkS4Ou5q9/q
	LlThTG6XH6ZFHLQVD6+qJHViCZwB9nfcNTIJGE8ZT3ZcQgklhpNEEmoHH2MosyV1ki7X+5QYDiq
	JnlDJUSvKq2aUgcSmqUZIjz94EKB0LxQnEOxfWcPjgqKAwZEiGY6v5MmWwvCB+zoopLaQ
X-Gm-Gg: ASbGnctjFwKnr7hA6crBnM4QKSuK7gPd73mKpUNFbZeG2QpMmSEooHZ26RivmC8vUF4
	RV9wZuyzcVA1sQXUO5spm9q6dkfgc7/HLlTVrHv+E3/4KMRwcWwy1EtLXj16t9YfFuQcf9M5o3W
	ULdMpu//4ReII52hKG5XcP5xjC3wc+Zj0+2jPvAkrSUl/U4sIlnG5xjOI95NVsL2Cfn2Koquoqs
	gBpyt/HmHjyxlLWeXXgKL/kZiDlxCuFU+e1D7UoXEwUq2vV3JqWjb5cwz2y7iKL/bTaQ8/gS4uq
	HHMhp0Y8t2K4WbAX+7VqZDgMIG0WrocJeUq87o9OwaXz3Cp5ri3Oc93EZmfF/dJhzeELtlu9t2Z
	jFDVUycaHaReAdiSgFPtwhGM4R67sxCvdRn6yYI+5d6gQ+/4KMI11ygpboVHvTD8ApBaBoJXiRy
	EoBI5IcA==
X-Received: by 2002:a17:903:110c:b0:297:d777:a2d4 with SMTP id d9443c01a7336-29df5deb8d2mr98970015ad.46.1765262507338;
        Mon, 08 Dec 2025 22:41:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlJ3bhQJaIGrAlDle/xf7a85OGCK21q0KG73zyRN0EsK0D2i8F3BqBatBxs6R7FzEWL+jX6Q==
X-Received: by 2002:a17:903:110c:b0:297:d777:a2d4 with SMTP id d9443c01a7336-29df5deb8d2mr98969725ad.46.1765262506838;
        Mon, 08 Dec 2025 22:41:46 -0800 (PST)
Received: from [10.133.33.218] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaaba2dsm146086505ad.69.2025.12.08.22.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 22:41:46 -0800 (PST)
Message-ID: <ae9cd5b4-c33a-4757-805c-d817f1560b81@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 14:41:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: x1e80100: Add crypto engine
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Neeraj Soni <quic_neersoni@quicinc.com>
References: <20251208-crypto_dt_node_x1e80100-v4-1-f5d03bb2c501@oss.qualcomm.com>
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
In-Reply-To: <20251208-crypto_dt_node_x1e80100-v4-1-f5d03bb2c501@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA0OSBTYWx0ZWRfXzEF4qHh9XtrU
 yeu8q0M6aqMHSTrnZPdCxFdVHYGe4G3f0UFvCIjfbQQpbb7iFmelefEuryvPUcmQlS1ITxTe0Cz
 ssL1OBWmTAN+D3m2wNqqSJsy0uJHBreRgIzxp882rg4UiB2h3HZJ2ds0CRF4Ds1wZxQv/lVkbA0
 qvZkyE0DXjm6/GNJQ9CpAyIeZ3jq+BOT5H3KCylGh6LiseNRH9VS63TA1BPcpWvjfeOsLwpv75y
 JCYka/eLpFDq+Kb5ZcN0gVBeGIEoLDQqCiQkWuOSYBr6NvwPfZL6lz82kq58zs/lRj92zJQ3XnP
 UknNJVQxDXH3dQ9qQiEb2ppX5dcRHW17ZBcpSWGS2yFqaWPll9bu8UreT+DP+zh2IbpHBo7NGEa
 PDTCwYbCY0N8dAXfPI9K/9sr+Khg1Q==
X-Proofpoint-ORIG-GUID: Gso0E-Bx5JKjtsKoP6mgouWrsX4wpdma
X-Authority-Analysis: v=2.4 cv=TPFIilla c=1 sm=1 tr=0 ts=6937c4ac cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=dlRP-RK6hvslqa0QFKgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Gso0E-Bx5JKjtsKoP6mgouWrsX4wpdma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_01,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1011 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090049


在 8/12/2025 下午8:32, Harshal Dev 写道:
> On X Elite, there is a crypto engine IP block similar to ones found on
> SM8x50 platforms.
>
> Describe the crypto engine and its BAM.
>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
> The dt-binding schema update for the x1e80100 compatible is here
> (already merged):
>      
> https://lore.kernel.org/all/20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org/
> ---
> Changes in v4:
> - Updated iommu property to use 0x0 instead of 0x0000 in last cell.
> - Updated dma-names property by listing one dma channel name per line.
> - Use QCOM_ICC_TAG_ALWAYS symbol instead of 0 in the interconnects property.
> - Link to v3: https://lore.kernel.org/r/20251127-crypto_dt_node_x1e80100-v3-1-29722003fe83@oss.qualcomm.com
> ---
> Changes in v3:
> - Fixed num-channels and qcom,num-ees properties by updating them to 20 and 4 respectively.
> - Link to v2: https://lore.kernel.org/all/20250221-x1e80100-crypto-v2-1-413ecf68dcd7@linaro.org
> Changes in v2:
> - Added EE and channels numbers in BAM node, like Stephan suggested.
> - Added v1.7.4 compatible as well.
> - Link to v1: https://lore.kernel.org/r/20250213-x1e80100-crypto-v1-1-f93afdd4025a@linaro.org
> ---
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 51576d9c935d..0ae5242e98cb 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3033,6 +3033,32 @@ usb_1_ss2_qmpphy_dp_in: endpoint {
>   			};
>   		};
>   
> +		cryptobam: dma-controller@1dc4000 {
> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
> +			reg = <0x0 0x01dc4000 0x0 0x28000>;
> +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			iommus = <&apps_smmu 0x480 0x0>,
> +				 <&apps_smmu 0x481 0x0>;
> +			qcom,ee = <0>;
> +			qcom,controlled-remotely;
> +			num-channels = <20>;
> +			qcom,num-ees = <4>;
> +		};
> +
> +		crypto: crypto@1dfa000 {
> +			compatible = "qcom,x1e80100-qce", "qcom,sm8150-qce", "qcom,qce";
> +			reg = <0x0 0x01dfa000 0x0 0x6000>;
> +			dmas = <&cryptobam 4>, <&cryptobam 5>;
> +			dma-names = "rx",
> +				    "tx";
> +			iommus = <&apps_smmu 0x480 0x0>,
> +				 <&apps_smmu 0x481 0x0>;
> +			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "memory";
> +		};
> +
>   		cnoc_main: interconnect@1500000 {
>   			compatible = "qcom,x1e80100-cnoc-main";
>   			reg = <0 0x01500000 0 0x14400>;
>
> ---
> base-commit: 765e56e41a5af2d456ddda6cbd617b9d3295ab4e
> change-id: 20251127-crypto_dt_node_x1e80100-bcb1a2837b56
>
> Best regards,

Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com> # on x1e80100

root@ubuntu:/usr/Testools# ./kcapi-convenience.sh
[PASSED: 64-bit - 6.18.0-rc5] Convenience message digest operation
===================================================================
Number of failures: 0

Regards,
Wenjia


