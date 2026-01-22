Return-Path: <linux-arm-msm+bounces-90239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNtTMApfcmnbjAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 18:31:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 209C36B57C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 18:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B04B302A05F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 17:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520083A0B17;
	Thu, 22 Jan 2026 17:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/mSaB/N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D292E5B3D;
	Thu, 22 Jan 2026 16:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769101197; cv=none; b=I2Nykr2gMHDh2atSd60fUUN8Q+PHDDhgkUZNbDh1dO4nGYBreif9ggH8QcPqclwp+HRjJuGROzE1Ss9iLVZx386pu6M7K08zhwcrlvQpY1ue8pGcX0rSzLGkuCZ7SnFRJrSWFfW4X+zuNtpLGBnepO2ARfjaFggU4fMboWo3iG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769101197; c=relaxed/simple;
	bh=fnj5f0mzOP3nCSR0nXkS9PzcpIrYNOAhr7vqfig/jcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jU+aBm/2otYUtAdEDfm+v2oGpTyG+4zI22lM+hSffGdqGb5CGNYdcjdD9UbxT5fUC2nGtXdq3igJ97cYm155f+89ZdVCtvssMpEv5YgrKkUce8531Hw/FYXDxrMeZZ2ZNYVZYXwxfULYYC7la7GZFWhui1HESUVa8VFay3pAuOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/mSaB/N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E608C116C6;
	Thu, 22 Jan 2026 16:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769101197;
	bh=fnj5f0mzOP3nCSR0nXkS9PzcpIrYNOAhr7vqfig/jcU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D/mSaB/NDq2jreN5kdch+CxtKuutzH5sGJhcWs4Iuwgska/79RFnyt2+QmqWuOzGj
	 gXH49QCP0UiMSu415Mm11bk6ywNiJ7DvUgjyJKtD5lGm1o9dzTHIfFfIwrF81pK4Fp
	 FIOM5sjK9z0/1ApyexIZkGEuctP9XMkB7OVAKpVketT29w/lydGM6WPFTcIdN89gKa
	 ZlfLq7d9bZ3zhooCGWOhKTCjyQef0+LHL0W7mB5nfskVQyFirlFZhE7SsbhxU6Q8OU
	 9f0PgWIgO/clpgh3X13HxqSdcZ5UskxXCMbnTHq2Kg73Fo1ljatyxXFx2PkPQOKf2O
	 Z9C0nbg45tr9Q==
From: Will Deacon <will@kernel.org>
To: bibek.patro@oss.qualcomm.com
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	charan.kalla@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	konrad.dybcio@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robin.clark@oss.qualcomm.com,
	robin.murphy@arm.com
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Restore ACTLR settings for MDSS on sa8775p
Date: Thu, 22 Jan 2026 16:59:40 +0000
Message-ID: <176909187807.2987598.8685170214732571189.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120151105.614792-1-bibek.patro@oss.qualcomm.com>
References: <20260120151105.614792-1-bibek.patro@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90239-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm64.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 209C36B57C
X-Rspamd-Action: no action

On Tue, 20 Jan 2026 20:41:05 +0530, bibek.patro@oss.qualcomm.com wrote:
> The ACTLR configuration for the sa8775p MDSS client was inadvertently
> dropped while reworking the commit f91879fdf70b ("iommu/arm-smmu-qcom:
> Add actlr settings for mdss on Qualcomm platforms"). Without this
> entry, the sa8775p MDSS block does not receive the intended default
> ACTLR configuration.
> 
> Restore the missing compatible entry so that the platform receives the
> expected behavior.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: Restore ACTLR settings for MDSS on sa8775p
      https://git.kernel.org/iommu/c/14e9a138dd02

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

