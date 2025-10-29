Return-Path: <linux-arm-msm+bounces-79481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BBCC1BA19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73E0458285C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 15:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776212E3AE9;
	Wed, 29 Oct 2025 15:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZYIf+Uz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BE22E1EE1;
	Wed, 29 Oct 2025 15:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761750783; cv=none; b=PCoZTZemfX8Tqegys6VXhs9LfurRm1yhq9n2OyTqy8c50SuYAax0b+o80Vu9dMw+bunbWQK72qUDlDsvIVNpLw9W2s/krR+Z4lu/QWkGBZBU0Yxafm5wT5bVuscpAb9K053MTRc8XZwNoohHpIOjz1x9eaDaI2NZfqFlcMgyc48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761750783; c=relaxed/simple;
	bh=a9WjV/wXG3p5oU/CJtQ3zKP/hL+FTs3eFaCuiRYs17Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqilnILpKGffcb7sySoZ7g2yy2w8N/8sGebHAWWbSImNW8qDWK7md7Gay4BD6eWDEMuR/chHqicEGdLSvS8ZCmBCBUnsEHY9eAdsomPT8rLVrjhPk8iRzdBjmfc5BBF/+KUc1SdrpBicoCKMI2x1r/Gf9RJLzAT+EaDVHHOTjGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZYIf+Uz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC160C4CEF7;
	Wed, 29 Oct 2025 15:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761750782;
	bh=a9WjV/wXG3p5oU/CJtQ3zKP/hL+FTs3eFaCuiRYs17Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IZYIf+Uz4+89T54FW3qFLqoyKBERl8NRLyfKThXmSWgS8Uh2F4i5IyU9QXZ5DO+Dk
	 F5Zuu9p2xyy1msMIXON20/m3VOtkVeNG6v/fzyuBTo669cIPqL9WHFRw3z/tlv6xBD
	 YMixdh6PlEXcI3gsvF77c6TlKfC0rty+1kgy0kxKuYLV6ss7mh3pf2u+89C9eur4q5
	 YvesDgCeRxH9+OD1ODfMt+jW1c8HMHvEBClWSD3GLke1A8xShGixVru5D5Nn/iFAQo
	 IH4b/Dl+zmCkjkuNCbQshts7Erx3DbI+8cbmf0cNgz8+n5rCR/0Dy8E63+qOUNanhz
	 vEhNW5+KG5d4Q==
Date: Wed, 29 Oct 2025 10:16:05 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mailbox: qcom: Add IPCC support for
 Kaanapali Platform
Message-ID: <k2wgpzkfklso42nsd6w527gqiadgdb235kzmvgk4wy27vievir@vlyxti5y7yan>
References: <20251029-knp-ipcc-v2-0-8ba303ab82de@oss.qualcomm.com>
 <20251029-knp-ipcc-v2-1-8ba303ab82de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-knp-ipcc-v2-1-8ba303ab82de@oss.qualcomm.com>

On Wed, Oct 29, 2025 at 01:15:09AM -0700, Jingyi Wang wrote:
> Add the physical client ids and binding for Kaanapali platform. Physical
> client IDs instead of virtual client IDs are used for qcom new platforms
> in the Inter Process Communication Controller (IPCC) driver as virtual to
> physical mapping logic is removed in HW.

Happy to see the description of what changed wrt physical vs virtual
client IDs, but you're leaving the task of figuring out how this
explanation is applicable to the imagination of the reader.

Nobody knows that the values in dt-bindings/mailbox/qcom-ipcc.h are
"virtual client IDs", so it's not clear that you're trying to provide an
explanation to why a new, platform-specific, header file is needed here.


Change looks good, but please update the commit message.

Regards,
Bjorn

> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/mailbox/qcom-ipcc.yaml     |  1 +
>  include/dt-bindings/mailbox/qcom,kaanapali-ipcc.h  | 58 ++++++++++++++++++++++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index e5c423130db6..ee3fe093e3ca 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -24,6 +24,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - qcom,kaanapali-ipcc
>            - qcom,milos-ipcc
>            - qcom,qcs8300-ipcc
>            - qcom,qdu1000-ipcc
> diff --git a/include/dt-bindings/mailbox/qcom,kaanapali-ipcc.h b/include/dt-bindings/mailbox/qcom,kaanapali-ipcc.h
> new file mode 100644
> index 000000000000..b6208ad155ad
> --- /dev/null
> +++ b/include/dt-bindings/mailbox/qcom,kaanapali-ipcc.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __DT_BINDINGS_MAILBOX_IPCC_KAANAPALI_H
> +#define __DT_BINDINGS_MAILBOX_IPCC_KAANAPALI_H
> +
> +/* Physical client IDs */
> +#define IPCC_MPROC_AOP			0
> +#define IPCC_MPROC_TZ			1
> +#define IPCC_MPROC_MPSS			2
> +#define IPCC_MPROC_LPASS		3
> +#define IPCC_MPROC_SDC			4
> +#define IPCC_MPROC_CDSP			5
> +#define IPCC_MPROC_APSS			6
> +#define IPCC_MPROC_SOCCP		13
> +#define IPCC_MPROC_DCP			14
> +#define IPCC_MPROC_SPSS			15
> +#define IPCC_MPROC_TME			16
> +#define IPCC_MPROC_WPSS			17
> +
> +#define IPCC_COMPUTE_L0_CDSP		2
> +#define IPCC_COMPUTE_L0_APSS		3
> +#define IPCC_COMPUTE_L0_GPU		4
> +#define IPCC_COMPUTE_L0_CVP		8
> +#define IPCC_COMPUTE_L0_CAM		9
> +#define IPCC_COMPUTE_L0_CAM1		10
> +#define IPCC_COMPUTE_L0_DCP		11
> +#define IPCC_COMPUTE_L0_VPU		12
> +#define IPCC_COMPUTE_L0_SOCCP		16
> +
> +#define IPCC_COMPUTE_L1_CDSP		2
> +#define IPCC_COMPUTE_L1_APSS		3
> +#define IPCC_COMPUTE_L1_GPU		4
> +#define IPCC_COMPUTE_L1_CVP		8
> +#define IPCC_COMPUTE_L1_CAM		9
> +#define IPCC_COMPUTE_L1_CAM1		10
> +#define IPCC_COMPUTE_L1_DCP		11
> +#define IPCC_COMPUTE_L1_VPU		12
> +#define IPCC_COMPUTE_L1_SOCCP		16
> +
> +#define IPCC_PERIPH_CDSP		2
> +#define IPCC_PERIPH_APSS		3
> +#define IPCC_PERIPH_PCIE0		4
> +#define IPCC_PERIPH_PCIE1		5
> +
> +#define IPCC_FENCE_CDSP			2
> +#define IPCC_FENCE_APSS			3
> +#define IPCC_FENCE_GPU			4
> +#define IPCC_FENCE_CVP			8
> +#define IPCC_FENCE_CAM			8
> +#define IPCC_FENCE_CAM1			10
> +#define IPCC_FENCE_DCP			11
> +#define IPCC_FENCE_VPU			20
> +#define IPCC_FENCE_SOCCP		24
> +
> +#endif
> 
> -- 
> 2.25.1
> 
> 

