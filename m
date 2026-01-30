Return-Path: <linux-arm-msm+bounces-91333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBwsKp0QfWmUQAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 21:12:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7D9BE51C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 21:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60552301112D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 20:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3D23161A5;
	Fri, 30 Jan 2026 20:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="KbIIqlXI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC173126C5;
	Fri, 30 Jan 2026 20:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769803912; cv=none; b=nf67rBjp8BTFnl1GqM6+evkNsL0aNdN4QWNVGhqHCoKqpBTdglV0gJXUYtTtDrJbqBdXP4ululp0E2V28qFZcmGpIgNcqBkDoMuqIDNXUCXgAXdwXc7J///xmYBV9BuqV+d59DfYdruvqJkT4PJodNe8QHgYdC7TAHtScyz4Bjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769803912; c=relaxed/simple;
	bh=jxTc22GnNEnbGoD3rMv2sB33PxMCvL7C9rOTcXjZCws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URmzeOSu3glrWWGbsIFwqSCmZBG7gZj2TZXSVr00CLWYmTDY3NzSD/TPQ9S1dxqpGBVepgohoKvTtU6828wWxyAvshvr/tZnzbXnQDhKvBr8TCxpoxGi+lIMHZMnZ3CgwTatv3O5VexEVUzEk5kv8pwcvbH7SoA0zAlhlDDdO9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=KbIIqlXI; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ausko735Zayn8G1dCNa1KKmdUArg6JEG8wLZlzNuMpo=; b=KbIIqlXIWWLVEsYfqlSX8vTz1k
	UZr8txxkqvJh/ToX/foEx8jWYKSgItnCBgxUIl54Iurd8EPzJ4s0pq6Seeu8ujfRkrnGyfBb4JIPg
	/fTQicfU9EpBQs2aki3zvlMOLJQERimytTKcyJkH/sigvmeH3MHMiR7jrxrWBxbcPpCw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vluqB-005WUp-NS; Fri, 30 Jan 2026 21:11:39 +0100
Date: Fri, 30 Jan 2026 21:11:39 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, richardcochran@gmail.com,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
	krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
Subject: Re: [PATCH 1/1] arm64: dts: qcom: lemans-evk: Add Mezzanine
Message-ID: <2f06ef50-619c-4265-823a-97e47d2f279a@lunn.ch>
References: <20260129172850.1175728-1-umang.chheda@oss.qualcomm.com>
 <20260129172850.1175728-2-umang.chheda@oss.qualcomm.com>
 <8ec07e5b-b83c-4e76-a49a-933420ab55d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ec07e5b-b83c-4e76-a49a-933420ab55d5@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91333-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0A7D9BE51C
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 11:53:09AM +0100, Konrad Dybcio wrote:
> On 1/29/26 6:28 PM, Umang Chheda wrote:
> > The Mezzanine is an hardware expansion add-on board designed
> > to be stacked on top of Lemans EVK.
> 
> [...]
> 
> > +&ethernet1 {
> > +	phy-handle = <&hsgmii_phy1>;
> > +	phy-mode = "2500base-x";
> 
> +Andrew could you please take a look at the eth setup?

Looks reasonable.

      Andrew

      

