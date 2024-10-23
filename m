Return-Path: <linux-arm-msm+bounces-35495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD7C9ABBAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 04:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 260E0284034
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 02:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C844DA04;
	Wed, 23 Oct 2024 02:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qyP/zTUB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EC345C1C;
	Wed, 23 Oct 2024 02:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729651342; cv=none; b=cEmFvnhiKis9LYfHTARE+mCg+i4iQebokKOLYaUWzDB8JxUgHFGHVSIm4CfORXYmBYrB1kvu79iGFBrouCbIqYf3DPyH/Hq04smz32qQ0cc6tNtWTsg1ezs3shotDl/XodxRmgIxzEhF7ka2pxc19Qa0nbwDOw+MvmBV3gDQGpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729651342; c=relaxed/simple;
	bh=w5B0qEbikaZbdZPaM/oDO0XbghjY2o8LzgE9dfDCjSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8J4Z3Vq2kDyFtDbpJEYXbrKMEUyLIdrMbDsJs50NTBamvs6JdutSzSE7/vfbZ4XGOVaf/6eBBH4qsyL/jaiZCB1Pb7CiWtb0dt1fMlJFM0NljhwiPD9N8Tqi1lb5y2BryDERE/vrcnhjpOm2qNlNJ0wRo1kftSM4LMMAozXYCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qyP/zTUB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E915C4CEC3;
	Wed, 23 Oct 2024 02:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729651342;
	bh=w5B0qEbikaZbdZPaM/oDO0XbghjY2o8LzgE9dfDCjSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qyP/zTUBxvNFt3jplOpcJQLYbMQUbtckhEXJv4nTf8V1DtFmWbJ8+k6yDo5wIsUUW
	 ATFvqxPXR0OYvxj51TZLcupcdIgcXDmb+NCq5lMEoaPsYvWJHp6t2GXkviggwBh5ye
	 9gNC2ABgfs5RmoGLfrY5Z+N/tuttrGvCei+Va2Mxz9QZDOvpTN8H+BUM3FP2TS7BaR
	 R0/jLsdsQidR3eKnjJy+rb9xeHWRNNuatZqm+/Gr7qSB3cORGzGyCqFLq0BEtCYLy7
	 zgQOZpkduTIxK//0ArvV7zVH680V4EqopVbnJs3V3OEhx/ORJSao1DAvI7rrSpcynh
	 jseJvWLKs8SEg==
Date: Tue, 22 Oct 2024 21:42:19 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 7/7] arm64: defconfig: enable clock controller,
 interconnect and pinctrl for QCS615
Message-ID: <ghvvsnf4xej4ylebxottza6xpina63b2sesz4v4laubi6euvqx@yqckh7hgkiit>
References: <20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com>
 <20241022-add_initial_support_for_qcs615-v4-7-0a551c6dd342@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022-add_initial_support_for_qcs615-v4-7-0a551c6dd342@quicinc.com>

On Tue, Oct 22, 2024 at 04:54:35PM GMT, Lijuan Gao wrote:
> Enable clock controller, interconnect and pinctrl for Qualcomm
> QCS615 platform to boot to UART console.
> 
> The serial engine depends on gcc, interconnect and pinctrl. Since
> the serial console driver is only available as built-in, so these
> configs needs be built-in for the UART device to probe and register
> the console.
> 

I love the fact that you're describing the reason for making these
built-in, and in such a clear way.


It therefor saddens me to say that there's more to it...

A builtin driver with module dependencies will through device links and
probe deferral be probed once those resources are available, so this
isn't the reason for us to mark these providers as built-in. Instead
what we're looking for is the fact that we want the console to be
registered before we launch userspace (and thereby load modules).

The main reason for this is that e.g. systemd opens /dev/console at
launch (i.e. when the init process starts). So if we registers the
console after this, we will not get the console output from systemd.


So, please rephrase this to state that we want these built-in, because
the serial console driver depends on them and we want that registered
before we launch userspace.

Regards,
Bjorn

> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 36b33b9f1704..fd0dfa9ebae0 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -607,6 +607,7 @@ CONFIG_PINCTRL_MSM8996=y
>  CONFIG_PINCTRL_MSM8998=y
>  CONFIG_PINCTRL_QCM2290=y
>  CONFIG_PINCTRL_QCS404=y
> +CONFIG_PINCTRL_QCS615=y
>  CONFIG_PINCTRL_QDF2XXX=y
>  CONFIG_PINCTRL_QDU1000=y
>  CONFIG_PINCTRL_SA8775P=y
> @@ -1323,6 +1324,7 @@ CONFIG_MSM_MMCC_8998=m
>  CONFIG_QCM_GCC_2290=y
>  CONFIG_QCM_DISPCC_2290=m
>  CONFIG_QCS_GCC_404=y
> +CONFIG_QCS_GCC_615=y
>  CONFIG_SC_CAMCC_7280=m
>  CONFIG_QDU_GCC_1000=y
>  CONFIG_SC_CAMCC_8280XP=m
> @@ -1629,6 +1631,7 @@ CONFIG_INTERCONNECT_QCOM_MSM8996=y
>  CONFIG_INTERCONNECT_QCOM_OSM_L3=m
>  CONFIG_INTERCONNECT_QCOM_QCM2290=y
>  CONFIG_INTERCONNECT_QCOM_QCS404=m
> +CONFIG_INTERCONNECT_QCOM_QCS615=y
>  CONFIG_INTERCONNECT_QCOM_QDU1000=y
>  CONFIG_INTERCONNECT_QCOM_SA8775P=y
>  CONFIG_INTERCONNECT_QCOM_SC7180=y
> 
> -- 
> 2.46.0
> 

