Return-Path: <linux-arm-msm+bounces-111926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +lKyOvvpJmornAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 18:12:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AC36588DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 18:12:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Yq/DqXFE";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111926-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111926-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 81D233092BD4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 15:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08033E123E;
	Mon,  8 Jun 2026 15:10:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15973E0C73;
	Mon,  8 Jun 2026 15:10:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931405; cv=none; b=ad9US6romTAhb3gy4sgSOUSmg0ihQQ/ha+/dFXlqr5fmY5i4k6Da92b7nt72Q4YZR5gg6asd+vI3B71uPqyzZH+BE+zn/wGYSsg9GdlmMB4xPJKGmTYO+0qTEDLF1kClvbWHDvhMUwU935eFwVXDVooGMRV+/cSTgWBi43911UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931405; c=relaxed/simple;
	bh=lKhMFaF7SoHcR9+d2yQvVGTv039v5i90jFkig/r6o68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eksVoqlrBek+l3uxU0gFBMPW6cLEx0ze7Qrqbj0q+aggLcH4FB549Zmjeku4vX3Lo4VZ4/7sD3seTkK4OA8UQvIFfz5Jn0E5ERrit1fshud8U9TAjzKFX7neNBVwMHZI52m7B5HuSd+ta0RQaditZwkQdlU4SjmeMwfGoPVZc3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yq/DqXFE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566311F0089B;
	Mon,  8 Jun 2026 15:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931404;
	bh=rhqJfRINulrdxXTK9fYh9Ep1Zir4DVzNWwSqx6ltEPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Yq/DqXFETxHtbhPivSk2QBS3kIzH2eS5w++cHgSFCVQsqexBvX5kTuxW/aG4OYnQO
	 vykiyIn7KrFfpII6FWAz27qAJWEBy78m12WvKEWYzg39zXosJuxW8O6eC8Zx1bbEGk
	 ymZj84bc5MIicqZ1G5PUsP7xzSTyreQfTaiBd3QfQhOt1j7xu/sBpCZADllGbiy4ZI
	 NAGBeLEBTwML4ozcytQI/qtQRrQqsFUjcjokwRGOGXgupthRj7ydIu53zvnPbFs8Wa
	 0NFAOwIm2OkJIJ+oXOG+nOHgdpNamxuE3Ovq1KfDBd/c+zICyCRjN3mmQaj7z9aM6S
	 R+TGrwjxqyYeQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: usb4-upstream@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: regmap-phy-mux: Rework the implementation
Date: Mon,  8 Jun 2026 10:09:55 -0500
Message-ID: <178093139446.244194.9422100472802070367.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409-topic-phy_fastclk-v1-1-6b4aaee56b90@oss.qualcomm.com>
References: <20260409-topic-phy_fastclk-v1-1-6b4aaee56b90@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111926-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:taniya.das@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:konradybcio@kernel.org,m:usb4-upstream@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 35AC36588DA


On Thu, 09 Apr 2026 13:57:45 +0200, Konrad Dybcio wrote:
> The sole reason this hw exists is to let the branch clock downstream of
> it keep running, with the PHY disengaged. This is not possible with the
> current implementation, as the enabled status is hijacked to mean
> "enabled" = "use fast/PHY source" and "disabled" = "use XO source".
> 
> This is an issue, since the mux enable state follows that of the child
> branch, making the desired "child enabled, MUX @ XO" combination
> impossible.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: regmap-phy-mux: Rework the implementation
      commit: e108373c54fbc844b7f541c6fd7ecb31772afd3c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

