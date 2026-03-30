Return-Path: <linux-arm-msm+bounces-100804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKEEFdt6ymnk9AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 15:30:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E8C35BFB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 15:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82147314A532
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE7A3D4123;
	Mon, 30 Mar 2026 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dO0Vu6pF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBC73D3339;
	Mon, 30 Mar 2026 13:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774876901; cv=none; b=YTD42H/pc2sNftN9ANbkr46JV7Zgz2JKdODUOAFddJHzqnd9DY3Z/jl8cC/wEm9Y8hf6WZfr3FurFt1mxQOaSMPmalxwkE9/ho948JF3ZDGpxnw1ebo7amaJ+s0CJYh5ASsgs7dwu8pd2L7OIBTWzllWh2bQO/ZbZw7m/3KSZso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774876901; c=relaxed/simple;
	bh=KoMsdHqrWjLfTLkKL3xr2JgDf+8q1RCvLhgRCV2Ka5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DI8A3+TbzA+y3ZD/hq+AOuUGWkXOqEk2FYZDT/f2IyPQD9eikbF4hQkBPkWGjkzuSWgftv+MPQz+xJR91BzO5UkFbPt0sH7AmP//Mcui0ezvWHP0vltgOFl3JjHKb7Fd2j4FU5asyQ1o10mE4/SF0OdZL3kvqJAvlYYL4VAEjEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dO0Vu6pF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95ED5C2BCB1;
	Mon, 30 Mar 2026 13:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774876901;
	bh=KoMsdHqrWjLfTLkKL3xr2JgDf+8q1RCvLhgRCV2Ka5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dO0Vu6pFemZzzjshfi+fs8MQlWnjgPXATZeiXfUf5o5cslL7otYSPo1FTWM4/XRVW
	 2TYfrJJz10F7wBR052H7f93nfGC6ukiPSKcoJ35nqd1l6sY+UlqiZ6GQimspoLAQHr
	 LMa9dUE7FNXiC5KkCpJfCpRKUH47Bd7I57Ss1LMbeWgzukd9fLMFVAhTN1cWI9nx95
	 taSEFy2E6JwrKpKPSiHvYSUOz9YaNQD7iAmspH3zCgqvk+fL815YsllKOJAaCXy94j
	 Pfwen2tRe06GveuEOFxv3cNsdltNIYqehQBPTxiJSXiiTb9VyKyfY/83obVFB/qM46
	 7JAnEDB2G3dCA==
Date: Mon, 30 Mar 2026 08:21:37 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Add USB support for Kaanapali
Message-ID: <acp4bfTGOxaAQkBn@baldur>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100804-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E6E8C35BFB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 11:22:46PM +0530, Krishna Kurapati wrote:
> Add support for the PHYs and controllers used for USB on Kaanapali SoCs.
> 
> V1 of this was a consolidated series of many functionlities on Kaanapali.
> The first patch is patch-6 from v1 unchanges. The second and third patches
> are parts of MTP and QRD specific changes (patches 14 and 16) and commit
> text modified to indicate mtp and qrd specific changes are being made.
> 
> Ronak is the original author of the patches. Kept Jingyi's and mine SoB
> (with no CDB) since we just rebased and send the patches in v1 and v2.
> 

That's the correct way to do it.

> Since SoCCP changes are not acked yet, enabling only device mode.

I'm sure it clear to you what this mean, but for everyone else: what
SoCCP changes and what do you mean "acked"?

Regards,
Bjorn


> 
> Changes in v2:
> - Sent USB specific changes instead of all MTP and QRD specific changes
> 
> Link to v1:
> https://lore.kernel.org/all/20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com/
> 
> Ronak Raheja (3):
>   arm64: dts: qcom: kaanapali: Add USB support for Kaanapali SoC
>   arm64: dts: qcom: kaanpaali: Add USB support for MTP platform
>   arm64: dts: qcom: kaanpaali: Add USB support for QRD platform
> 
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts |  27 ++++
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts |  27 ++++
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 154 +++++++++++++++++++++
>  3 files changed, 208 insertions(+)
> 
> -- 
> 2.34.1
> 

