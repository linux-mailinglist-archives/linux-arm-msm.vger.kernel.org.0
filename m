Return-Path: <linux-arm-msm+bounces-105043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GbQCnTh8GmoagEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 18:33:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B09BC48902B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 18:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D93F322AE68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447AD44D01D;
	Tue, 28 Apr 2026 16:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JbkEQnl8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214F73C2799;
	Tue, 28 Apr 2026 16:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392894; cv=none; b=i8emZsj9igoDsIFulhlSY+JYZ5tPGV5M4bHn182it0UMx4O+M6rTzjWUy9hmJcUxxdHk2bFKtnRrIBPQioIgVRH9prwlZh+NQLMbXlONX71KjCW11dU0zJXpMwlGKdhnoSXPWBWIRf3b2Hf/jIrPXwKtyURVDHMW5qmBkXUXdF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392894; c=relaxed/simple;
	bh=KL2ZfNVqrWQLqUll24996ElMsbWWCAGfVvy2a3Aa0Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgEckSmhRTQvW3fkFsnbuPFaNmId5fpQRfs9ixIHq/aHlpZz+rYj33eGKQV5b5fJ7JaglQ6+BxjVqICZ05HU+rlH2s67ne97ne6IqJcEfD3u54i2ezReD0nR5B5Ts/jg6Uq0jg8KsDSzMZ+Du1Na7CFVKD/Uvlc6qKIkCFXEHmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JbkEQnl8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE790C2BCAF;
	Tue, 28 Apr 2026 16:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777392893;
	bh=KL2ZfNVqrWQLqUll24996ElMsbWWCAGfVvy2a3Aa0Vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JbkEQnl8PbvoONjjfnDexc6ygPB3xUpJM0n/RKwzjtMG6dF/c1uB/5aZas06b+Fh5
	 TsVKWoJO19sgPwMKC5x0jd0KG6sRIDv7A9jSFKJlDM6oKrKgZt6bwuLhh607MaSpdP
	 QrXG3P/HHmrkG5WJl2Rqx7OGXUqGYvrXq8XcPc8gj0Wyyujt8wBi2V2ABjnqdi+/KW
	 6HfOQtzQcv5SUMCMQzNMlf2bpWSYRHmBSORhRDed6lHF3e8MzD94ILuZ+IgYw4YDqr
	 sfdKFqBho4fDCwzo2YegESounFOdnfM58bd3VPkqk+iFGTMpOiaO6AcxtudeyLB7X7
	 5Xy5b9UePUzPg==
Date: Tue, 28 Apr 2026 17:14:44 +0100
From: Simon Horman <horms@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] net: Unify user-visible "Qualcomm" name
Message-ID: <20260428161444.GU900403@horms.kernel.org>
References: <20260427070127.18471-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427070127.18471-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Queue-Id: B09BC48902B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105043-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,oss.qualcomm.com,gmail.com,sipsolutions.net,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,horms.kernel.org:mid]

On Mon, Apr 27, 2026 at 09:01:27AM +0200, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

...

> diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
> index 88df55d78d90..958dbc7347fa 100644
> --- a/drivers/net/wwan/Kconfig
> +++ b/drivers/net/wwan/Kconfig
> @@ -38,7 +38,7 @@ config WWAN_HWSIM
>  	  called wwan_hwsim.  If unsure, say N.
>  
>  config MHI_WWAN_CTRL
> -	tristate "MHI WWAN control driver for QCOM-based PCIe modems"
> +	tristate "MHI WWAN control driver for Qualcomm-based PCIe modems"
>  	depends on MHI_BUS
>  	help
>  	  MHI WWAN CTRL allows QCOM-based PCIe modems to expose different modem

Hi Krzysztof,

Sashiko points out that QCOM is still used on the line above.

> @@ -51,7 +51,7 @@ config MHI_WWAN_CTRL
>  	  called mhi_wwan_ctrl.
>  
>  config MHI_WWAN_MBIM
> -        tristate "MHI WWAN MBIM network driver for QCOM-based PCIe modems"
> +        tristate "MHI WWAN MBIM network driver for Qualcomm-based PCIe modems"
>          depends on MHI_BUS
>          help
>            MHI WWAN MBIM is a WWAN network driver for QCOM-based PCIe modems.

And here too.

-- 
pw-bot: changes-requested

