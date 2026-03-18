Return-Path: <linux-arm-msm+bounces-98478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCwAA16vumlXagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:57:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6B62BC768
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C394531DCA5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25DA3DC4A6;
	Wed, 18 Mar 2026 13:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCs5Z/fM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE29A3DBD7C;
	Wed, 18 Mar 2026 13:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841848; cv=none; b=QsJbTq2+JzvXWef6HZNrYJKaO8FRDXAU051yLQjHsL1SwoSkTqvIXxB2G3rLJoRfBVQM6KWP+Sm1pLPDH0QLhYAppkAVhzfdjg+quRgCfhfp0579obrtH0p5PusDN2EeyIVek9tosG+YT2slmdgN9Bs5zaU3ZMlsPXfUw8K3wWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841848; c=relaxed/simple;
	bh=e4wl1ZI6Jna3vBjeF3P/12L7or+GkCv+KAoMkgBbB4k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ACcFlELJXj94TJlWx33dAP2t/j37dn/FZ69/RCcrvrJKi9Wd5wS6fB5GYNutPaGxYDDJGRGXiz1dsrQxza+tD2RC2SyKcPnkzIy/rOp8msHfI/pk4Qguv4v63+jwK4BMvN/4IEW5jt1rsOkjTlnw5fV/ecRQTGmsGIsgsBw4GJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCs5Z/fM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616FFC19421;
	Wed, 18 Mar 2026 13:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841848;
	bh=e4wl1ZI6Jna3vBjeF3P/12L7or+GkCv+KAoMkgBbB4k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CCs5Z/fMgVK1+r2qDHqqoGt2/bJxRMKyvNbMq7nj41vjRd2IWZpxLvAUBWzvvBE+J
	 vaEufZ7wZYJDWs95HLEM208Mr+bWTo+DcP5/OL5M7Io0j2ZnFKm9gR976oWzE69i+1
	 0bo8w22KlGu5HZLrWeF7Nxn+ssCugkSCkviYCDJqUJF8oPa1qTpsc/omAHskF9kow/
	 jc74LEC+sQInGaoXiz41w9GL7L2dJo2dGLZPDCPrHQFJsJBdf6d5dT7v6ecfVcysqf
	 TgcLIm+zpc/rOhqhcF7P4MZiNR6t1J7NrGlseS5qkOI1jvv8U9HMPAXklrmp+M7cwn
	 qF8wh0KeQ19wg==
From: Bjorn Andersson <andersson@kernel.org>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 1/3] firmware: qcom: uefisecapp: Simplify mutex with guard
Date: Wed, 18 Mar 2026 08:50:09 -0500
Message-ID: <177384182905.14526.16538779869751732076.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260216091525.107935-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216091525.107935-4-krzysztof.kozlowski@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-98478-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com,vger.kernel.org,lists.linux.dev,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5F6B62BC768
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 16 Feb 2026 10:15:26 +0100, Krzysztof Kozlowski wrote:
> Simplify error path unlocking mutex with the guard.
> 
> 

Applied, thanks!

[1/3] firmware: qcom: uefisecapp: Simplify mutex with guard
      commit: 055d79affa436d83a6e0d3ca6d054f11a7e3d4c1
[2/3] firmware: qcom: uefisecapp: Annotate acquiring locks for context tracking
      commit: 4bfb0ec11e20b9354beabf1b9f3e70e926c407bd
[3/3] firmware: qcom: scom: Simplify mutex with guard
      commit: d98b978446d249df1a662b4fef4c0bbfa1d650b8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

