Return-Path: <linux-arm-msm+bounces-107193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJWvCVKOA2pN7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:32:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 489255293A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 934793083013
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336303D1ABC;
	Tue, 12 May 2026 20:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LgDDXQZ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4053CF022;
	Tue, 12 May 2026 20:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617429; cv=none; b=E49cuIed+x3xVp8MNjRW9NXRQAo+3ivsoOAYf9R0ROfAJZikC1T/3LAe2YOnBXfsOYlLHHg/NCvsFZACi68hpz5PfEM92MujtJAaeheRwOdqdcvH4FvB3EeA6Rg1EfAsUgtA4Z8u4wEdmd/uPa90IjGxZfLwYj8Yn9ZmYbSyKm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617429; c=relaxed/simple;
	bh=0cfdKCCcPXoLmDCDkVPC+HsGiGSLOzuaJ4fLPpEdLhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GW229uddZhGGSjvS8Hgegg8A+SACRRs9QVFPj+jXaz4tkVtFmi6fuDRju0lLbZc+ZFzWXA3Ty2+5Hn/0djOlfvws05YaJ9//Zti3CaC2jv/L6SVXfPojs+PIkaO3rhM0SYfq2tw6NBjOUaWIvU4mW06+WB+ROJHoRCZ9gIOroIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LgDDXQZ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D514DC2BCF5;
	Tue, 12 May 2026 20:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617428;
	bh=0cfdKCCcPXoLmDCDkVPC+HsGiGSLOzuaJ4fLPpEdLhk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LgDDXQZ5xvYEAelgMVxOtCP+yP/Ut3UnP/JQ5IKqXhcSFIdi/are6YqxhgIi7XI54
	 AnV2OkS7s35gsfyrTG/e0BwQZckDJEg0Tcoxbu6J3gBr58dQ3bTUpsRkaSkslCc7QU
	 upvOYMKgkrQLdY4avU69+adKLc40qfnlH17LVakFUHdQbspfxYJcCTr9+mzKBASqYG
	 HY45Rt6e64yVYdvDN+vJ82UiA/IPPo6LbisB8E5EP8gFiVkCf7644g65C1oqzO7TI8
	 K67Qda3AST9Hui0Atl7B/ye+BwTkU9yCAbrSH3UfzWYkp671UdtnbjhYIkbZumZJWD
	 d7eYzn589mNMA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Le Qi <le.qi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@oss.qualcomm.com
Subject: Re: [PATCH v3 0/2] arm64: dts: qcom: QCS615 Talos EVK audio support
Date: Tue, 12 May 2026 15:23:00 -0500
Message-ID: <177861739341.1242344.11016918116428252722.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20251204083225.1190017-1-le.qi@oss.qualcomm.com>
References: <20251204083225.1190017-1-le.qi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 489255293A8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107193-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Thu, 04 Dec 2025 16:32:23 +0800, Le Qi wrote:
> This series adds initial audio support for the QCS615-based Talos EVK
> platform. It introduces the GPR (Generic Pack Router) node in the SoC
> device tree and enables a sound card node with the DA7212 codec on the
> Talos EVK board.
> 
> With these changes, playback through headphones and capture from the
> headset microphone have been tested and verified to work.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: talos: Add GPR node, audio services, and MI2S1 TLMM pins
      commit: d962cd7c49fa210e53dfeed04028ac9ef112ae70
[2/2] arm64: dts: qcom: talos-evk: Add sound card support with DA7212 codec
      commit: 141d7ea5036e70f670aba1e6704be74552a3c964

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

