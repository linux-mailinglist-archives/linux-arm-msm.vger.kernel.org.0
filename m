Return-Path: <linux-arm-msm+bounces-76375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DA411BC491D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 13:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0D71B35180E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 11:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDD42248B8;
	Wed,  8 Oct 2025 11:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cav5u0+G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EFD130A73
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 11:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759923061; cv=none; b=F3UrdV7m9IwPTHBELIsFH66oHDgeI80N7cB5L3henJyEV1tVwUN2pRHAQJtW/3eZzd62DdAk4jVl2Uy4upkblqR+DEJRq5EEz541hMhaWTuJ63NeEanoP0yXgLK3Y9KhU/flZwfkJFUutp/E2i0o9Gjikt5zuH98JlFzRIX3NDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759923061; c=relaxed/simple;
	bh=zu8srtjs/VvDHGLC2NU4E6Rl5RoR5FKBFQQLdfu8gKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QHncaRQrdsbNMuAHJrv3ts6niDPpX7mw0GJZMWB6uWPkjRDlH7go+jh++cUjgVXolzao2kFthpmHY1PPMZT8jBjVmkfzVcyrr3bRhwNy1/FUbmsr3ueIKdptv6E2pCs6NRIU8mkMxXvEqF114rKcljK0JgVxrYRge1sxdQmACHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cav5u0+G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890Okv021162
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 11:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oeyjEDktIox9UBLyHqazReHxq3mp8y+F8tUeuGtBHUU=; b=Cav5u0+GM3KmIWYD
	wkaWInk/R/COwo1MmoHFo0qKXFhEKaNl0Tt8B+/9VU8T5sZnjecKg+5o/nmYOlTu
	bT/+9l2gFbf8RgcQe4r96ZenrQMe2Ohe7e1K6Gil22sLJ4VwCB85RpFdx1429g49
	eheqb9OrYFH5ORTn8Sp7rBtwJuEd4gPS/pvEq7vIJAkrC6acz4B86OEidb1Gk8Es
	OfSNFM8wXlcX9Fekf+LIiy0wiXJJaIdjllohi9shM7JswfxflftUJVpCzzXMUhAA
	7dV7KEl4PB+Rg2fh1aBo4Q8CMsuEpLx3cE7WljrJuZnux424TZwrHzKRva/3dHWW
	vr2JGQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1t6kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:30:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-78104c8c8ddso6741246b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 04:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759923058; x=1760527858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oeyjEDktIox9UBLyHqazReHxq3mp8y+F8tUeuGtBHUU=;
        b=D5eo2vwQeam46VaK7QV4VKnyF3Opo5/jL4Tcwuy8cJtne/EuQJlqSWFGUgeFXXpHqY
         5UUukNF2lwJIaAiTQolgyshO0sTVMQ2Bgl/9oTMKbPrrrL+izoqDRAFSXYQfgpmnjbHc
         0aWjVfy9XBp8xMBSHAeiFSXMMoxYd6TXawUCHFE55tFvmbU68jzJQ2xJWaSfeJmJESZj
         LJrm20dYi3FzPy5juy7LGaaZm8+bcZTvu0SgwCvNETjXs6XMh/wuj6KkNSkm1nEXdZ4x
         Q0WodTFGHc+C8n4J9AIztvSeXoXeQw0BSzd+OGpiE6uqkpZSgSqZEiDQDVFl3YxEjTPO
         SHNg==
X-Forwarded-Encrypted: i=1; AJvYcCUBv0q3P1OL/t0AzZmfBjSGrdKY21+IagcOxB0P96m568cGQbMoQAl4aMIDUb/xW34tDg2FrICi5EL9Bwku@vger.kernel.org
X-Gm-Message-State: AOJu0YzXo9CRtKkSdNmm7hTORdH3rAw+87B8ueT7RK4yDljeBWPKvxWB
	fvjNDn2v2TQlXT5Hk5AecYfSKnhFn4rVpi31u/RkzBoRtOK6oJ05gAuC9HoRCbUGZrgkcpwnHbm
	jtK8Obm8YYcqlVpDG5wzUnZ1PRqGQtk5N0VLcP0CwQ0KC10IUQt5lrt7PydDZtHb+Gh/N
X-Gm-Gg: ASbGncup498Ujz8e1p5d64S/i9hjl/vdYUKWJvAUzT9xxyYbIrVRv6MkW6BczvKCCTp
	ZvUyahljze8NvRgjo7uvF8L+5mPbEr5zw5+v4822+PwefF1XavDCwPu+kyiiea8AQCsa6nVGyrz
	uSKVmbB9pv80kOiue3zwmIUDmbAmKf/NdfoFOVfkchXodKbPM5f2XxRKeDN7pZZin0W35uGLOP4
	gmiy7UozZ9THksLYz8FtHMEirqwC7IllBphVcFXVlxC7nRjpMlBTdvVCsWeKqUcqixYm317qqTc
	YTkJGkll3+AQj2wCBqaT+IrUch77REufnMy4ALcpvXXMsyJ4cDY5/XWjvs5SeAcE5D0fYCxF9nu
	LLxnRUzYXQz5cLujntI8QABW66g0iN8o7wpHsX5X7zECGgIou8mSYemXFjbQnPQA=
X-Received: by 2002:a05:6a21:9999:b0:32b:7001:6601 with SMTP id adf61e73a8af0-32da814f674mr3981164637.25.1759923058244;
        Wed, 08 Oct 2025 04:30:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKUu9FJQdAllcNJOPLYlAIk3iB9sIRFpyX5MjL+2NG5pT1aPZFr8VldEU2DqxpUxZzi+Cjkg==
X-Received: by 2002:a05:6a21:9999:b0:32b:7001:6601 with SMTP id adf61e73a8af0-32da814f674mr3981116637.25.1759923057714;
        Wed, 08 Oct 2025 04:30:57 -0700 (PDT)
Received: from [10.79.195.127] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b510ff9a8sm3107175a91.8.2025.10.08.04.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 04:30:57 -0700 (PDT)
Message-ID: <6563611c-b7da-49b2-822b-79c5c5c67237@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 17:00:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/24] arm64: dts: qcom: Introduce Glymur base dtsi and
 CRD dts
To: Marc Zyngier <maz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-3-24b601bbecc0@oss.qualcomm.com>
 <867bxm1y8j.wl-maz@kernel.org>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <867bxm1y8j.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fV-Nu-8s64h3dYmyAllu6OmyLyanX6sF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX9saUoroX/R7k
 GnDaGOWO2qr40Z8RxhciKRaUmmK2rt7+A+ll7Mlkz9B2Fc2kQQvwsb2RnMX3fK0dkf+R14AWq7o
 YnMjO/GZNgR2lezjowRvXTLZ08QP6Qp5V0fUIz9ySTgTG2FC0GtdTH2GKpZTOrCfMC/Bmjzvvxo
 XxqT6RVfYbQWNOUX8GoeonYoCkM4gBH4UeFp3NQtnt3/G6er7etflZEFiJnQfdrSjEpR28HSLJd
 prGT54gjJRCnmihMT5PpvHINIlNtzwSJRExGnMD+BWgxsLk2E7gehS71ETYua/fmOgPPRyEkeX0
 Nrym+YrhJjgXIV3C0xmyJNVP759fiq376pizy0pMks1ho1clpojBzGOBQCRsZeZ4/W7YkVmKhca
 CvFtMlp5GcaGxapH0W/D/bObhEebTA==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e64b73 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=mQOHZLyPYVvQyi9y9SsA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: fV-Nu-8s64h3dYmyAllu6OmyLyanX6sF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

On 9/25/2025 6:32 PM, Marc Zyngier wrote:
> On Thu, 25 Sep 2025 07:32:11 +0100,
> Pankaj Patil <pankaj.patil@oss.qualcomm.com> wrote:
>> Introduce initial device tree support for Glymur - Qualcomm's
>> next-generation compute SoC and it's associated Compute Reference
>> Device (CRD) platform.
>>
>> The dt describes CPUs, CPU map, GCC and RPMHCC clock controllers,
>> geni UART, interrupt controller, TLMM, reserved memory,
>> interconnects, SMMU, firmware scm, watchdog, apps rsc, RPMHPD,
>> SRAM, PSCI and pmu nodes.
>>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile       |    1 +
>>  arch/arm64/boot/dts/qcom/glymur-crd.dts |   25 +
>>  arch/arm64/boot/dts/qcom/glymur.dtsi    | 1320 +++++++++++++++++++++++++++++++
>>  3 files changed, 1346 insertions(+)
>>
> [...]
>
>> +		intc: interrupt-controller@17000000 {
>> +			compatible = "arm,gic-v3";
>> +			reg = <0x0 0x17000000 0x0 0x10000>,
>> +			      <0x0 0x17080000 0x0 0x480000>;
>> +
>> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			#interrupt-cells = <3>;
>> +			interrupt-controller;
>> +
>> +			#redistributor-regions = <1>;
>> +			redistributor-stride = <0x0 0x40000>;
> Drop these two properties. I assume that your GIC implementation is
> compliant with the architecture, and doesn't need hand-holding.
>
>> +
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +
>> +			gic_its: gic-its@17040000 {
>> +				compatible = "arm,gic-v3-its";
>> +				reg = <0x0 0x17040000 0x0 0x40000>;
>> +
>> +				msi-controller;
>> +				#msi-cells = <1>;
>> +			};
>> +		};
> [...]
>
>> +	timer {
>> +		compatible = "arm,armv8-timer";
>> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
>> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
>> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
>> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> You are missing at one interrupt here, as the CPUs have both secure
> security state and FEAT_VHE (hint: the EL2 virtual timer also has an
> interrupt, usually on PPI 12).
>
> 	M.
>
Will fix both nodes


