Return-Path: <linux-arm-msm+bounces-112645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d8f2LRxzKmoOpgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:34:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6E666FE77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:34:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VQBmbHPX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112645-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112645-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F08632BCDDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787C12D8DC2;
	Thu, 11 Jun 2026 08:30:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686C827B353;
	Thu, 11 Jun 2026 08:30:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166659; cv=none; b=uaWUvHei2MLKeP5HdPaqbD9FzY6GeUYdj3uB9BoRAgl+kkClZrndqex26tyRFaW4/rAUSnlzLPMQ+uX/6h/0gto79Zn0tvpGkYhHrKTI05OLdPr+VDxPUeWKoVdYsgX95FzMdsXpavX93iYTU0HoJnnwxr6vo9hsDySYbTLWSgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166659; c=relaxed/simple;
	bh=CVhWDpxXEpv6IDDg1dDTYgqeimdnwUkacOL1+OUOWCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raUsKRhPLR2wuyE9R5ucdtSYpCYpq9Ccyaqyu80cx1yCSG4D7vFQMZ0zdoNmxyRKjotv3AOl6s1u0MM+4T1Xj1QEHBQwsH+wgL03O2sz50jsK8e7JkCiO60Me7WavnX1rB0vl409Sc0ODXeXDZS0XWiS/b+CWZdI2DA07UUvlvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQBmbHPX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C70A1F00893;
	Thu, 11 Jun 2026 08:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781166658;
	bh=vtlzKaXJh9FWitTv16vzxrOT+QcbBfRSnmuu3ZFvB5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VQBmbHPXoDkIWUszPY3iwAMMn2Tu4Nh94J1tyo/Z3gCe45+lrCB7CAKdd+O8+iL+F
	 G5pLLck+sOvImR1dfcklIj+8GJPnDizoQrjq+nOHzJEr0Vb1ZW82H3Wl/DjY8UQ2i2
	 ftZYwFtxtzQ4GH6J8zNsr3jfuWogPJULP1VnLuY5A1WMfA/udfxZO3dW2PEkCnFySX
	 QF8vmL/EciLaYaxmUWWVo+yHalwG4Q09Q+8+dsfkAwm0r5FiV5ODOl5AneAQm99pGC
	 0UB7Pu5DJHl7SZ+lPWy+FgB/pAwRQJc+tAW4zxekuY0hO8EYuIarIQv21sxz2S2VAj
	 roLh5jbU5dIKQ==
Date: Thu, 11 Jun 2026 10:30:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Georgi Djakov <djakov@kernel.org>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 10/12] dt-bindings: clock: qcom,gcc-mdm9607: Add missing
 "clocks" property
Message-ID: <20260611-artichoke-dodo-of-camouflage-9e31c1@quoll>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-10-5e9717faf842@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-10-5e9717faf842@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112645-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,quoll:mid,linaro.org:email,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA6E666FE77

On Tue, Jun 09, 2026 at 04:14:46PM +0200, Stephan Gerhold wrote:
> gcc-mdm9607.c uses "fw_name", so it requires specifying the "xo" and

"gcc-mdm9607.c driver ..."

> "sleep_clk" clock source in the device tree. For some reason, this was
> never documented in the dt-bindings. Nowadays, qcom,gcc-mdm9607 has a
> dedicated schema, so we can just add it to the properties without any
> additional conditionals.
> 
> Fixes: 6faa7e4ddce6 ("dt-bindings: clock: Add MDM9607 GCC clock bindings")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc-mdm9607.yaml        | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


