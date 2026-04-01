Return-Path: <linux-arm-msm+bounces-101337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFOsNWQHzWl/ZgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:54:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED74379EC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A1B1E3034ABF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 11:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C277E4014AD;
	Wed,  1 Apr 2026 11:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qCUAPXe8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB90401A05
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 11:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044077; cv=none; b=Z4TR9eT9g5GZk13IMwjlPnF48/tWgLgPXjFt4Bi8YZ2JGNari6F1fawTZUHvK9YwlMVr9EeItR+B/uTNHpT+aeNW3FMXX6O27c6UrbpsMa0l4ClNYyjkoZXyE67xIVK+k09BxTJASf36mQZm0alk6ypfnhIh4W64lKCJ/yKe3jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044077; c=relaxed/simple;
	bh=J9xPXY4c9/hlpTH54aV46gW8mH+CjxJY3bUqufY9wWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POFDhzb1fDdxRB/TyRwFAqnhv3NHujHKpNaBU0rUU62mBQySQST00tygnu8r0OflCDObDe43TAmZVfKZOp7re4XpuACAMza6TSYmvbawebR+WmPnJVPq+BYGfYiJT7mN8jirkfDM1DjtniBB1ZDxha+mc0Ei9o+btMF1s4OS8Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qCUAPXe8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0207CC116C6;
	Wed,  1 Apr 2026 11:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044077;
	bh=J9xPXY4c9/hlpTH54aV46gW8mH+CjxJY3bUqufY9wWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qCUAPXe8wR4D4KukxlibgmO7f8bkBCKfigB8j5EsIT6B+kKoZfWDz32pzlW44cQPS
	 O3MsLv002aQXCfUP8bktnHCfMQ9QcDj2mK2UU8gSBEdgjQBUTttDax18FD9JcEHpJZ
	 PnlJlLmc675E5+VI9L8UeQmCXpDRKE4varWRgAWJTkrK5j49rzmYphOcDbsDZYB3yE
	 6IPX7CdrVcgXZqF9m4v7O9Is70CeQkaApRxPLb6Pp4mIBfEyzh72ohmvI1X2poKEHC
	 Q1rNamnM9jl0dm1j8N4qJT8UZKO75NLgRa/7heioNLxzuoAZm7u6IVkge4QmDqkvhf
	 xU9zzyacEXuHw==
Date: Wed, 1 Apr 2026 13:47:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [GIT PULL] Qualcomm driver fixes for v7.0
Message-ID: <20260401-mighty-crow-of-upgrade-b17bd3@quoll>
References: <20260326133119.66268-1-andersson@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326133119.66268-1-andersson@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101337-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6ED74379EC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 08:31:19AM -0500, Bjorn Andersson wrote:
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-7.0
> 
> for you to fetch changes up to a343fb1e03cfc9f6dc83a5efb2a8d33e9cdaf6b9:
> 
>   soc: qcom: pmic_glink_altmode: Fix TBT->SAFE->!TBT transition (2026-03-18 21:51:11 -0500)
> 
> ----------------------------------------------------------------
> Qualcomm driver fixes for v7.0
> 
> Fix the length of the PD restart reason string in pd-mapper to avoid
> QMI decoding errors, resulting in the notification being dropped.
> 
> Fix the newly introduce handling of TBT/USB4 notifications in pmic_glink
> altmode driver, as it broke the handling of non-TBT/USB4 DisplayPort
> unplug events.
> 

Thanks, applied

Best regards,
Krzysztof


