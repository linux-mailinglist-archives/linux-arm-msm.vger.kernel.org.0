Return-Path: <linux-arm-msm+bounces-90041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEl/NIrrcGk+awAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 16:06:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC5F58ED1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 16:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7C937726697
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC244A2E0D;
	Wed, 21 Jan 2026 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oRuaQeTi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9507B4A2E03;
	Wed, 21 Jan 2026 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006813; cv=none; b=kEDoczBV3zOcAX4txraNus4QTri66rEwBkwVPigppmSt5ZD94tn+l91vGJnCo6DdcJ5W44QZNuy8W7gTIfpRLA9uLk9JupcFFHonA8XBgNjlW/YWRHarMPz5yWpyo80Qi84hsHR6g+SC0Uu+jgqMO21yhqLgzh69JU+SEToSNe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006813; c=relaxed/simple;
	bh=S+5EpmdELU8PLZTSrl8ayAXpEobV1mMRAAa5uAOth0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eX1Ggl7bc4cafROV2Cf1E05V3yepNFTuCBJC6nuvATFwtu2+NtMTMJtI9vha3qL7Wy2REX/u6612aiy/Te5Jh51R8T/kl4CwlWZpLXBdHSpTeGTCcqqIx0vNlzjRNmtniyxfU8A1rUi35rVAYacVu7KLJZGiosCu42XghFJiAJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oRuaQeTi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8B3C4CEF1;
	Wed, 21 Jan 2026 14:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769006813;
	bh=S+5EpmdELU8PLZTSrl8ayAXpEobV1mMRAAa5uAOth0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oRuaQeTimy3+0QFPFe2bCRMcbMxj26B7rlNdaMdWcO384tZkzsFAqbDlm9YpSBtMB
	 bovOxj10jSa3NGXqSBGunOpvNJvHFgeR9dGqZJ1JeIaLmvXa+mLoe834NRHzxK8+q4
	 RpmMQ7E3dv33x0KyCuEi5FH92zmTQRz4EpAJqHu0=
Date: Wed, 21 Jan 2026 15:46:49 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, broonie@kernel.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, robin.clark@oss.qualcomm.com,
	hanguidong02@gmail.com, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@oss.qualcomm.com, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: do not register driver in probe()
Message-ID: <2026012139-crewmate-radiantly-d533@gregkh>
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
X-Spamd-Result: default: False [2.54 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-90041-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,gmail.com,quicinc.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	DMARC_POLICY_ALLOW(0.00)[linuxfoundation.org,none];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 8AC5F58ED1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

