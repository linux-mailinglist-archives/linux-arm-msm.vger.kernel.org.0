Return-Path: <linux-arm-msm+bounces-100844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKQhCoygymmg+QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:10:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B66AD35E774
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3F9123031193
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F7F38F62B;
	Mon, 30 Mar 2026 16:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R685i2WB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8664738F25A;
	Mon, 30 Mar 2026 16:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886526; cv=none; b=tumnqhGclF4rdKoNwt+/l+Xypt9S9ZzJhluAfeGg0PSi+i5J/ZIEbnu2aJM2luRNxuM4ON1bD4wpWup4Ft8Cs7U8zGiyvjuLoDyHQKmQsa49p4p27q+u1UxKLriL8RmGMFq5MgzMNWZXKoFOMfm2Q9b4JvfxY6nEO/cOWVaq5wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886526; c=relaxed/simple;
	bh=EDQNz8XHJ2yR3klK36ygKjpB4IBnvc6XPcy+8RDrKb0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kc+1hIJ5eHOm7XgAXO08fD7NiMu5vI8haWmOx8erEFauPKPJEacWEp67vzAlycA94upKtL7/dm+k9Rl7J9qSC9OdCPx4MhuAcb3j4ItVjKNr11DHuJntY/m7fkqIFT+VYgXrskHMgwtLf1iJyxwz8miUQ41pD3NDxycVXwXzQA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R685i2WB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FEF3C2BCC4;
	Mon, 30 Mar 2026 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886526;
	bh=EDQNz8XHJ2yR3klK36ygKjpB4IBnvc6XPcy+8RDrKb0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=R685i2WBwAcbJoRjiPWp8UcbS9IE5GTi8uVSq3V7U6l6DEU9lxBOIJvozg0qqZoM5
	 P5TQBxVn+1Y0fxLCMjpOnGeLf3AkuPGjASS7yQnU1LqSFYwBcnSikbjjrtiwdZS8CJ
	 zmmfa1+WvMWWaqJev0df+fm/pJt6AnkiUNTvcQvvCXk7wZ/SeZ0PyXMh+JZLFq5f27
	 cd6lzzISIFz+ex1LIpvcu+gxdvLFj5XKqggd0421zy7oTTtYd0fH5Nl1YuqA+n6bf0
	 4e2KZ/lBmUxatPF+QV7RZAK83o2Nc2prPAi7xkZ+Edi3kDxdXo7F2Sjx37vCpH30BC
	 ROKe0OghESytg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: Re: (subset) [PATCH 0/3] SDM670 cache controller support
Date: Mon, 30 Mar 2026 11:01:25 -0500
Message-ID: <177488647777.633011.2759239243705909343.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210021957.13357-1-mailingradian@gmail.com>
References: <20260210021957.13357-1-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100844-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,huawei.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B66AD35E774
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 09 Feb 2026 21:19:54 -0500, Richard Acayan wrote:
> This adds support for the Low-Level Cache Controller (LLCC) on SDM670.
> 
> Richard Acayan (3):
>   dt-bindings: cache: qcom,llcc: Add SDM670 compatible
>   soc: qcom: llcc: Add configuration data for SDM670
>   arm64: dts: qcom: sdm670: add llcc
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: sdm670: add llcc
      commit: 3aa997129993135ff1e11128e216af814e72f0a0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

