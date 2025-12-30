Return-Path: <linux-arm-msm+bounces-86928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7E7CE8F63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 09:02:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 409173001E30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 08:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C092DCF45;
	Tue, 30 Dec 2025 08:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQWEaome";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="glZVetb9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240052609EE
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 08:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767081756; cv=none; b=BmdwWorHnPzza4xMcjhudp3svyfrbFXKruBfeDabsAwWx64bvD/vxED2h9T7DYEKDQ2oLtechM1S+GwrDEJFtszDi+xOPD5NDFjlIhTxpR2U3ru2mOieaU8C2Nqqo+DBn/ei0LmvvOlP/h2SV2M2cMde51PtEX7PscREjvXdYKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767081756; c=relaxed/simple;
	bh=gINk5FE91N30iPXdSLNhZdhs7EAsNPJ71wds1sL6I1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Alasx/IVzzoy2DtrN4KEaUE6UHU7UIqj6FCbMwQ2kw46Y8373yl5R4TuQD3HlvVv+zHLjuLHm2AQiCPqNEoqWo11jhdW+j9rbg+CSH0UX6d6qda2NYsdAu6XOIhh2Zu7vbT1QKfM/BYBiXiDJicU+bqggq4moQeRv0MkpCbWbLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQWEaome; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=glZVetb9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTKdMSL2723178
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 08:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3OhHCU1J9aP6tsjQt+X79nSYLwwMPdY2IpL+yaltzGI=; b=WQWEaomeOaEz/GFs
	bWh8L4oDKVohUpCJ1c4ObETe1vzoN72aAc82hb2jedCUDl9E9IT+cy7euxeCf7Bv
	IfH+0Er8Zu6VpYeZVlPSFO8JZFxfnNs4MCWI0XQR9OzvOE24psghNgNzKPDKfi3B
	VXRnTp4qZY9pwge8sYpbXudD/HR2fgzUytapX3DWy3pJcef0j/R3ldukbyvnmVQJ
	woLmL2iYqPknJUBwvfXPNKooWwIC2wiXb5HMEXf8GCfbcER3/TgzDKSfXPt5yrLm
	7RKVWJfk1FJ/M+yVZT6xou2sgHgl682uHPbwCpKexxWqfpk5UwZc33AInhd+S+7f
	aHcuXg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0vdh7bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 08:02:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c6e05af3bso21704429a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 00:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767081753; x=1767686553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3OhHCU1J9aP6tsjQt+X79nSYLwwMPdY2IpL+yaltzGI=;
        b=glZVetb9dz1Y3VtJ5zm0wN1Evtnl4wglTJOkO9OmJn06FG3ZQzf9qIF4uXgIiCfh+F
         YchZ+dLKkhaxz3oYfblrOEZh5mgPO+XKRRZoxA/IIRq0l9UqMqtIQUTSSBSnKeVpLi8O
         iNGnKue1N69JcGgkUzZwBnFEH1YtWAENJ4jr2/UuQIyYltE8Oc+s/Tge8fpg9M3d7eRB
         BILvWy6Q472wlg5V0fq1YHQ7ZvzOJFhihxGJkYlloXgpYNFSHH1GUncLYSc9V4p9rFMg
         NZByRrbyirOrkmIaSJgvBd0Uyb0A+xIpfy+lokr5Yb5Y/5Xgd1rxCZciCJAodwS+Byvl
         eYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767081753; x=1767686553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OhHCU1J9aP6tsjQt+X79nSYLwwMPdY2IpL+yaltzGI=;
        b=cKQtSkJwcAe+YVFjrjJPSHnA2ACSkvpVs9o6RfPYEu/n0hufD/hj+wqqzqXUa1+Q9O
         6XaqZNQicYO/9WmEHbTo7lKAsHDLexEbMkY2v9SkX+8+C6TH391RUZwA8OYZ7zIPIWtZ
         1aQ51t0pxcyEHbGk/XvPUTOsDvU7X0VqHvpe1ngaTk2jlMq+Rf0Ai/febVDoPY2Zth27
         M7MYd7cHDTEauLbu7ZB7X26fs3mMSZoeOoM8ARQACENlrPgucX4j5w64N8QsCVSbF6+U
         azR07IGjRLpDIZAD9aNYOfe7y8CrF5ByQevo4XMol/voR+baYCkAy6kioAWwbWMxvy6/
         3W6A==
X-Forwarded-Encrypted: i=1; AJvYcCXbCmiIWFbskuoDebVwGlGMh4aYfKPtDRfXsBWRvToDOYNRNzTOJY/n6cQCpF2VEtkKW2P/13BMMA3+mj6G@vger.kernel.org
X-Gm-Message-State: AOJu0YznSOJmTX63dZvr6qC7VyHqjhKPyT7XY9s66ZUPqGtdDjgDP7kb
	SyZG8DFZOEJlY2IzZERgNRhVgpTEMEAQWyI1B/nWItrS4X5ynonlL1TbKvgd41hHNtOSTbfvI+Z
	aIM1CmCRGwXm6jRFEBNp66JAUlRGPVlI52P5GP7opMNrCAuvKgUHbm5NEqpuGAdaVDeqn
X-Gm-Gg: AY/fxX5FHUmzonm/Ib6xKROHw1ylNIkw03kPBxIPprtRDJTrqzfMo76U2x0cFIKzxg8
	sD26aSbmYnyIBsmOt+WuKoET04siMyuZ4YagXGtxSlPO0kKET9ZZWZZtrRkaKuohCfC32HZabJG
	JfJu/lBSoLq7tVfyO3wAJICbpMVmnRmLaChQ1TAU835+q7Onv2vujoz3j0UsQ6RqeHJDIXWyQv9
	p+rkchRc7zxjaXO9G1llH8JJ3CS8Fr+V8Car5Gs1RyacH1EuMk/+x5vTxisW5tA3sPTbOj2HJf0
	eE69DhqZ9T22HuEOku94gnFVwkB382858/vpBB5Ii1q4BE9VITmZz3njTz4miYMY4f99e+B2Y/U
	9vPO9+UAUw0dLN92jGsOkGU07HmhujgkZYhv91QaXGhKVDUA9tJHIVRpCL6U1vWdia6xmqY2wAl
	x5PsMbpIQgatsa2mb25cPB9kWYRj0=
X-Received: by 2002:a17:90b:2f05:b0:340:b912:536 with SMTP id 98e67ed59e1d1-34e921f5816mr24699354a91.31.1767081752877;
        Tue, 30 Dec 2025 00:02:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvh5gVshkpUSUTueHD7Wy9iBjRVMxatQvV8KoF2Z2q7toFBbXZGwf+VH73/aLpk6bpIIOlSA==
X-Received: by 2002:a17:90b:2f05:b0:340:b912:536 with SMTP id 98e67ed59e1d1-34e921f5816mr24699330a91.31.1767081752317;
        Tue, 30 Dec 2025 00:02:32 -0800 (PST)
Received: from [10.190.201.90] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e9219f03esm28769350a91.4.2025.12.30.00.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 00:02:31 -0800 (PST)
Message-ID: <6b048028-b3f9-4d8d-aa20-89236c66b800@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 13:32:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Introduce Glymur base dtsi
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        rajendra.nayak@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
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
 <aUkj-CkSSOlG8X6Q@linaro.org>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <aUkj-CkSSOlG8X6Q@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dfONHHXe c=1 sm=1 tr=0 ts=69538719 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Ik_U2rayHFIm2EPsZfwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA3MiBTYWx0ZWRfX11iFSNMiqVMj
 GTibTN0f2laIE+0gZObjA5V23lWES31EJFxoAcWi9HN6q1SMbft5kjTVVyQ2XOMcClQJ6smO1Si
 eONuPEJaS7zX5Rsa0huDmn87x7O+T8vQLEo6c6z6PYqGo9JMTphYJibr65qySEf4vin33VPqsYq
 YTKy3PxJa96u3J6KijBmH+PH039m/5oVn/Gs8PjW5KnYWwiYzMd2fgcIotII71Q8LW2IpN+wahH
 /TYwFXoUkBTZWJLJsp/HsnUt/rRsq7e0CVvjuFEKOTgaQ5xWNSEaxzNLsSfD+OLiuEsL2nz/1Uz
 Sy3ZmrQkOPo2erWyqpcCCsG3YZXLFOvPyBOP4eAl6gUtopjQN4MoPpyRaPOoFvD4QVjBWTt5T69
 xI6AFokhZOkuQacmx+lD/7UOGMH91oNR/7V4UoEZnKNth4pCuBym/TNZ0I53kEKeibz3yb8Fk85
 7K0stS4nzSKzOnhRrWg==
X-Proofpoint-GUID: Fsy6bYpkIIWYwqkQlO_B00Fthz-ia4Px
X-Proofpoint-ORIG-GUID: Fsy6bYpkIIWYwqkQlO_B00Fthz-ia4Px
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300072

On 12/22/2025 4:26 PM, Stephan Gerhold wrote:
> On Fri, Dec 19, 2025 at 08:16:56PM +0530, Pankaj Patil wrote:
>> Introduce the base device tree support for Glymur – Qualcomm's
>> next-generation compute SoC. The new glymur.dtsi describes the core SoC
>> components, including:
>>
>> - CPUs and CPU topology
>> - Interrupt controller and TLMM
>> - GCC,DISPCC and RPMHCC clock controllers
>> - Reserved memory and interconnects
>> - SMMU and firmware SCM
>> - Watchdog, RPMHPD, APPS RSC and SRAM
>> - PSCI and PMU nodes
>> - QUPv3 serial engines
>> - CPU power domains and idle states, plus SCMI/ SRAM pieces for CPU DVFS
>> - PDP0 mailbox, IPCC and AOSS
>> - Display clock controller
>> - SPMI PMIC arbiter with SPMI0/1/2 buses
>> - SMP2P nodes
>> - TSENS and thermal zones (8 instances, 92 sensors)
>>
>> Add dtsi files for PMH0101, PMK8850, PMCX0102, SMB2370, PMH0104,
>> PMH0110 along with temp-alarm and GPIO nodes needed on Glymur
>>
>> Add glmur-pmics.dtsi file for all the pmics enabled
>>
>> Enabled PCIe controllers and associated PHY to support boot to
>> shell with nvme storage,
>> List of PCIe instances enabled:
>>
>> - PCIe3b
>> - PCIe4
>> - PCIe5
>> - PCIe6
>>
>> [...]
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> new file mode 100644
>> index 000000000000..eb042541cfe1
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -0,0 +1,5700 @@
>> [...]
>> +	cpus {
>> +		#address-cells = <2>;
>> +		#size-cells = <0>;
>> +
>> +		cpu0: cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "qcom,oryon";
>> +			reg = <0x0 0x0>;
>> +			enable-method = "psci";
>> +			power-domains = <&cpu_pd0>, <&scmi_perf 0>;
>> +			power-domain-names = "psci", "perf";
>> +			cpu-idle-states = <&cpu_c4>;
> You probably want to move this to domain-idle-states:
> https://lore.kernel.org/linux-arm-msm/20251010-topic-x1e_dt_idle-v1-1-b1c8d558e635@oss.qualcomm.com/

Will fix in next revision

>
>> +			next-level-cache = <&l2_0>;
>> +
>> +			l2_0: l2-cache {
>> +				compatible = "cache";
>> +				cache-level = <2>;
>> +				cache-unified;
>> +			};
>> +		};
>> [...]
>> +		qupv3_2: geniqup@8c0000 {
>> +			compatible = "qcom,geni-se-qup";
>> +			reg = <0x0 0x008c0000 0x0 0x3000>;
>> +			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
>> +				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
>> +			clock-names = "m-ahb",
>> +				      "s-ahb";
>> +			iommus = <&apps_smmu 0xd63 0x0>;
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +			status = "disabled";
>> +
>> +			i2c16: i2c@880000 {
>> +				compatible = "qcom,geni-i2c";
>> +				reg = <0x0 0x00880000 0x0 0x4000>;
>> +				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
>> +				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
>> +				clock-names = "se";
>> +				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
>> +						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
>> +						<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>> +						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
> CPU->something paths should be QCOM_ICC_TAG_ACTIVE_ONLY (everywhere).

If we're removing and placing the vote during suspend/resume scenarios, then the tag mentioned in the device tree doesn't matter.The intention behind making it ACTIVE_ONLY for config path is that during APPS suspend,APPS->CONFIG wont be accessed as APPS itself is going to suspend.

>
>> +						<&aggre3_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
>> +						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +				interconnect-names = "qup-core",
>> +						     "qup-config",
>> +						     "qup-memory";
>> +				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
>> +				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
>> +				dma-names = "tx",
>> +					    "rx";
>> +				pinctrl-0 = <&qup_i2c16_data_clk>;
>> +				pinctrl-names = "default";
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +				status = "disabled";
>> +			};
>> [...]
>> +		pcie4: pci@1bf0000 {
>> +			device_type = "pci";
>> +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
>> +			reg = <0x0 0x01bf0000 0x0 0x3000>,
>> +			      <0x0 0x78000000 0x0 0xf20>,
>> +			      <0x0 0x78000f40 0x0 0xa8>,
>> +			      <0x0 0x78001000 0x0 0x4000>,
>> +			      <0x0 0x78005000 0x0 0x100000>,
>> +			      <0x0 0x01bf3000 0x0 0x1000>;
>> +			reg-names = "parf",
>> +				    "dbi",
>> +				    "elbi",
>> +				    "atu",
>> +				    "config",
>> +				    "mhi";
>> +			#address-cells = <3>;
>> +			#size-cells = <2>;
>> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x78105000 0x0 0x100000>,
>> +				<0x02000000 0x0 0x78205000 0x0 0x78205000 0x0 0x1dfb000>,
>> +				<0x03000000 0x7 0x80000000 0x7 0x80000000 0x0 0x20000000>;
>> +			bus-range = <0 0xff>;
>> +
>> +			dma-coherent;
>> +
>> +			linux,pci-domain = <4>;
>> +			num-lanes = <2>;
>> +
>> +			operating-points-v2 = <&pcie4_opp_table>;
>> +
>> +			msi-map = <0x0 &gic_its 0xc0000 0x10000>;
>> +
>> +			interrupts = <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 510 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 511 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 512 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 944 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "msi0",
>> +					  "msi1",
>> +					  "msi2",
>> +					  "msi3",
>> +					  "msi4",
>> +					  "msi5",
>> +					  "msi6",
>> +					  "msi7",
>> +					  "global";
>> +
>> +			#interrupt-cells = <1>;
>> +			interrupt-map-mask = <0 0 0 0x7>;
>> +			interrupt-map = <0 0 0 1 &intc 0 0 0 513 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 2 &intc 0 0 0 514 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 3 &intc 0 0 0 515 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 4 &intc 0 0 0 516 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			clocks = <&gcc GCC_PCIE_4_AUX_CLK>,
>> +				 <&gcc GCC_PCIE_4_CFG_AHB_CLK>,
>> +				 <&gcc GCC_PCIE_4_MSTR_AXI_CLK>,
>> +				 <&gcc GCC_PCIE_4_SLV_AXI_CLK>,
>> +				 <&gcc GCC_PCIE_4_SLV_Q2A_AXI_CLK>,
>> +				 <&gcc GCC_AGGRE_NOC_PCIE_4_WEST_SF_AXI_CLK>;
>> +			clock-names = "aux",
>> +				      "cfg",
>> +				      "bus_master",
>> +				      "bus_slave",
>> +				      "slave_q2a",
>> +				      "noc_aggr";
>> +
>> +			assigned-clocks = <&gcc GCC_PCIE_4_AUX_CLK>;
>> +			assigned-clock-rates = <19200000>;
>> +
>> +			interconnects = <&pcie_west_anoc MASTER_PCIE_4 QCOM_ICC_TAG_ALWAYS
>> +					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>> +					&pcie_west_slv_noc SLAVE_PCIE_4 QCOM_ICC_TAG_ALWAYS>;
>> +			interconnect-names = "pcie-mem",
>> +					     "cpu-pcie";
>> +
>> +			resets = <&gcc GCC_PCIE_4_BCR>,
>> +				 <&gcc GCC_PCIE_4_LINK_DOWN_BCR>;
>> +			reset-names = "pci",
>> +				      "link_down";
>> +
>> +			power-domains = <&gcc GCC_PCIE_4_GDSC>;
>> +
>> +			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
>> +			eq-presets-16gts = /bits/ 8 <0x55 0x55>;
> Shouldn't there be an IOMMU assigned here? (i.e. iommus = <...> or
> iommu-map = <...>). The reason we don't have these directly in
> hamoa.dtsi is that it runs in EL1 by default and the Gunyah hypervisor
> prevents direct access to the SMMUv3 that protects the PCIe endpoints.
>
> Your cover letter says Glymur is capable of booting at EL2, so this
> can't be the case here. Is there no SMMU for PCIe on Glymur?
>
> There are significant security and performance downsides without a IOMMU
> assigned here (especially with the upcoming USB4 enablement), so this is
> not something I would expect to be omitted without any TODO comment or
> similar mentioned anywhere.

Let me check on pcie smmu enablement.

>
>> [...]
>> +		dispcc: clock-controller@af00000 {
>> +			compatible = "qcom,glymur-dispcc";
>> +			reg = <0x0 0x0af00000 0x0 0x20000>;
>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&sleep_clk>,
>> +				 <0>, /* dp0 */
>> +				 <0>,
>> +				 <0>, /* dp1 */
>> +				 <0>,
>> +				 <0>, /* dp2 */
>> +				 <0>,
>> +				 <0>, /* dp3 */
>> +				 <0>,
>> +				 <0>, /* dsi0 */
>> +				 <0>,
>> +				 <0>, /* dsi1 */
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>;
>> +			power-domains = <&rpmhpd RPMHPD_MMCX>;
>> +			required-opps = <&rpmhpd_opp_turbo>;
> Are you sure you want to force TURBO here?

Will decrease it in next revision.

>
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>> [...]
>> +		watchdog@17600000 {
>> +			compatible = "qcom,kpss-wdt";
> This compatible is deprecated.

Will update in next revision

>
>> +			reg = <0x0 0x17600000 0x0 0x1000>;
>> +			clocks = <&sleep_clk>;
>> +			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
>> +		};
>> +
>> [...]
> Thanks,
> Stephan


