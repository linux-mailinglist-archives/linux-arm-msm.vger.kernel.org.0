Return-Path: <linux-arm-msm+bounces-101886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNbRM9q60mnGaAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 21:41:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E26C39F84F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 21:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD19E30078BC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 19:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F9935F171;
	Sun,  5 Apr 2026 19:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JoUYhNK2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAA435AC31;
	Sun,  5 Apr 2026 19:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775418044; cv=none; b=U+GW9a6yxAYvDNjVQgKwfE53j9ZdguwzOVfOzJT3Kwmyp/c5ZC8/jE78j7WeHc7FyyBkYaLLnH13bpWgT2POP/elTkW4qM3goVMDpB+FbON9+IAs8cogqjaXDLUhBrlfP7JpjaleWN0bmazZwOzZfJa0EbxMu4qYU+kVwNhvELg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775418044; c=relaxed/simple;
	bh=G8OHlwTmTRxK63cP/30d5ZvSGyTtM/dCdLD08SQGNd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=myCdxExndhg56zgNFZz7FU8qHtxwrOOST612DvqmXLdZ556Zulm9d8GjyIZ+0oSdvi/jRGI4Br2b4qID/h6WADbxwLhIuSY3o0t45BTWro2rFeImPQinMtwP5tKVwI1B9cp7dYwlbI+aQbb4pVKeeDay2PNYi5b9UFfrggjziaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JoUYhNK2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBEECC19424;
	Sun,  5 Apr 2026 19:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775418043;
	bh=G8OHlwTmTRxK63cP/30d5ZvSGyTtM/dCdLD08SQGNd8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JoUYhNK2rn1I9djWNCEm2ncbbVbMGSkx0CS6iUkKGHWMM2FOqei1RTfHwkST1aDx4
	 YD8rNvVpCK9quSnJYfg/G5zMWwgJ3hpEZGSr7gT2BIIwJ0XuAIvP+tqZNsa52Wf6BS
	 O6gXbTrW9AeFMIcV/bGGwlodb+eHhUn0N1V0w2k4KU4gtlDd1CCUFGWB8kTgBSizNE
	 6UuDwcNVgW5PbEk7JogQSNWAUg5z4P36ywzp6tWW113LvTSu1W9+6bzEYMFsx2sN2Q
	 hOL24jvU8AJHmYX36O9bv5XMNaBjRSpJFZzUFScPSvGgqbyh6vrZHdGedsjNkcy/rg
	 fseOGL04fij+w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	Paul Sajna <sajattack@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Amir Dahan <system64fumo@tuta.io>,
	Christopher Brown <crispybrown@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v7 00/15] arm64: dts: qcom: sdm845-lg: Improve hardware support in devicetree
Date: Sun,  5 Apr 2026 14:40:23 -0500
Message-ID: <177541802142.2061229.9094394728986735362.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
References: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101886-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,oss.qualcomm.com,ucw.cz];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7E26C39F84F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 31 Mar 2026 20:15:05 -0700, Paul Sajna wrote:
> Rollup of improved hardware support via devicetree for LG G7 ThinQ
> (judyln) from sdm845-mainline kernel fork
> 
> Notably, this patch-series enables full DRM acceleration and wifi,
> among other small improvements in individual commits
> 
> after this patch-series the main things that remain to be worked
> on include touchscreen, audio, and modem.
> 
> [...]

Applied, thanks!

[01/15] arm64: dts: qcom: sdm845-lg-common: Sort nodes and properties
        commit: 6a9e8df732014c1c758bd3cd6254b5b4cb273c7f
[02/15] arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes, change path
        commit: b9afe8581c0e14b7b56e2314dc7f9597bf23ef67
[03/15] arm64: dts: qcom: sdm845-lg-judyp: Define firmware paths for judyp
        commit: 8f4c53ae286bd6a113245ad53ce957e623374cf0
[04/15] arm64: dts: qcom: sdm845-lg-common: Enable venus
        commit: e9f611de7ab51540c0cf246df6b7d4d99f4cec64
[05/15] arm64: dts: qcom: sdm845-lg-common: Enable qups and their dma controllers
        commit: 4ec3045c969a326c458c53ca65bde5749e575d52
[06/15] arm64: dts: qcom: sdm845-lg: Add uarts and Bluetooth
        commit: e746ed5af3084e9534135679c55e69eced0c657f
[07/15] arm64: dts: qcom: sdm845-lg-judyln: Add battery and charger
        commit: 995c258982429db93db103fc26fcb3a0acd6a5ee
[08/15] arm64: dts: qcom: sdm845-lg-common: Add LEDs
        commit: b49722c8a18cdd11f49357f3b8be23549f76a506
[09/15] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
        commit: 2e7cdd400b6a4e67c27fc3e839342824b51d01ff
[10/15] arm64: dts: qcom: sdm845-lg-judyln: Add display panel
        commit: c6c66aa3ef33dc3076c6dac64003b29bd9515b58
[11/15] arm64: dts: qcom: sdm845-lg: Add wifi nodes
        commit: eb8fa32085261a07d763e9d616b3c206d0be82ff
[12/15] arm64: dts: qcom: sdm845-lg-common: Add chassis-type
        commit: a5a5ad9848980e1019ca841fe057afb83debecfa

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

