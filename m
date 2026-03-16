Return-Path: <linux-arm-msm+bounces-97776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kC2qAeJkt2kMQwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:03:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C30293C09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:03:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 881D53009542
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52020309EF9;
	Mon, 16 Mar 2026 02:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYDChHtw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC582E06D2;
	Mon, 16 Mar 2026 02:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773626559; cv=none; b=YJC1xremwhwnyhPfmojj0QxBSb6Ma6Aqhy9n6tWi63Uu2LF6Et5ZZEdCO9cTB8LKEKnCBKhv2qvwREm+ee3NY/OeYxhAVh4PBH+IyOgN3JoJK3Bb0UaBtVaFkXG0xRAi+FOR/K4w7LlhOzDnFg002Z2InxsKPkNXtuKVs6ebtoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773626559; c=relaxed/simple;
	bh=tNE//M1QOyEnGuSPqt3MngBkPn06uHH3wdiVKR7tDaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kPygOGXFE7IsDwW2Za5E4obcZs0/epwiy7BZLObijZZEboRwuQn+Qd0YPUW0mZIPYFXRhCdHzIXAo2pQ6PVWCYp+AhTpWe1qAfo6eeDOu4vkX+gy/W+IUb0btG7GbPKC1bMuhy3/mQzRD6rQQDJ3IbI+KybfKDkTGggQHWagBgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYDChHtw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B50AC2BC9E;
	Mon, 16 Mar 2026 02:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773626558;
	bh=tNE//M1QOyEnGuSPqt3MngBkPn06uHH3wdiVKR7tDaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PYDChHtw6pP6ge+g+3LS2EhRDhRwq2aLp323nP2QJ7xKWD03xqUyoUAtGm3kteQB7
	 aFKzG5CB7BkQXhTSQMcATOAHln91sd/NXpSLrWQEu1xSR0lXLPmGl0YK+M2DJWsSdO
	 xrX6TMEzxYjjPaZBF46PvE5BEHEd6Idwe+CS2LdKT0QIPakdw+203f85a0Z/pb0U1b
	 WatJWGRi92iyTXmMoCMxc+/v6fFj+yt4ZShxc1F41OrDal+8461XbKO0MUQUPmBXRD
	 75qYEWPEGgchPJqfhsiFMENaHyqmgK7Ya8m4GIEXh4kmXADSaegVB7OIeY5W7nHxv5
	 C4UUf0RMySFgA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aelin Reidel <aelin@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 0/2] Add SM7450 and SM7450P to socinfo
Date: Sun, 15 Mar 2026 21:02:26 -0500
Message-ID: <177362655072.7429.8280016320141439355.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302-fillmore-socids-v2-0-e6c5ad167ec4@mainlining.org>
References: <20260302-fillmore-socids-v2-0-e6c5ad167ec4@mainlining.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97776-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 81C30293C09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 02 Mar 2026 14:10:13 +0100, Aelin Reidel wrote:
> Add the SoC IDs of SM7450 and SM7450P, two SoCs in the fillmore family,
> to socinfo.
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: qcom,ids: Add SoC IDs for SM7450 and SM7450P
      commit: 583157bee545e5c2da6ae094bcac7f68dbc5d265
[2/2] soc: qcom: socinfo: Add SoC IDs for SM7450 and SM7450P
      commit: 3fa036c08938d37c4bc79d125974bb87b4122ac4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

