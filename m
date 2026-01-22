Return-Path: <linux-arm-msm+bounces-90127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLukE+rjcWk+MgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 09:46:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CA163636
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 09:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 626F8726329
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 08:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0697A369221;
	Thu, 22 Jan 2026 08:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ip8L3Q6r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67543033FB;
	Thu, 22 Jan 2026 08:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769071069; cv=none; b=FkLNT/iffddzyiJYnNn+NS86BnglGi6pVOv+0rSfHo8FyP1I0tdCuWkQkNw/vwv+7FP6Bnno+8pMq5SXufjD0dKYvhXKfK+c0St7IOzSbgRDKo8zfbEJRznYvBB+WtIGa4XOxBlRPXQpJkjDApcdrKUb0LaKVRfHGIiuMKfCM6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769071069; c=relaxed/simple;
	bh=SfmvWqRZsDc45SxQJtfNXD/CqX0o2X+iPrylB7CAmNk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=Y4IeQOH5roXCbPHTkyMQGBu9f4arjKAIGPx7px7OEsAs1N8Z4wQzovhzDv6KBmDVzxaf7xHKvfqVfKZfvwO3Bc0GtUlBucJRKrriugqysxR0Dl0QZYTrBr4+U73MPk66OZZ+4oSeyCKYNqO4cZpvkXSJTethl6rcrfYFH+vgSiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ip8L3Q6r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE8FC19423;
	Thu, 22 Jan 2026 08:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769071068;
	bh=SfmvWqRZsDc45SxQJtfNXD/CqX0o2X+iPrylB7CAmNk=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=Ip8L3Q6roPH4UT/uSKbKbAbbRltqOIGkmay/HPfUl4xOxKE9pV5oLwcT6fPS/he35
	 +k5/K+5iCTmB2ygSQfiKco4SQ+kQn7NtnU19Rd7kt2W/1BoMaJMrqmBFKhJlUEXvO2
	 dU+DiANH90rxClaSjP9Od6bF5Pi6Mb6pul5ny/wd4YsKkijB75nRcyBihea4Pgb6LH
	 EAMVLPrL9UzLTZEdYYYEalM6t9Ob8NzK5T2oxYnUkzUVkffiQHWPE+Gkz4est3G90q
	 h/ZU833scwAHuAZp7qfgLt9wGdShw5XCq/R+7UHnK8W9594lTUDo4K8f9GQL7o/4Gk
	 Ny9lzyTKrzlZQ==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 09:37:44 +0100
Message-Id: <DFUZCRCTYP67.358VJGW8MOFSH@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: do not register driver in probe()
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <broonie@kernel.org>,
 <will@kernel.org>, <robin.murphy@arm.com>, <robin.clark@oss.qualcomm.com>,
 <hanguidong02@gmail.com>, <quic_c_gdjako@quicinc.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>
To: =?utf-8?q?J=C3=B6rg_R=C3=B6del?= <joro@8bytes.org>
References: <20260121141215.29658-1-dakr@kernel.org>
 <mo5v74ryxfwik4ggr56c2xha34sfwq2kq6suxi65pbqxrdppnj@oqkirr2kgrey>
In-Reply-To: <mo5v74ryxfwik4ggr56c2xha34sfwq2kq6suxi65pbqxrdppnj@oqkirr2kgrey>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,arm.com,oss.qualcomm.com,gmail.com,quicinc.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-90127-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: B5CA163636
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 9:18 AM CET, J=C3=B6rg R=C3=B6del wrote:
> Acked-by: Joerg Roedel <joerg.roedel@amd.com>
>
> This patch should go via the branch that contains
>
> 	dc23806a7c47 ("driver core: enforce device_lock for driver_match_device(=
)").

Yes, I will take it through the driver-core tree.

Thanks,
Danilo

