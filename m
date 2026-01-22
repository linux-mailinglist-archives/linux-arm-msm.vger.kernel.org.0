Return-Path: <linux-arm-msm+bounces-90218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMyyHXBBcmnpfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:25:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0A268B8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:25:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 967B478B53E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E63334DB57;
	Thu, 22 Jan 2026 14:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vHFoYMdg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4D42E1F01;
	Thu, 22 Jan 2026 14:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769092897; cv=none; b=JqlWnZNxYYdG9RsH9HUgwzjnJc5sU2j2ogPKmSVQNtKTMSrq8Ae6pFO6y2eFffjozTg6i6zBYnHGm0w39Twt4PmnsZzIHC/UUhTaKioye/7rvYW4oYUsMlOnDZ2TK65XVOssxzd5/lpIwv4P5cgdmsrB4AhIxvk0apZi4dAFPYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769092897; c=relaxed/simple;
	bh=MdN8tApaGhTAeUwctL8TWZWqe4uqbNP2GFX5k0FZzjw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=twc/ARKAKXhSqQmal6JwiXFdvKwiewsg9RMY6NoQDA8zrFeGq2sXe3CdGWhov+zulYd5/b6NjtSd7NKwBaSpXn7XHofI4MQCtkXBnAUkFbZ5lbp/0PODS2pAPjPNyEiACIJbNrdxj+V5gPmDGtKwaOqagvIEGtc/no4AO677JVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vHFoYMdg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C546C116C6;
	Thu, 22 Jan 2026 14:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769092896;
	bh=MdN8tApaGhTAeUwctL8TWZWqe4uqbNP2GFX5k0FZzjw=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=vHFoYMdgIMY5+6FflDXfL5BZe45Uh6TMPu62RAtX/7+OUJxIDTC4hKk0yoOIltmHm
	 wXwlvxgKkMKp1PIAgllRKARyufu0WDKmrgqg0leaAlYPRUzYAhjG/HTfpd1ThNKeep
	 pJzkNTJ4fue2bAQD68BPX3ZwpZ01pzBiCI7a28ksukxepfURCfQyD3nz3DBHsssDEA
	 9JSJ4EskLt4wgSNkpRt55lh9gDZ6Mv4z7EwfhKNkHCjDvuiknOjsMUq1Uu46S5rlm4
	 DuuGBzjUU/OVHISM4si3QDiqqdMZcdTO/24l4HREj+gS2XmAmuHVAq42Wslk/lmAxT
	 RYaQyhKWMXBoA==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 15:41:31 +0100
Message-Id: <DFV73ATZO1W0.1ZAP6UN1HFL2H@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: do not register driver in probe()
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
 <linux-arm-msm@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <broonie@kernel.org>,
 <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
 <robin.clark@oss.qualcomm.com>, <hanguidong02@gmail.com>,
 <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@oss.qualcomm.com>
References: <20260121141215.29658-1-dakr@kernel.org>
In-Reply-To: <20260121141215.29658-1-dakr@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90218-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,arm.com,8bytes.org,oss.qualcomm.com,gmail.com,quicinc.com];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 0F0A268B8F
X-Rspamd-Action: no action

On Wed Jan 21, 2026 at 3:12 PM CET, Danilo Krummrich wrote:
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
> Closes: https://lore.kernel.org/lkml/7ae38e31-ef31-43ad-9106-7c76ea0e8596=
@sirena.org.uk/
> Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/=
 [1]
> Link: https://lore.kernel.org/lkml/0c0d3707-9ea5-44f9-88a1-a65c62e3df8d@a=
rm.com/ [2]
> Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_d=
evice()")
> Fixes: 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in qco=
m_smmu_impl_init")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to driver-core-linus, thanks!

