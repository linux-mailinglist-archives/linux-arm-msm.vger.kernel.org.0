Return-Path: <linux-arm-msm+bounces-102850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0K2zI7i622keFwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 17:31:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF7D3E4812
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 17:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 50CB03004F0B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 15:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAEE033985;
	Sun, 12 Apr 2026 15:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="GGBtoRzi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9F2CA5A
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 15:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776007857; cv=none; b=SICFa+kI8Ld+XsHhWHcRSqDlPHTOu3t3hU7LeeOWvZn0yqcIT2f0L4/QBmzKNytHuU/Z0179kxxTM51UFqTcBV6ORXM0UP6F8t00xCkIlvNhofT1kExG30OORN/SSP5Q8VNE68x0DHFVmMYdqb3kWUMpEpx3VFQzWK7sd4qO3OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776007857; c=relaxed/simple;
	bh=fS5pY0/j5z7De+TIQ5fJJ216Ld5MOEv8jk/IQWF3TKU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lz0CpG/fJUr9xQGB5RqKWsFO6W2qP39VL+7FMTSi6Iv+pO0i09T6RsqeKxhhGYUNNerOAa2J4le4WbNHYDLEXLnhixI9PFOENqym88O5Ey8PmijnPnhJoFiAlv3dNRJnbydQ/cIUO0yTCu8PhEseACQUFWSfi1wnfNgTdHLwfSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=GGBtoRzi; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776007852; x=1776267052;
	bh=MM/26Hm35xCPc7b54FBmQmxkGjPiKHVLx5akTLsDdAk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=GGBtoRzioo+AiCNiW4/lkGIipLW32r168oK2UrM6QNveyK7CEwcg5xujzeEgz8MuE
	 XCUK2Dsd2PllEVLT6JFycfkvwEzCr1qvQnhy0IPo8G4sG4GrqgxHw7VYxl2g13yaKl
	 RgENmwMkZQe1Ku++cfw+bVgIus9zsL69fBRAEo06Vx7oBzoLEKvAfdEY5x2f9cR7J5
	 GG8n9LOBuWOn8mi4Xf1Tvb4TYyLt6JoARnbzyFTju/4oUR54pPOAEpaNRWc07It+ep
	 SVX+luFbRzd+ZE3THdjvpWM3Iua5+AWP2lK0pS4rlZMM+Z7FNnZQ9H2EdFbmBFu5cL
	 oAHn9wq+1locQ==
Date: Sun, 12 Apr 2026 15:30:48 +0000
To: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 0/2] clk: qcom: clk-rpmh: Make all VRMs optional by default
Message-ID: <20260412-clk-rpmh-vrm-opt-v1-0-37c890c420ff@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: fcf56ab00c5df48881397586bd94cf5e610520af
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-102850-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3CF7D3E4812
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series is meant to resolve an issue seen on the Nothing Phone (4a) Pro
(Eliza) where probe fails due to RPMH_RF_CLK5 not being present on this boa=
rd.

The existing clka_optional mechanism does not cover rfclka also being missi=
ng,
so just mirror the downstream approach of marking all VRMs as optional inst=
ead
of expanding the check to include rfclka.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Alexander Koskovich (2):
      Revert "clk: qcom: rpmh: make clkaN optional"
      clk: qcom: clk-rpmh: Make all VRMs optional by default

 drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)
---
base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
change-id: 20260412-clk-rpmh-vrm-opt-78b97cf451ba

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



