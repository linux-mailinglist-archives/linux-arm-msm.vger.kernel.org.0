Return-Path: <linux-arm-msm+bounces-46046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D736BA1B12A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 08:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89C527A52AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 07:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EEB11DB136;
	Fri, 24 Jan 2025 07:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EQcHf4oQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A0F156991;
	Fri, 24 Jan 2025 07:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737705418; cv=none; b=VqwNDrCZySzTTxJD+OxamOWKGukGa5bI4XX43MiPCTgFcq/CK8R+edCD5OCER+eQztvzBw92YVjQI4JCtBGle8GsY6NwqLRZBgXYSBfAe0VoOd1h1REyeNhS74qaV6vHYMtodnF+nV8/84fCKe/GpQmhymOm3oi02fSU0YFeg30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737705418; c=relaxed/simple;
	bh=vbeiH3HbXIS31pOEKzNCYB77KdhQTfpTyuE8IUc2HEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zyc2zYklnzr8pxjnTDIokEVFdXyPu+rXbpwFP3368EVPeGOrFxkuec5oMlfcn/0zZ2ye/bTQO7iQKGs3yqrBEuTxTqJyA4Kh7/71CgGyePB1UlVufdPau6rQmTxPSXP/pNLBXzsQqOQhT2AivwMYTvzx2pXaxpJrDGsMTThiy4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EQcHf4oQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F05C4CED2;
	Fri, 24 Jan 2025 07:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737705418;
	bh=vbeiH3HbXIS31pOEKzNCYB77KdhQTfpTyuE8IUc2HEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EQcHf4oQ7NHRPG4QeHwMYKqkGtMvFKiq4gApAg6ZPzmhaMeFbNXCD8VWiTKrlLYtQ
	 hCYo1mVCPMAOPVOlRxz2swo47saEvRX1Zqt+UzdiAfzIxpgXo4H7qdgzDuitnmlpxB
	 0YVmkS+9Ko1INJbf79lV2Yr1eOYPTRBAYQrbF3H4iq9CY5xQIKII+r3LWMvdjHcHYP
	 y9qKhYKDkHyTKiSt1oDz06ZfhCAuwXNTfMWpUDSnEOFtQyEV3SgIhXAKhLYRtk24Zk
	 NvvBryntAb72VPDXJdB3D+EHS8IBQ7KVzricch7h16AGVC5dRHMh1S0vXg1Zcct4PU
	 dhjxwkf6CdL3A==
Date: Fri, 24 Jan 2025 13:26:46 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: manivannan.sadhasivam@linaro.org, jassisinghbrar@gmail.com,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mailbox: qcom-ipcc: Reset CLEAR_ON_RECV_RD if set
 from boot firmware
Message-ID: <20250124075646.oc6ni5gp6c23ozp7@thinkpad>
References: <20241230075425.2534765-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241230075425.2534765-1-mukesh.ojha@oss.qualcomm.com>

On Mon, Dec 30, 2024 at 01:24:25PM +0530, Mukesh Ojha wrote:
> For some SoCs, boot firmware is using the same IPCC instance used
> by Linux and it has kept CLEAR_ON_RECV_RD set which basically means
> interrupt pending registers are cleared when RECV_ID is read and the
> register automatically updates to the next pending interrupt/client
> status based on priority.
> 
> Clear the CLEAR_ON_RECV_RD if it is set from the boot firmware.
> 

Any user visible implications due to this?

> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Change in v2:
>  - Corrected email id in the Sob.
> 
>  drivers/mailbox/qcom-ipcc.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
> index 14c7907c6632..0b17a38ea6bf 100644
> --- a/drivers/mailbox/qcom-ipcc.c
> +++ b/drivers/mailbox/qcom-ipcc.c
> @@ -14,6 +14,7 @@
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>  
>  /* IPCC Register offsets */
> +#define IPCC_REG_CONFIG			0x08
>  #define IPCC_REG_SEND_ID		0x0c
>  #define IPCC_REG_RECV_ID		0x10
>  #define IPCC_REG_RECV_SIGNAL_ENABLE	0x14
> @@ -21,6 +22,7 @@
>  #define IPCC_REG_RECV_SIGNAL_CLEAR	0x1c
>  #define IPCC_REG_CLIENT_CLEAR		0x38
>  
> +#define IPCC_CLEAR_ON_RECV_RD		BIT(0)
>  #define IPCC_SIGNAL_ID_MASK		GENMASK(15, 0)
>  #define IPCC_CLIENT_ID_MASK		GENMASK(31, 16)
>  
> @@ -274,6 +276,7 @@ static int qcom_ipcc_pm_resume(struct device *dev)
>  static int qcom_ipcc_probe(struct platform_device *pdev)
>  {
>  	struct qcom_ipcc *ipcc;
> +	u32 config_value;
>  	static int id;
>  	char *name;
>  	int ret;
> @@ -288,6 +291,19 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
>  	if (IS_ERR(ipcc->base))
>  		return PTR_ERR(ipcc->base);
>  
> +	/*
> +	 * It is possible that boot firmware is using the same IPCC instance
> +	 * as of the HLOS and it has kept CLEAR_ON_RECV_RD set which basically
> +	 * means Interrupt pending registers are cleared when RECV_ID is read.
> +	 * The register automatically updates to the next pending interrupt/client
> +	 * status based on priority.
> +	 */
> +	config_value = readl(ipcc->base + IPCC_REG_CONFIG);
> +	if (config_value & IPCC_CLEAR_ON_RECV_RD) {

Can't you just clear this bit always?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

