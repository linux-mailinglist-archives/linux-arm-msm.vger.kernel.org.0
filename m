Return-Path: <linux-arm-msm+bounces-38766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D18BD9D59C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 08:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CC53B22013
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 07:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D2B16849F;
	Fri, 22 Nov 2024 07:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DkXu7s0Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F75F22075;
	Fri, 22 Nov 2024 07:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732259792; cv=none; b=OhqWnAz+ewUKqpWU8upPvO0r8UflBIbyPZLbhMhMGsWVehdWGP4hGvbBLpeo3pg7DEk6pJwnyuqV3VslhGRvKk783/69wBVCdo8+zqzKzGKZ486qaMJWxjHJgu/AmSYbSxt+gMgAuxuUqiP0RZmLpU0daHqnaeSO1QPDZqYNGOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732259792; c=relaxed/simple;
	bh=Wd3TXSildFXJxXQZobSC5oDGUdglHsoTXiln84ITaKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKBMWjhq0iLa9RUrEtilBqBHVPKCwidlu3WKoHUT/Wkrk5uqzuvgOsq5a06iSgVcQUItaRETpHd2zNGGootVERnqyL6m1esIuRFXP4GqwsdpkfiI+upTo8Q428MhPHYqSdF7ow61FvD95cPGfMZXrOLDyO9bO/sGTShFea9ub5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DkXu7s0Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5FF9C4CECE;
	Fri, 22 Nov 2024 07:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732259791;
	bh=Wd3TXSildFXJxXQZobSC5oDGUdglHsoTXiln84ITaKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DkXu7s0Zojjn7os3jSywBf0ToISgeC0scHniO9ruy6OKMHz+e2etmCruxfUQy7Hkz
	 eGo0gXIk2Hp0fi7QIhF8LD0z+BnDPaatvLNI/imSUS8JPAA9pteWxLNoz3qzOXAz7N
	 0Mj6wVPX0tRKRbbaoXCYBOsjbwQ0G40UcExzz3RNcKeFkhjlxaJE9TjybW+CvCnwFO
	 i4gxjkMH/3LKOrcFcbOhpitjL7MsN+7SKa65AvsY1at6NA0m1873dxbfsb7fpryiId
	 IKiKHfdTzrATF3iUAM3UO5/sOx4W6UAR0wpJzp1jz2wom9dbriVaQp+gQPuAZtumNP
	 amq9gpxdlS0CQ==
Date: Fri, 22 Nov 2024 08:16:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org, 
	manivannan.sadhasivam@linaro.org, bhelgaas@google.com, kw@linux.com, lpieralisi@kernel.org, 
	quic_qianyu@quicinc.com, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	andersson@kernel.org, konradybcio@kernel.org, quic_tsoni@quicinc.com, 
	quic_shashim@quicinc.com, quic_kaushalk@quicinc.com, quic_tdas@quicinc.com, 
	quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, Krishna chaitanya chundru <quic_krichai@quicinc.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: PCI: qcom: Document the QCS615 PCIe
 Controller
Message-ID: <nxje65jbp6tmgskq765zeiy6ojnadyuh56wabk2g6kfq7bwfwl@vaoxhtu7si3a>
References: <20241122023314.1616353-1-quic_ziyuzhan@quicinc.com>
 <20241122023314.1616353-4-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122023314.1616353-4-quic_ziyuzhan@quicinc.com>

On Fri, Nov 22, 2024 at 10:33:11AM +0800, Ziyue Zhang wrote:
> From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> 
> Add dedicated schema for the PCIe controllers found on QCS615.
> Due to qcs615's clock-names do not match any of the existing
> dt-bindings, a new compatible for qcs615 is needed.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---
>  .../bindings/pci/qcom,pcie-qcs615.yaml        | 161 ++++++++++++++++++
>  1 file changed, 161 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie-qcs615.yaml

I propose qcom,qcs615-pcie

> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-qcs615.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-qcs615.yaml
> new file mode 100644
> index 000000000000..8f7571538d23
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-qcs615.yaml
> @@ -0,0 +1,161 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/qcom,pcie-qcs615.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QCS615 PCI Express Root Complex
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +
> +description:
> +  Qualcomm QCS615 SoC (and compatible) PCIe root complex controller is based on
> +  the Synopsys DesignWare PCIe IP.
> +
> +properties:
> +  compatible:
> +    const: qcom,pcie-qcs615

I propose qcom,qcs615-pcie

> +
> +  reg:
> +    minItems: 6
> +    maxItems: 6
> +
> +

...

> +  resets:
> +    minItems: 1

Use existing code as template, e.g. sm8550, instead of coming with own stuff. Drop.

> +    maxItems: 1

This fails tests.

Best regards,
Krzysztof


