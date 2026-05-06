Return-Path: <linux-arm-msm+bounces-106215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANfZA2i++2nqEAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 00:19:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE344E1300
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 00:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C72E300668D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 22:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD58333AD85;
	Wed,  6 May 2026 22:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UF/aj9HS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CD42E612E;
	Wed,  6 May 2026 22:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778105957; cv=none; b=Z8SY7Khb2CQlRoZMh0JCnkE27OxikLixe8JX1Ftp0Za0K9Err073JzjHcb4ZrbTaJm7AwowGh+2SxUC6621bz1j1HLqgF2jQmH9q/vQAukprnlMF7sC3cyPc4eAHlvCYUK+0Wqn/UqEYV9eHyS0wNehm9AD+uSHuyEVKswnESIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778105957; c=relaxed/simple;
	bh=gysC/lx1i73eA4zP8jwgbWYpicdKVkkAq/If5SfmOvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nv48ScvAih9VyVBnqcOp+kT3nFzwZAa14AqgflLGXZmkgp7Gd8TBdq89HV70jqsF0i8lN2uPdGNyvMGhAWSzbOgI+2PqSnSQTnMNOndbDfi29/r6Tiiqbq/V1K4ZBi1jfBNuTyzNTWmC4G4Elj42HLXBVu9o0SFKRVmZhUDNj5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UF/aj9HS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5ECC2BCB0;
	Wed,  6 May 2026 22:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778105957;
	bh=gysC/lx1i73eA4zP8jwgbWYpicdKVkkAq/If5SfmOvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UF/aj9HS2SYPYHTIXkOa8lL3owagoxJHzGMhyRFSAxj+GJL8gP8yC5+XoLLz6s1x5
	 X9cL5R+VcjnFIjQexqIW2yM4i2kvMQEHMnTIu0Lb82lcqBkA1Hg3vvTFnYScS91BuS
	 2N40C7auuO3CTglHzgoaPeo24WGlW/+zx0190iYZVTD6bGYt2OnLQxGXS+Zi31QbCo
	 BSVOloj3oH2LafE2j6H0SnRWGMGyru24IxEPo4APpEHqlKdF+7EKoOV6XhFqOa+f3G
	 bqbSLPeKNIjTZdxVJ1+2t3TbHL1Z+PbeCe39zAx2EWiABfykEikLE4KgvyrMiahx6n
	 +1VGvBd4tB8Jw==
Date: Wed, 6 May 2026 17:19:15 -0500
From: Rob Herring <robh@kernel.org>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, imx@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
	Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v14 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Message-ID: <20260506221915.GA3290640-robh@kernel.org>
References: <20260424-parse_iommu_cells-v14-0-fd02f11b6c38@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424-parse_iommu_cells-v14-0-fd02f11b6c38@oss.qualcomm.com>
X-Rspamd-Queue-Id: 9DE344E1300
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	TAGGED_FROM(0.00)[bounces-106215-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, Apr 24, 2026 at 11:26:07AM +0530, Vijayanand Jitta wrote:
> So far our parsing of {iommu,msi}-map properties has always blindly
> assumed that the output specifiers will always have exactly 1 cell.
> This typically does happen to be the case, but is not actually enforced
> (and the PCI msi-map binding even explicitly states support for 0 or 1
> cells) - as a result we've now ended up with dodgy DTs out in the field
> which depend on this behaviour to map a 1-cell specifier for a 2-cell
> provider, despite that being bogus per the bindings themselves.
> 
> Since there is some potential use[1] in being able to map at least
> single input IDs to multi-cell output specifiers (and properly support
> 0-cell outputs as well), add support for properly parsing and using the
> target nodes' #cells values, albeit with the unfortunate complication of
> still having to work around expectations of the old behaviour too.
> 							-- Robin.
> 
> Unlike single #{}-cell, it is complex to establish a linear relation
> between input 'id' and output specifier for multi-cell properties, thus
> it is always expected that len never going to be > 1.
> 
> These changes have been tested on QEMU for the arm64 architecture.
> 
> Since, this would also need update in dt-schema, raised PR[2] for the
> same.

Sashiko has some thoughts on the series:

https://sashiko.dev/#/patchset/20260424-parse_iommu_cells-v14-0-fd02f11b6c38%40oss.qualcomm.com

Rob

