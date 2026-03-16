Return-Path: <linux-arm-msm+bounces-97779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2N2nH99kt2kMQwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:03:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7FE293C01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 516B83006789
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992AC30DEC4;
	Mon, 16 Mar 2026 02:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXD8kYJD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768E630DEB2;
	Mon, 16 Mar 2026 02:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773626565; cv=none; b=d+z0TC3TiTEecdvxMpLL3tTVowFX73PqRPg0RXUYSUdWo/D7HeQ2+xt0XtJrQm20D+vZUAuG8bBEXOLni2z+b4X7QJQwoypjbuW9phIkBXNFXMB3k37Mj4QZM1gq9pBJxGhpdbml8JKMQYltS3K7TUhKh0/9RRa8AY6WNHRb1EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773626565; c=relaxed/simple;
	bh=OBJ2UipQdoQdNalDKylaIxCjOjD2bNYxo+Y0Pn2OG14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tnkkRddY3WbpwNxEvccav+fLi8Noo5L1xxJwfUHTJ7FoXmvrlxXht6acB3IZkuDmS9u8i5XDzQdVvtFCjEucRR83sAO0Vj5EO6vyNv95I6gSOaXNH9qdwpBcdk4KbXTOHLbxMwMOEFPy2KWIRiZQN6/2AxrTjkiHdbvcwupSVIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXD8kYJD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487EBC19425;
	Mon, 16 Mar 2026 02:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773626565;
	bh=OBJ2UipQdoQdNalDKylaIxCjOjD2bNYxo+Y0Pn2OG14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GXD8kYJDJp3ZUWxDIZe7brh8Y7WjIv3AfJLYceQOt6xAZrGdZd5d1QoPZN3mYpfYb
	 uU5QTtByk0Hm+cmHdm6C6A9zYo/4hS55CbzUoQXgjhtLxlPBqGHf2OOlm7/DF9M6ZW
	 gw2pmpAatPDUVJqc0aTa6MMGF/40H7Np1x39ZUE4o5pZGdwaLqDafZOvLI4/BdSHNt
	 NqjcGYzsF/NtrhFkWlLCAx64rav3vU9mfAGAUcS/GZ1fQK/dPQPznDQ1cSt19oilQt
	 DnRvtm28p8twyaDhbu7jRsoN8fWWTLNX2koPBcF9sxJ22Vy8ZdJMDNdBfQ1VO1ZyrN
	 SDhvDGSuHYtPA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] Fix slice accounting and simplify descriptor and locking logic
Date: Sun, 15 Mar 2026 21:02:29 -0500
Message-ID: <177362655073.7429.1560095184450386966.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305-external_llcc_changes1set-v1-0-6347e52e648e@oss.qualcomm.com>
References: <20260305-external_llcc_changes1set-v1-0-6347e52e648e@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97779-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2E7FE293C01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 05 Mar 2026 19:12:04 -0800, Francisco Munoz Ruiz wrote:
> This series addresses correctness issues in the LLCC slice
> activation logic and simplifies both descriptor management and
> locking within the driver.
> 
> Patch 1 fixes incorrect slice activation and deactivation
> accounting. The current bitmap-based scheme fails when multiple
> client drivers vote for the same slice or when
> llcc_slice_getd() is called multiple times. This can lead to
> mismatched activation and deactivation pairs and incorrect slice
> state.
> 
> [...]

Applied, thanks!

[1/2] soc: qcom: llcc: Add per-slice counter and common llcc slice descriptor
      commit: 45c2a55d13c698ba6a281315676934c44225b034
[2/2] soc: qcom: llcc: Use guards for mutex handling
      commit: eda32f68ce7a3d16071870c7af0803fdfae40401

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

