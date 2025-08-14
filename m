Return-Path: <linux-arm-msm+bounces-69140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B6DB25EA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 10:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1629D7AF61C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 08:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62B92E7BAF;
	Thu, 14 Aug 2025 08:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DslO9j9n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A532E7BAC
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 08:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755159856; cv=none; b=R9J6qIVyu4ITvjKQBufCPL0lWPq3y1oOU1yTQZ+uZxMo7OMzMHrt3Biv/pNmC8gD0zYeXCQmlOtMOfc2Fhky2/9xnwl1P4cySOHFvbi5QRjhphaKOSgZ4xt2Sqy7k1KkIwU4rplbD1uqEdhajKR9yBv/b2Cf3qob/VOD87XgDZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755159856; c=relaxed/simple;
	bh=x/vD0eT82eorZ1S1sGi4+1pN1ugsh/LpqIA/GYt0GoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLbZy3T94C9YXBwE2qgIO41KjDUKdI24wqQMnVOCwcJvo5qbnIkh5w/Rj8kZljgPUgVuzFSm2L1aMfgy8bt5DEiKzIesQ/sI+KNr9fz5pNROwZTkZxjJJ/hcs68hapd2xMwq/KoNH8EwUH3qxt3M/eKBHvRg4yOtbQpSt+E9VNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DslO9j9n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMXCRx011356
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 08:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	STzZkkK3s0ULF0XUFVwg+6IbX+TqSk42ASKMrRFRGxU=; b=DslO9j9nblKbzgNf
	BNwzqd1SbsWTyxqEQeROfmxT6a31d4mNuu/RUSEgLWkSIROuw8IOdzTkmNOH9z+F
	hB2+LYefIvKIip92mMg/F39Hd7CCiuP9tuJuM5AWRwgSR2Lkm5RFUFdPrRwp658C
	FWWncXWqurgyEfU7ZjCBXI+rK6r9pRYg/4WozZsgjfCH3b4B9HJmME51KoUvagkY
	+ZVs61lRWleBIFDku22rGyimLxvJckjujQlZe4kPVe1MUTeBgnNeXAWtpAjcpylq
	5c2aLRZb5JukM9X4pYFMDZQAQdLRPUU7Z7NkuMyke7SGE+5lAG7uvcyBY1XZMo5k
	cBLXXA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbj3fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 08:24:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109ab1e1dso30734691cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 01:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755159853; x=1755764653;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=STzZkkK3s0ULF0XUFVwg+6IbX+TqSk42ASKMrRFRGxU=;
        b=mqbFs5WuicGzoNtacnPLbPsKv2N2TOAALdQuE+QfhNTybxyUvjTt1RNERglgsF/hlW
         NCrg5FSy34pvoZDf+4gWjQsZYdYINO4YbQCJDqx3r07Jj2ufyzNT4Af4yGGr9oRHpDAl
         iaXGh9urdripoxbXU4F5NozC1sPSvUpg8tFCnb9ctbu3t3dhol2ikJEVXp+5H7mOKOPM
         rKHyzkZ4E4rA1Kasj7GXPcDas15tUgshKTYLGhcE0IwKDV4ag6sqQbDfLKtbWkRtSrrv
         nOkHffIgaLaPlC/oNXzRZm7mmSuDqmhZjscrKj6oHsodWy4JkRl0Ls/BFoIltC0gW6a2
         d9Qw==
X-Forwarded-Encrypted: i=1; AJvYcCX0cQPOsmn8WID8CfwlQ8SHjhRPrspsbKzExZcO3snijCBIavnofhe8gIhbb8wfyk5rII/esTNPNWkjV/1O@vger.kernel.org
X-Gm-Message-State: AOJu0YzofLwOnANEbnC9xlXM8zQVON8qXHf0YabGWilGdoXLwqyrDD0z
	uSp+vrwVCwasIe3DgaMZFV27PkRFH2UGdphN7tuU/jD2bGKgd8geVrUEhZpXuo2zIMpcvG19D7g
	YjjSaUNpieIEY5c52eJ8iPFY6H1Du1G3TLFApPPRgQy0Vh5WAKqUU974wdces8dJGB+W5o6RIwG
	XMLh4=
X-Gm-Gg: ASbGncufrSNlTXm0x48z4SrF6X2hnzN7eCA34YOzlNuFsQDwWL4uGcytYR9n/I8Qyo/
	wLjVL4PaMg9VZNQCek9+QtPGQc7bV5Qc9Q/ZZsaUj4TEBpAoAcZvZmE8zYY+pjkQJWWVn5d+YJr
	OVor4u/hWZRIFULrlpE5usjbB5IckLTRO0XkjkqLdzGbxk9nh0Av48gVdyKQWdDl2UIesE+zu+i
	VkENxiG8EbcO72Ca1HRavtK5QqrUc6ITqo8TTvDRfgvgC9rSzbhxIIm8OLtxsrMC4v5T1t8DMBM
	IeQS+5CNNgk3yAkb/T0yENKXBRfFfgu0bnmmwyNRyM3ej1hMPFSFTXVjFCLHv3uku0UbDXQDSmX
	aaqzqo8eiRcOI0F1mKzwgK7eQN5PHYGUz1YG1GZFsi3YlxXPJxET6
X-Received: by 2002:a05:622a:99a:b0:4ab:6499:7864 with SMTP id d75a77b69052e-4b10a96a5a5mr36305841cf.22.1755159846696;
        Thu, 14 Aug 2025 01:24:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPX29qryebvlyshE3WKiFvt9j6kVQRM4jDsF730RtTEEqTpS7RsbGTjBh8FQJrkQYwPSfPYg==
X-Received: by 2002:a05:622a:99a:b0:4ab:6499:7864 with SMTP id d75a77b69052e-4b10a96a5a5mr36305601cf.22.1755159845980;
        Thu, 14 Aug 2025 01:24:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88cb7f40sm5652859e87.171.2025.08.14.01.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 01:24:05 -0700 (PDT)
Date: Thu, 14 Aug 2025 11:24:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Yingying Tang <quic_yintang@quicinc.com>,
        Shuai Zhang <quic_shuaz@quicinc.com>,
        Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v5 0/3] Initial support for Qualcomm Hamoa IOT EVK board
Message-ID: <5reeryefhw7burzf2lymhg5wivaq2n4gq5hszvfp57dergvpyx@qehaf334gdrn>
References: <20250814-hamoa_initial-v5-0-817a9c6e8d47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250814-hamoa_initial-v5-0-817a9c6e8d47@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689d9d2e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wouTI8Ndp15Em8D2RjsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX6mDQmeQn7rmX
 P9oQjb36kLZRTbbncW7o4Btnve8n3QBFapsf08Dc4JAXKC6Cpf3OuJF4Xiyyhvo7JJ7V3RXMal1
 vG78u9upTeZoSJULu7Q8OJWgkJ2p6A57pcDoAI8eh5YwYYOfNaTBWTYos4UIfmCt8dGq4WYKHXf
 e6dVtQdfcaI6TLl6GMctevk4584d18fvV6F9S+JNRWqfR97noH9jmJL6WiHuvsVnZA7mc+PbBWq
 KtZW/LoaWAYeJR9lvGGYh2cen6byfWfVicxMJFeG5httm8mChdSTFdEvRe24V1xaBfjFE/0jrTa
 h2ipfSV4cs8hKZnPSbDlK3cWjPr2DsIaAMkUAgBvICqChqInl4zZC5vnwvaEkgst8Aq/0UB0+wc
 w1XfW7Q2
X-Proofpoint-ORIG-GUID: spXe0mbuE3CeI6VePCSaqPKSw3x5LZNx
X-Proofpoint-GUID: spXe0mbuE3CeI6VePCSaqPKSw3x5LZNx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

On Thu, Aug 14, 2025 at 03:27:27PM +0800, Yijie Yang wrote:
> Introduce the device tree, DT bindings, and driver modifications required
> to bring up the HAMOA-IOT-EVK evaluation board—based on the X1E80100 SoC—to
> a UART shell.
> This patch set focuses on two key hardware components: the HAMOA-IOT-SOM
> and the HAMOA-IOT-EVK carrier board.
> The HAMOA-IOT-SOM is a compact System on Module that integrates the SoC,
> GPIOs, and PMICs. It is designed to be modular and can be paired with
> various carrier boards to support different use cases.
> The HAMOA-IOT-EVK is one such carrier board, designed for IoT scenarios.
> It provides essential peripherals such as UART, on-board PMICs, and
> USB-related components.
> Together, these components form a flexible and scalable platform, and this
> patch set enables their initial bring-up through proper device tree
> configuration and driver support.
> 
> Qualcomm SoCs often have multiple product variants, each identified by a
> different SoC ID. For instance, the x1e80100 SoC has closely related
> variants such as x1e78100 and x1e001de. This diversity in SoC identifiers
> can lead to confusion and unnecessary maintenance complexity in the device
> tree and related subsystems.
> To address this, code names offer a more consistent and project-agnostic
> way to represent SoC families. They tend to remain stable across
> development efforts.
> This patch series introduces "hamoa" as the codename for the x1e80100 SoC.
> Going forward, all x1e80100-related variants—including x1e81000 and others
> in the same family—will be represented under the "hamoa" designation in the
> device tree.
> This improves readability, streamlines future maintenance, and aligns with
> common naming practices across Qualcomm-based platforms. 
> 
> Features added and enabled:
> - UART
> - On-board regulators
> - Regulators on the SOM
> - PMIC GLINK
> - USB0 through USB6 and their PHYs
> - Embedded USB (eUSB) repeaters
> - USB Type-C mux
> - PCIe6a and its PHY
> - PCIe4 and its PHY
> - Reserved memory regions
> - Pinctrl
> - NVMe
> - ADSP, CDSP
> - WLAN, Bluetooth (M.2 interface)
> - USB DisplayPort
> 
> DTS Dependency:
> https://lore.kernel.org/all/20250724-move-edp-endpoints-v1-3-6ca569812838@oss.qualcomm.com/
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> ---
> Changes in v5:
> - Update base commit.
> - Drop an already merged patch:
> https://lore.kernel.org/all/20250804-hamoa_initial-v4-2-19edbb28677b@oss.qualcomm.com/
> - Link to v4: https://lore.kernel.org/r/20250804-hamoa_initial-v4-0-19edbb28677b@oss.qualcomm.com

Please keep full changelog rather than trimming previous iterations.

Also, is there a reason why you didn't pick up audio and display chunks
as it was requested on the corresponding reviews?

> 
> ---
> Yijie Yang (3):
>       dt-bindings: arm: qcom: Document HAMOA-IOT-EVK board
>       arm64: dts: qcom: Add HAMOA-IOT-SOM platform
>       arm64: dts: qcom: Add base HAMOA-IOT-EVK board
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml |   6 +
>  arch/arm64/boot/dts/qcom/Makefile               |   1 +
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 987 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi     | 609 +++++++++++++++
>  4 files changed, 1603 insertions(+)
> ---
> base-commit: 2016d952577e807ee89e0cef02af1f95aabbbcb2
> change-id: 20250604-hamoa_initial-0cd7036d7271
> prerequisite-message-id: <20250724-move-edp-endpoints-v1-3-6ca569812838@oss.qualcomm.com>
> prerequisite-patch-id: c536bf9ec7fd22af9b05b695272997615dfd675f
> prerequisite-patch-id: d513e5a08d3be585b9b6a737ef3a1ad275d7caad
> prerequisite-patch-id: 605ef6f89dd84f810df11be9d11ee6803a6bf289
> prerequisite-patch-id: 2ab2430624acbdd9011f6c0c2a77469fd19fc75a
> prerequisite-patch-id: bfbb562513763ce75f2bb5da7f12e7b54ff3919d
> 
> Best regards,
> -- 
> Yijie Yang <yijie.yang@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

