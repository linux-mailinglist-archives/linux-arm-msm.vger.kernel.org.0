Return-Path: <linux-arm-msm+bounces-84528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4231ECA98CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 23:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DD893158122
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 22:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B0C2DF3F2;
	Fri,  5 Dec 2025 22:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tkIdNrcc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36512296BDE;
	Fri,  5 Dec 2025 22:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764975242; cv=none; b=jJZTm+glgGFMO4Bx3dO9+8HvHuUV+2xpKNaQO3ACMqBG4+XqOKG+ZMQNhN1t9+JLHbj6AESDv9H0QRyRpTje+cGxrPCdRNdV+o0zHdEGKj+JRRBiIV1uSHspecUrK+hZLz0bmL1IPSA+Smy+d7BWmltJv9wR3UK+7Ba0+JiFi6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764975242; c=relaxed/simple;
	bh=JHfUFbNwP+F8C/TtZ4sOmd50QMNZcQvkkM5b7PkxVRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QRk/+rUhyGO1KLCQ0iB3YSisCSIRdbWrU3WDZZLn9HHP3Reml7VsrEc2NzvxCobuQyks2ghAYggX+v06EbbPfm6qBp8VuG0jprv/9TigBSJJFL/Mr8B+GjIdrQ8Xqv0kRhvacG/Bx4S5v3OCMgLZvhEPqa3x1aIbPNo+Ozukuo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tkIdNrcc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0271EC4CEF1;
	Fri,  5 Dec 2025 22:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764975241;
	bh=JHfUFbNwP+F8C/TtZ4sOmd50QMNZcQvkkM5b7PkxVRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tkIdNrccDeIXm22ngmaBIfI5YzHIDgcDOH5haIxuuaaP+dPGVIwEPM54ZJ5XX0j69
	 fgwcpsehwh9IDQFrHIFP99/4+b9mJ8h3Km++j6rqwK5kM/M/HjKZKNahk1ADKU1Uk7
	 gn+sJdslLSo19TBbHSXpG6S3pM+IesotH4/d4vuiHWVlsIBiNgLPC4dZg1xWGu2xV7
	 bX2uR9w/nTMjP6iX3uibXFnAh4nf2oPoNG6UOTFv25NRpOrtX+WmioYfRiUS6mgVkZ
	 iiMKtDn0Nq/XrVJ8B6VnAgO5AxSBz3SFfv3+2RDkQvO2TK33aN9O3KziN0glNYXVRy
	 o5gjjwBmHNXEg==
Date: Fri, 5 Dec 2025 17:00:20 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 14/14] arm64: dts: qcom: Add EL2 overlay for Lemans
Message-ID: <537jfsochzicr6pha6jt46ngltk2z4jjm5se7sti3klcgjd66u@wawpyrsihqeq>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-14-8e8e9fb0eca0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-kvm_rproc_v8-v8-14-8e8e9fb0eca0@oss.qualcomm.com>

On Fri, Nov 21, 2025 at 04:31:16PM +0530, Mukesh Ojha wrote:
> All the Lemans IOT variants boards are using Gunyah hypervisor which
> means that, so far, Linux-based OS could only boot in EL1 on those
> devices.  However, it is possible for us to boot Linux at EL2 on these
> devices [1].
> 
> When running under Gunyah, remote processor firmware IOMMU streams is
> controlled by the Gunyah however when Linux take ownership of it in EL2,
> It need to configure it properly to use remote processor.
> 
> Add a EL2-specific DT overlay and apply it to Lemans IOT variant
> devices to create -el2.dtb for each of them alongside "normal" dtb.
> 
> [1]
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        | 10 ++++++++
>  arch/arm64/boot/dts/qcom/lemans-el2.dtso | 41 ++++++++++++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6f34d5ed331c..56efd90b7a5e 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -37,6 +37,10 @@ lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
>  
>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera.dtb
> +
> +lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
> @@ -142,6 +146,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
> +
> +qcs9100-ride-el2-dtbs := qcs9100-ride.dtb lemans-el2.dtbo
> +qcs9100-ride-r3-el2-dtbs := qcs9100-ride-r3.dtb lemans-el2.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-el2.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/lemans-el2.dtso b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
> new file mode 100644
> index 000000000000..af35039946e3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
> @@ -0,0 +1,41 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/*
> + * Lemans specific modifications required to boot in EL2.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&iris {
> +	/* More driver work is needed */

You can write this comment without referring to some particular
implementation (as DeviceTree should).

/* The binding doesn't allow for describing the firmware IOMMU stream yet */

> +	status = "disabled";
> +};
> +
> +/*
> + * When running under Gunyah, remote processor firmware IOMMU streams is
> + * controlled by the Gunyah however when we take ownership of it in EL2,
> + * we need to configure it properly to use remote processor.

The comment describes how things work with Gunyah, and then from that
angle explains why we need this. I'd find it preferable to keep the
perspective of not having Gunyah. Something as simple as:

/*
 * Without Gunyah, the IOMMU is managed by the consumer of this DeviceTree,
 * so describe the firmware streams for each remoteproc.
 */

That said, once the iris binding (and others) allow us to describe the
firmware stream, this comment will be misplaced. So perhaps apply my
feedback to the commit message and omit the comment here. If someone
wonders why it looks like it does, the commit message in the git history
will tell them.

Regards,
Bjorn

> + */
> +&remoteproc_adsp {
> +	iommus = <&apps_smmu 0x3000 0x0>;
> +};
> +
> +&remoteproc_cdsp0 {
> +	iommus = <&apps_smmu 0x21c0 0x0400>;
> +};
> +
> +&remoteproc_cdsp1 {
> +	iommus = <&apps_smmu 0x29c0 0x0400>;
> +};
> +
> +&remoteproc_gpdsp0 {
> +       iommus = <&apps_smmu 0x38a0 0x0>;
> +};
> +
> +&remoteproc_gpdsp1 {
> +       iommus = <&apps_smmu 0x38c0 0x0>;
> +};
> 
> -- 
> 2.50.1
> 

