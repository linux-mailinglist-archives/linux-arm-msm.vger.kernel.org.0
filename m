Return-Path: <linux-arm-msm+bounces-97189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOt+NC+osmnwOQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:49:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A0E271454
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 215133162EF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 11:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56E33A0EA6;
	Thu, 12 Mar 2026 11:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMbPmSE9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C523314C2;
	Thu, 12 Mar 2026 11:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315610; cv=none; b=IaYDnrN26iedIaE4cRhoEe3NFQ/c/+LJV46639JLC8xWZrlJd0BF6Wyqi+24I3TdurA2q4TAXtm5XXEpH4EG7DenSkViETsNp2jwDOhIkk2eQptY5cZRkAsA+x/YRsd/Gm/Nq6cVxVxhB4jV96E7bfvcQbNdX4Wxk0a7lwTMz6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315610; c=relaxed/simple;
	bh=5bAP25N26DNZvZYDaoJJAEnJi3gLAs8/Yn4kVXtSOgA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MQFvn7mqUFGTuT2LJvRXOTTfCdKGm6yXiztqZt90mYz2Nhxfroda5t1rbi8v0bP+E+oJssELJZHBPrxoVg8syxpNaTy30l0C346DfoiIBdCHcj74BYNzOcCQpHBmI2/F7R/A2x/9pTJUE891Mh9j3p4gFIGzs9oVXUFnTEyq2FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMbPmSE9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3722EC4CEF7;
	Thu, 12 Mar 2026 11:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773315610;
	bh=5bAP25N26DNZvZYDaoJJAEnJi3gLAs8/Yn4kVXtSOgA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lMbPmSE9ItIMHKHJ8fhn70K0/3Ohr4qUO31rCKUG1RQ776qXoPrQVWyttKfo1eOQ6
	 s3Xf4JpPf2Ph+lyQVT5P4UaKePnMz36zFqnQFO2DxLEneflkNNUnTxii4Y89CHip/e
	 YsciqaxX5jz5izTEd/H/+sRnNGnXKVqmgeDtN7TufBgHhJbmyqB9laqxy1S0+Jho+L
	 3pQQAzAUI0l2qdx3KSfToU0whMEw+PCNU2d/8H807Pb3kazdrQfwSSCeY44Rr1vFJ/
	 ZMqWc0HFOtc4f/LxtBqqW4225x4z0gPc+gzB7+Ghy6AYJn07m0x76esut2+Z3baqMr
	 KSEz5lXEVAYxg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02CD03808200;
	Thu, 12 Mar 2026 11:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] IPA support on qcm2290
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177331560580.4062867.8199136096986692017.git-patchwork-notify@kernel.org>
Date: Thu, 12 Mar 2026 11:40:05 +0000
References: <20260310112309.79261-1-wojciech.slenska@gmail.com>
In-Reply-To: <20260310112309.79261-1-wojciech.slenska@gmail.com>
To: Wojciech Slenska <wojciech.slenska@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, elder@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-97189-lists,linux-arm-msm=lfdr.de,netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 62A0E271454
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 10 Mar 2026 12:22:29 +0100 you wrote:
> This series adds IPA support for the QCM2290 SoC.
> 
> The configuration is based on SC7180, as both SoCs
> implement IPA v4.2.
> 
> ---
> Changes in v2:
> - Order fallback list by priority
> - Add leading zeros to register addresses
> - Use RPM_ACTIVE_TAG instead of RPM_ALWAYS_TAG in the last path
> - Link to v1: https://lore.kernel.org/all/20241220073540.37631-1-wojciech.slenska@gmail.com
> 
> [...]

Here is the summary with links:
  - [v2,1/2] dt-bindings: net: qcom,ipa: document qcm2290 compatible
    https://git.kernel.org/netdev/net-next/c/4320f1f111c5
  - [v2,2/2] arm64: dts: qcom: agatti: Add IPA nodes
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



