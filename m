Return-Path: <linux-arm-msm+bounces-108555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBJiFpKDDGrIigUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:36:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9B2581920
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D3C45318F0F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C707407CCF;
	Tue, 19 May 2026 15:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MHKx/dRc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC436407CCB;
	Tue, 19 May 2026 15:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204243; cv=none; b=u38CvPwKpS01uAVkkZJWSEBTai52j0rBDjkI1tLdaeG2qW5dtd1kLE0xlHeAd4qQwHAjfdM/XenNOLRTIhMo/qtYWmCzT8cDGFCjBGQO2e0tKW+/K5MBY0PeqcRc26QLW0metZqqvRukCTdbtXtGyFXX1ARYgNzu5mYJkWbA2I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204243; c=relaxed/simple;
	bh=ef0V2qYtMoTZ4ao0OA/ZUH8o36Z4suzNSkCZvD+JjiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=htagEBPJprLMNlzXcMuyCzhXJB5ld0JYNomtXjXjK9VSiVBMdig17nld9zkeUYhSR1OT/hsbuehUx/k27gssgSzhy9nTvJcDHRyWCx3fyRwaPiK+P4s9uqN54Ln589FNdVH5S6IyKhDTu3t99E/8CK1RsOr0g+oThYhoWrbdlYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MHKx/dRc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67300C2BCB3;
	Tue, 19 May 2026 15:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204243;
	bh=ef0V2qYtMoTZ4ao0OA/ZUH8o36Z4suzNSkCZvD+JjiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MHKx/dRcVU1ErmNRFu+mNLcqMBYsntNVurMdQbJapJq3gfUpXv1UQ0Lq2JYpxqY24
	 kPx2PcjzhB5NYuxX7p5dsx+CTYxLnQ3koGMFOiFtNLNeY7IkJU8URxsDVkhk8Rlc3g
	 U6kN2PBa3jeCW2QnA0aVCdsSd1f8sWZK/WqkY6j+/fphWVM2POwxdFHbGjbqE/PoGV
	 X4KduLkmIfTkhz3JfJh3e67kdmzExX5oPkuKIr8wJQt3sfshBbcUKQFSZyc8g77ulz
	 Xl7I6mZK6S9kikz7jWOqyNj5wK3DoNZ2l00gW305woJjWDpRVKWnZCOk3hsR26Kqv9
	 2Vb2jstowzFdQ==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	=Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] perf: qcom: Unify user-visible "Qualcomm" name
Date: Tue, 19 May 2026 16:23:02 +0100
Message-ID: <177918680676.737622.2620851169920682514.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427070056.18140-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260427070056.18140-2-krzysztof.kozlowski@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108555-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm64.dev:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BE9B2581920
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 27 Apr 2026 09:00:57 +0200, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] perf: qcom: Unify user-visible "Qualcomm" name
      https://git.kernel.org/will/c/3ef020a3c9eb

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

