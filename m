Return-Path: <linux-arm-msm+bounces-108556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKHMAqSDDGrIigUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:37:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D6058192F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 23F1B30A2F05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5851D400DFA;
	Tue, 19 May 2026 15:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4MrnUeZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356A63EA957;
	Tue, 19 May 2026 15:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204252; cv=none; b=IrL7hnhnBvJMtSmJdiW0GHMa1WuXDM6ULXv0s6F6z2XlCqsJRR5blymA1iG0j5A2Gi9c4PSx06CI1OzP/1E2aFGfKCf8tNpJz0qMy+VxNBqz06RMCQ49xbySYFIkELl0p8DrxvOMY5KXisfprQq0nxCflW1sPmFdti9pSjCQRVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204252; c=relaxed/simple;
	bh=ERJ6QYyD/rtixjiVMC1F+5dCbuxQKMvAlZAya3dqpJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uit44Qlbi3y9oUyErPtaVqd1mXuUpBuxhiNGo8o1o4ecVEUYNk4czKbycQ5zYBBk/NzqS68p07w6ldFp/3g6uQiUyerAYUU0ck5RiNtKYqCs0oXOeYPQLmpn+9zOMTB4F3weSKvMS+exppWfUdd7k8f+a+2SQkqLVmOqLIWWbwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4MrnUeZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E113DC2BCC7;
	Tue, 19 May 2026 15:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204252;
	bh=ERJ6QYyD/rtixjiVMC1F+5dCbuxQKMvAlZAya3dqpJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D4MrnUeZHzwkASxmm+QLvSMa2+atQzHfuIemVPTpOJQijkUBjoNeWrcqbWq5iJFv5
	 SKY8ZmKZdDU2bxaHhHU8FPdAh3NgE6MD5DN6RFv3C7oRuuy4T6IGNbbLBMkaA28OG4
	 D2HQn1foKwNI0Qje9xesPIQANao6i0Fbe/Xb+FqSNUa7VtcSCV6iBF7zxhayfyj6S5
	 a8LA+gPrCwsd3M/3SWzClJoEwlgkPmJJ7azMCh/n/zXiXKC5qmiX56FnEFGRGIVNx7
	 VeQT2aSXxLth0qIhEp/hYo5wquD5NOd8ESpgBEMufMf2ZlBHJg/F5OX05uvgH4qHU3
	 kEq12YoAKEwbw==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Lokanadha M R <lokanadha.r@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add glymur MDSS to ACTLR client table
Date: Tue, 19 May 2026 16:23:05 +0100
Message-ID: <177918839354.749747.14864663543580350364.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260428-add_glymur_mdss_compatible-v1-1-8416df5a26f4@oss.qualcomm.com>
References: <20260428-add_glymur_mdss_compatible-v1-1-8416df5a26f4@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108556-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,arm64.dev:url]
X-Rspamd-Queue-Id: 04D6058192F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 28 Apr 2026 15:13:50 +0530, Lokanadha M R wrote:
> Add qcom,glymur-mdss to the qcom_smmu_actlr_client_of_match[]
> table to configure the SMMU-500 context bank for the display
> subsystem (MDSS) on the Glymur platform.
> 
> The settings disable the next-page prefetcher while keeping
> macro TLB caching enabled. Without this entry,
> qcom_smmu_set_actlr_dev() finds no match for the glymur MDSS
> device and leaves the context bank ACTLR at its reset value.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: Add glymur MDSS to ACTLR client table
      https://git.kernel.org/iommu/c/8bcad9e3a674

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

