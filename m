Return-Path: <linux-arm-msm+bounces-91506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBGFIhyxgGn6AQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 15:13:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 348E8CD373
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 15:13:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08B063068F11
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 14:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C98736AB57;
	Mon,  2 Feb 2026 14:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HO17UQf6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D4836654D;
	Mon,  2 Feb 2026 14:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770041084; cv=none; b=DnUpDQ7pUJpdYKLavwGhMF88clRWTgpNgkYEqMsS4qPOuz9/A5y3gAKqY46KrYmojWXH9pY7JBJsKELVu2bIf+tziOKWQs+zqera7mFS8XQjRTpBkMofwucUtsra/9QlKyxmYCjZYLqhpxUN9GmssblD2AT471qV8nq1qoaqX+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770041084; c=relaxed/simple;
	bh=SXuNNOnsQdFJa9SM+WHqux1k31fSFS+8p5nyixxKTJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbDQyInj7A7Oi1EisxxyVMzyiQ0W/WZQnnnvx2L1qp9vnzM97F8/SM8Ygar/mWPSXXhwug3fKEREd37gvcaQdmLHMrlK3+kqKcZgvXmQE/jE+75S+YcV8UH4LF1Qsnf0hY/KNRKGsOaXQRjpu2j+Ac8y5zCFfC0DKU//KRj1kwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HO17UQf6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54DDC116C6;
	Mon,  2 Feb 2026 14:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770041083;
	bh=SXuNNOnsQdFJa9SM+WHqux1k31fSFS+8p5nyixxKTJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HO17UQf6jX9VBo5h2uNe0FhP5pMsqZvgqeBo7PJdXPpAnIAGY0bZfPKwaYnQO46aQ
	 woKYoOJwu+4SN16iUYE9sPExv5gywBB6lUMXG1Bc/vS3tCSSzqHLfYf0ubfABKYVcb
	 1YYQVOoAFKYsEprcuqo1z/qfDAOKyF50w1Ykhtr2T9GsFeXsfgI2cqaeEldGw8krq3
	 cQZ2seOf4J3VUtfq05qkeNDOyYhQi9LgHjfeTDGUgqfirYWXMbFXby7hwIICyrbm+9
	 +Mku1CX8mo9puXeHJrkw47YFEqv+IkRgD7bqRM2w9lfupLXMa9SnA0MsuEt5AlEAc+
	 GBABLITYgOySw==
Date: Mon, 2 Feb 2026 08:04:41 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sumit.garg@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: ipq9574: Enable eMMC variant
Message-ID: <px6xpdu2mafxunvvlx6svf3blyzh3w4le4c7jqgxqeerbsgq2d@3rsoiwpkcguu>
References: <20260202073322.259534-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260202073322.259534-5-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202073322.259534-5-varadarajan.narayanan@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91506-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 348E8CD373
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 01:03:22PM +0530, Varadarajan Narayanan wrote:
> RDP433 can have NAND or eMMC based on a board level rework. Since the
> same GPIOS are used for both the interfaces, only one of them can be
> used. Add a new DTS file to disable NAND and enable eMMC.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
> v4: Move sdhc properties to SoC dtsi.
>     Disable nand (that is enabled in ipq9574-rdp-common.dtsi) here as
>     the eMMC variant doesn't have NAND.
> 
> v3: As qpic_nand is disabled in ipq9574-rdp-common.dtsi, no need to disable
>     it here. Just enable eMMC.
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  2 +-
>  .../boot/dts/qcom/ipq9574-rdp433-emmc.dts     | 24 +++++++++++++++++++
>  2 files changed, 25 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6f34d5ed331c..d5fe12ef4300 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -26,7 +26,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp418.dtb
> -dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb ipq9574-rdp433-emmc.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
> new file mode 100644
> index 000000000000..9053838ef696
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
> +/*
> + * IPQ9574 RDP433 (eMMC variant) board device tree source
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "ipq9574-rdp-common.dtsi"
> +#include "ipq9574-rdp433-common.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. IPQ9574/AP-AL02-C7 (eMMC)";
> +	compatible = "qcom,ipq9574-ap-al02-c7-emmc", "qcom,ipq9574";
> +};
> +
> +&qpic_nand {
> +	status = "disabled";
> +};

I'd prefer you keep optional peripherals/buses disabled in the common
dtsi and enable them in respective dts, this generally gives cleaner
layers.

Was this done on purpose?

Regards,
Bjorn

> +
> +&sdhc_1 {
> +	status = "okay";
> +};
> -- 
> 2.34.1
> 

