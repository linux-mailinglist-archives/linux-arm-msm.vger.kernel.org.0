Return-Path: <linux-arm-msm+bounces-81937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF2AC6046D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 12:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 769CC4E3098
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 11:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817A0296BD3;
	Sat, 15 Nov 2025 11:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBzfn1kW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC1C18CC13;
	Sat, 15 Nov 2025 11:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763207708; cv=none; b=BlhlZEj2scDovq9526hcadgXaAkiYbAUa7s4LsmiWf1gm4cNzWHFoQhq+gOuz8h1t08CVu0zR9EIXvG+BfM4f/dJdcLgbaToJOqEOiSmp6cC0FqBI0UrCOpQmyqSf2+7n27SpRo6+IBmrcnwW4O/7er2OxVZK9PdZOBcG3qjVqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763207708; c=relaxed/simple;
	bh=aBqfjB03ArE/5E9PTH0CuhNVX/n/7wlUMo2ZVHSb8fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1etPzEsiw2ofbewJzQqgWvAlSy6Xg3Dt4WoQyMAS0NTb9EH0q5S9p8ykcGDnAZu2aYtOpL8p9VmQtFqMssAy3z96ug1z5uxfOhh7f+Z+4Ev6Xb5MvI6omD13u1TqHy0So4Z/RMZu39TnHp0SPEOEN44Yy83J1ah/AOc7HREuE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LBzfn1kW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AADAC116B1;
	Sat, 15 Nov 2025 11:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763207707;
	bh=aBqfjB03ArE/5E9PTH0CuhNVX/n/7wlUMo2ZVHSb8fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LBzfn1kWzEcYfzMxQfY8UjnQndctUHuljnI/8FyYc3PB4zX25LgEt1mykJqgW/7hk
	 Fu1uzI/i6eHKysiUEFPhPUbtWMqLn7dpTdAkJ2IwT9N3j8NXl9b1Vp/8ns+iwWiQ5W
	 7gRDSc2VJkyIx3FkFKswtB6uelUlUL0bGHMSFhdtHpte7KcFEdPhoBUzqiV6+6RdHa
	 ALaA2dbLeNX/UaublFEJBtvJcqSuPRKGRJn3k6llBORxG+EF4XQPrYmMV67n6+KyNR
	 DppeKLVM3GYeR1M/rpFf3Hd97YdlpJHc4dS4ftwvi8lJZGCO1pgVld2HDJRDdvSVJF
	 zgoIfLxATqXUQ==
Date: Sat, 15 Nov 2025 12:55:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
Cc: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com, 
	bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, quic_ahari@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1 2/3] dt-bindings: ufs: Document bindings for SA8255P
 UFS Host Controller
Message-ID: <20251115-polite-kakapo-of-satiation-0a0288@kuoka>
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251114145646.2291324-3-ram.dwivedi@oss.qualcomm.com>

On Fri, Nov 14, 2025 at 08:26:45PM +0530, Ram Kumar Dwivedi wrote:
> From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>=20
> Document the device tree bindings for UFS host controller on
> Qualcomm SA8255P platform which integrates firmware-managed
> resources.
>=20
> The platform firmware implements the SCMI server and manages
> resources such as the PHY, clocks, regulators and resets via the
> SCMI power protocol. As a result, the OS-visible DT only describes
> the controller=E2=80=99s MMIO, interrupt, IOMMU and power-domain interfac=
es.
>=20
> The generic "qcom,ufshc" and "jedec,ufs-2.0" compatible strings are
> removed from the binding, since this firmware managed design won't
> be compatible with the drivers doing full resource management.
>=20
> Co-developed-by: Anjana Hari <quic_ahari@quicinc.com>
> Signed-off-by: Anjana Hari <quic_ahari@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> ---
>  .../bindings/ufs/qcom,sa8255p-ufshc.yaml      | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ufs/qcom,sa8255p-uf=
shc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yam=
l b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
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

Just :true.

> +    type: boolean

Best regards,
Krzysztof


