Return-Path: <linux-arm-msm+bounces-47583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38121A30CB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A433F188209D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4231D20C473;
	Tue, 11 Feb 2025 13:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NR0mJh3N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B421F891C
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279997; cv=none; b=DadugNBbnhkZlGaq4PRBaxmrw6Qf2PFgLZfWc6VDXzlRGPjbTEU1PWJY19Qq7JF9fsZi9sV44JPDVNzebVR7ep+v7w53MrfCx5azdX4VuD60NMES+tAmXPP7/NOFQhW2u35yp4VWpAVzdwbgJdx6WNb6vHnUNB6PhsQ25ZpnZEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279997; c=relaxed/simple;
	bh=QKlyKakevPKbZlXRttwq1+XMDUWDv/mp3XwjZkSNztA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JERVxs5VHvsd2iaNbu4qmXT6E91rUMDRXowH7Ys5SmmqsxPZr/2duFaZBefsXtixzG0U2dNj6w/Rn49LQVmlnG7mgXPjcHrxzhC7Mx7VtK/vkpq2WDTiMduqHkVdCWSjGdepTKEgIS+S62hOzv623YeJjm/OuhL9IzRzoiDUvts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NR0mJh3N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BDDKw9011562
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JOisIeMKhaMre/mucrOBZcJGPDoiRYiGHCkyjHs764Y=; b=NR0mJh3N8+Ht8A8+
	XdyS0Xi5qdpQXK7GWY5394wfnNd6Na1LrkNANX3P7QwPgoKaigRJYDDc3wwvAUyx
	MOofwIt/hrdGUI2fvZF1e++Rgzy131yA8MnZ+iGWw+xV/dNF5zv6KBZmvfMfzoSC
	kh7ZKCClS7tDrhpyP/54Un9EzPEjIFqgCojYbyR4Oy1RO1Ar6GZ7kXnQvIgj/rJw
	1016/mWyosrbcnmRBI8xN3FpRe8cjcOhLEtlgFNMVeCFTxmDv+8F4l6461F7kMQg
	57J4TC2ki1iV+EUnHHvuFgDKnFZCXhxav6dm8QW4acQPARv2HW3NTy+kVDMAQwVo
	LabPjg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxv3sfwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:19:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-471921f2436so2326051cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 05:19:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739279993; x=1739884793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JOisIeMKhaMre/mucrOBZcJGPDoiRYiGHCkyjHs764Y=;
        b=p/8DbQqABLAdl87xjCP8h8pa87CcLxrAOLE3ltRydRzSFJvyU7LvSqG1R+SsD8GmrQ
         v1d+fCBwj/pnS+gpEHgZDsY+sYhHRsrOz2QeU3JHkHVZxBm35rxpiGP81yOadIk3a1Tu
         rI7uoX7xhtKTp8ughLnV7WEUIvkglg/2euS+w0wVc/Cfg0V+U0tjKgJgIyTg/Ew1dzXb
         zcbfAyL50vZRxZxHij8gtd9ouhz7n4RXvlLB6pJblyLU2Xu6JFokhNLDO2vqqTh1aKZ5
         oFlHTlMNfar5+i+9PKFpLic31nPUJAVZEMsfydKMI+zrTvlnHcO88iUx8IVdAtr19tAu
         8jLA==
X-Gm-Message-State: AOJu0YxqLpxdzdmqJYHvdtlezO+dk0UmZDqsc/pkGDYVHEjWGQdxbd/u
	TbzK1FTaPEFrtrZz4Z3wBKnpdx9S51mBx6SZkq7mXhNqomyeYB06/rP/joEHJjnukei7u1imwxa
	HKSXpxA3EgfCVltJL5PQTK8Sb2l5fG57BqdayLBlbnafHZpKIQadKdPnz+bn7kXie
X-Gm-Gg: ASbGncsyagn19APLwt9N4O6ZeyR6aGxJooPnAhVEOQ99VZRAueg9zSuY0CE3GnnW20j
	jGrZ8NqZ2gg2O37rJitGI7VQgsUkEqTLcBvZVi3No8bHz8hGKxBbw9yh3kHnrdqVMTnTKF6d7bn
	yG1OKVHZWP1yMK6XdBR8b7cFsU4pvjyZLT0c8XWs+yO4aB5qlW6MS6Zr128ylUmpDwpr1lXkxRd
	F4iETt49OhwlbuwDw94NtQYo2J6tK49Zu3v6xiTNqLIV7B3iN5dOMruzNQLCPAvEwGgPvNAey5m
	cq9mphoj7u0z1U1yUdFMuZwTza7U6UjcIXsMEytVk6WywS7yJkP/UnoxXC8=
X-Received: by 2002:ac8:5f4d:0:b0:46d:d2d2:390e with SMTP id d75a77b69052e-471a3e19d69mr10640371cf.14.1739279993575;
        Tue, 11 Feb 2025 05:19:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZa9b0DBu69beqWOOt3Vvof3AOvSmtwgQsb5mCQEuJ0isnxAdCTxgz9ObigZW0hbSXLqr+Gw==
X-Received: by 2002:ac8:5f4d:0:b0:46d:d2d2:390e with SMTP id d75a77b69052e-471a3e19d69mr10639881cf.14.1739279992010;
        Tue, 11 Feb 2025 05:19:52 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4fe72207sm7666488a12.38.2025.02.11.05.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:19:51 -0800 (PST)
Message-ID: <e583f295-4629-41dd-83e0-529042700794@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 14:19:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/13] ARM: dts: qcom: msm8226: Add modem remoteproc
 node
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
 <20250129-msm8226-modem-v4-9-2b02ed7b7f1c@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250129-msm8226-modem-v4-9-2b02ed7b7f1c@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: huQYlgUtRfk9XD_TcrdDOhoh-2JB54CU
X-Proofpoint-ORIG-GUID: huQYlgUtRfk9XD_TcrdDOhoh-2JB54CU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_05,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110088

On 29.01.2025 12:35 AM, Luca Weiss wrote:
> Add a node for the modem remoteproc found on MSM8226.
> 
> Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

[...]

> +		modem: remoteproc@fc880000 {
> +			compatible = "qcom,msm8226-mss-pil";
> +			reg = <0xfc880000 0x100>,

This one's 0x4040-long

> +			      <0xfc820000 0x020>;

And this one's 0x10000-long

> +			reg-names = "qdsp6", "rmb";
> +
> +			interrupts-extended = <&intc GIC_SPI 24 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";

Please make this and clock-names a vertical list

> +
> +			clocks = <&gcc GCC_MSS_Q6_BIMC_AXI_CLK>,
> +				 <&gcc GCC_MSS_CFG_AHB_CLK>,
> +				 <&gcc GCC_BOOT_ROM_AHB_CLK>,
> +				 <&xo_board>;

rpm xo

> +			clock-names = "iface", "bus", "mem", "xo";

Konrad

