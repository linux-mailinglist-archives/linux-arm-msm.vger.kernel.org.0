Return-Path: <linux-arm-msm+bounces-112021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VaXeE+++J2rZ1QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:21:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F350C65D230
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:21:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=n3VNPKH9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112021-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112021-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09FBB3053D2D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 07:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E345E388880;
	Tue,  9 Jun 2026 07:18:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB91C2D97BB;
	Tue,  9 Jun 2026 07:18:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989512; cv=none; b=mJOJlL4FWVBt3Fbt5pLDJ/Zu/ydP+QVVKx71NyWUh7ZN+K9DWddKctjuzGF3RAsjfTXpoIH9PlrWJWyxF/7A+FkaZbEPPcTnyMsoUS8WAmgN0Kf5Z9QtPu5lp9Lz3awt+a2hsIR+c7VJem6uwpOfzS+6s43JylafeJElwEGGKXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989512; c=relaxed/simple;
	bh=jB+9iYQzLWMOHTzqxJfSZdfoSY/mPNRWtrD+kyYbiOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wibrktle3+uphFmuUy1DKVx78+ka5iQYzbx4StAIS2kIVsGPpkDuD6rxTzz7Sw6HYCPZP7BOkvzXorKaxtunNBlYPOVnjxFUWpiG75kJxiF6q1fqdcKCvWI4xYdsP3TKM/R0Hw2R+VWKuo5EEgLFr3u4MiRxPgdcTm6RRfqsSCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3VNPKH9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB861F00893;
	Tue,  9 Jun 2026 07:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780989511;
	bh=D+j2bglNUemdqYv53Kc/U+NhITrTdZZ/fBecoxTIbnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n3VNPKH9LPbsw9TmWAzPZWnTVt71Qj5N33xRdeUqfjzWb1lJmGfVERHRNv5RatWdW
	 D3R9cu0xU/cncCBYYDP6J20SBn9fnOJq6hpglE+B7RCJPHfCBlC8BMmkVeEM/5WLqL
	 agxQxquDw5uZQ4wFIhc13YSrXsQzfwsd/zOqf22upEHXyOgfVvTqqmndkALbeOYpEX
	 POat0KSwpKQK0xTWHg16SF8nJsDn3Q4mNI3h7OBli/yuRQUsTq1b/rZwQKF5q3E3Lr
	 /rl1wWMjtA/ZFZkQLfk/ZV1gD+dW6NeaK4XA+CcqSyO8sS14uxX8Rr7CrRYHbRC/HC
	 IBRgkj0gQRBAA==
Date: Tue, 9 Jun 2026 09:18:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: qcom_smd-regulator: Add PM8019
Message-ID: <20260609-watchful-cyan-mackerel-8bc8aa@quoll>
References: <20260608-rpm-smd-regulator-pm8019-v1-0-c671388b9ea5@linaro.org>
 <20260608-rpm-smd-regulator-pm8019-v1-2-c671388b9ea5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608-rpm-smd-regulator-pm8019-v1-2-c671388b9ea5@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112021-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F350C65D230

On Mon, Jun 08, 2026 at 02:05:44PM +0200, Stephan Gerhold wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> Add the definitions for the regulators in PM8019 to allow controlling them
> through the RPM firmware. Reading the TYPE/SUBTYPE registers using SPMI
> reveals that PM8019 uses a mixture of regulators from PMA8084 (hfsmps,
> pldo) and PM8916 (nldo).
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  drivers/regulator/qcom_smd-regulator.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


