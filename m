Return-Path: <linux-arm-msm+bounces-93807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOXZLoq1nGkNKAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:16:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6E617CCB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:16:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C404E3092474
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA58C377550;
	Mon, 23 Feb 2026 20:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+EgPFCl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FD0377549;
	Mon, 23 Feb 2026 20:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771877746; cv=none; b=aEHUDSOpnf8GggLN3J47X1V/Bg10N15uJX/2X5RZBBNPiOHsryqgUH9ttyigmMeZaF0g6qr1NPe7UC3/zNwoG4P8r0wQny4SEOjDtejAwjsNFWtamjrMhS7MVZoMAFtZfe6CCdEUUZqlP6ClxRVM/7PmYMTzsgWENV07eR44UxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771877746; c=relaxed/simple;
	bh=aQgmf1lPVfzt3M2lSCbMTGHDpUjJxa/gBGspgVG6KPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iObivWvAWiYt5pJlIvSl98X9EomtdjFWOKR0ELKFgSA0hTyhv5tGlzOg4Se5ZaDhFN67nAOO2/A9deZbGKJK+3KzsoxDok4pCk31d4T2jo8VWa433stz5ezaJpsdL7Y25i/Xzy+YaOuqnOdPHuiSWe+jFdotVhPn7R0wu+n9sK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+EgPFCl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C374C2BC87;
	Mon, 23 Feb 2026 20:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771877746;
	bh=aQgmf1lPVfzt3M2lSCbMTGHDpUjJxa/gBGspgVG6KPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O+EgPFCl2lmupC8jQCIntnBvyBG0aiUHUb8+QfzGFSFpcFFug7zU+2NFjUUkSOW7Q
	 fakj5G4tMgXZeezyfirm75M1avGwI19MFzOcSrv46qZ7id+q6/yrwJ13NsC/fJ5XIJ
	 H891hhfwVzN6BniYHLdzsteuSj8jmA20+StU5pZVi4h9vsp7nBO0Nw+x5WtxOpX04Z
	 9AL0+Ux94PLuDlY45B1mOoEoF/HoWvh6d6RdkE2HVOdQppLyLpAfi47FICkCnfxRG2
	 SLrtH6C17s58Zwd1MiYvtBIw6V3OiRJayYor867q0lKLQiOagpeax2klQp99rqxa3Q
	 RRWibG2l/OKBg==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_wcnss: Fix reserved region mapping failure
Date: Mon, 23 Feb 2026 14:15:40 -0600
Message-ID: <177187773676.170549.13155650021757907041.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128220243.3018526-1-robh@kernel.org>
References: <20260128220243.3018526-1-robh@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-93807-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5E6E617CCB9
X-Rspamd-Action: no action


On Wed, 28 Jan 2026 16:02:42 -0600, Rob Herring (Arm) wrote:
> Commit c70b9d5fdcd7 ("remoteproc: qcom: Use of_reserved_mem_region_*
> functions for "memory-region"") switched from devm_ioremap_wc() to
> devm_ioremap_resource_wc(). The difference is devm_ioremap_resource_wc()
> also requests the resource which fails. Testing of both fixed and
> dynamic reserved regions indicates that requesting the resource should
> work, so I'm not sure why it doesn't work in this case. Fix the issue by
> reverting back to devm_ioremap_wc().
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom_wcnss: Fix reserved region mapping failure
      commit: f9b888599418951b8229bbb28851ed4da50c58e9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

