Return-Path: <linux-arm-msm+bounces-94359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJdwCtjyoGkXoQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 02:26:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1FF1B17D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 02:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96701301828E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 01:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2BA262FFC;
	Fri, 27 Feb 2026 01:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVsPwexo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A692257821;
	Fri, 27 Feb 2026 01:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772155604; cv=none; b=kDEMyqz19hoxHPG2a8l0vJvEIgYAYhifpj8/6iWcb6XBVvzZif99CV8A3lSpi7N6Pr0NzA/G6Gcf0k1HoyVOAoY4auVf9hU6IXVi7UmAWAGEbUVyHy2jXihM/Y2NIpnEF9ku8VLadGt/MqCfI+ntgabv2E2ZvnLrTCpIExLzKhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772155604; c=relaxed/simple;
	bh=hSJg4qauvG+7+fWEs47LIA3wWemCOEi5vHzM2SoFyQU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aGDR8WHQhkZ+95sB326xteWTuZXHbj+2Xt5x+jCw4RBF4RwSbhmnorZh6Ua21cxtHSLKQxtyzzgJ5xSazwHUuq7SEuhIfrYZgMs31VOLRVFr6KRHnXfWAaXILziZYg8InNjAinJ3acVGnq3b5oikas2PObrEvyObTkuWEQvBp/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVsPwexo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65302C116C6;
	Fri, 27 Feb 2026 01:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772155604;
	bh=hSJg4qauvG+7+fWEs47LIA3wWemCOEi5vHzM2SoFyQU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HVsPwexo8yQC1McqS9JeWC0dIgxu1ad7PFQ22F991iYeUBVcYSuPOP84+EK5Y9pJB
	 s5PJk8FxLshZme53gbaRIOggFE+wq9oL5Os0uK8s1L3/QJYzquBLDZ0wHuN62GGBP8
	 44IszaOZK0R6ejURWjnzivmC0W1LEGgDI1QNBzyYM0f5wh/ZXMRcK69pYhStJ0RECS
	 8sFIquFryVggccd5pUkOnJ7HsoAy70K8n4IbQzTLC2aQv7vCMR9/+zQVd9KfpHbvFA
	 mg5035FzbtoblNIfsRDZSJgRrIRS26FBO23ak1AqrCpMD1AB9c7iA5URfN5LqlAUqZ
	 +KcPyCNgIMV6Q==
Date: Thu, 26 Feb 2026 17:26:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
Message-ID: <20260226172642.18a0b20b@kernel.org>
In-Reply-To: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-94359-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4A1FF1B17D9
X-Rspamd-Action: no action

On Thu, 26 Feb 2026 23:07:16 +0000 Russell King (Oracle) wrote:
> Subject: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further serdes reorganisation

The only exception to the 24h rule is if a reviewer _asks_ you 
to repost ASAP. Maintainers also wait, there are no exceptions.
Please don't do this again. Having to deal with multi-tier system
of privileges and rules will make our (maintainers) job even more
miserable than it already is.

