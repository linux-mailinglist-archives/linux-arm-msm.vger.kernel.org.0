Return-Path: <linux-arm-msm+bounces-89939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGdvHOg7cGmgXAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 03:37:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6124FDF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 03:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EA429BC3183
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 02:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19701345CD7;
	Wed, 21 Jan 2026 02:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JR/KZFnX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43C03446B8;
	Wed, 21 Jan 2026 02:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768962963; cv=none; b=A7LSkn0hr8P0EFmppw5QpCqhARuh1gDaM3eE2vd2ub5V2k/gPwejqPN4+5Qfp3tpMC8RdVmQt/jEa03PZiR8AxrphiSfQsblJtoTKMZJntRAEYids6vDfFihv06xkg9nuLxI4lp/BwDvxZeI7g/O3frB+Zo8VB4c7CEoo9SmA0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768962963; c=relaxed/simple;
	bh=3zQhsHLIo5np8zt0ro/rTW3M8XDw5h7doK5654mOiXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pj/mHPCO7IcVTLJaZ4ZWCADBDKZX6BrDckCi3aL1agsKRUswp+GsxQrvyH03vz8PMIn3hhLiHwq3HUEKgwZ3tpukZZx7aj30K8N87GKKzusZVKcUkOsGvkQrnv8yziStvzibGYsUNdv6a52+qSQaqw0aCMHqtuITAxFRgDU0MrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JR/KZFnX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1295CC19423;
	Wed, 21 Jan 2026 02:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768962961;
	bh=3zQhsHLIo5np8zt0ro/rTW3M8XDw5h7doK5654mOiXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JR/KZFnXD+9EVrj7Y/IITLIbomNu8jwg+L+NKxiqNL5EWgGjgYWDZEAVV8HpLSnFE
	 cUpx4mW5ZW2ErhiYuvT5X2OoYZEmeP+HkJkPKg8E9Sldxbf6oF+scFuZNRr1BjemR8
	 uRqtiNtDgTpLLluZwaR163o9Ax+GzOV+Wus6nYidg3t2cMOG8FU59Ua61SJPi4MgyS
	 Hs/lA6/7HEmPGdg06uZTIm6EumBcvTJriMOz7JTzcXJy3Cem0j2WOEI/Ta+grAb29S
	 l6WVwE32HqE3xMCvyMXA8usAib1v4xrB/pqZusAaMqxDclRjbFlpIfDvT0X00D+thh
	 aZXId0A2DSyIQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gfx3d: add parent to parent request map
Date: Tue, 20 Jan 2026 20:35:51 -0600
Message-ID: <176896294115.1060469.4317223338583120172.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117-db820-fix-gfx3d-v1-1-0f8894d71d63@oss.qualcomm.com>
References: <20260117-db820-fix-gfx3d-v1-1-0f8894d71d63@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-89939-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 0D6124FDF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 17 Jan 2026 05:54:47 +0200, Dmitry Baryshkov wrote:
> After commit d228ece36345 ("clk: divider: remove round_rate() in favor
> of determine_rate()") determining GFX3D clock rate crashes, because the
> passed parent map doesn't provide the expected best_parent_hw clock
> (with the roundd_rate path before the offending commit the
> best_parent_hw was ignored).
> 
> Set the field in parent_req in addition to setting it in the req,
> fixing the crash.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gfx3d: add parent to parent request map
      commit: 2583cb925ca1ce450aa5d74a05a67448db970193

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

