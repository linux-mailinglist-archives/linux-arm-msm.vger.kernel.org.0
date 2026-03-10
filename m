Return-Path: <linux-arm-msm+bounces-96457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Bi8N/GHr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:54:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 374632447DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CD1431E7226
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716753B9614;
	Tue, 10 Mar 2026 02:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUOra9Tg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB6D3B5850;
	Tue, 10 Mar 2026 02:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110902; cv=none; b=EbBj6XYaG5ADJSlQg9kZakgbCP5meimmq1BfM85WKaHitsn8ZWFCBfYpFDhwU1jeVyKh4z/HIrhn18hP1kw+oxL53/OW2/qdvwXRl+LT+JgugnROtMEg9HEQmYxQZ2lE4+o3slVmdtDSmiDVsVL0+cvoQqH6QFiGsoKwKUBeg0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110902; c=relaxed/simple;
	bh=WjXoL/uzaNlGfWjy8f+cF+Y0P4qsnn2PaTUfzvgYVY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jL/rJ0pSfgPbKbMFXK2aVvRShooXaY9FIan8auXguvqk2aIl//73lKtLoCtSd1iiS5YuvG7Hqe++lmTrSzRg9ryw+DhJ+X+TWA58wWQCwzngQJMnDGfKQ5X2nCUXHFomawO8B2QiEqvUjXycroVChxFHdQi1OZ2iCnurtKUvefQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUOra9Tg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A18C19423;
	Tue, 10 Mar 2026 02:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110901;
	bh=WjXoL/uzaNlGfWjy8f+cF+Y0P4qsnn2PaTUfzvgYVY4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SUOra9TgbbZt5CLgo7G9tGWLrkrVtfE9uLYQUgfiI8yNuSCO5vSTI2AAYuaLuizuR
	 aIDDRdyKvIhI5NqH3Iw7QgIYgrr4z0k6PMJlNXIBInBKWZ/Z14u14Wwpdepd3X8efm
	 G9VKbkU33sFf0X+I6m8nW2tcSjtSzYrUhB3+soxlBxlYxPn+KHl+aX++uEE3S9+uT3
	 nZng0i3pVaas2rG56MoU6I32ID4Ac7bZdbtiQH/7CsavmCfr7sLGtfXj+K4luYZJzi
	 X4rMj+/ROXu1T4kHKl9u/O3Rhf9/m+QcGk2NHx8gdWO7KtvCts5qV7pfW1jFMI89ze
	 lyne0yf+2//bA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	YijieYang <yijie.yang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/4] Initial patch set for PURWA-IOT-EVK
Date: Mon,  9 Mar 2026 21:45:46 -0500
Message-ID: <177311073306.23763.1875088249550729861.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com>
References: <20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 374632447DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96457-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[10.30.226.201:received,100.90.174.1:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Mon, 02 Feb 2026 15:35:44 +0800, YijieYang wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> Introduce the device tree, DT bindings, and driver updates required to enable
> the bring-up of the PURWA-IOT-EVK evaluation board. Focus is on two key
> hardware components:
> 
> PURWA-IOT-SOM — A compact System-on-Module integrating the SoC, GPIOs, and
> PMICs. Designed for modularity, it can pair with various carrier boards to
> support diverse use cases.
> 
> [...]

Applied, thanks!

[2/4] firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK
      commit: 0924a6fba19c8f4bbbe2e228a4fb5ae4bdb6d8ab

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

