Return-Path: <linux-arm-msm+bounces-95052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0D0MO3eApmmIQgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 07:32:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 634F61E9A36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 07:32:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF39B302E7D9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 06:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B45C31D367;
	Tue,  3 Mar 2026 06:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QjHvkaYf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075E31E230E;
	Tue,  3 Mar 2026 06:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772519539; cv=none; b=QuSEySb5Bn/wXibIVhra023HUrd3sgC7w02vZWwJ16RgFa4StJDRrtyIRROYB36VOuhWr5b1Y5xyaRQp8mDLXkgR6n87w4BxeDy198CmFEQKXGfRoSw+/vPL6Rrmpxui4ZovWLg7oB2/46r60uwKzygaHyCsmg7q82TjJGj/E1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772519539; c=relaxed/simple;
	bh=qNRc9hbmwHNq3XXQICITZDpHOIS5X7xjtvMnD8iNwGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uyoyPaL0afoN33kq+q5DqO88y4h3A65COFRs8wjG3WPNmvJQ7OPCsqjvwLOpM9VXtSzr++K+dF86BMbCCl8wVh93iQCD0zJllISQ26rwZFOx7huDl3Jb3G/9CzLhiyuziUHC/CC75Q9cc0lBFzY8J/7knZ+LHGfS/pDyx3/wqq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QjHvkaYf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511E7C116C6;
	Tue,  3 Mar 2026 06:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772519538;
	bh=qNRc9hbmwHNq3XXQICITZDpHOIS5X7xjtvMnD8iNwGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QjHvkaYfCzoPHxUyy1MBdQ2r3dYPXpCeCtWYDcIG4p2VYYJjTNAAOCV8N0lGeIBTK
	 PFDSMzhkXrjZQmxYxUYI/e1ne+zGikWSyY8fn/kBr/PbyYmy+wjyz/O01Fw3q2FhNG
	 9OTRaSOcIol7BFLMLVWlR0CTe0RvrWpv4vHDsGSgVZcVs+rVopceMkDccbAVziJHRx
	 GAFMmtMV4CiiKfuT2RdJJhkHg9lfgcP93njx5vUQWDoSskHGNRC/clwrh4PhKxCOJM
	 peOvLe8UNTGVYpB6Oixc66seES0w2voKsjloXhO8HoEDrKCvfTbeNUEOHFR51/UxWA
	 Olj+ke088gwlw==
Date: Tue, 3 Mar 2026 07:32:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/6] clk: qcom: dispcc-sm6115: Add missing MDSS resets
Message-ID: <20260303-peridot-beaver-of-camouflage-f5ba7f@quoll>
References: <20260303034847.13870-1-val@packett.cool>
 <20260303034847.13870-4-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260303034847.13870-4-val@packett.cool>
X-Rspamd-Queue-Id: 634F61E9A36
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95052-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,vger.kernel.org,lists.sr.ht,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 12:41:22AM -0300, Val Packett wrote:
> The MDSS resets were left undescribed. Add them to allow resetting the
> display subsystem, which is necessary to avoid issues caused by state
> left over from the bootloader on various platforms.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/dispcc-sm6115.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


