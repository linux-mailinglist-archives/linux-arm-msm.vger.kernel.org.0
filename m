Return-Path: <linux-arm-msm+bounces-116260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WkTOAjWIR2rzaAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:00:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5123D700E5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:00:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="OF/cjS93";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116260-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116260-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73CEC3008770
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 09:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B730423FC41;
	Fri,  3 Jul 2026 09:53:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283723B14AC;
	Fri,  3 Jul 2026 09:53:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072418; cv=none; b=amYYg85zZlXeVPpX8qERIz+akMyGuXlcOAd/xK2XdA078WhpYZb9h3ppGdbfgTRRk2fdzgNVLzv8fVCiQRku7XaO6vC4tX2EbBstbivScPh9my9l0VtSw5uuzL/mjFZ0VEt1rrM72NqBnsCnVLiOaSL5Z1aP+W0BmIUOq2hDyZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072418; c=relaxed/simple;
	bh=2L75dJp21IjSIQ4qqPVGE/oyVx9qhEU9GtCivqVwR34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/FH0yv3b0Dl8i9c3avOCdYVNh6CqzmHRc2HPeTpwuBZPrvdxsYGKCdyLk/pS0EK2a5ge/fC/QFrQUFANr2Wu52/4fQmd3raXPi/8Ag5mlDxJECuv3M2z9UuSk7/S9gy26C9007lORYFKsgeH1w2hFg3FvQj/eGChcIbBPACE0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OF/cjS93; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6E01F000E9;
	Fri,  3 Jul 2026 09:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783072416;
	bh=SaZwKJT1mcqlaSPlM+wH/cK8p/eu/JiBJQO7HD7Jt54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OF/cjS93JCz9fvJi5J53vzzUpmODrWEI0X+l/YQKubMaMw0PEOT9bj6Qtcuuw21lV
	 k3rXjNisHfWOUCrbbvL/oL+7UoUSYjzR7YZ8j8Or6SBy+ZQDWzaZMZ8l/2yq6KbQKQ
	 duI1KpGKehLTar1ABuFdOA87HhWl38/dMm8LJmwdf9OQbxZORCxvR8jmax8GoBcvXd
	 IFTsYy2O6NJ1i0/plQHiqsDO4MCn/4d7SBUEh70c/+JjYBitz03dQ92V0AcQCjRCxK
	 XTEJPcdZS4IfS7SWe74OacVgroPYYtB4pedEnutpbW467mhTb+NNXQ5Ye2nQJr4Av+
	 AF8YSANx2dn+A==
Date: Fri, 3 Jul 2026 11:53:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lin Li <zhuolin.li@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add Hawi video clock
 controller
Message-ID: <20260703-hilarious-hopeful-corgi-e0fa28@quoll>
References: <20260702-hawi-videocc-v1-0-6c1e640b0954@oss.qualcomm.com>
 <20260702-hawi-videocc-v1-1-6c1e640b0954@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702-hawi-videocc-v1-1-6c1e640b0954@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:zhuolin.li@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:quic_jkona@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116260-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quoll:mid,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5123D700E5D

On Thu, Jul 02, 2026 at 10:08:07AM -0700, Lin Li wrote:
> Add device tree bindings for the video clock controller on Qualcomm
> Hawi SoC.
> 
> Signed-off-by: Lin Li <zhuolin.li@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 +
>  include/dt-bindings/clock/qcom,hawi-videocc.h      | 64 ++++++++++++++++++++++
>  2 files changed, 67 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


