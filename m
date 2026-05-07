Return-Path: <linux-arm-msm+bounces-106529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJBwM2b6/GmxVwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:47:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 395B54EEEB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 648B03064575
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 20:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD4F4A13BF;
	Thu,  7 May 2026 20:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFu+tLij"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC0533F8B7;
	Thu,  7 May 2026 20:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186109; cv=none; b=SyxkqRyv0vDHD0xkzoSt5b5SoceOqm1GHPLfgeIeYfcj+J6UHg9JYYtZW0kCYwLMxGp9JBVerX3Vv9q8Olh99hrTlp8TZt5jwib0LukMUxt6qWW4GfZWVegW7cbMGZ++zyuT6FyUpCRo8QEgtCbhvQ+IlIAeKnpiF2JE24Sn7a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186109; c=relaxed/simple;
	bh=fC3Ce+ENqS32YaS5NfaHlmi1OOmR9fqmzZ8w3RM/fXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DFmBDWk6P2g/0fxUgc1uqcgWbESyKiin9zBJub8jeZ4fg+peKH97bwNytoIbXbaRgvdfLO6ll61r2JVNoePiFsMsYKY8T+BDbUepA6Me0qq5+kn2XeNAfv46g5lUUO3ZuS9HPsFFsewjOyEpOwr8kJtK/6q6FKeJ/QIX2nndZws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFu+tLij; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D517C2BCB2;
	Thu,  7 May 2026 20:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186108;
	bh=fC3Ce+ENqS32YaS5NfaHlmi1OOmR9fqmzZ8w3RM/fXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PFu+tLijK3+s4biaEyzlljUTTyg13TkBprnJCT/yLzewkwZ9BVozX9ugacZnXWy6o
	 DxMdjY8Eg2eho2OyCnIJDkBD99eKj8wbKT07dLN1LUyfE06lSpVD1A17ZQoZEdyfLC
	 lIpwSbeSqZfE+ImxziBGDTqnsdfN0fYbe4TeyqvpD0GIvlEZUwR4RcNxSTJQoKASvt
	 D/Dpny1mucvl9aorPbWJ+Aww7n6dqTSe+hvQi01ec4Qbe6RK1hU7/3Xar7iwlnY2SJ
	 luXUOZX7bdl2s2wF7W+23htuENM+I3GAgdHs60QLV9hijIxoefEzZgUE291S/wFopu
	 Uu5h1pxBWpgAw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Add ADSP FastRPC node
Date: Thu,  7 May 2026 15:34:27 -0500
Message-ID: <177818606042.73000.12011840476150294916.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403120753.105869-1-mitltlatltl@gmail.com>
References: <20260403120753.105869-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 395B54EEEB4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106529-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On Fri, 03 Apr 2026 20:07:52 +0800, Pengyu Luo wrote:
> Add the FastRPC node to enable offloading compute tasks to the ADSP
> via the FastRPC framework.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc8280xp: Add ADSP FastRPC node
      commit: 1825ac5e2ad27ad72d1a550f6e19f8cc1ae90afe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

