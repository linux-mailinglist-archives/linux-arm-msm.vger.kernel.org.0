Return-Path: <linux-arm-msm+bounces-90124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLiWIvXecWk+MgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 09:25:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB786306D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 09:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 292515A14BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 08:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F8B322B6A;
	Thu, 22 Jan 2026 08:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="PvMWY5uf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D1434EEE3;
	Thu, 22 Jan 2026 08:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769069924; cv=none; b=grY/TwwKtMFJU2TcOfdg1GObRs3yNtMLS78LWQzye4f7AXYFgBeYGsQy7jXkPYd3vZneUAPthldgjyCWmbP09SIrtkIQID1933T/pydCaC3Zdw/vHqR92LVDarsTXFnylEvnRX1iI/kOSudpKLZGzXlp+vS5IFuoAf/VIzfRiXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769069924; c=relaxed/simple;
	bh=7CIJ7TMjYpB8LpC3GI/NHJut7LLEZIAawxgiBGDf2Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdxFM/nOyk3umVnHAKymbIuoHN5guzEzNttcDm1Blb3ONTdzm5SZcO+TiIZawti64L0TSQWpv+Piy0KNzgIB9ezWCkDXFQEy2qyR7TyxKtyDGU0uJ+M8+unKa2JmahWXKsQN0WGPoxF0x8ffGPxDyKM6nAZbpxxzGpwJbV/R45E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=PvMWY5uf; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 0012B1C03FC;
	Thu, 22 Jan 2026 09:18:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1769069920;
	bh=7CIJ7TMjYpB8LpC3GI/NHJut7LLEZIAawxgiBGDf2Sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PvMWY5ufBPgoOXsVdUw8Vj0CniCI9dAvxLDn4lDpuXmCKwHf2Gc0icqZELzs5/bxF
	 hNLma+GYNrjzkPOB2Qi4+AsUIA14s87i2YIrIns6zc4PhvuV2MRETKhUZppOhAc+ZO
	 QGhIF9P8a4rD10CKsr/W1YkuraSl0HsyvSmpxqlG2GQMDNQAFqIbyjiclWtBAR7EBY
	 rwJVIzSjmh5iHWabfQ7oKB0IW2zjK9M184vYXLOwjmqd4/Z2zhJpdOFOGEe0Bw4xGJ
	 PUWjW1bFZxAX6H9BTIBQAsDq7KiGmJLoJoO7pCJbKEBPMHsAltRtUIfPrAsN/CBAPq
	 YvZDKQkPYin5g==
Date: Thu, 22 Jan 2026 09:18:38 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, broonie@kernel.org, 
	will@kernel.org, robin.murphy@arm.com, robin.clark@oss.qualcomm.com, 
	hanguidong02@gmail.com, quic_c_gdjako@quicinc.com, dmitry.baryshkov@oss.qualcomm.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: do not register driver in probe()
Message-ID: <mo5v74ryxfwik4ggr56c2xha34sfwq2kq6suxi65pbqxrdppnj@oqkirr2kgrey>
References: <20260121141215.29658-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121141215.29658-1-dakr@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.29 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.67)[subject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[8bytes.org:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-90124-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	DMARC_NA(0.00)[8bytes.org: no valid DMARC record];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,arm.com,oss.qualcomm.com,gmail.com,quicinc.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[joro@8bytes.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[8bytes.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[8bytes.org:dkim,amd.com:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 1BB786306D
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 03:12:01PM +0100, Danilo Krummrich wrote:
> Commit 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in
> qcom_smmu_impl_init") intended to also probe the TBU driver when
> CONFIG_ARM_SMMU_QCOM_DEBUG is disabled, but also moved the corresponding
> platform_driver_register() call into qcom_smmu_impl_init() which is
> called from arm_smmu_device_probe().
> 
> However, it neither makes sense to register drivers from probe()
> callbacks of other drivers, nor does the driver core allow registering
> drivers with a device lock already being held.
> 
> The latter was revealed by commit dc23806a7c47 ("driver core: enforce
> device_lock for driver_match_device()") leading to a deadlock condition
> described in [1].
> 
> Additionally, it was noted by Robin that the current approach is
> potentially racy with async probe [2].
> 
> Hence, fix this by registering the qcom_smmu_tbu_driver from
> module_init(). Unfortunately, due to the vendoring of the driver, this
> requires an indirection through arm-smmu-impl.c.
> 
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/lkml/7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk/
> Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/ [1]
> Link: https://lore.kernel.org/lkml/0c0d3707-9ea5-44f9-88a1-a65c62e3df8d@arm.com/ [2]
> Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()")
> Fixes: 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in qcom_smmu_impl_init")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Joerg Roedel <joerg.roedel@amd.com>

This patch should go via the branch that contains

	dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()").
	
Otherwise we add a Fixes tag pointing to a commit which comes later in the git
history.


-Joerg


