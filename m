Return-Path: <linux-arm-msm+bounces-107680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NnkDu/1BWpVdwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 18:18:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D43145448D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 18:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B486301386E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4074D175A6D;
	Thu, 14 May 2026 16:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHXvUjOD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9293F4132;
	Thu, 14 May 2026 16:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778775488; cv=none; b=rOkqOkWZuQPHaXGfVlLqLcmX9VT5ZHgmMr+5yCtJFtpQyjEtnXJxJAj5aOr9T7g3Wsc6KeXr6GESEmU1JJCoTdNhBgQPch084GeZ/942WEySqlDVdMyMXhof79Vr5l9ga+m72dGd8cH1r5Z+/MJ1YM+KYqYWlp9OC8gtfwDtJz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778775488; c=relaxed/simple;
	bh=7YYdKtGlfnKHsAP2aKZIZJDNPvZ1jULG4/aw9QNQLgU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kA9HvdenMv7lchDK2+GFJzgIts//K62K2ljzUPGcPGQlUBJ62UrHfPCY92ny0enSbUVDmZ49+xvlLjJAUIZ6/pHr9SwiDXAV1qUZh6W6Q5qemOTwcGLXOivK7GtUyGg4645dT2g5JGsA6MRAS40L31md+uotFHmeVzBRzF7Qsz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHXvUjOD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D361C2BCC9;
	Thu, 14 May 2026 16:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778775487;
	bh=7YYdKtGlfnKHsAP2aKZIZJDNPvZ1jULG4/aw9QNQLgU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kHXvUjODb/DDtyVekllZYuJqqWrI+mT5LlGzje2hciMqsSHyuPQmR+mqlAm51Cv90
	 X1LahNWQpmT917+2zrPnG/1a0HL111QdvuEFQIrNirB8nq+2B+doyuYOjrfiOac9H4
	 m0C+xzoHtOdl/NcDw/BYFYkZ3MVmaOvddsko65jJzMRKUCbYUPtsWsTQCna4HtAVek
	 AmjjqdfVm2bJG37skAXQV1pfFWI1xsqQ/9DmYfHHymdLO6CbUBzdpr0n6UV41n7QNx
	 G+f7JLbEAVFIfhnDJaNP/alZJ2u0nChxK+ZiJut+EH2XO7b513Q03kyOnEkOAP9n+j
	 3uiq2rrlxfmOg==
From: Vinod Koul <vkoul@kernel.org>
To: linux-phy@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260315214930.4621-1-rosenp@gmail.com>
References: <20260315214930.4621-1-rosenp@gmail.com>
Subject: Re: [PATCH] phy: qcom-usb-hs: use flexible array member
Message-Id: <177877548580.1092446.11009102114814879783.b4-ty@kernel.org>
Date: Thu, 14 May 2026 21:48:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Queue-Id: D43145448D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[lists.infradead.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107680-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Sun, 15 Mar 2026 14:49:30 -0700, Rosen Penev wrote:
> Simplify allocation by removing kmalloc_array and just doing kzalloc.
> 
> 

Applied, thanks!

[1/1] phy: qcom-usb-hs: use flexible array member
      commit: deb281cec3cbef5f02c6bc29fa5cd51f6d5be10f

Best regards,
-- 
~Vinod



