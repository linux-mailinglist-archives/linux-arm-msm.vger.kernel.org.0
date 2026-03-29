Return-Path: <linux-arm-msm+bounces-100641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKNBFKWMyWm1zAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 22:33:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5D2353F90
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 22:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1F0903003346
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 20:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4240A234964;
	Sun, 29 Mar 2026 20:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZhilpZB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D54833EC;
	Sun, 29 Mar 2026 20:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774816417; cv=none; b=haMCZxQbBwBZVKyVCI+lF3X1P0Iv7JQnnP87LG1fNe4iKW/5LYi5Ayp4h1dH17xqenNEmIUSK0FzriDIAKwKYLAR2iz2DV3hpPDFnVciwlqxqLhUuPq08D+uXDqaw+IFEBUS6JH5Egom7t7ApiVYbIwwFpQogWx+tHdcv2fsKOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774816417; c=relaxed/simple;
	bh=b1qN/QmmHyjDsZ1S9VwDWDPOs1KQeHXkZssW5Tti60M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TDFDlVHOVSE71zycqNQAFxP/whCR/7V4AkWlA2hum2RRttABIu7uHQkdRJXI7KFqzcuVW0bOspnrDobBCDD3Lm27j8tzMSl0oR0XWWThmIlZ911xqZGO7FI8ypGUD0Draml6arZDz+TOM3TFluHhgHjyUcyrRWQRWtZl0VC3Juo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZhilpZB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7B2C116C6;
	Sun, 29 Mar 2026 20:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774816416;
	bh=b1qN/QmmHyjDsZ1S9VwDWDPOs1KQeHXkZssW5Tti60M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lZhilpZBz7DGzJadRK9UuEunDiurdIq3qSlXsGUYhUvtMTzezCXS9iGGECsu9OglZ
	 /pq/eLDDFWBCFjnLYeB7v1jt2dtpyr7pHiXafTk3sNj39nOqTSYzYehbzfLLLHu8eT
	 wb3q6It3eWkruNtOl8RlaKpboope5U5uNVoMKxb2usnbaaVFxbN6LcVg+3MnvRyD5E
	 GQT1MPKA64RSIQ3vE2QS8yIW8eJXMdMlvAIy2EV6cGe4I1DOGP2O4rHkKwOE19aRUF
	 snpv2/hc4o1t3JwyTNWRin/mMfh2AXlrAbETIXv90oS0ggXNzIx+MfIFxUgl9qQNmV
	 i5Udi/vKhcwZQ==
Date: Sun, 29 Mar 2026 13:33:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@oss.qualcomm.com>, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andersson@kernel.org,
 yimingqian591@gmail.com, chris.lew@oss.qualcomm.com, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] net: qrtr: ns: Limit the maximum server
 registration per node
Message-ID: <20260329133335.6dba8048@kernel.org>
In-Reply-To: <as3zucfwr4z2x5pxww6ognmqcujkwnhppulm7jquex6fy6sqn5@qa33h5mxxdz7>
References: <20260325104415.104972-1-manivannan.sadhasivam@oss.qualcomm.com>
	<20260325104415.104972-2-manivannan.sadhasivam@oss.qualcomm.com>
	<20260327095832.GC111839@horms.kernel.org>
	<as3zucfwr4z2x5pxww6ognmqcujkwnhppulm7jquex6fy6sqn5@qa33h5mxxdz7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,davemloft.net,google.com,redhat.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-100641-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE5D2353F90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 27 Mar 2026 15:40:01 +0530 Manivannan Sadhasivam wrote:
> > I am wondering if any bounds are placed on the number of nodes that can be
> > created. And, if not, is this a point of concern from a memory exhaustion
> > perspective?
> 
> That's true. I plan to send a followup for that. This series just limits the
> scope in addressing the reported issue.

This series is moot without such limit, tho.
Let's fix it all in one series.
I'll send you the remaining AI feedback.

