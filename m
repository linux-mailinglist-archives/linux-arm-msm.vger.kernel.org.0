Return-Path: <linux-arm-msm+bounces-105272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9tZwGGGZ8mmgswEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 01:50:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A31EC49B692
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 01:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A4653018288
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 23:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA877394462;
	Wed, 29 Apr 2026 23:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tW0b3Iy1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64B3274B3B;
	Wed, 29 Apr 2026 23:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777506652; cv=none; b=jvlxwQ/Z03uDckggglOTPjEFotVkoGbR2EhXGIbY+a1iwcvHZ8nHrkacuP6N93rHjvsvB6zDWmua1CSiBWwYjcNQnAUqqu2JX5w6KAiTzFXhfL/pzcqQixky5EPP8ujldeFwd5eDNjDEo9HW3WiFVNQ8NIguULJ3M8qu+hf1ES8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777506652; c=relaxed/simple;
	bh=36ubX7x1U6gFHGFqJ+mYS3hAER5LByVPX+za611HD5U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=q7D2vBTW+dHjKXhnsjIJiT400thdL7lW5TdQkyLsiENrgXxo9taf8Dj7FyQt4QoYo9mQgxleQLHXZ65TtLqfA5Gl18wAWWMPv6azxVKdG1H6PjrHiwDS/C8bAyb0pjxLG6txD+yhX//sLLUPBfn2R7hmFIYnKsu8LUIZHxquK7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tW0b3Iy1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C5EC19425;
	Wed, 29 Apr 2026 23:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777506652;
	bh=36ubX7x1U6gFHGFqJ+mYS3hAER5LByVPX+za611HD5U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tW0b3Iy1UzeHjw4lopNS4bF7psqu6TtvDABkPR/9sTeEut+HeAaT4MoGpGAAVQ7Rm
	 /EkDiCzMuZ+fuQc7ENQ/krFF6UnB4Xa8h59Tbq0rZrwDJYlU//mzCx9sM7bRhw4wGw
	 lFEHJPGw+gNhIGYuDOJ5Hd9VDd0doOocSq489xvyFWXBlr/D080aZCPmqlshHgmNko
	 kPOIQRrwR/RXgnAa+MXIYcXjJFYBhcHmEljxDO8jIt8ZHnt1sJopKpy19ZxkaF6+2q
	 UQEQnECCw1i1mc/pBnu++3bSHCK6zDfFCQ11hu6bcfMZhXa6/CUnvFRjD0DS8YJSmY
	 ZiTIlUY13E82Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F0B3809A2A;
	Wed, 29 Apr 2026 23:50:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: Unify user-visible "Qualcomm" name
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177750660730.2222595.4709678174483377613.git-patchwork-notify@kernel.org>
Date: Wed, 29 Apr 2026 23:50:07 +0000
References: <20260427070127.18471-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260427070127.18471-2-krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, loic.poulain@oss.qualcomm.com,
 ryazanov.s.a@gmail.com, johannes@sipsolutions.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org
X-Rspamd-Queue-Id: A31EC49B692
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105272-lists,linux-arm-msm=lfdr.de,netdevbpf];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,oss.qualcomm.com,gmail.com,sipsolutions.net,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 27 Apr 2026 09:01:27 +0200 you wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> [...]

Here is the summary with links:
  - net: Unify user-visible "Qualcomm" name
    https://git.kernel.org/netdev/net-next/c/f48bf6145116

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



