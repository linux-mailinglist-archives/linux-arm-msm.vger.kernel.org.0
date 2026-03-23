Return-Path: <linux-arm-msm+bounces-99302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHQkCTJTwWkYSQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:50:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B39E92F548A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD8563045020
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A723AC0F8;
	Mon, 23 Mar 2026 14:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S6ih3iMy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FE91FC101;
	Mon, 23 Mar 2026 14:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276090; cv=none; b=kNimWC0gkSrZ0epXGEZoIfmRPQEwmAG87JTEpQgGJ2ZvhU7WR9O1QuMgevJehUifBZMtam27pjSoTJRM10q5QE0uZBvzXklyMk+JfN4btNrCfIw7povyFSIw7AgpzsJ6PfCBfAvcQ5BtXxQOHC+VW1XIw6vKRwiVz1uTYmjFZFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276090; c=relaxed/simple;
	bh=mbtEVinGGoFAGG65jvCAfLcX2UZyN3FkVZ6ahWjHf6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpE8uPZTQYXAhjrDpnbhxyqquoFKGYyhu46LIkkIOGTCb1wNnMNb6mm2ysay3kGYY0ewikpPG+MuJojUb7p8Ob28le4Jrsjk941oTscD7hVAT1tw1gBMz0iDnPQjd3H4TqgNSvm/27cNQWsJ2FG/fySxCffSO0A4c4Go/n5SLM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S6ih3iMy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B296AC4CEF7;
	Mon, 23 Mar 2026 14:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276090;
	bh=mbtEVinGGoFAGG65jvCAfLcX2UZyN3FkVZ6ahWjHf6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S6ih3iMyXrsi0EnqMWySm5wMlW5EMOyV32wgtDiiGuz872SA8ND9mI1HGWfphMT6I
	 TRMw/nGeHp69L2RIzqkrgyBB0jUov/+iy6JZwnu/kSQF3d7Hcs6rrEVmb39f45kYxo
	 o9xJJWi60jVrV9HcckgoqiBsNZUHpQj+fHXyiAB1lrfPgX8E2V1GW1M4ua12d6lMyE
	 gXeccf2zufyGXf0cUXamz9j4mQQ/FL3QNTmCiptOnWmw/EPnRY7mjLDzGv4i5LS0p1
	 Cth4Lk73T+DEPPr6JdiQ+dLB1ZsxrgOCXSY7VKnm7KBTvlL0eUK+wCji2TiuHotk03
	 9VZKdkh4ofOxA==
Date: Mon, 23 Mar 2026 09:28:04 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: glymur: Tie up the CX power
 domain to GCC
Message-ID: <acFN2Fqp9yE84q3h@baldur>
References: <20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com>
 <20260309-glymur-fix-gcc-cx-scaling-v2-3-d7a58a0a9ecb@oss.qualcomm.com>
 <eeb9b49a-c879-46de-b272-30f601947d99@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eeb9b49a-c879-46de-b272-30f601947d99@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99302-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B39E92F548A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 02:07:01PM +0100, Konrad Dybcio wrote:
> On 3/9/26 1:08 PM, Abel Vesa wrote:
> > It has been concluded off-list that the Global Clock Controller needs to
> > scale the RPMh CX power domain, otherwise some of the subsystems might
> > crash or be unstable. So adding the RPMh CX power domain to the clock
> > controller which will result in all GDSCs being parented by CX. This way,
> > the vote from the consumers of each GDSC will trickle all the way to CX.
> > 
> > So add the power domain.
> > 
> > Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 

I'm expecting this to be resubmitted with an improved commit message.

Regards,
Bjorn

> Konrad

