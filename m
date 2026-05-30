Return-Path: <linux-arm-msm+bounces-110347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAk3IZS2GmpS7wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 12:06:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA86460C034
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 12:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0B003039811
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 10:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A8439A7FD;
	Sat, 30 May 2026 10:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVAC1Nmp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9546B395ACC;
	Sat, 30 May 2026 10:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780135566; cv=none; b=eJenPbvblxrUKGP8F0x2YiPuGkB8sgo96fSmORATwCB3lomt0wP7m7hn/oe1KBeauGzYlPOprPjvRuqoF/P3Imb/YowwHBE97HwotTl50NLdYVUahbkyt5eyP0+IYve/VIL0rHYikUQ07DFSnrsxOt4ztJwUxhb3+V6si5G1QxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780135566; c=relaxed/simple;
	bh=kxd/+s4up+CB9nw8Uufefrg8XJ1FfVNblaSwYdQb2aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2EYaBZwCiktxPPzT8cx6lWpHGwxiZPEdqzB7ZDA4lDxGZtMm+niqCQlPO9Hetd2FfcMjJEADE0v134FPLo0GOrl2f79LR3grIhewNDBWmR8F7/XztiRbgeL2QKIJDKGCYW2fZnncNKkG3C+SyQjQz/nZF09m0VAHGY1x8vt4wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YVAC1Nmp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6FF1F00893;
	Sat, 30 May 2026 10:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780135565;
	bh=/j5UccKc4jhuG20/9tIyhmRAvogcURw7E1mOE6YtsS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YVAC1NmpcDKBuSTcVe7kc4AUI+9t6Z/3sP3ChNmn4VpaWsE1BhiO1XEVJzSYEjFTY
	 NxGoZneMnN0sDSHxFcnrbRmH7s3QlVooD/hJ41F0+BNbKP0PXvi/JoybdxJqzRgtbL
	 fRWLYSLcT39NVmrmbrBXus7MbpsZljVZJcG4KQcha0Dem9IsaSV/k085L5NE/9SCMz
	 K0HfKsyg72/31BVkZkrWaPxDQtJcuZS83VeIzJ7ZpivoOmWUkWCTbdKzMMzxNXB6C9
	 h8GRIZ+V5XN4JHOSeKdjv2qY258OkjFMVxhbMzXZZ54a8AHil85+yhtgkaNB44Ey7m
	 9EN2ybJlj2dpw==
Date: Sat, 30 May 2026 12:06:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] PCI: qcom: Add PCIe support for upcoming Hawi SoC
Message-ID: <20260530-mutant-gecko-of-anger-ce8803@quoll>
References: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110347-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DA86460C034
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 01:10:07AM +0000, Matthew Leung wrote:
> This series adds PCIe support for the Qualcomm Hawi SoC. The Hawi
> platform features two PCIe controllers: one capable of Gen3 x2 operation
> and one capable of Gen4 x1 operation. The first patch adds the device
> tree bindings documentation for the Hawi PCIe controller, and the second
> patch adds driver support by enabling the Hawi compatible string in the
> existing qcom PCIe driver.
> 
> This series depends on the following series queued on linux-next:
> - [PATCH v3 0/7] clk: qcom: Add initial clock controllers for the
>   upcoming Hawi SoC (Change-ID: 20260316-clk-hawi-1ad4cad36d6a:v3)
> - [PATCH v4 0/2] interconnect: qcom: Add support for upcoming Hawi SoC
>   (Change-ID: 20260311-icc-hawi-d6dc165f8935:v4)

It cannot depend there it makes it unmergeable and untestable. I skip
review in such case, please follow standard documented practices about
decoupling independent works.

Best regards,
Krzysztof


