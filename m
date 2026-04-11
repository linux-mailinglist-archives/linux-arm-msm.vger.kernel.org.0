Return-Path: <linux-arm-msm+bounces-102776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PXeHDIJ2mkcyAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 10:41:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2EB3DF00A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 10:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D957300380C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 08:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110AB1F91D6;
	Sat, 11 Apr 2026 08:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q5+eQ3sS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24681D432D
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 08:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775896876; cv=none; b=rjMUtUB+qtQdmZcuOW4gbZTXgd9y/RdMeBO5gHXYkNM5girOt1qF2xear9PThHgzDEqY5fJ3V9H/ZjyYgANaOqb484zEY9EHa9PbOLqpiUd6Pk1WsEtrNjx4GOMEEMrVcKaRf8pCAN36XMqXsVvlxOI234Wb/Bv14IWVeQLqPx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775896876; c=relaxed/simple;
	bh=kBsOxr3eKZCvLYnbyeQwhEckrwKolmqWuaSMv3r69rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6psJiqEiL95TngbxFI7NQvS/cW8FPtVt1gdBYbOmPtf3FPdZdtWlHDzQi02YqQ+D1OZ0i4UYErzd7X7PAiEyiZg1qKsv9mMStZkimvgw+Pr8KzQ4Oc7bXnCY5xyb1vGRdns+RsjTKOh+ae3Mc8Tnts8SNaWbHv84gcB9FdwqzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q5+eQ3sS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B876C4CEF7;
	Sat, 11 Apr 2026 08:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775896875;
	bh=kBsOxr3eKZCvLYnbyeQwhEckrwKolmqWuaSMv3r69rE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5+eQ3sSpSYIFT37nLZmc0PwcBopPnwQTeTsz+FPR+P+hqhE5l3QX6t5WsGoPu6I9
	 m1Ndn18E9QbRV3Af4FeI/uvAL6O/poM0gBgpOqEnLCmZp3KkP/Uq1+WmB41hhYR16e
	 ic3Vav9zLb01BUObPsASr5ECqnJ6w8Hl+qxilrqls/eFd6kvW6opTq1qS75W1bKeNO
	 OHLHY4K9PQcvCY1rn0URjWc8ZlJ98Ju/HfNtwIPL0PW5R75634hQ0Wr5VpqEFc31B8
	 JxsZyKM/A3/HZYcjF9Z4l0VguPGIJU29iKdV7SQisN9Qc1roV/ywymJrv8cQT3vpLF
	 gh/4IfTZOHC5A==
Date: Sat, 11 Apr 2026 10:41:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [GIT PULL] One more Qualcomm driver update for v7.1
Message-ID: <20260411-adventurous-celadon-flamingo-10b27b@quoll>
References: <20260406132138.2265013-1-andersson@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406132138.2265013-1-andersson@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102776-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6A2EB3DF00A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 06, 2026 at 08:21:38AM -0500, Bjorn Andersson wrote:
> 
> The following changes since commit d6e766e391ef0b2be62682e007223fc72ba7764f:
> 
>   Merge branch '20260125-iris-ubwc-v4-1-1ff30644ac81@oss.qualcomm.com' into drivers-for-7.1 (2026-03-30 12:46:14 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-7.1-2
> 
> for you to fetch changes up to a31ad9339eff4ce401dec816b01a94b4e3c47898:
> 
>   firmware: qcom: scm: Allow QSEECOM on Lenovo IdeaCentre Mini X (2026-04-02 16:09:01 -0500)
> 
> ----------------------------------------------------------------
> One more Qualcomm driver update for v7.1
> 
> Flag Lenovo IdeaCentre Mini X to have functional QSEECOM/uefisecapp.
> 

Thanks, applied

Best regards,
Krzysztof


