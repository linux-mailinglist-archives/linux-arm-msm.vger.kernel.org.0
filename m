Return-Path: <linux-arm-msm+bounces-109143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFSeNvZcD2oZJgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 21:28:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E665AB71A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 21:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C82E0301FAA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 19:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125B8407CDD;
	Thu, 21 May 2026 19:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OScVrC/l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA202727F3;
	Thu, 21 May 2026 19:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779391716; cv=none; b=CKkoi1dyR0yV91scsjOtD/7sQ3US4EJGGvY7AWwlsAB0smKFBC7UGo8MGWzxdHIDdRdSSUUz7XgqPxddzlbBG3f1X5iFc8uXHnlIBBBkJiprBVDeYLECcMFe/qty6Ti7OimEwFepyAH8YMw/bID+LRvBJhVJRXUwqtQFNJrvrdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779391716; c=relaxed/simple;
	bh=eXOdibe27FMjyv0tLE5dqY3ki+x2X3uDtmg6gwReUQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s97Tp8vwgb9lhbymJeWYDHWWpGxBlVMiYvNIeVXMJvkZjf7HWBpJaCVyi6eR3An978cqBU2kiR/Yx0Y73AQ1pICBBHrZ902c5JFvvNC/3C1ZlmWoBaiCiJeCUWbjcJ+VBoi1Ey6zUCiauRKypyOuYzntqH/mPNRAi9ieTlUN9H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OScVrC/l; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BA11F00A3C;
	Thu, 21 May 2026 19:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779391715;
	bh=dDdprqY5xXBb6tElxZYg6fJzslPtKQtTwCaHKVnxaAE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OScVrC/lG5m5H83Ff6PemtX5kJI+H/EsiD/fcb0cIk6IakDSgX9izGeyWFjyY15L6
	 ZW5Ps2CF3wfqyOL7+q2JkmxYMwYMUc3vqb5iCYnoCRM3kNhTLMNykaUqI5cK4PJ/0g
	 mR9jrK4WB5U5axRhlRwpW3tzhSFlMoiCbQrjwVdCXBD8dofBGR71zI96V7/9fAV4Wq
	 R3kKRYXk0mNSPrjYBRmhsyDhDcFY+TvaaPrGa57qVZCkEMQiG3xBOegU7/E0QrS0xe
	 ozsLFZUOIA/GaOXT3PCPh037s85o03RINzoU9rOvAE87GyusZuO8NECajbEbkbEEKB
	 twwkWKDvP0+pw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: socinfo: Add PMIV0102 & PMIV0104 PMICs
Date: Thu, 21 May 2026 14:28:25 -0500
Message-ID: <177939170555.182385.3217866712137349963.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-add-pmic-ids-v1-1-1f40b8773ef8@pm.me>
References: <20260413-add-pmic-ids-v1-1-1f40b8773ef8@pm.me>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109143-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 63E665AB71A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 13 Apr 2026 09:37:09 +0000, Alexander Koskovich wrote:
> Add the PMIV0102 and PMIV0104 to the pmic_models array.
> 
> 

Applied, thanks!

[1/1] soc: qcom: socinfo: Add PMIV0102 & PMIV0104 PMICs
      commit: b3990b52de516431df2b0751ace9349e96e512c0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

