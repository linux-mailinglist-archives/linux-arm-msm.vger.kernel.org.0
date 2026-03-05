Return-Path: <linux-arm-msm+bounces-95521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HF/JJ81qWlH3AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:49:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF3E20CEBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBF2030387E1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 07:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43F9328608;
	Thu,  5 Mar 2026 07:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OX5meTB9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13C927E05E;
	Thu,  5 Mar 2026 07:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772696964; cv=none; b=foCXLIBixod16+Aq05ZDsX51ocdR9hOdyKxQt5KdtOi+Ezk9j42JkeaqWjnpCIkBug2ZiCjGkLcckoou5CLEEoohqU+CH/E6nPNl7/0H2nxml82djH997h+2pZ1/J5dX9iaw/yOerhW0shIkDTtpQXHrZ86PJz5wQx/o/UB8uXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772696964; c=relaxed/simple;
	bh=6AqLYlPW/gs3vlo4az2RBnc0fhk6dglm/YJG1KWJfp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7L9ofGlAH6OP4AN5x8BwCrrWQBvnZ7GCTba1zq3NHCQbIG2B7sq+lnyKUeriv7ALUDFiLTisZNs2pQS0H1ribkEEoSPT5iicToNaXr/GRo0MkW9h1a9vl0vq1k85VoyoD1RzRq0M+5Ibvrh6CtyNWy9tlUwxGpDw7y3UmMKHTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OX5meTB9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95538C116C6;
	Thu,  5 Mar 2026 07:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772696964;
	bh=6AqLYlPW/gs3vlo4az2RBnc0fhk6dglm/YJG1KWJfp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OX5meTB9KrGVnyHJiKDDlXTURvrR3RfZb5Q477AWojqGpqFAT91ujTK66gHgJOq+a
	 DTt/sOga39neE+CW7s4xLXJK5c52xpOnqv8aGaV9fcShBhmTWA5/pMXnVuSuGKyojQ
	 AVEGfbMqf2VhL8o3uQIBOJcmNQaPcFURPHmM9J4caAigy7Xx4M2DEtIdPaEZYi5bDB
	 OnK92yMjCFkw9/sXmWeopiF4lwHRMY6B6A9PKengoQ1A50XgU0Ja1cg8F4K5VTnGKV
	 067wdC2+hhAvMJbPyPiQdtrkU8q1SU3eRLC+n/mqmxt6K38kkNQVCwPAMyVPV9jlxF
	 uPXZZBbc3XChQ==
Date: Thu, 5 Mar 2026 13:19:10 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com, 
	bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH v2 4/5] PCI: qcom: Power down PHY via PARF_PHY_CTRL
 before disabling rails/clocks
Message-ID: <to6p7yf2oo5qh37hsye4zpputrc7p4bwgqvjc2plieuyapjdhp@7xshxghi4tzd>
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
 <20260217-d3cold-v2-4-89b322864043@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260217-d3cold-v2-4-89b322864043@oss.qualcomm.com>
X-Rspamd-Queue-Id: 0CF3E20CEBB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95521-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,vger.kernel.org,lists.infradead.org,nvidia.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 04:49:09PM +0530, Krishna Chaitanya Chundru wrote:
> Some Qcom PCIe controller variants bring the PHY out of test power-down
> (PHY_TEST_PWR_DOWN) during init. When the link is later transitioned
> towards D3cold and the driver disables PCIe clocks and/or regulators
> without explicitly re-asserting PHY_TEST_PWR_DOWN, the PHY can remain
> partially powered, leading to avoidable power leakage.
> 
> Update the init-path comments to reflect that PARF_PHY_CTRL is used to
> power the PHY on. Also, for controller revisions that enable PHY power
> in init (2.3.2, 2.3.3, 2.7.0 and 2.9.0), explicitly power the PHY down
> via PARF_PHY_CTRL in the deinit path before disabling clocks/regulators.
> 
> This ensures the PHY is put into a defined low-power state prior to
> removing its supplies, preventing leakage when entering D3cold.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 2c4dc7134e006d3530a809f1bcc1a6488d4632ad..b02c19bbdf2ea5db252c2a0281a569bb3a0cc497 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -513,7 +513,7 @@ static int qcom_pcie_post_init_2_1_0(struct qcom_pcie *pcie)
>  	u32 val;
>  	int ret;
>  
> -	/* enable PCIe clocks and resets */
> +	/* PHY power ON */

This comment is confusing since we already have phy_power_on() API. What does
really happen in the 'test power down' case?

- Mani

>  	val = readl(pcie->parf + PARF_PHY_CTRL);
>  	val &= ~PHY_TEST_PWR_DOWN;
>  	writel(val, pcie->parf + PARF_PHY_CTRL);
> @@ -680,6 +680,12 @@ static int qcom_pcie_get_resources_2_3_2(struct qcom_pcie *pcie)
>  static void qcom_pcie_deinit_2_3_2(struct qcom_pcie *pcie)
>  {
>  	struct qcom_pcie_resources_2_3_2 *res = &pcie->res.v2_3_2;
> +	u32 val;
> +
> +	/* PHY Power down */
> +	val = readl(pcie->parf + PARF_PHY_CTRL);
> +	val |= PHY_TEST_PWR_DOWN;
> +	writel(val, pcie->parf + PARF_PHY_CTRL);
>  
>  	clk_bulk_disable_unprepare(res->num_clks, res->clks);
>  	regulator_bulk_disable(ARRAY_SIZE(res->supplies), res->supplies);
> @@ -712,7 +718,7 @@ static int qcom_pcie_post_init_2_3_2(struct qcom_pcie *pcie)
>  {
>  	u32 val;
>  
> -	/* enable PCIe clocks and resets */
> +	/* PHY Power ON */
>  	val = readl(pcie->parf + PARF_PHY_CTRL);
>  	val &= ~PHY_TEST_PWR_DOWN;
>  	writel(val, pcie->parf + PARF_PHY_CTRL);
> @@ -844,6 +850,12 @@ static int qcom_pcie_get_resources_2_3_3(struct qcom_pcie *pcie)
>  static void qcom_pcie_deinit_2_3_3(struct qcom_pcie *pcie)
>  {
>  	struct qcom_pcie_resources_2_3_3 *res = &pcie->res.v2_3_3;
> +	u32 val;
> +
> +	/* PHY Power down */
> +	val = readl(pcie->parf + PARF_PHY_CTRL);
> +	val |= PHY_TEST_PWR_DOWN;
> +	writel(val, pcie->parf + PARF_PHY_CTRL);
>  
>  	clk_bulk_disable_unprepare(res->num_clks, res->clks);
>  }
> @@ -994,7 +1006,7 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
>  	/* configure PCIe to RC mode */
>  	writel(DEVICE_TYPE_RC, pcie->parf + PARF_DEVICE_TYPE);
>  
> -	/* enable PCIe clocks and resets */
> +	/* PHY power ON */
>  	val = readl(pcie->parf + PARF_PHY_CTRL);
>  	val &= ~PHY_TEST_PWR_DOWN;
>  	writel(val, pcie->parf + PARF_PHY_CTRL);
> @@ -1065,6 +1077,12 @@ static void qcom_pcie_host_post_init_2_7_0(struct qcom_pcie *pcie)
>  static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
>  {
>  	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
> +	u32 val;
> +
> +	/* PHY Power down */
> +	val = readl(pcie->parf + PARF_PHY_CTRL);
> +	val |= PHY_TEST_PWR_DOWN;
> +	writel(val, pcie->parf + PARF_PHY_CTRL);
>  
>  	clk_bulk_disable_unprepare(res->num_clks, res->clks);
>  
> @@ -1169,6 +1187,12 @@ static int qcom_pcie_get_resources_2_9_0(struct qcom_pcie *pcie)
>  static void qcom_pcie_deinit_2_9_0(struct qcom_pcie *pcie)
>  {
>  	struct qcom_pcie_resources_2_9_0 *res = &pcie->res.v2_9_0;
> +	u32 val;
> +
> +	/* PHY Power down */
> +	val = readl(pcie->parf + PARF_PHY_CTRL);
> +	val |= PHY_TEST_PWR_DOWN;
> +	writel(val, pcie->parf + PARF_PHY_CTRL);
>  
>  	clk_bulk_disable_unprepare(res->num_clks, res->clks);
>  }
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

