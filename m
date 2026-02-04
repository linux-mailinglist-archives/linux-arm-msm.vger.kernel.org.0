Return-Path: <linux-arm-msm+bounces-91850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iuJKLTzEg2ncuAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 23:12:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AB6ECEFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 23:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E4ED30057BA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 22:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D52C33A6EC;
	Wed,  4 Feb 2026 22:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZj/HDAv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B5233985;
	Wed,  4 Feb 2026 22:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770243128; cv=none; b=hngBf3OVvWVuXJ0lxqT72kn6uvtBZn8AfqRz3nXvJlI0rbBAtu8PYB8EX3vMYRS2Z6Vq4CL1PwhuG+m/YQwHw7PUqb6HQl4AGXSS6mlVJ2HsWbfw0ssH83I7Tx6QoPuF067l32pCyylbtyu//+2Wg1kO36Tefy7c2VPz9oEbItA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770243128; c=relaxed/simple;
	bh=vpcR8WLMO+0F9KREUdrKC5t30Gxwf5z71iGLdTSJbbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QLZz30KGOBXTT3BXFfVd4vjeXkMk7IyGnGBmUyR12Z1UTihIGFCIWCQ3vZJJNdV+XNx02pa5u/eB24VOGXPstMfzN2ZXWD2bhIm7RuejFBBw2ihvl5vaoYvCguOwyXvbzD3ccjJEX8sHpwJGuVW9ZcYJCpRpB4PU/NI+6m/HvN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZj/HDAv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6CBEC4CEF7;
	Wed,  4 Feb 2026 22:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770243128;
	bh=vpcR8WLMO+0F9KREUdrKC5t30Gxwf5z71iGLdTSJbbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lZj/HDAvuc+mHWg4wzfIk3C/Qj9ANQDQo8FU2BDufJqy5x+LYAoAlX5qhxiWW5olw
	 DOxz2j+/DoYdzsXXK+pc5ky9xJjarwbcZvXFhIbs9O7EqNhT2nwpApMSfbdmGoCty1
	 9wdsHlc05QME3SZOCLLpbuYxNXDQgc7j9yA5UgsIM+1jgUlv8NjTDZ2PA4G3Q7KqjR
	 fRdco9SsqARdXZQ+PKPDLp9ZzMyEGEjsAawEDiOLtbvUEGJ0LOv0E6Lkx1OJGPMW8l
	 3DJHO/SxfWs+MJICNDSqviWbuDE0v9F0VTXKXwMdwGMuAUoV6uuhNijv9rsSnSOapW
	 cGOHUpuedgW/A==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com, 
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, 
 Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com, 
 quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com, 
 chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
In-Reply-To: <20260204162854.1206323-1-praveen.talari@oss.qualcomm.com>
References: <20260204162854.1206323-1-praveen.talari@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] Improve SPI target mode support and error
 handling
Message-Id: <177024312540.380254.1461688590164454858.b4-ty@kernel.org>
Date: Wed, 04 Feb 2026 22:12:05 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91850-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 12AB6ECEFA
X-Rspamd-Action: no action

On Wed, 04 Feb 2026 21:58:50 +0530, Praveen Talari wrote:
> Enhance the Qualcomm GENI SPI driver's target mode support and improve
> error handling for serial engine operations.
> 
> The current implementation has issues with incorrect controller allocation
> for target mode, missing abort sequence execution during error recovery,
> and lack of graceful abort mechanism for target operations. These problems
> can lead to serial engine undefined behavior and improper resource
> cleanup.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/4] spi: geni-qcom: Improve target mode allocation by using proper allocation functions
      commit: 50464497b5874b7c2f3ab991cec81e916d40743c
[2/4] spi: geni-qcom: Fix abort sequence execution for serial engine errors
      commit: 96e041647bb0f9d92f95df1d69cb7442d7408b79
[3/4] spi: qcom-geni: Drop unused msg parameter from timeout handlers
      commit: 9934383f98c91d8dfdf16d0e980431041c2d17ee
[4/4] spi: geni-qcom: Add target abort support
      commit: 6516169fa7f6110ce42a5958c921255f2d0968bc

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


