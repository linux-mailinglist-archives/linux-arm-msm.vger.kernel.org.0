Return-Path: <linux-arm-msm+bounces-109856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOPeLW60FWpxYAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 16:55:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E605D81BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 16:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46498304C7D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637843FDC05;
	Tue, 26 May 2026 14:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DFRNYBtt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439143FD15C;
	Tue, 26 May 2026 14:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806817; cv=none; b=hPa5SPN/HbOYZchyAQ3Z3tLyQfBorO/7eW2F+OR/asi/bFFyiswdlmKT7kgwqJ3tALvxffHEYx+EwKAWkhrjEnEwTDF0T/Oa6R+Xl55txb61SUvwnUdTMsgyF8+iAvG6Z6O7t0zfDcY7WQT7Y1gAGOTxM9KnhlguDrw/mytxxLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806817; c=relaxed/simple;
	bh=cWd99PV5i1/wwHzXhpwkU/1IWBMNd/CIwE0gfZNuNqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iu7Rbpe6dw3U2hoQ5t6WF8kHYwotTZpp0v+fIZGhnl1BxjqR7BBBKfC/OaIb2o+6SANfsIhmZ2IiKrkTdGun4i6L+tzsUZ50JwAXLRc6Ttf3IY7FMnGVO2EzI6bmNdRovY8n5zhIOuRMh43sco+nSDV2W4zW1M2H6HAgE37Pf1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DFRNYBtt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1C91F000E9;
	Tue, 26 May 2026 14:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779806816;
	bh=MdSG/zAtkJWOQxwxf+SU3n5z7OdeKAIAKo2ylUcELSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DFRNYBttKSy5u2zhkG1o6P1u3jGJdB8ntV8xB+AcohmYYKprMEpEN9Jrj+Qu6mNM9
	 iNU6JX7vMjsGM3mgk5BYe74FQtaWHAXX1X/l+t6JSkGBGS/Ii9vHHhy+fwCHR3pGK1
	 qVWzNUtxRUFLtv/CpP2AKEkz45WSJ5Lx6dloWiI7+LXZ0d77ihZz999E9MJ72+j451
	 Av0d6AIDPTkYPAw/Y07VP0c7SQO5DWDMSz6NTfQjDZzZ80vPBDEM+qhN9YgSX/Mx3r
	 heM1p5AMOFWtVIlSlwjnvChznfaziJlfJbOMs0gHaK9It9w3QEifwfM4V0wY8IO/rp
	 OgJPqAFqeQfEA==
Date: Tue, 26 May 2026 20:16:51 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: avoid duplicate PERST# GPIO acquisition in
 legacy path
Message-ID: <vadkszqfpmi4jssf4rqm22xs544en7tmcjnqukdbhzpjd3ckk3@bjdhzu7hvnxn>
References: <20260526-fix_perst_gpio_handling-v1-1-9170507bb4e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
	TAGGED_FROM(0.00)[bounces-109856-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 20E605D81BE
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
> legacy binding path. Since PERST# is already acquired during Root Port
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

This will cause spat for each child node. So switched to dev_warn_once() and
squashed this fix to the offending commit, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

