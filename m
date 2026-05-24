Return-Path: <linux-arm-msm+bounces-109489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ji4Af9tEmo7zQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 05:18:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0734B5C1378
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 05:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DE4CA3006913
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 03:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D988119E839;
	Sun, 24 May 2026 03:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLJnPZ4B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE572744F;
	Sun, 24 May 2026 03:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779592694; cv=none; b=Fv5Fm3OI7Sz3A1vKtASMdVxnKqYYqqte7IHLFYNtbL7FmImV1OuDo5etBR0bhTMu0+fLzBIyQ98Nt/6oUnkz47wqY/bU14SX/m5nS/fkGtb9M+z4B/YAhHYfpZJJ1dQ2X0DcxDITfLsGpeD5ylQ+jqMq5DANelMeGDIeAF7Erms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779592694; c=relaxed/simple;
	bh=FTF04ASVcIjNCTSm6vabBRC9pFEBi23lkvHUCkWwLVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cavQdjYogtOaLOIpM89PSTV09ahASelm9IUik+uNDgVCIazsPhRZXGPD2Mohgro3DUfvNIfwdUm15C5QUNvHX0QbKuw0QVkJC4NQcwdPEC88OTdka+59GJDr+dzWS17IrzSwfuIvLa8OJDLMcmh2DuXIvnC7s9/VJVtMDUJFBp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLJnPZ4B; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A481F000E9;
	Sun, 24 May 2026 03:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779592693;
	bh=IAB1qhj2r/fkAJ6mKlvIOfPFOwzS7DkVvJXTCaX2+So=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KLJnPZ4BfCy7vv3pHrBbdspN7ac1IdUfwlsoQ7feQ7V1TOtNyzHvnpcBFcgqslc/Q
	 MDdEwhQdihORhN4P0dKsaHoyuhl5QHx2I8N5sJf03RTzY5pmkcuez6lKGhR6LxRR53
	 nRzF3hzPeh/H57M1fiwIsr0aI74M77x9Ry0yM/NnJrTCjGYBpZiOgC0yGCdq+Pz3Is
	 hlnMPrtXcAIKWahHnStosix3etbklacLcZyNH2pAP36Anp+xp6EjMDClHKzltAPZjf
	 PgTU1QEE/7eWI7GcUa791J77CQHMbm2lPlfjT3RwBcVjqBGTLXdbGzJ0+SEyq6lXNn
	 9iveyTCCCAvYQ==
Date: Sun, 24 May 2026 08:48:04 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] power: sequencing: pcie-m2: Add QCA2066 (QCNFA765)
 BT serdev ID
Message-ID: <7apajygktl7myslg7mclwgndj2rqhomxmtdii2vsigo32ztr2d@qdui3oxx5rik>
References: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
 <20260520-monza-wireless-v1-1-9f6942310653@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520-monza-wireless-v1-1-9f6942310653@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109489-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0734B5C1378
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 01:01:42PM +0200, Loic Poulain wrote:
> Add PCI device ID 17cb:1103 (Qualcomm QCA2066/QCNFA765) to the M.2
> serdev ID table, mapping it to the qcom,qca2066-bt compatible string.
> 
> This allows the pwrseq-pcie-m2 driver to automatically create the
> Bluetooth serdev device when a QCA2066-based M.2 card is enumerated.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/power/sequencing/pwrseq-pcie-m2.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
> index efeb25ba9c79e20fc8bc8354def8ae423d0f2f2e..f90df88c663985c7702c19911f0c147e3b68984b 100644
> --- a/drivers/power/sequencing/pwrseq-pcie-m2.c
> +++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
> @@ -188,6 +188,8 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
>  static const struct pci_device_id pwrseq_m2_pci_ids[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1107),
>  	  .driver_data = (kernel_ulong_t)"qcom,wcn7850-bt" },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1103),
> +	  .driver_data = (kernel_ulong_t)"qcom,qca2066-bt" },
>  	{ } /* Sentinel */
>  };
>  
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

