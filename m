Return-Path: <linux-arm-msm+bounces-95697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wC5SBT8gqmn2LgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 01:30:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBED219CF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 01:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 507C13027D88
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 00:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9C82BE7D1;
	Fri,  6 Mar 2026 00:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+bVQ9HN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B03C207A20;
	Fri,  6 Mar 2026 00:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772757050; cv=none; b=MnyXgkvDHr9GFrIl8k6kanMM6GUc7/717OUW8vgM4Q/zGfa7QOskVbzo7sZqJn3dmFTDLUUlWMD3hG49irb+5QOctKIPY6kfib5voDkhWP8PsGxkDoNB5LqHkQa6IE7HvQIqB8F3AtwC8TDvGAqYpKxoZtQ/w5QZexCJb6scrp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772757050; c=relaxed/simple;
	bh=WYC43A9b8jtbhNz0YoSbpf+q8HxUhCunA8YjhxxW6TA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bV0zeiY6i/cFkvyi+kYxrxDE1XO529anBHs+AQSEm7QIg3FpIsrhru73Av313uQDhmgFJjV5IaDfc76NVBcCRrJ54giC1e6eA+j9HXCWE61yGN4+SwWm7JTeopP7Iecs/tKZSpKQcyRU6Jtz3RdjOQKb05KnFu19/mpHPrKbR+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+bVQ9HN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0CFDC116C6;
	Fri,  6 Mar 2026 00:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772757049;
	bh=WYC43A9b8jtbhNz0YoSbpf+q8HxUhCunA8YjhxxW6TA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h+bVQ9HNy3bJJMH6OOsFhTIdVCYRt7YTLgMeT6Ng3Cc7h1mOvk5E1RcbPfEzEHNJH
	 RAaaqpYlGYft4cbL+RVfwXe6nUBhjAeM8JSLA/Eh6dCbC1BSSfVs63LNTHKCcRaYqM
	 iIboV+p03pVoKrpx5WSL+nedC6gqs1DXpjGo0nIvNQ51NN6YF1hd1pfOX60siTj97Q
	 4/smsA3WEkrSrzrP0ggznZPovsRNT1MDyltAaOgC2jJkpS9mxecQ/WbAMVZwx6jyz4
	 ZB6BbA7g4F1nocjsK74tVkHJprIxay3nVbe61PaNKYKdfym1pYBZZBF0PLWVgg1GbS
	 1bzf05eB8+Flw==
Date: Thu, 5 Mar 2026 18:30:48 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Raymond Hackley <wonderfulshrinemaidenofparadise@postmarketos.org>
Cc: phone-devel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Max McNamee <maxmcnamee@proton.me>,
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Nikita Travkin <nikita@trvn.ru>,
	~postmarketos/upstreaming@lists.sr.ht,
	Raymond Hackley <raymondhackley@protonmail.com>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: qcom: Document samsung,coreprimeltevzw
Message-ID: <177275704847.856406.11424137082390066913.robh@kernel.org>
References: <20260223220514.2556033-1-wonderfulshrinemaidenofparadise@postmarketos.org>
 <20260223220514.2556033-3-wonderfulshrinemaidenofparadise@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223220514.2556033-3-wonderfulshrinemaidenofparadise@postmarketos.org>
X-Rspamd-Queue-Id: 7BBED219CF4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gerhold.net,kernel.org,proton.me,trvn.ru,lists.sr.ht,protonmail.com];
	TAGGED_FROM(0.00)[bounces-95697-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,protonmail.com:email]
X-Rspamd-Action: no action


On Mon, 23 Feb 2026 22:05:13 +0000, Raymond Hackley wrote:
> From: Raymond Hackley <raymondhackley@protonmail.com>
> 
> Document the new samsung,coreprimeltevzw device tree bindings used in
> msm8916-samsung-coreprimeltevzw.
> 
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


