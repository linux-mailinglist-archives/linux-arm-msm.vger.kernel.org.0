Return-Path: <linux-arm-msm+bounces-81912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 99228C5F0B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 20:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F0D754E15B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 19:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24D32E1EFC;
	Fri, 14 Nov 2025 19:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uNaeUx2q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BB0256C61;
	Fri, 14 Nov 2025 19:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763148460; cv=none; b=P72IENkxLZpgdPMuKBxp+nwKwbWcbJUBWQTdqok8wmlbh5ND6P2E85lWoNn/5Jmafs50z1YuVjS91u+9utObWgwxtIDtmLL5lfn4pSplBrTgQK9WOG7rR/J2ogYLZxLUUSTpNYGsokRVMMgwsBF9cMD5ubNr8xOCHUVLgA8JNrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763148460; c=relaxed/simple;
	bh=4zS6kNpvotULTCAWIlQuSkSHH1YFH0RmzTXAaBQMR4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwGe+Eh24hc1e3F0P2SZI8wgvo36Cq1IgGaM1JIvILWGhyPjylPRs4A8tkwkeo4cMr1BsmxcT6y7VB6MciEoHTuGeV+y0TBhEdBtydBA1PlOY3P29wQzWUm6Z4JNeFG9AhaNwnAs1IckzuwzkYpbFk1fCMeDBCvFPOTLGQpU5lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uNaeUx2q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B49DC4CEF5;
	Fri, 14 Nov 2025 19:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763148460;
	bh=4zS6kNpvotULTCAWIlQuSkSHH1YFH0RmzTXAaBQMR4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uNaeUx2q26LSO9Ug4y9BK9zI6eQ4LVLoGARLCvMJJINSkBqiToXBchG+YscwoDAWP
	 ZIDuaDEcQ60I+wzPQeJtTC0XZM6WgpBi0ctpMwRWd3K5EdIq0E8JGXyCuUkgTUkYOA
	 XoCKEUdBOvA6u9xBw0fOsWWcYKH0clrO5ZbkiqloPKmq0Ld3jn1IAZFbUNFmoo5k0V
	 DyYv1X948/0JjKjRdl5I+C4qj03VhZTEgESoZ9qKkZeY3ED1V7v+J4dpkEbGlgpoyA
	 P8oUvy3bzUGA2rX02fe4vnHDP3jNFHlKqDan1PA4qb5HdorufY8lydZvj28cGXveeZ
	 bLDXTeBoLfMSQ==
Date: Fri, 14 Nov 2025 13:32:08 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
Cc: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com, 
	bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, quic_ahari@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1 2/3] dt-bindings: ufs: Document bindings for SA8255P
 UFS Host Controller
Message-ID: <p6a5nazgd74fwbo6c3ctgvwifcigwwn4azkiu7nrmovrn5cmqn@nxzryxyx4oao>
References: <20251114145646.2291324-1-ram.dwivedi@oss.qualcomm.com>
 <20251114145646.2291324-3-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251114145646.2291324-3-ram.dwivedi@oss.qualcomm.com>

On Fri, Nov 14, 2025 at 08:26:45PM +0530, Ram Kumar Dwivedi wrote:
> From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> 
> Document the device tree bindings for UFS host controller on
> Qualcomm SA8255P platform which integrates firmware-managed
> resources.
> 
> The platform firmware implements the SCMI server and manages
> resources such as the PHY, clocks, regulators and resets via the
> SCMI power protocol. As a result, the OS-visible DT only describes
> the controller’s MMIO, interrupt, IOMMU and power-domain interfaces.
> 
> The generic "qcom,ufshc" and "jedec,ufs-2.0" compatible strings are
> removed from the binding, since this firmware managed design won't
> be compatible with the drivers doing full resource management.
> 
> Co-developed-by: Anjana Hari <quic_ahari@quicinc.com>
> Signed-off-by: Anjana Hari <quic_ahari@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> ---
>  .../bindings/ufs/qcom,sa8255p-ufshc.yaml      | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
> new file mode 100644
> index 000000000000..3b31f6282feb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ufs/qcom,sa8255p-ufshc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SA8255P UFS Host Controller
> +
> +maintainers:
> +  - Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
> +  - Anjana Hari <quic_ahari@quicinc.com>

This should be @oss.qualcomm.com, or @qti.qualcomm.com, not
@quicinc.com.

> +
> +properties:
> +  compatible:
> +    const: qcom,sa8255p-ufshc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  dma-coherent:
> +    type: boolean
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +  - iommus
> +  - dma-coherent
> +
> +allOf:
> +  - $ref: ufs-common.yaml
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        ufshc@1d84000 {
> +            compatible = "qcom,sa8255p-ufshc";
> +            reg = <0x0 0x01d84000 0x0 0x3000>;

Drop the two 0x0 and you don't need to change address/size-cells.

Regards,
Bjorn

> +            interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> +            lanes-per-direction = <2>;
> +
> +            iommus = <&apps_smmu 0x100 0x0>;
> +            power-domains = <&scmi3_pd 0>;
> +            dma-coherent;
> +        };
> +    };
> -- 
> 2.34.1
> 
> 

