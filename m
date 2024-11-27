Return-Path: <linux-arm-msm+bounces-39263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD719DA387
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 09:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 633E2283830
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 08:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46981741D2;
	Wed, 27 Nov 2024 08:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahvxqV/Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812B314A08E;
	Wed, 27 Nov 2024 08:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732694750; cv=none; b=Z/oZbh5XIR0POoj8T9ADd3qZbKP6jteXI0C9NoQAF9ahj2wEYmoEzmFeNaQwYXy4lEYRnoD2sOCgT7vTtvzcTlTxeGU/Wx/c0/7i3lOJcWa2b7zqQnU/aydjctq1pT/uu6Aar4963j73MNP+P0oKBZhDI2Mr/F0gpVMho5hrJRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732694750; c=relaxed/simple;
	bh=jQPCM7hepJRI2HqOY1oM4ZTOxq2jJna0K4BcLqrXqsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dye/xFOolCfEKvL48vM9ySS9uTUPkoc7cvLqyrMaYXNuxuNhSMYg0lPEjv59+wrcnVeXzy6HzJY4MRaSGjUbibY7D2IHrxM64/qFaW064pswsfXyPxMkxNKKQHvWtevILb1CuF2+lVgc5fuClMz1ZyFdfWp0HWExjWPkB1O3pas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahvxqV/Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FD1C4CECC;
	Wed, 27 Nov 2024 08:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732694750;
	bh=jQPCM7hepJRI2HqOY1oM4ZTOxq2jJna0K4BcLqrXqsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ahvxqV/QDoB2FBus2KjALb/45KOJd+ulufxYEZGlNf2sECxj3MYUN26ICOWOPEHc4
	 ZeQrEmekzs5TgxOnmoXogg4Ci5Pw6WiycJCYkXV4VyEdMfPxzn1MoLnq0ANPVUyfEk
	 DBeDGEnP4tKXYtEo4r8C3m/ApZkXKqqloRDn2U396K+AqXRN/IJFgRUNOVBb7Dp2Dc
	 7ug1/QpDpiZ9WSIt0QcFQgIgFQElY2R/5XigMhOITIwz5H02m6RZiCVw7MiGx6nw18
	 eL4EZ3AXV1m8SDVQJ+ogbm59QifQoh1YSvla5oQ7+XYsmlcfmulk0K9B2xNFnyQpG8
	 U/rPEz+up3g6w==
Date: Wed, 27 Nov 2024 09:05:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Sanyog Kale <sanyog.r.kale@intel.com>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com, kernel@quicinc.com
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: Add bindings for wcd937x
 static channel mapping
Message-ID: <br4vo2iygjc6p5zezss6wccuakodthej4cut3cpw76ltxyxkpb@pjalqvpszxvo>
References: <20241126164300.3305903-1-quic_mohs@quicinc.com>
 <20241126164300.3305903-2-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241126164300.3305903-2-quic_mohs@quicinc.com>

On Tue, Nov 26, 2024 at 10:12:56PM +0530, Mohammad Rafi Shaik wrote:
> Add wcd937x static channel mapping values to avoid
> having to use unclear number indices in device trees.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  include/dt-bindings/sound/qcom,wcd93xx.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 include/dt-bindings/sound/qcom,wcd93xx.h
> 
> diff --git a/include/dt-bindings/sound/qcom,wcd93xx.h b/include/dt-bindings/sound/qcom,wcd93xx.h
> new file mode 100644
> index 000000000000..45bcc30d0393
> --- /dev/null
> +++ b/include/dt-bindings/sound/qcom,wcd93xx.h

Filename matching compatible, always.

> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __DT_SOUND_QCOM_WCD93xx_H
> +#define __DT_SOUND_QCOM_WCD93xx_H
> +
> +#define SWRM_CH1 1
> +#define SWRM_CH2 2
> +#define SWRM_CH3 4
> +#define SWRM_CH4 8

Bindings define interface between driver and DTS. The values are
abstract, so alwys start from 0 or 1 and are incremented by 1, not by
power of 2. Also missing some sort of prefix, w.g. WCD9390_xxx

Anyway, this does not look like binding.

Best regards,
Krzysztof


