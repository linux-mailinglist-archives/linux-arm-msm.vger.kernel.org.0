Return-Path: <linux-arm-msm+bounces-108554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PLkGqaCDGqmigUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:32:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 618CD581825
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3CE85307BF3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2AAD3546C8;
	Tue, 19 May 2026 15:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4MbMa0g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA853EA96B;
	Tue, 19 May 2026 15:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204218; cv=none; b=mkYr/nySPjkIdk5IB137BzRvfUk9bwj8nZQXVDURc2VKKLgoNiNTdpa+XJjOS8UCU0XfoGnvrCgpsqJfZlSndnVz9sG+k/awHbgGngLjXX5hf8mjCbtqodvyilbQpDxS5W3op4cU7qrt3djQ3d3vd3QOJjH4JfHv54XfTxlsFuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204218; c=relaxed/simple;
	bh=tKQBYpT3697CvR/eRR0KPRe6RFtDdAPupyrmFvryfL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SdLcB45dVE30kSocRFY5sYddGRNCLCtd5Ir7jySp3oHdha/7y3SYFBTC2GMSQ9n+pIfUIhHJXgcn6L5oxEkKzK/dR6vXChpBrbDNiLmh+d8I8lgNGwdnkjmVGcvLhdWND1xaE2OsN7aq7T1zrMduNqVnn5vkkWYCNwPm5wMsxtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4MbMa0g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937E2C2BCB8;
	Tue, 19 May 2026 15:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204218;
	bh=tKQBYpT3697CvR/eRR0KPRe6RFtDdAPupyrmFvryfL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m4MbMa0g9LByzbaU+tBMRjuc9LJm6PxE81eiY/DnXxAlYyAb4F7WIoHlTuV8OrG98
	 oRA2/3CossOVllXcQg8YprF5ijbIlHhY4o2IEsnCEkUlNWVdDRNsbKDkulx32W7mf1
	 QmwyNNkC0BD0nXT3mZZ/84MY3uw5j+O1bNZvkL7I3Qo7amsxoiSdNJD6b55EmSywd9
	 LuN07bgGmG/mNTixJXNOFLS1zztsEjUy21p6gH90ovOzwJrRDw102kNF0seU5Re/N6
	 5FijeC7uB9zBB0G4xMupD1a1S3Fd4Jv7vQSSEdbo8JQ9ud3kMFTWY5b0E4WMGV22LK
	 YzYmQE1fBySIQ==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	bibek.patro@oss.qualcomm.com
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	srinivas.kandagatla@oss.qualcomm.com,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Fix fastrpc compatible string in ACTLR client match table
Date: Tue, 19 May 2026 16:22:54 +0100
Message-ID: <177918570897.725893.17447458328924227845.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260423100230.3462214-1-bibek.patro@oss.qualcomm.com>
References: <20260423100230.3462214-1-bibek.patro@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108554-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm64.dev:url,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 618CD581825
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 23 Apr 2026 15:32:30 +0530, bibek.patro@oss.qualcomm.com wrote:
> The qcom_smmu_actlr_client_of_match table contained "qcom,fastrpc" as
> the compatible string for applying ACTLR prefetch settings to FastRPC
> devices. However, "qcom,fastrpc" is the compatible string for the parent
> rpmsg channel node, which is not an IOMMU client — it carries no
> "iommus" property in the device tree and is never attached to an SMMU
> context bank.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: Fix fastrpc compatible string in ACTLR client match table
      https://git.kernel.org/iommu/c/a6e1618a65d4

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

