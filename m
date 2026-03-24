Return-Path: <linux-arm-msm+bounces-99552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gN7lBoAKwmmOZAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:52:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF56301DE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AFB730D5C39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98EA33A380A;
	Tue, 24 Mar 2026 03:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9TgPtuh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745263A3805;
	Tue, 24 Mar 2026 03:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774324244; cv=none; b=RMvrKYZWEhLv6iY83M6tADbibyKAL5TyKFsCg9XQlyxeu+SNUvYV7nu70J1BY5J+R0b0RzmT87Ry5o0Uq7/U+nFcN00QrfTXa137JtmavJQsaTxRkB7/bzcBmzEFKeKWLeyhtwwJsA++eR2iIYGkgzl+JjuNE8+2DP1hee2Y7oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774324244; c=relaxed/simple;
	bh=oKQlsNiNiTu2dAc/Q9+DlBryFpUDTANz43yCvxxdPu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e/Mwf22dz59EtrmnUwLg9nTiZu5O44ZwHVCoE5hoXVFT3WkdPAYW3neto5w+EolYcs7MY7uVqv7GJqvFXa/X32ibkHDpiSRMHDVQzj9bJkKqAuM0x+qTax2Cr4Okb1qRsx/8fWo6JGTr0ZlhO/Mkn3GB5tJhGISfc1nzzeWHkS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9TgPtuh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E7E3C2BC87;
	Tue, 24 Mar 2026 03:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774324244;
	bh=oKQlsNiNiTu2dAc/Q9+DlBryFpUDTANz43yCvxxdPu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l9TgPtuhrvEtUbDvu2tHl1mEZIyd6EaZS3NtnBUKHFGI5cf+qSQuQ8GG5vJ5Q7YOC
	 fN85LpxifZOXodxfLc2F9/XhDx+/cdmjtkBlZSf/EEd5BqbrlfJG+VELgo+TEGfFrt
	 gWwjY0XhvAE3OlTI5fCNFl25G4Edagh2I7Xek/zIMlC0jb4hRpGY+8JseO9ghAyqKY
	 WaNoGhXsUjG1q49/3x2jwxlOnYGJ25vGO7FpCGtEepbRyDTbYSpXraKGDScbOci2yK
	 eOJzn84UfEml0S+mtVz7+yEaYa20jnPvQHjCj97u2QjspTBnbh12rG8Zwze0pKvWf5
	 AIj44uWu6h8XQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH RESEND 0/5] arm64: dts: qcom: Drop redundant non-controllable supplies
Date: Mon, 23 Mar 2026 22:50:36 -0500
Message-ID: <177432423482.37653.16692425551171904687.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-qcom-dts-supplies-v1-0-5071a7052ea9@oss.qualcomm.com>
References: <20260310-qcom-dts-supplies-v1-0-5071a7052ea9@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-99552-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: 7BF56301DE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 10 Mar 2026 14:08:43 +0100, Krzysztof Kozlowski wrote:
> Resending with tags
> - Link to v1: https://patch.msgid.link/20260223-qcom-dts-supplies-v1-0-f90ac885b3fd@oss.qualcomm.com
> 
> Drop completely redundant non-controllable chain of "regulator-fixed"
> supplies, which serve no purpose except growing DTS and kernel boot
> time.  They represent no added value and because of being completely
> transparent for any users of DTS (except the bloat), they should not be
> represented in DTS, just like we do not represent every transistor
> there.
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: lemans-ride: Drop redundant non-controllable supplies
      commit: bb33ae85df0111f5b23e7aa8421ebff4b1edd275
[2/5] arm64: dts: qcom: qcs615-ride: Drop redundant non-controllable supplies
      commit: f7cc051591a64e38128708c3c6a10a261f001359
[3/5] arm64: dts: qcom: qrb2210-rb1: Drop redundant non-controllable supplies
      commit: 86d3b33679931b8064beced2fcf3fcb9a59b6ba6
[4/5] arm64: dts: qcom: qrb4210-rb2: Drop redundant non-controllable supplies
      commit: 466b6ebf9499dadfe37fe7f6c46ee72830f41276
[5/5] arm64: dts: qcom: qrb5165-rb5: Drop redundant non-controllable supplies
      commit: 7e1d38e637ac693bb117c1503259fb352ecd295f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

