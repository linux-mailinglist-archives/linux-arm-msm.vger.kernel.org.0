Return-Path: <linux-arm-msm+bounces-86987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2192CCE9F05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 15:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B88CA3026533
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 14:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11AC02727EE;
	Tue, 30 Dec 2025 14:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DS1QKy7P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JySDxYUr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDC123F417
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767105046; cv=none; b=M/TW/q6kX7k+QsAFfO4YMJ8y8ppVoeHfH8Ln921LBmLRip9wJ94+xayKNer9YVtUAzv0g+jQhuIK1LhLJFRR+BX6ON9yyhbOK/p/wR+x/SkDf965wYp4IiENXQCmx+vwlAWJje2ngl5rsLB/vj0Z3aT9Yc96RcF/YG11Utf/liY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767105046; c=relaxed/simple;
	bh=QP26hpgxF+lAD8Z9cGWJFhCymcgjif5Fg8NHCOBcVLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jxk1G5KpL1Fnyh451vkB1ri8XFIKEUdCeeJLBJ5SkixWWo1i6Bn6T6/sHkw6PxictRPU7Ee9F0hfeOg+8F5+KehUH9Z+fKi0tgvDNUQ7id/jISXJ3sXoT7uVmot7wyJRjzI/JLefkrh0ZrPhwNKR1bi+E2Jhb7G/cOewSXuDwGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DS1QKy7P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JySDxYUr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU9V5SG2551303
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/PZp3x2OV0c+hwCgSx1p/1wkfRgjK/4GzIE/SLBWfSM=; b=DS1QKy7PcO3ICAte
	S6ADdJn6kKwhvtdKzki8P2g1Z4/FsAZ8IljuSjOda6a1u1huvAnEl+b51jtcmy4S
	1ipfEJA3xSJlRSrsAfZrn6MgJuzX+nf1GYVYb/eB2l2jhWcJz7quZkDCEFyHzQfd
	Qom7Ug/yg+sUS2/KjC1Ppv8Ue/wCiT68qm7RQ+t0CJMraXEWtginjUSuk7AXCYRY
	ZqtdjyCuPxTlkgtk5cSgc7vIwZw8rQ4shuG5bwNYUUJHI519lsQOcMPd25Plo82Y
	MmNCqOq4Sjw3zcIjF1tgV/SvqkfOd+hJyOuk+UybTDQf6mWyJluExI4Wegbf+eQl
	YBVqbQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0skj3kk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:30:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f34b9ab702so26285111cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767105042; x=1767709842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/PZp3x2OV0c+hwCgSx1p/1wkfRgjK/4GzIE/SLBWfSM=;
        b=JySDxYUr2afnVwcDVf1SRJnPnrkq0+LXb0GENVOgZraO4PqKLNfwCrs0dGCv9Xh8uF
         N4R3xtE8L+1C6VVzHIr7NmyOgUApYlqS/Jx/MOb0UN60YuKaWmykOiumB2re/OkAh1H8
         aScUgr1e95qwyFGUY7lBOi48RPeus6OnGSdMkX0Ad8DPNlQIM2+HI94LdMnETElJ8kvM
         kqyhAU/PvzopQdkr376QClqEltnU4+B2B+lH7m2VDn8BWv8D1FdWHGHdpuhgs2+Tzwsb
         tvfE/rkLffNGKR3CZx+UqCSMjrqIeE16TRC6w7BnBtYkey0oV3/BPVGEft7kC53Xcuh5
         KAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767105042; x=1767709842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/PZp3x2OV0c+hwCgSx1p/1wkfRgjK/4GzIE/SLBWfSM=;
        b=k2/QIkOpCX868hQ/93z4BQBIQc57zaQNoF1t3VTGXQ4PIKzI9SkywfomlWFo++OH0i
         cgWISH3SGJAAgAPn9tIlrIY+208O8yvWYsiXKDHtcbUQIhmM7robAElEOJ2LQQ0cPIDB
         pGUAGeAl32t5GXMOAc/Zxg+QjEtMXAdTI5qeE7K8qsXqUoWc8X7ulm8ByIeGB8ZLoId6
         gJDitbKWxlk9aNysn/SPGsLji481okp/9ZCahiP9IJwfDDMkRHgzGTulzqQPW1QltvNq
         ETOjySyXs4nHkLPOxrPpDEDlHDpaAf5mShEasJyBCTcY4T6KvWQlqG9+//gXF6VSu1+K
         LQmA==
X-Gm-Message-State: AOJu0YxWVNUd6ynduu4JKhuw2D4JMhz/mryQVEhnLqzFXROUj7nt1YeQ
	ggW8T3AAcJ9zhLzlJqzxIirZz/u2dmah9ogWQk5lIS70RjFHLYajT6j2WwQELnsRXGoG5TIhG8K
	Fb8ET4C0ZQ9l/MiqF7Lq/Znrexb3BZj08FfMKAmb4/PoGpJysd2HsN0mNlVNcAh2Z6jo9
X-Gm-Gg: AY/fxX7gMTTAr7OVSej9VgCpNbN0RMvjIH9VvAsBT/WXDXLf7BGQS6rue76rqw+PfzE
	qoT1PrLgo6uIO/ARxL3F8P4J44qmGMeNV5N4LEKJbVcOhrQXWGY26vbYdhn/+suOk/0LxiEcgJq
	taHCwZenbehaiCqeCqsvOp1UXBZt70E5BKdQu1jt52ls4T9pJqdFixv21ldMup425vsxW3BYlJ8
	j3GOZ31kL2gBbjFoGHlJ6ANTAsDdZlg1/2q9ltopIXAis4OCbiyhfyOk/fyGSHKRIX2zlHBcBsZ
	TrK7kwrS25RvTCcgat3IvUVad/Tr5as2wgT6Ip9vDWpmDvnZN+XP2q8dllb816NnZZcthIzHmEn
	DVfCxMplbjFs9vgMbon5Yn1+S4VzBv4CznxMJN2VUizgPxzglYuxchcsJ9cSfz/wZNw==
X-Received: by 2002:a05:622a:1983:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4f4abcb50acmr385349491cf.1.1767105042165;
        Tue, 30 Dec 2025 06:30:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5pOt+wPqz8LsodsxGbIxAzrDfZ+9egM1Xc+qC7esh4eB5dGKkht5V5r7Vd5boEDylrxpaSQ==
X-Received: by 2002:a05:622a:1983:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4f4abcb50acmr385348931cf.1.1767105041564;
        Tue, 30 Dec 2025 06:30:41 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8044f4acdbsm3534554166b.22.2025.12.30.06.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 06:30:40 -0800 (PST)
Message-ID: <f5cd5639-00d6-4d6b-866e-7b3503a59d9e@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 15:30:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Introduce Glymur base dtsi
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rajendra.nayak@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
 <20251219-upstream_v3_glymur_introduction-v3-3-32271f1f685d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219-upstream_v3_glymur_introduction-v3-3-32271f1f685d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEzMSBTYWx0ZWRfX59MrX8LneNyp
 LHwtvC2Q+pJ410qclHXg8guc1dLVUGtOgm+0Hd9C2yLNIZZkK4BlmcALPMZmQgiQdKLmKcI0xmC
 lrRqQJGNMx0PbVIBfcEthDY+RPGbM2VxWy83d1s7aUELbRnQIvT76zVIelAXGwkf8WnPc5AteGr
 Maypadc9Y5eKCiadbDXFDU0LByILCRt1CICL8OIKtnWGCYKc94y+m+746dumQrZpR595TSs5kXk
 lktufduf66xDE5W/kFpaoFHeyRbbqGbU3V2zVK7ovOcMmONe6SFntI1T6KgNBBpN/cEaeGogfNY
 SAqVH3bW7u35puUR+Anc4SMZuh9x6/NhzGauD450e1W6qdUpE6zAsg7AJ2hWuZOnqmXSmudZFeh
 cAUz58v4TWzsVEzyqvroxYSE1suXenDacCL1kF8amniSc1XfhNY4e5pGH0marDgMdnfeeSF7/Dy
 9lsucLP1TrxGFDBi77A==
X-Proofpoint-ORIG-GUID: 5eJW7HUdg6r5xi3lcCgDGWegpfQH5uhG
X-Proofpoint-GUID: 5eJW7HUdg6r5xi3lcCgDGWegpfQH5uhG
X-Authority-Analysis: v=2.4 cv=FJ0WBuos c=1 sm=1 tr=0 ts=6953e213 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w7Tv4zNA8aCE7STyPtkA:9 a=G0Cx74KbSqDmYbrs:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300131

On 12/19/25 3:46 PM, Pankaj Patil wrote:
> Introduce the base device tree support for Glymur – Qualcomm's
> next-generation compute SoC. The new glymur.dtsi describes the core SoC
> components, including:

[...]

> +		gpi_dma2: dma-controller@800000 {
> +			compatible = "qcom,glymur-gpi-dma", "qcom,sm6350-gpi-dma";
> +			reg = <0x0 0x00800000 0x0 0x60000>;
> +			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 129 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 132 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-channels = <16>;
> +			dma-channel-mask = <0x3f>;
> +			#dma-cells = <3>;
> +			iommus = <&apps_smmu 0xd76 0x0>;
> +			status = "disabled";

Any reason for it to be disabled?

On some platforms the (common and default) TZ config is overzealous,
but that shouldn't generally be the case on compute.


> +		};
> +
> +		qupv3_2: geniqup@8c0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x0 0x008c0000 0x0 0x3000>;
> +			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
> +				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
> +			clock-names = "m-ahb",
> +				      "s-ahb";
> +			iommus = <&apps_smmu 0xd63 0x0>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			status = "disabled";

Similarly here (individual QUPs should stay disabled because leaving
them all enabled would lead to multiple attempts at claiming the same
pins)

[...]

> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x78105000 0x0 0x100000>,
> +				<0x02000000 0x0 0x78205000 0x0 0x78205000 0x0 0x1dfb000>,
> +				<0x03000000 0x7 0x80000000 0x7 0x80000000 0x0 0x20000000>;

Please align the '<'s (in all pcie nodes)

> +		pcie4_phy: phy@1bf6000 {
> +			compatible = "qcom,glymur-qmp-gen4x2-pcie-phy";
> +			reg = <0x0 0x01bf6000 0x0 0x2000>;
> +
> +			clocks = <&gcc GCC_PCIE_PHY_4_AUX_CLK>,
> +				 <&gcc GCC_PCIE_4_CFG_AHB_CLK>,
> +				 <&tcsr TCSR_PCIE_2_CLKREF_EN>,
> +				 <&gcc GCC_PCIE_4_PHY_RCHNG_CLK>,
> +				 <&gcc GCC_PCIE_4_PIPE_CLK>,
> +				 <&gcc GCC_PCIE_4_PIPE_DIV2_CLK>;
> +			clock-names = "aux",
> +					"cfg_ahb",
> +					"ref",
> +					"rchng",
> +					"pipe",
> +					"pipediv2";

Please align the '""'s (in all pcie phy nodes)

[...]


> +			interconnects = <&pcie_east_anoc MASTER_PCIE_5 QCOM_ICC_TAG_ALWAYS
> +					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +					&pcie_east_slv_noc SLAVE_PCIE_5 QCOM_ICC_TAG_ALWAYS>;

And the '&s'

[...]

> +		pcie6: pci@1c00000 {
> +			device_type = "pci";
> +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> +			reg = <0x0 0x01c00000 0x0 0x3000>,
> +			      <0x0 0x7e000000 0x0 0xf20>,
> +			      <0x0 0x7e000f40 0x0 0xa8>,
> +			      <0x0 0x7e001000 0x0 0x4000>,
> +			      <0x0 0x7e100000 0x0 0x100000>,
> +			      <0x0 0x01c03000 0x0 0x1000>;

I'm a little confused about the lack of ECAM enablement (through
a large config space), but I suppose we'll see that soon..

Konrad

