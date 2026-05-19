Return-Path: <linux-arm-msm+bounces-108553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WImmBEOCDGqpigUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:31:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 040CC5817EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A8BE30700AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A863EA979;
	Tue, 19 May 2026 15:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0ZaDTEP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04963EA972;
	Tue, 19 May 2026 15:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204212; cv=none; b=WOSHviFyv7+8fN5h7dYFKnO34uw4HPKbxi4/8vbuG8OHxgrRJbX/JugwQA0BSHXEm7NQyRhqeL1l4QHfTI53OSsWslO+yBzFFsDQ8liaXv45g8KmIRh6OBP/Y1nYVarj7VcVdrZA2Qc+L09UyCCCdCtpHtpn3hMOSE1rZzFtEY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204212; c=relaxed/simple;
	bh=aMA6CgWGVgRaYAjNVWdhULx2b3EFtXV+By0rfZRxQNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dvOqLwi+LPOPAAWnhANJruHkIX8t+jWnfLLKN/0ne1s3ENdfZbJ+Cb+n00HwDxKVFJZHt0MLRH0qYz7bCmF51TWuHlfPkSdsNBMYt3imAphyyDeUOFu1xC2055SKW43lOHEElEOrizfG745c6MhdN18cngz/KoV4D7kReZTp75k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0ZaDTEP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548A0C2BCB3;
	Tue, 19 May 2026 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204212;
	bh=aMA6CgWGVgRaYAjNVWdhULx2b3EFtXV+By0rfZRxQNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R0ZaDTEPbJxRfn5XodR1rT73cXUjtKTkvkRrFMHXis/rhfUs0WjRZq2dDZuxkY/rV
	 ozAWtcwRBeVBHlElOosG77B801f8oE/LqFAPM9NZGFg/VLPUH8hCDE7S7vmBVpVBbL
	 bhCHzXrbtnk6NQRe+NIWxniNnH+/TjwTasQLNsqHrQG0ShXjVmEsPmdX/F60jfKpUf
	 iin7gCwNFll2HpYcNIn4ZKjNtftAEj7Lpg+F10Z8FiKalH0HEGCFhdT5bPjOzj/Bse
	 5ujp7zEF9QHX1a5RiUFrlsLizKutHNtETs2MY6KbayVuKYMThItsuOFQZLPoMyhDXF
	 cwJ2yPN58IQGQ==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH v3] iommu: arm-smmu-qcom: Ensure smmu is powered up in set_ttbr0_cfg
Date: Tue, 19 May 2026 16:22:52 +0100
Message-ID: <177919116291.814652.1720687887970998122.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260507-qcom_smmu_pmfix-v3-1-af8cd05831a2@gmail.com>
References: <20260507-qcom_smmu_pmfix-v3-1-af8cd05831a2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108553-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,arm.com,8bytes.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,arm64.dev:url]
X-Rspamd-Queue-Id: 040CC5817EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 07 May 2026 17:43:15 +0200, Anna Maniscalco wrote:
> arm_smmu_write_context_bank() assumes it is being called with RPM
> active, but it turns out that is not guaranteed in the path from
> qcom_adreno_smmu_set_ttbr0_cfg(), so it's possible for the register
> writes to get lost when configuring the context bank while the GPU is
> idle, leading to page faults later.
> Add the RPM calls here to make sure the SMMU is active before we touch
> it.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu: arm-smmu-qcom: Ensure smmu is powered up in set_ttbr0_cfg
      https://git.kernel.org/iommu/c/8a0aab012b52

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

