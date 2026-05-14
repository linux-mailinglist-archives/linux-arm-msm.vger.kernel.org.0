Return-Path: <linux-arm-msm+bounces-107681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Jy5Nhr3BWpVdwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 18:23:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F665449E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 18:23:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A635C30D1A03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461F43358CA;
	Thu, 14 May 2026 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AskMKOfp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A853358AD;
	Thu, 14 May 2026 16:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778775537; cv=none; b=qdPCr0DeXRzk3mVXAz240nqz+s/KsxXuRTXcGiEkuTaBZo98DKeHN3+1usz8zfhEVx1Pm6cPp1rO557KOaIEs0QPrP7VFtMPbPG/huERt022dzKqz1oYmGmEBgvu4ZvZwJARb2vkAy6jld8Fl9Ko68Tg7v9+6hd41uWAth91b/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778775537; c=relaxed/simple;
	bh=oEhI3MAV9DxVMuKAz9IhMcJIErgvjqO7BIkYeGhQp4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=YwKO0kBGR70NbEUDl32BKJFNmvo9lbo+HnNn+s0HzNTNPUdN9gRYxGaZa8/mXJSWS/KSf83bfbXw1IOpkQ9+zaEXnj/vYf7FynTOXqzBdUwk2IrZ6zhQfJTAphAeZgBRJsTJJ0j2m6YiwtBnyl47mpmutalIiwQjHtdwjuCzRiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AskMKOfp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B6CDC2BCB7;
	Thu, 14 May 2026 16:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778775536;
	bh=oEhI3MAV9DxVMuKAz9IhMcJIErgvjqO7BIkYeGhQp4c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=AskMKOfp8fqZVUF1yd8ILV6qlLGR3THvisSjDvtQ6IR268fAh8b01Fu5uSHxq/NvR
	 IKoX1eki7KvfGnMhB4u2dj6kWi4B+TuYKjOMwhlCttAZLyHKOJbvzD8iMR5PtLd7MF
	 B/YbQxErOYkTxvAq/UsORCFsP48nNckzea4cNYk9oe2DweD+xhm0GIFfWiF34X3C6m
	 nW10TZSEk7ccE3SneHEQUmP0bK3xj6bFnjSazYYAByEEjEToX0ocrGCKM4mk52gllw
	 l6DViFpK1a0qOBSGD2dKQUU3xG24PpcjzYVL17x+oZkPQcCw5YaRkESmMWQOrcF6L0
	 wscu4PI/eqw2w==
Date: Thu, 14 May 2026 11:18:55 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v5 3/3] PCI: qcom: Program T_POWER_ON
Message-ID: <20260514161855.GA408477@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-t_power_on_fux-v5-3-f1ef926a91ff@oss.qualcomm.com>
X-Rspamd-Queue-Id: 86F665449E6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107681-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, Apr 28, 2026 at 02:07:17PM +0530, Krishna Chaitanya Chundru wrote:
> Some platforms have incorrect T_POWER_ON value programmed in hardware.
> Generally these will be corrected by bootloaders, but not all targets
> support bootloaders to program correct values due to that
> LTR_L1.2_THRESHOLD value calculated by aspm driver can be wrong, which
> can result in improper L1.2 exit behavior and if AER happens to be
> supported and enabled, the error may be *reported* via AER.
> ...

> +	/* TODO: Need to move to DWC core once multi Root Port support is added.  */

Can trivially be made to fit in 80 columns, e.g.,

  /* TODO: Move to DWC core after multi Root Port support is added */

