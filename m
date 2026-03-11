Return-Path: <linux-arm-msm+bounces-96997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOpTMbBusWlVvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:31:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 579EC26490B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A7BAD30325C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C9732E72F;
	Wed, 11 Mar 2026 13:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxF3tEHC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD08832D43C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235870; cv=none; b=XbYeh0nwGf7sgjH1TSrAcKgkNkCLrk34plImr+JtbT5ZuW+kFPCHyeyrFMgTuYlRa/G6mg2RAJ6P9Gy7rWbQB3VZX+Q0xVVRXLLFEgafIk6zcPtrrYlBvPvNxowlYX1CphPaQJPuwCMHoHgY+dfuHFacgPJHfzqpdZdcug4ht3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235870; c=relaxed/simple;
	bh=pKJkoKTrp7hzxZvbwVJr4wyjKCg0av7BkleQT+Zt73Y=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YD6sijfYTISLrd9UWhOZMQ0l4KRAS3NtLFPFhsAwkBYxg0w9czTI8Nx6CeP0vjlD15zU+B/TfGarfvtRljj2AvcjQOXb5B5ROzWS3Dj0potos7N7xpsvvDpg7Bm5Gxph8H6ODJArkkSvv9uWwZFLPEk+4m/8xmRxAtMKveeLebA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxF3tEHC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DA0C19425
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773235870;
	bh=pKJkoKTrp7hzxZvbwVJr4wyjKCg0av7BkleQT+Zt73Y=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=dxF3tEHCnzw/2/O529VGrKPviMpfWx95CPyuppoUNr1kDGtW/RRD972dXGb7uPD0Y
	 Si26oGIVdvXa6eiaItQyfUpv5U3qnYWqbyTH/bl6Q1ZFGC6+FojgJy9XDeGwp/RyDd
	 87l6v63TIxafVPGOrS4Da/5pp3aqlU7LJEeOHTc9o8+xGSXzyF2rYhvoBz/A7b8djb
	 GeudHrRGq5QQGxfNSqLPh1EJxbq49QU6KHcD8014GTyK+PNGk96zXL98sDYANA7K/R
	 13GJLHsZrMFhc0PF6RINmxxoEtrNE7TmtjFxQMbwExNPNtQuafiUGx/ikNo/+FRJhp
	 74MZIhrUAdfqQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38a335d84a0so59354191fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:31:10 -0700 (PDT)
X-Gm-Message-State: AOJu0YxxwRV+47pLN1BWFYqNpPxipKXAP32c8ysIMRb3+UUdgNaAnjtI
	sYTWAyj5DCnQIUwUdE/ckwZau8X4dPB36ZSFSquKeaPIOqBBW0ZgZBZhGjK3686ihnL9iBhJm/V
	0Rm8GRg79KhA2lN8UTDihtbN579tBo+dwjBLTLETdIQ==
X-Received: by 2002:a05:651c:1549:b0:383:5390:bc96 with SMTP id
 38308e7fff4ca-38a67aad6bemr10145771fa.0.1773235869042; Wed, 11 Mar 2026
 06:31:09 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 06:31:07 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 06:31:07 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260304-b4-scmi-upstream-v5-2-f8fc763d8da0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com> <20260304-b4-scmi-upstream-v5-2-f8fc763d8da0@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 06:31:07 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdWSU82R-tGor5uP=UqosoV6Hjmpn03XdqAgVzhprSGpw@mail.gmail.com>
X-Gm-Features: AaiRm51UWpkQOgWiBnzPzEkbIsk5ctHx0LmP7-JW3L9as5wLmQXbPYhk1uEXN_c
Message-ID: <CAMRc=MdWSU82R-tGor5uP=UqosoV6Hjmpn03XdqAgVzhprSGpw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: Introduce sa8255p SoC
To: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>, Nikunj Kela <quic_nkela@quicinc.com>, 
	Shazad Hussain <shazad.hussain@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 579EC26490B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96997-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,quicinc.com:email,mail.gmail.com:mid,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, 5 Mar 2026 05:28:29 +0100, Deepti Jaggi
<deepti.jaggi@oss.qualcomm.com> said:
> From: Nikunj Kela <quic_nkela@quicinc.com>
>
> Introduce base device tree support for sa8255p Qualcomm's automotive
> infotainment SoC. The base dt file describes core SoC components- CPUs,
> CPU map, ipcc, QUP,  geni UART, interrupt controller, TLMM, reserved
> memory, SMMU, firmware scm, scmi, watchdog, SRAM, PSCI, ufs, pcie, pmu
> nodes and enable booting to shell with ramdisk.
>
> The Qualcomm automotive sa8255p SoC utilizes firmware to configure
> platform resources such as clocks, interconnects, and TLMM. Device drivers
> request these resources through the SCMI power,reset and performance
> protocols. Assign each device driver a dedicated SCMI channel and Tx/Rx
> doorbells to support parallel resource requests and aggregation in the
> SCMI platform server. Operate the SCMI server stack in an SMP-enabled VM,
> using the Qualcomm SMC/HVC transport driver for communication.
>
> Group resource operations to improve abstraction and reduce the number of
> SCMI requests. Follow the SCMI-based resource management approach
> demonstrated by Qualcomm at LinaroConnect 2024.[1]
>
> Limit initial support to basic platform resources, serial console, ufs
> and pcie.Defer enabling USB, and Ethernet to subsequent updates.
>
> [1]: https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte
>
> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> ---

Just some nits, looks good to me.

>  arch/arm64/boot/dts/qcom/sa8255p.dtsi | 4861 +++++++++++++++++++++++++++++++++
>  1 file changed, 4861 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sa8255p.dtsi b/arch/arm64/boot/dts/qcom/sa8255p.dtsi
> new file mode 100644
> index 000000000000..4f8529db70f6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sa8255p.dtsi
> @@ -0,0 +1,4861 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/mailbox/qcom-ipcc.h>
> +
> +/ {
> +	interrupt-parent = <&intc>;
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	clocks {

Stray newline.

> +
> +		bi_tcxo_div2: bi-tcxo-div2-clk {
> +			compatible = "fixed-factor-clock";
> +			clocks = <&xo_board_clk>;
> +			clock-mult = <1>;
> +			clock-div = <2>;
> +			#clock-cells = <0>;
> +		};
> +
> +

[snip]

> +	firmware: firmware {

You never use this label.

[snip]

Stray newline? Same elsewhere.

With that:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

