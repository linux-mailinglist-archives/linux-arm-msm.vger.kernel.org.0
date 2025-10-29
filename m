Return-Path: <linux-arm-msm+bounces-79482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 690D8C1BCDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:52:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 46998586A04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 15:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3852E6CDF;
	Wed, 29 Oct 2025 15:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oyCRzO9n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9DA2E040D;
	Wed, 29 Oct 2025 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761750898; cv=none; b=cJju4cvATGxbBKJSKHfWL/3yShZpdZ0TUABgbs1zoA6n/V3eQqylySzlwlMVdqn4BFWlROvEHRoCpZCA6MVCVYGPdVfLR93i5l4i4Em0Wq8BY4ApOGUFLZCAhRbMPZPO8zIB8gbnLHBjrQRFhRjIYaoMdPalgCT7OOZIbKpkNlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761750898; c=relaxed/simple;
	bh=ig09PqYacp8UprCsjXlalhOc8q4d3xQp4KfFP6SfNZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rd7AJNW0IQHIIUvr18lXaoUSfKSBiuA4zwxmxb6eOj8wf51pm67udpKi7cMCk5mbywvZLYYsMMnvY95KI9xGn5chtiti+2TQQ6BRqgVzz3JQeVIXdEvToq834Kvoe6trBmYSlHlciVeVFjfTdTMiLsNzqw3GaZqv4Q4qgAIgZRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oyCRzO9n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD53C4CEF7;
	Wed, 29 Oct 2025 15:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761750897;
	bh=ig09PqYacp8UprCsjXlalhOc8q4d3xQp4KfFP6SfNZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oyCRzO9n8fiSBaC1u7EElSOlY4QuGRLIwyo12vYTuqYN2dgDs00bx7wI25/+rrGSY
	 0xIU87wGnDQjPogqX6e/8E1XBz3XJX0bv3qze7/KtBHbW7HLouTnY6uBIDW01FOE9A
	 KFAlHvdsOcF+6IuAnz/r6tPw8ReLrFJzXpmXPiPZW25FexRXfJ9erfeyJaqhNA748L
	 tBqx/7AugGAHIcc97b/Bi7l3hYBU33cTnW3hVTI1VBuEsiumdamHo43WoBlUzEWZ3c
	 5yDTuBwuOOCGEmw9izjMMbVsB6235jh/xBdOKZFfA6c6bX8jpdTv3MSt9y0VVV/Wnb
	 pSTnouFID3kPg==
Date: Wed, 29 Oct 2025 10:18:00 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: mailbox: qcom: Add IPCC support for
 Glymur Platform
Message-ID: <tgt6aflesypa2wlsqdsvwptyulagkjm5hmfh4ohhc4zmyf3zbo@bwyifpcf54mn>
References: <20251029-knp-ipcc-v2-0-8ba303ab82de@oss.qualcomm.com>
 <20251029-knp-ipcc-v2-2-8ba303ab82de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-knp-ipcc-v2-2-8ba303ab82de@oss.qualcomm.com>

On Wed, Oct 29, 2025 at 01:15:10AM -0700, Jingyi Wang wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add binding and physical client ids for the Glymur platform. Physical
> client IDs instead of virtual client IDs are used for qcom new platforms
> in the Inter Process Communication Controller (IPCC) driver as virtual to
> physical mapping logic is removed in HW.

This is just copy-paste from patch 1, with the same shortcomings.

Please improve the commit message in patch 1 to introduce the
understanding of why we need soc-specific header files from now on, and
then omit that part of the explanation from this one.

Regards,
Bjorn

> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/mailbox/qcom-ipcc.yaml     |  1 +
>  include/dt-bindings/mailbox/qcom,glymur-ipcc.h     | 68 ++++++++++++++++++++++
>  2 files changed, 69 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index ee3fe093e3ca..7c4d6170491d 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -24,6 +24,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - qcom,glymur-ipcc
>            - qcom,kaanapali-ipcc
>            - qcom,milos-ipcc
>            - qcom,qcs8300-ipcc
> diff --git a/include/dt-bindings/mailbox/qcom,glymur-ipcc.h b/include/dt-bindings/mailbox/qcom,glymur-ipcc.h
> new file mode 100644
> index 000000000000..3ab8189974a5
> --- /dev/null
> +++ b/include/dt-bindings/mailbox/qcom,glymur-ipcc.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __DT_BINDINGS_MAILBOX_IPCC_GLYMUR_H
> +#define __DT_BINDINGS_MAILBOX_IPCC_GLYMUR_H
> +
> +/* Glymur physical client IDs */
> +#define IPCC_MPROC_AOP			0
> +#define IPCC_MPROC_TZ			1
> +#define IPCC_MPROC_MPSS			2
> +#define IPCC_MPROC_LPASS		3
> +#define IPCC_MPROC_SLPI			4
> +#define IPCC_MPROC_SDC			5
> +#define IPCC_MPROC_CDSP			6
> +#define IPCC_MPROC_NPU			7
> +#define IPCC_MPROC_APSS			8
> +#define IPCC_MPROC_GPU			9
> +#define IPCC_MPROC_ICP			11
> +#define IPCC_MPROC_VPU			12
> +#define IPCC_MPROC_PCIE0		13
> +#define IPCC_MPROC_PCIE1		14
> +#define IPCC_MPROC_PCIE2		15
> +#define IPCC_MPROC_SPSS			16
> +#define IPCC_MPROC_PCIE3		19
> +#define IPCC_MPROC_PCIE4		20
> +#define IPCC_MPROC_PCIE5		21
> +#define IPCC_MPROC_PCIE6		22
> +#define IPCC_MPROC_TME			23
> +#define IPCC_MPROC_WPSS			24
> +#define IPCC_MPROC_PCIE7		44
> +#define IPCC_MPROC_SOCCP		46
> +
> +#define IPCC_COMPUTE_L0_LPASS		0
> +#define IPCC_COMPUTE_L0_CDSP		1
> +#define IPCC_COMPUTE_L0_APSS		2
> +#define IPCC_COMPUTE_L0_GPU		3
> +#define IPCC_COMPUTE_L0_CVP		6
> +#define IPCC_COMPUTE_L0_ICP		7
> +#define IPCC_COMPUTE_L0_VPU		8
> +#define IPCC_COMPUTE_L0_DPU		9
> +#define IPCC_COMPUTE_L0_SOCCP		11
> +
> +#define IPCC_COMPUTE_L1_LPASS		0
> +#define IPCC_COMPUTE_L1_CDSP		1
> +#define IPCC_COMPUTE_L1_APSS		2
> +#define IPCC_COMPUTE_L1_GPU		3
> +#define IPCC_COMPUTE_L1_CVP		6
> +#define IPCC_COMPUTE_L1_ICP		7
> +#define IPCC_COMPUTE_L1_VPU		8
> +#define IPCC_COMPUTE_L1_DPU		9
> +#define IPCC_COMPUTE_L1_SOCCP		11
> +
> +#define IPCC_PERIPH_LPASS		0
> +#define IPCC_PERIPH_APSS		1
> +#define IPCC_PERIPH_PCIE0		2
> +#define IPCC_PERIPH_PCIE1		3
> +#define IPCC_PERIPH_PCIE2		6
> +#define IPCC_PERIPH_PCIE3		7
> +#define IPCC_PERIPH_PCIE4		8
> +#define IPCC_PERIPH_PCIE5		9
> +#define IPCC_PERIPH_PCIE6		10
> +#define IPCC_PERIPH_PCIE7		11
> +#define IPCC_PERIPH_SOCCP		13
> +#define IPCC_PERIPH_WPSS		16
> +
> +#endif
> 
> -- 
> 2.25.1
> 
> 

