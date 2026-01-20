Return-Path: <linux-arm-msm+bounces-89840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFFDHT6/cGmKZgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:57:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D455B5662D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6C56B70652A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 13:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E30F42DFF9;
	Tue, 20 Jan 2026 13:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uVQCzbF+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB22421EFB;
	Tue, 20 Jan 2026 13:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768915917; cv=none; b=YtJ4bz/b3572WIKFf1LSSobc51Flbh86c6Bru1oTOJgKk7vSKzlIau79jRWAVDvUKVeaAyYbmJ80T3OR2hzKI1oUZuZaQAKUoFUdgbly6XiMvPP6sljUdFUsgjgO6dNyxkmwIWzxe/Bx8okqTd5MwTt0Oo7Y4RRXf382rBVDfao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768915917; c=relaxed/simple;
	bh=YoK1kF0LiYeImQzAqlY+R+SVH8ElhbpU5AjwKHKm7tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bs0+JaJaILRIvjqgIh4O3Fl6Pk8E12Yl7tyd+S8kMCCz2/tX5UEyILTYGowzlWzeCxrAQmf4Qv7qGda1nVRVaN9MA6LtFZTuaY3AQbS27J/5Rb9Uuyjmj1OzgoIWty6Vj2YiPeKDsyUNbLbgHy5wY0wo1r4AoyteghosqsqOzYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uVQCzbF+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67314C16AAE;
	Tue, 20 Jan 2026 13:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768915916;
	bh=YoK1kF0LiYeImQzAqlY+R+SVH8ElhbpU5AjwKHKm7tU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uVQCzbF+fsfwjgSvm0gkJqpESlZ3n2CmOoVZJ9befRAc8lYNLBDkiPbTW3st0MVKQ
	 ZSIgrRiJ70LtL0Adi9FDJjJjghwcaXLvRUXVAcj2W52MfNTY1P8aoCBwSoGiKSgcVS
	 LB0ENg8cO8ZMsv7psybBnpORnmZUB/ZbDDWCqZs8pmnVc9Zc0LwQjxprEGWioM9k7v
	 3GDarBih2nVgeD193ZlOHelEkTNEXyAvBtVaAvop49aAmU+DGQWPOKuwzuX/uaLdGa
	 98GrnbSqeEOo3Qjt+mrucponuE561H/VlodhHLZ7uBMUe0W83cgumME7TsOK8wpuX5
	 XwKinHMadGT5A==
Date: Tue, 20 Jan 2026 19:01:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
Cc: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org, 
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Anjana Hari <anjana.hari@oss.qualcomm.com>
Subject: Re: [PATCH V5 2/4] dt-bindings: ufs: Document bindings for SA8255P
 UFS Host Controller
Message-ID: <jsatarcn3ahtj2gyc3kqjtjydlrxlx2fk4ufxylvujf4nxrvyw@x5gkaeqg34mj>
References: <20260113080046.284089-1-ram.dwivedi@oss.qualcomm.com>
 <20260113080046.284089-3-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260113080046.284089-3-ram.dwivedi@oss.qualcomm.com>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89840-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,devicetree.org:url,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,1d84000:email]
X-Rspamd-Queue-Id: D455B5662D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 13, 2026 at 01:30:44PM +0530, Ram Kumar Dwivedi wrote:
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
> Co-developed-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
> Signed-off-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
> Signed-off-by: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  .../bindings/ufs/qcom,sa8255p-ufshc.yaml      | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
> new file mode 100644
> index 000000000000..75fae9f1eba7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
> @@ -0,0 +1,56 @@
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
> +  dma-coherent: true
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
> +    ufshc@1d84000 {
> +        compatible = "qcom,sa8255p-ufshc";
> +        reg = <0x01d84000 0x3000>;
> +        interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> +        lanes-per-direction = <2>;
> +
> +        iommus = <&apps_smmu 0x100 0x0>;
> +        power-domains = <&scmi3_pd 0>;
> +        dma-coherent;
> +    };
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

