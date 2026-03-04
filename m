Return-Path: <linux-arm-msm+bounces-95233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGurCc2Mp2nliAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 02:37:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B829C1F98A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 02:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C116C317726F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 01:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF343242B0;
	Wed,  4 Mar 2026 01:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ph+F9Lr9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068F3322B8C;
	Wed,  4 Mar 2026 01:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772587838; cv=none; b=TUVRi6l93bY06FFfFzdNNJhY025yIhf5uyWRebXU8e4z46YkZVcfZs3CV77AHmarrKTi9KJFp+gqvSebb/Jjc3uPW4cuqXG8+bpyNLgh6ZPIaT34oWWK2ZyXpItbNNRcPJzTBnVJ3BTqZW+kq22clvB9bK2+lI3JjoPA6bnRetY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772587838; c=relaxed/simple;
	bh=+I+hq5d0Ukd9MEdfhHt1OsWJaWgutZdYvcEqbxDyxqU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=icMPuIDSDWpPeChW9cMO6a+GHjySsDLlTnefeWSJYFL5n5juse8LqDypeuBLzTyV48CEROTawfOZ8mjzl3iO52J+EEIeQ2lSM0+5asfozgKUttUIt+KWgdtCDXLXKaVmVwp96V4vmL8Aq9TyP5uJ6hbx6gJT+SCKQ8ZW+AmfguI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ph+F9Lr9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B191BC2BCB0;
	Wed,  4 Mar 2026 01:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772587837;
	bh=+I+hq5d0Ukd9MEdfhHt1OsWJaWgutZdYvcEqbxDyxqU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ph+F9Lr9dGojpzp44IwvwNc7Xzd80mdx2Mdy9tq55GXsJ31dupTH7ZFY3sANQJZV7
	 v3wWtdvvm8glGo9uP6cTo3PvDb3Q10AX7GaF0RCY4Jd+S2qTv8SkyD3sc/rm5jueJ7
	 0YJy0IWAUwuMcra0wjAzu8nix3XdG1X3bvrrFl1qcXH2XTf93TdFxVXP9RsHj6uRUg
	 TzdgeSEb2jQXkBjSELPpUZDhM20H2QdGmrx3JcURNYuuNu7Imn8c2a7neFbi/WLTLy
	 pw6iL2swgmTb2TW6pYqZe7+llC+vPxxMlbvbPUww6C3t1LoT5CfMCKXgM2NQdAM0ji
	 E1p1grKVjRVqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02E523808200;
	Wed,  4 Mar 2026 01:30:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next PATCH v6 0/3] Grab IPA IMEM slice through DT
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177258783853.1546050.12919128541243132740.git-patchwork-notify@kernel.org>
Date: Wed, 04 Mar 2026 01:30:38 +0000
References: <20260302-topic-ipa_imem-v6-0-c0ebbf3eae9f@oss.qualcomm.com>
In-Reply-To: <20260302-topic-ipa_imem-v6-0-c0ebbf3eae9f@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, elder@kernel.org,
 marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
 krzysztof.kozlowski@oss.qualcomm.com, elder@riscstar.com,
 dmitry.baryshkov@oss.qualcomm.com, horms@kernel.org, krzk@kernel.org
X-Rspamd-Queue-Id: B829C1F98A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-95233-lists,linux-arm-msm=lfdr.de,netdevbpf];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	RCPT_COUNT_TWELVE(0.00)[22];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 02 Mar 2026 16:58:42 +0100 you wrote:
> This adds the necessary driver change to migrate over from
> hardcoded-per-IPA-version-but-varying-per-implementation numbers, while
> unfortunately keeping them in there for backwards compatibility.
> 
> The DT changes will be submitted in a separate series, this one is OK
> to merge independently.
> 
> [...]

Here is the summary with links:
  - [net-next,v6,1/3] dt-bindings: sram: qcom,imem: Allow modem-tables subnode
    https://git.kernel.org/netdev/net-next/c/ca4c7771a059
  - [net-next,v6,2/3] dt-bindings: net: qcom,ipa: Add sram property for describing IMEM slice
    https://git.kernel.org/netdev/net-next/c/f5a598abfdd9
  - [net-next,v6,3/3] net: ipa: Grab IMEM slice base/size from DTS
    https://git.kernel.org/netdev/net-next/c/6f82cb4ecdb4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



