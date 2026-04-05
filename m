Return-Path: <linux-arm-msm+bounces-101884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPLRAHm70mnGaAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 21:43:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F75A39F912
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 21:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6888303D303
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 19:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5E2355F2B;
	Sun,  5 Apr 2026 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPHSsnea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBD235CB81;
	Sun,  5 Apr 2026 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775418041; cv=none; b=T11tc8nR4tmKLfgEi7Awt2kZ+7e6J1DOC0ZN8ZTJ/JkdXxVHU38W7SFopXJNUT4oCNwuVSTCk+CUktUeZMcNmBIVBiXoDanKiht1YmqSM6/SxAZ8pgiETwv7Vq4DgowPn2mZjO0vylWXhbdno8PHyk7Njm8loRPjELmyWBqhS6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775418041; c=relaxed/simple;
	bh=m5rUz6ZUc1i8+nH8NJT6TeUYggDWUNgLqrZ21fTffSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PHw9zmch3DAyt61yiZFxxF2D5Z6vhwXU5IB0lrkeTtFQUrA+rMnC1LvACwkGYnxm39SnrxJ54kQKOzT4p4poXbiuAgPjWcb1NWxsEfrWawCgboSHabtZWFv7FHHE69I7n16Nt24sqrk5swIw8LIsmrtowIBNWQqcqMa0W22LpiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPHSsnea; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA287C19424;
	Sun,  5 Apr 2026 19:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775418041;
	bh=m5rUz6ZUc1i8+nH8NJT6TeUYggDWUNgLqrZ21fTffSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KPHSsneab+5MPAKVS9sZ5vHAEvUOwnkilsyr9gj1T2R5LqJP9oLgy3gLJbvmUffwX
	 PrMrYi8ypotg+6vPrrZgYBMzv5k5pbjFqXe1K2GWuH2MveuMinSG3SUOxX5w6Z17nE
	 dIWV8taWgLsnvTr3yUKKbrxMNoi/ZcLPpEHqvsSg2JM436Nfs/kOYWLur/b1I8txL1
	 yMOMYRfsmF6QyTgy+s3Pq1mNfmI/Ig/In2ZxSiMlkHYLyorTuL4BH1yWv1Pe3PmZnD
	 eEgFGFi3vOTkeqjor693seFJdETtJxIgoX7DAiYrL0OnEiVnpzmEFX/XUh0EqPa3u6
	 3q/f/48Sl6D0Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/3] arm64: dts: qcom: Add EL2 overlay support
Date: Sun,  5 Apr 2026 14:40:21 -0500
Message-ID: <177541802145.2061229.16531214571003388687.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260127-talos-el2-overlay-v2-0-b6a2266532c4@oss.qualcomm.com>
References: <20260127-talos-el2-overlay-v2-0-b6a2266532c4@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101884-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4F75A39F912
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 27 Jan 2026 17:13:47 +0530, Mukesh Ojha wrote:
> We have recently added initial EL2 overlay support for Lemans and there
> it was not disabling zap-shader as GPU changes were not available. Lets
> disables the zap-shader there. And in the similar lines add support for
> Monaco and Talos SoC variants as well which support EL2 configuration.
> 
> Talos GPU changes are not merged so its overlay file has dependency
> on https://lore.kernel.org/lkml/20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com/#t
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: talos: Add EL2 overlay
      commit: 1bb533d644a2c56a3314351721445ea43fac9ff1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

