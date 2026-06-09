Return-Path: <linux-arm-msm+bounces-112020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QfDHCse+J2rK1QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:20:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B78C65D213
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:20:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fzhT2bcc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112020-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112020-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 368B130316F2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 07:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BFF7356746;
	Tue,  9 Jun 2026 07:18:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FF133F5AE;
	Tue,  9 Jun 2026 07:18:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989490; cv=none; b=Aso5ATNsjJ0J2/K+nZb4k8Qy/3EfuvCUECjOI9LgbdYYkBt1EJlDntbgBspu8u+gNzWAv74XtLzhO5LZDxDTNFcbewH3mUIOdD5Y7P/4XJ5Le/+odXfXRRgSZ1NFccjSwJQW5o28pb5HhM7knA1DWBeFgL5EzCNVj3joH6SLJ44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989490; c=relaxed/simple;
	bh=lu+Rb/49Rz7y2O9U2JPduslb4hbvFoCzHRjeVCvgAaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5wJ4b8oyvp/M3knfL/Va1MULOiD8x81LedIHkAKoarT0TSsUqyCXG/okPSHBYimGIZFE6Jc/Zp6frmA9qINvPwR3tcns1pIMGiJSCQjlXkVSNI9az+umMkeZ30iBiVa6Tyb3ZGKpeaxhk+3jT0ajkcllTFdjYAKWQQfyhDEyzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fzhT2bcc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A46E71F00893;
	Tue,  9 Jun 2026 07:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780989488;
	bh=mz8ojFXLgCZAzcSHeznkvPuCX2+1KU6fdTaN2fyFoUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fzhT2bccfiXtbo8YlB8l5FmgXgR/6ljjFGN+dE0OkiLiiH7jaMcCEz+CD8yfYVK3f
	 g7QUADv+7yz2hkHLOoC51z7ireNpprWyYjlw3b4LFIBvGhDN7ckm95s7OXoPdlujVb
	 XceznKNt5tXjUBPdQw7N4QrG4XfpW9DCeFUlKWt7+HZhv6dfxG3ZSrSzlNHMYtW4Cy
	 651M6k4Q9Q8rOSHSGqFO3gkESmDdJrC8l+e2AYDmD1LSwrakHFqvGuJMevkxmdq08p
	 GEfzX5xdiSCFo9BrJ2rQtFakdPOHyDfybJUbWGytEFzOoTBbAYc9bNALDnR0fnC+qg
	 X9rc1mquDll1w==
Date: Tue, 9 Jun 2026 09:18:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] regulator: dt-bindings: qcom,smd-rpm-regulator: Add
 PM8019
Message-ID: <20260609-amusing-cryptic-stallion-bb209a@quoll>
References: <20260608-rpm-smd-regulator-pm8019-v1-0-c671388b9ea5@linaro.org>
 <20260608-rpm-smd-regulator-pm8019-v1-1-c671388b9ea5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608-rpm-smd-regulator-pm8019-v1-1-c671388b9ea5@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112020-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B78C65D213

On Mon, Jun 08, 2026 at 02:05:43PM +0200, Stephan Gerhold wrote:
> Add the qcom,rpm-pm8019-regulators compatible to allow describing
> regulators controlled by the RPM firmware on platforms that use PM8019.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  .../devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


