Return-Path: <linux-arm-msm+bounces-100333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CG2lAxeJxmlELgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:41:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A155B345739
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:41:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1407231556BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AFD03016F7;
	Fri, 27 Mar 2026 13:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="koYe2/iX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBAC1FBEA6;
	Fri, 27 Mar 2026 13:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774618335; cv=none; b=lptaHaUOpcsaAAONZqLrmIEWPADJ384j/McKnWKYAHagerXFd8qcUIcGkslstHgh3Zmlp2xb51Y/0gdWPjcl1TwrBkNjtHTHKsCQjHzIzf5oVxXjbjytn8xAwNBnnaW6zZfIRmcFD399BIlBjAQbYggxyxRfwokoVt3Z+onpOEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774618335; c=relaxed/simple;
	bh=QzVEVgQdSwSPj+ybLHaV797Xnlkqu8w3/Dy5geA+o3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elKG0+qreohA5A0fkS7EdBueFR4bEkvlz6z0ErZsg2F32FyGv1ihL5qzzLSeacVYPr3ynTTvYR1V/sEAdEhdwhZgMj+68SYaGUyzkxouAr0yXVks8JOzTYIABcY/ppMtzy6oUEWkgtgVvbEYNzNSZsucNTub20Sfys+StSrczpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koYe2/iX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E02C19423;
	Fri, 27 Mar 2026 13:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774618334;
	bh=QzVEVgQdSwSPj+ybLHaV797Xnlkqu8w3/Dy5geA+o3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=koYe2/iXK7AbnXwwLFNSPqDecAX6xgm4SHtymmKfhin1OB1mqs3oDulI+rbn2G9jS
	 adQRwwrtvLKL/fMNP3Qzyu/BEaJYfnKBrWWBbQXt6SfTvMqG5aBjHAvKcYJyW2zNQe
	 j8D3n/EQEKyt6gy02C9vsp3psDk88GFr+/RMaYBPmBglKER8GLRv1HMKwcRK4dxdNk
	 oA5T6QjBH/dhuaCuoMSOdlhp/eTGlltJLlh5p7AoIeic1axVcbHAekq7FLKLXBBQV8
	 FCZ8LKg0eqJ+7w1OxRRw0ln6OQZwqhFY403jxhwF+beGVqALrqvzX+w2fq2UlDl90e
	 dQfGxoTDOk8kg==
Date: Fri, 27 Mar 2026 14:32:10 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] i2c: qcom-cci: Remove unused CCI_RES_MAX macro definition
Message-ID: <acaGe_QV0urIUSIa@zenone.zhora.eu>
References: <20260326165345.762807-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326165345.762807-1-vladimir.zapolskiy@linaro.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100333-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A155B345739
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Vladimir,

On Thu, Mar 26, 2026 at 06:53:45PM +0200, Vladimir Zapolskiy wrote:
> Trivial change, a never used macro CCI_RES_MAX can be removed from
> the CCI driver.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

merged to i2c/i2c-host.

Thanks,
Andi

