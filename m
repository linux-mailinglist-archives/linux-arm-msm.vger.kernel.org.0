Return-Path: <linux-arm-msm+bounces-100842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FFiB96hymmx+gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:16:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2222535E960
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 33E52301D4AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22EB38C41A;
	Mon, 30 Mar 2026 16:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tc60gduN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E03838C405;
	Mon, 30 Mar 2026 16:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886524; cv=none; b=dB9n+b0o7KZQ31rSoNtO4NxCiWF/KCOKk1tBH5326wY7JxVyCawLdcFp9CJ4I7RYz/menRaidwx1J3BBLYVRHZakyoO1iTpwpFRWfL8cstMyu7lW8v6zQ8h3wFD1FYJR5u/2Tz/xxKYtfHkv/CZ2iqlsfS8JdG85cvO2KU7mEV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886524; c=relaxed/simple;
	bh=KWI5mXlfyYk0noy8RLgcmeEBzXZ3IDQg9QTiPYEqbmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d8Qk+oVNAu7ygP0bWsCIijadGo/tiA9rqUvAOiWFLS9+2NA2apa18PVIiCGAlLL3cQCoaYZFp+dsEFa/BCBXq1JXiU/7cm9tn8gifXtmiQKw6PVARsIP6gnyk1mZhIk2RCAbka8itv5yb1KObpoGnD4/V75V0E7DUiigri+WDls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tc60gduN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15586C4CEF7;
	Mon, 30 Mar 2026 16:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886524;
	bh=KWI5mXlfyYk0noy8RLgcmeEBzXZ3IDQg9QTiPYEqbmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tc60gduNn2iOae0PiGEeeXogO7Aebrc2H+Dzn9m/fHuw/PNgPdw1EB+erERB1ou4D
	 ZRDVLHe5Gd47vH3KgzcEn6eGqjwUbxcWZg82QWt8N8zyvlSN6ksC1wTcFEqwbA1BNn
	 4RjaORFwVCLd3Iwpbn8VnsdKIHJNJx4k/tj2bK8X3SjHRpB+qy42HYbsIFZeUziaib
	 6AlQagKNVNb57XLtYI5tVwI7KlkDlPBv2tzq7U9ph7u7P90e3HZsp0w81wg1MnjuU4
	 NgPTrV7J5EAMxFi7HvZl80zL4KtpBww/zdOe4MFJbmsGoxLIylRLQorrn2xn2Dbhwc
	 wGItXiHC6m+Iw==
From: Bjorn Andersson <andersson@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/3] Add CCI support for Milos, enable on Fairphone (Gen. 6)
Date: Mon, 30 Mar 2026 11:01:23 -0500
Message-ID: <177488647774.633011.12866863736782433840.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320-milos-cci-v2-0-1947fc83f756@fairphone.com>
References: <20260320-milos-cci-v2-0-1947fc83f756@fairphone.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100842-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2222535E960
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 20 Mar 2026 09:09:48 +0100, Luca Weiss wrote:
> Add the compatible strings for the CCI busses on Milos, and the EEPROMs
> found on the Fairphone (Gen. 6) camera modules, and add them to the
> milos dtsi and device dts.
> 
> This series soft-depends on https://lore.kernel.org/linux-arm-msm/20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com/T/
> 
> The patches can be applied without the dependency, but the final dts
> patches should probably only land once the other series has been fully
> applied, otherwise the CCI busses cannot actually be used (unless some
> other component turns on the mmss_noc) and you get a kernel warning like
> the following:
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: milos: Add CCI busses
      commit: e9e75b3e622bccefe3ccc7e167e36f58369a388d
[3/3] arm64: dts: qcom: milos-fairphone-fp6: Add camera EEPROMs on CCI busses
      commit: 924d734960062b0665d551c82489ad2cb4d96e80

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

