Return-Path: <linux-arm-msm+bounces-102867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBSXBG4f3GnoMwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 00:40:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A77F43E64F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 00:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7182E300D853
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 22:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA93322C67;
	Sun, 12 Apr 2026 22:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDA7KYQ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CB51A681D;
	Sun, 12 Apr 2026 22:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776033640; cv=none; b=M7Dz3/VFpCO9Au8R6GUXUyBiVnMF9cvhxwVYuRfMqyWc2Op4o+pwCmc5nv9txSP8JEfSE7rcpt33JONdmhWTF9XdLCE+VNI6JiI/obTXpt8iS7j7OMTRMUYGyJbIfHqakJncfFDtWwHFs5TBfZiTxOmltcl4MmCfPdFEYHN7ORs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776033640; c=relaxed/simple;
	bh=f9+QkuOQSxfqFHi5THmDbOofB97kseZs53WdRc4K/3Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YAi9rvwu+rsT+yhSHCvqGjOiGhjJrSGAxyVOq1SAZElcU2XdbZabFEGpaL5SnZawllyaBGSMic4/uPBfnbkXMG6MKTtS1q5avTN/0y74E+OMtVX7O41Qc4gr/SdEaO3Gm+EbArS741kktnDY5ScunubqAkhf2o9gHcbeKR6yQ/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDA7KYQ1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D25C19424;
	Sun, 12 Apr 2026 22:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776033639;
	bh=f9+QkuOQSxfqFHi5THmDbOofB97kseZs53WdRc4K/3Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oDA7KYQ1Oh4blR4MCycwS8BEji4z8JMJ5rVMJ/IOIzrLxu8tG42j0TK4I5rXCqJ2U
	 9TVYp6XqMeQUPRMRo0UPhiDZ3xQKbewWukhZU5oDl6YOwZeuq1B52LE8GR9JWuPvFe
	 g9EB00UktrO4hwZbFb2r7MQIVVbLz5gc83gfSN6qYeHhWKq6Y1hpwUw4vFzggGyIpR
	 szeUD+dbCHpW5bICEhkzEoj0N0nOEtpy2zzfMeTPkoW97hPTIO7Zbw2kQ9IOUOSAjy
	 uHuxncAcp01fgCjwtu3/EsBviitZ9BcmWuiDmAeX8Wj2rtPTdFk78NMre76xPAhnZe
	 58cCq5iRqKnWA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FC823809A8C;
	Sun, 12 Apr 2026 22:40:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/2] IPA v5.2 support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177603361205.3843927.9903704326605588051.git-patchwork-notify@kernel.org>
Date: Sun, 12 Apr 2026 22:40:12 +0000
References: <20260410-ipa-v5-2-v2-0-778422a05060@fairphone.com>
In-Reply-To: <20260410-ipa-v5-2-v2-0-778422a05060@fairphone.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, elder@kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
 horms@kernel.org
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102867-lists,linux-arm-msm=lfdr.de,netdevbpf];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A77F43E64F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 10 Apr 2026 09:40:06 +0200 you wrote:
> Add support for IPA v5.2 which can be found in the Milos SoC.
> 
> Note: This series has been split up into two, one for net(-next), one
> for the qcom dts bits.
> 
> Changes in v2:
> - Split the series, drop applied IPA fixes, mark as net-next
> - Pick up tags
> - Link to v1: https://patch.msgid.link/20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] dt-bindings: net: qcom,ipa: add Milos compatible
    https://git.kernel.org/netdev/net-next/c/d471d70cc964
  - [net-next,v2,2/2] net: ipa: add IPA v5.2 configuration data
    https://git.kernel.org/netdev/net-next/c/4bf38bac1b2e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



