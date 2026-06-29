Return-Path: <linux-arm-msm+bounces-115198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h/pPB/qVQmq2+AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:57:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ABE6DD040
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:57:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=K30e3ASX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115198-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115198-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3493730C8E41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F1A3F7892;
	Mon, 29 Jun 2026 15:47:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D7C3DDDC9;
	Mon, 29 Jun 2026 15:47:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748027; cv=none; b=H8Ea5JwuDT0WJglJ8xNrpD+Dn2dHTXPldBlPqPJVZq7PWv2yooyTStBuTykykE23b1nQomXkHM9YNhUTYTEJfrN9PB4SIhPSHRV4G0Aa/I90KoqoRqlPpiSgIQBsoJZ/abxHhV/ijahzZfoEc+Y+5hjxm/larsl/fgsQFlCI/iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748027; c=relaxed/simple;
	bh=QsnmsrfvMFfrNo2Ii8bGmMNMDhphCh1nj5cZluIQVYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PyKXq6ks3sYIiNwXF7x7S4sSsSZTpb0GJJJvLXxs5Qcjj0jmmEoMfbhkRNBzSpLmEpBCA4RW7y2X/J8fJztBnZVSVu0jvE1slb46lPrishsz1ixwbCAbv6feh+/SfrFI0BCBYj1Jb6fZnlUDkbqbdTSHxo+cehmC0liXeKc4cl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K30e3ASX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61431F000E9;
	Mon, 29 Jun 2026 15:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782748026;
	bh=Zwf2F0ty3yV6emjhTjpwsHP7jJr8cgRnPZK3E9IHM8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K30e3ASXk3Uqd8wptw5/q4d3OfVyGIaifmMIO0sZx4XzC0nRXsLZyvov1vUNo0l7O
	 fqPB5kA+GuR3/IYyPUFwwCuqdgfPeDx8auQNBbolikD1bNFCC4UGFq78nE+/h9zyPo
	 FTqbEacmru9UWhrRJF0K5q25jNDHlJH0V+RGpLuH+w9bQ25mjjtnmdQ4rFG4M04ilS
	 0exPBjE2JdqYREtuvCtYPe7FOwer93BEBrFVJabP+jsZmfS3GJij0Z1wSf0Jq+lrBw
	 WRAUgeNd+AZJDHcWZzNbh4Lm6VeRSfFHsHJamRB8fdSYTpAOceEMCMq9wAIn9Ojk7J
	 5lxTuTPo9WbRw==
Date: Mon, 29 Jun 2026 17:46:57 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] mtd: rawnand: qcom: Add MDM9607
Message-ID: <4kdjxrn3bxg7rhkdovidxv2b2f6evnknng7gjtbz7pahyqaakh@qkgxaz6xlav2>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115198-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:email,qkgxaz6xlav2:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A4ABE6DD040

On Mon, Jun 08, 2026 at 03:20:21PM +0200, Stephan Gerhold wrote:
> MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command, but
> is missing the rest of the hardware changes in QPIC v2. There is also only
> a single clock that can be controlled using the RPM firmware. Document and
> add the new qcom,mdm9607-nand compatible for this setup.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

You could ammend patch 1's commit message with the information I shared in the
reply. But nevertheless:

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

