Return-Path: <linux-arm-msm+bounces-92342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DEfGjYVimlrGAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 18:11:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D20B3112E5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 18:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAEE73067075
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 17:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832213859DE;
	Mon,  9 Feb 2026 17:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhumkFC+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8B725D216;
	Mon,  9 Feb 2026 17:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770656836; cv=none; b=a49njJ1q/I6dPoSjVGs0f3A4Z3C4exBV/AZ3LLOEytPxt5pjuowg+Gz5Aq5VubXlMpC7LSCmh8BrOwGCPyvgElEV5rTfazQXbp/U01wzM+XW31rLbG8rFDgQjytEo4yXMlS6A3NSb2vaIznFFQzH7QkFtDelrA0rXc3CT29KVLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770656836; c=relaxed/simple;
	bh=J+WYEI5OUDp7zyfOKZk30amsbMvkzUJwFhvzQ5y6oR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alWZtswq7zZjJPfA2AzUjGXEVRL/bMER9fg0rXGvvTdBdJbiDLO8DfTMHkfqfxVViV6ZyKJKUUVXBOazrtSUXtxRWxxSth4EwHJGYxuDEa0+EEtmn20I9flDp92mTIMwQwMW5FgrpKMbIm5E66C3YPXocIYu7lqXHE7bHgXQUeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhumkFC+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6057C116C6;
	Mon,  9 Feb 2026 17:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770656836;
	bh=J+WYEI5OUDp7zyfOKZk30amsbMvkzUJwFhvzQ5y6oR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HhumkFC++ogiQ7jS9HsG52pKyGtFBNa2XKipTyORg04zQgghJR5+IXxLpF7yoZdJi
	 NXCOHbpQFakxdR12+BWe/2Y5CHZJ/vTlRksXYTlvTOjHiHNEAOoNQVgbFw6MWsXbd0
	 dqmUOmTRjnA7DQJ++IxGgEA6mtOQFoJSA+E/PyS0oMdeieYjQVnjRFot10scPxHy06
	 V1Wt/Pdcx61uYC6MdGZMnYeM/ICryJOO3cfyeOv/wiIKPgPOOqBHGayBvTT+6Sq6dN
	 9gNOip0aJRl4SCaYEoe5oC+R140uR2DmRO9e8TKyQLuIAb5REZWr1OafYtg82uRBcj
	 Sj9JqbRBL574w==
Date: Mon, 9 Feb 2026 11:07:14 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kumar Sharma <quic_vksharma@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Lei Chen <quic_chenlei@quicinc.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8550: Add tz-log node
Message-ID: <20260209170714.GB1401643-robh@kernel.org>
References: <20260129-sm8550-abl-dtbo-v1-0-abca3be14024@gmail.com>
 <20260129-sm8550-abl-dtbo-v1-2-abca3be14024@gmail.com>
 <eef70e37-3841-47f3-a436-13e18c157176@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eef70e37-3841-47f3-a436-13e18c157176@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,quicinc.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92342-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:email]
X-Rspamd-Queue-Id: D20B3112E5E
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 11:59:15AM +0100, Konrad Dybcio wrote:
> On 1/29/26 8:46 AM, Aaron Kling via B4 Relay wrote:
> > From: Lei Chen <quic_chenlei@quicinc.com>
> > 
> > Add DT node to enable tz-log driver.
> > 
> > Signed-off-by: Lei Chen <quic_chenlei@quicinc.com>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> 
> It's nice that you preserved the original authorship.
> 
> Please extend the rather lackluster commit message to explain the
> "why", which is notably different from the original downstream
> addition, since your goal here is to mainly appease a grumpy
> bootloader.

Humm, that's certainly good to know. Though I don't think it will help 
the case for this binding.

Rob

