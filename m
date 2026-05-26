Return-Path: <linux-arm-msm+bounces-109876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MUCHVC3FWrKYQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:08:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7CF5D8521
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8B6E30888B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82BFF403EA1;
	Tue, 26 May 2026 14:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nka0MBj8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4680D3FFACF;
	Tue, 26 May 2026 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807298; cv=none; b=ARe2OTmcsI77JtWV1yyh3mQ9MmekWn4TvPQJgh/ybuUCu7AvO7ILsjq1jSp8LD7HfvZR3yBFRDWgB8kNvsOomBnVo8l9O9QNrTbnauPJXeNc8N89ZHvt/7eSKfb5nz5ZV+YsZeGcO2p78Hjhb+ZzNMVReML2MIUbScKsUQlCwzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807298; c=relaxed/simple;
	bh=sEWmEoDeKV3e8XmvxvpVCz5qpEiEFRtT/L/nyenoHfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ine1Mcf6Txf2lefcnZ1j0KDGyMnknPRlG6zvgldX5mPU6+1RzIiPVjpdRLKdagaBKgIzTEmrIXvYAgxuZC/d+w3JGSIBSfGQS45sVqWNIRGJG12o6drdLniMTI2pb1S19eo8yDaC0DWimgVMwN3IsXf7IrX/KdR4OYg7ek8ZOEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nka0MBj8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29A71F00A3A;
	Tue, 26 May 2026 14:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779807297;
	bh=Gz1XDPEqMOede6w3QiL6LZiwFKjg/p5trACYiKw7+M8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nka0MBj8qZwX0efF+YTCpVSV5CRLDdNArlqWNJrbtk4cr3mfS9/8GQKE1CTmkbNIG
	 SjyvOGgA+YTrF2aTyhr0G0peBARIOywlyARllBnVFmwT3s1V8PyGyzPUNZIyBdieuq
	 +lxy/iEyFLx+zSwBZ6d2Wy5sKQnT2aDLbZLuVUtxc+1gllMfuUWkjQhKmpHbn9AGO+
	 PCdi70c+4q3OZk7ENpFgqroxtHMjfqr0J4RQ1rYdsmEaRHo+Z426cJfblyM4E0kbqO
	 3MGTgeF3OiTkXRMFR/0yBf2zYKnOD3L7dDKkGyPsHGJZQwn3q2rhHk74tO67LkxjMW
	 XYJyM8hPPF0GA==
Date: Tue, 26 May 2026 09:54:52 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-pci@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: avoid duplicate PERST# GPIO acquisition in
 legacy path
Message-ID: <ahW0HOEMnJIHviLi@baldur>
References: <20260526-fix_perst_gpio_handling-v1-1-9170507bb4e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-fix_perst_gpio_handling-v1-1-9170507bb4e9@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109876-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CC7CF5D8521
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 05:02:30PM +0530, Kathiravan Thirumoorthy wrote:
> Commit deed8aec62dc ("PCI: qcom: Handle mixed PERST#/PHY DT
> configuration") handles the case where the PHY is moved to the Root
> Port node while PERST# remains in the RC node by acquiring the PERST#
> GPIO during Root Port parsing.
> 
> However, on platforms such as IPQ5424, both PERST# and PHY are
> described under the RC node and are intended to be handled via the
> legacy binding path.

Please send patches to update IPQ5424 to the non-legacy binding.

Thanks,
Bjorn

> Since PERST# is already acquired during Root Port
> parsing, attempting to acquire it again in the legacy path fails,
> resulting in probe failures as shown below:
> 
> [    1.571859] qcom-pcie 18000000.pcie: probe with driver qcom-pcie failed with error -16
> [    1.571909] qcom-pcie 10000000.pcie: probe with driver qcom-pcie failed with error -16
> [    1.571973] qcom-pcie 20000000.pcie: probe with driver qcom-pcie failed with error -16
> 
> Fix this by removing the redundant GPIO acquisition from
> qcom_pcie_parse_legacy_binding() and reusing the PERST# descriptor
> obtained in qcom_pcie_parse_ports().
> 
> While at it, move the warning message to qcom_pcie_parse_perst() to
> avoid polluting dmesg when the legacy binding is used.
> 
> Fixes: deed8aec62dc ("PCI: qcom: Handle mixed PERST#/PHY DT configuration")
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 11fc60489892..77cbd204ac5c 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1824,6 +1824,7 @@ static int qcom_pcie_parse_perst(struct qcom_pcie *pcie,
>  	int ret;
>  
>  	if (pcie->reset) {
> +		dev_warn(dev, "Reusing PERST# from Root Complex node. DT needs to be fixed!\n");
>  		reset = pcie->reset;
>  		goto skip_perst_parsing;
>  	}
> @@ -1912,8 +1913,6 @@ static int qcom_pcie_parse_ports(struct qcom_pcie *pcie)
>  						      GPIOD_OUT_HIGH);
>  		if (IS_ERR(pcie->reset))
>  			return PTR_ERR(pcie->reset);
> -
> -		dev_warn(dev, "Reusing PERST# from Root Complex node. DT needs to be fixed!\n");
>  	}
>  
>  	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
> @@ -1942,7 +1941,6 @@ static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
>  	struct device *dev = pcie->pci->dev;
>  	struct qcom_pcie_perst *perst;
>  	struct qcom_pcie_port *port;
> -	struct gpio_desc *reset;
>  	struct phy *phy;
>  	int ret;
>  
> @@ -1950,10 +1948,6 @@ static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
>  	if (IS_ERR(phy))
>  		return PTR_ERR(phy);
>  
> -	reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
> -	if (IS_ERR(reset))
> -		return PTR_ERR(reset);
> -
>  	ret = phy_init(phy);
>  	if (ret)
>  		return ret;
> @@ -1970,7 +1964,7 @@ static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
>  	INIT_LIST_HEAD(&port->list);
>  	list_add_tail(&port->list, &pcie->ports);
>  
> -	perst->desc = reset;
> +	perst->desc = pcie->reset;
>  	INIT_LIST_HEAD(&port->perst);
>  	INIT_LIST_HEAD(&perst->list);
>  	list_add_tail(&perst->list, &port->perst);
> 
> ---
> base-commit: d387b06f7c15b4639244ad66b4b0900c6a02b430
> change-id: 20260525-fix_perst_gpio_handling-5a4fee9228fd
> 
> Best regards,
> --  
> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> 
> 

