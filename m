Return-Path: <linux-arm-msm+bounces-99545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB73GxgJwmliZAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:46:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C053D301D1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4652131228DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966FD3A1D05;
	Tue, 24 Mar 2026 03:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdNDxC6O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A6A3A3826;
	Tue, 24 Mar 2026 03:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774323740; cv=none; b=qi4qw2nCtoe3ybvTG9qKtcxbqAd3Xk67Q2e7bCBi4LuDI3fJT3bf8RJ2XTNsNMr+1nSk7ssh1YHp4Ughk2zyvSQAxt5Wy0Nulw6Gam0bh7sOvMsrYDqBC65abZjjqFM4EwU1czPUduP+KFFEFskJbejpQ1f9p9y13YiK6J/yUKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774323740; c=relaxed/simple;
	bh=IMfN7urYjBnRPfuL56heXF/BShQCNmAIo9+LQzxVbvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oVSnXO+ktfs0whhDK+iZoELZWKq0PQGUjMmzdYwlrxERqzXlACXSBbPLsyKe1V78jGxCvcCzg9ZfstmPRKOk7ApjoF2q4QssAaZEXrMZ1RVnK0XbV6cZ29Abm3a4C8qYW+5dXJAI3kBad7LoX+L+GiPkcGepi4v0q4nFiM8xvBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdNDxC6O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747ACC2BCB1;
	Tue, 24 Mar 2026 03:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774323740;
	bh=IMfN7urYjBnRPfuL56heXF/BShQCNmAIo9+LQzxVbvU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DdNDxC6O+fB4XAQQ0258UPkVYd+01VocCodVytovRNIKIQzqqwhy1aCgQWWWom0Fs
	 jOSEasZDAApYf1hyb8+4oWUPfXkUGqnRyFgTc/BnoTyk2vVPgNTJty1J74JFMF2B+v
	 1DkCm4nnlL5E4jWwEh+lAnWfpyx0qayJnrqVQp1XWALVR9F0ze6F/UcgxKikCpLBBH
	 MNVhucnYzex6qG0FyhcK50vwkrg8480lIv+d5MO7OWvhV4Hn8/XskR3qyhRqM5fOi8
	 /foX2cvuJmxHOCKBgTVfMY5HPpZQMItWdLoS6tEXZXmYE0P8g7B4mUou0Kmn+YOkOf
	 8TPujueJwkYfA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: varadarajan.narayanan@oss.qualcomm.com
Subject: Re: [PATCH v6 0/4] Add QPIC SPI NAND support for IPQ5424 and IPQ5332 platforms
Date: Mon, 23 Mar 2026 22:42:05 -0500
Message-ID: <177432372695.35532.12923764669090329260.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306113940.1654304-1-quic_mdalam@quicinc.com>
References: <20260306113940.1654304-1-quic_mdalam@quicinc.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99545-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C053D301D1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 06 Mar 2026 17:09:36 +0530, Md Sadre Alam wrote:
> From: Md Sadre Alam <mdalam@qti.qualcomm.com>
> 
> v6:
>  * Squash the eMMC removal changes into the SPI‑NAND enablement patch
>  * v5: https://lore.kernel.org/linux-arm-msm/20260223100552.1050303-1-quic_mdalam@quicinc.com/
> 
> v5:
>  * Split DT changes and driver changes into separate series
>  * v4: https://lore.kernel.org/linux-arm-msm/20260206100202.413834-1-quic_mdalam@quicinc.com/
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: ipq5424: Add QPIC SPI NAND controller support
      commit: 3afb6fc2e4c764b4dc018348550924dd7f3b85c9
[2/4] arm64: dts: qcom: ipq5332: Add QPIC SPI NAND controller support
      commit: 98a660f29e482d19eb3acb815d6172ea3cda3137
[3/4] arm64: dts: qcom: ipq5424-rdp466: Enable QPIC SPI NAND support
      commit: a139a3e712b4cc7fd731cf3e97499dd399184a14
[4/4] arm64: dts: qcom: pq5332-rdp-common: Enable QPIC SPI NAND support
      commit: 315f92dc11f568be833a54a2f89cc010b2cf6a40

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

