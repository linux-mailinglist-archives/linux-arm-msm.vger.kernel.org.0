Return-Path: <linux-arm-msm+bounces-118522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 86N1M8meUmpWRgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 21:51:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7185D742BEA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 21:51:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HU677xkP;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118522-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118522-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9715F3020D3D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB7B33DED5;
	Sat, 11 Jul 2026 19:50:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1095E33B6D3;
	Sat, 11 Jul 2026 19:50:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783799411; cv=none; b=VG7nbm6le7YVJYTDjgpZEkGay7khHjT/ZRvNvwXdHgiUDqKEIcIeezXcmDUIqiYKLL1xfLMdgolTPPDVIX7IU7PJ9qONT6PQJgM6iulEvvauta0/S/5LNd2CjdAeA3i2pYsgsSw/hXzElog2twGqlyikKtOEYiYs+bxCBSSxEqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783799411; c=relaxed/simple;
	bh=JpmCUbWyn7ZBnWxlF29dqjkzD2PMwtwhp2dC4dh7x5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q0Ai4rrMyDU9+pGaOhBYfIq2T4VkAY21vIHf8AW495ERbfBPb1SMYChhT+TJpmHzbou2hcY+9LNipLupP/RWJsXaIy1V5/vgaaELw0221llg1pS0isKMl86yOUbGhcp0Ig+PIakSh37R8b8HsfPDIt9wbklj1wV/ZyoZQvid0VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HU677xkP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7201F00ADF;
	Sat, 11 Jul 2026 19:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783799409;
	bh=OADxrFJ+t4Dx8VgY9XZpFEf7YPrxIZ1wR6HGIT2FrNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HU677xkPvltNInibF8s6G8JYgYtJocTIpDyXLUFACvIVvNkOFcQaxjFvWcD/DytJQ
	 9evA707BQqf0wpHB0gKhGYvgO9cqsKmcHK4u3Z1plDllAiNITFiHpcRrZzxDlX2JOC
	 c+WWEZxB8sz+Xbv8FLBO4e/rocl5EswesUV+KJliZkdoAJEA6N8qt62PqUgbQx1RDV
	 jxZLh5b58Ps7pQ+7Ir/MZSDqKabWdv2YGeEzs+qSPeLG+rlt9AD4ge+7igCDrpu8k2
	 av9qoCKh/ccu+lQ1BVvuSejB9iFVz/3zxO8amhk8AKMao+apTY/+08OyGEm/tqNxCC
	 P23bUYBuLJuBQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/7] clk: qcom: Add sane defaults and drop defconfig
Date: Sat, 11 Jul 2026 14:49:48 -0500
Message-ID: <178379938596.163099.9873273386152252307.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118522-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7185D742BEA


On Fri, 03 Jul 2026 12:03:58 +0200, Krzysztof Kozlowski wrote:
> Merging, Bjorn:
> ===============
> All clock changes via Qualcomm clock tree. The defconfig can wait a
> cycle or could be applied via the same branch on Qualcomm tree. In case
> of the latter, keep it on separate branch in case this needs to be
> shared with soc@ tree.
> 
> [...]

Applied, thanks!

[1/7] clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574, QCM2290 and others to ARM64
      commit: 2ce505b437e98adc3c009d22762f491cd2cb15ee
[2/7] clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
      commit: 9904402cf417140f0dbdd0b9b3b5f5fd0527a447
[3/7] clk: qcom: Make important ARM64 drivers default
      commit: 5c38f9b7df7716c2ff54418d6a0aa4328133a58e
[4/7] clk: qcom: Make important ARM32 drivers default
      commit: d643934c275d83470a195a115cd16ac13d1ebbd6
[5/7] clk: qcom: Add defaults for desired arm64 drivers
      commit: 6b150572bb76dc508b0d9fbe2c5a56a67429e376

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

