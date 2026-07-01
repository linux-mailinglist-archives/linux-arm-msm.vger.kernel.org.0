Return-Path: <linux-arm-msm+bounces-115781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4HrVI1xyRWrEAQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:02:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8BA6F13C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:02:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Yr5NZeCZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115781-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115781-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8F31305B493
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 19:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BAA35E950;
	Wed,  1 Jul 2026 19:57:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544CE3033E1;
	Wed,  1 Jul 2026 19:57:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782935868; cv=none; b=iRPQKt1w30gwnHpmQXXRlBIoNZ8bLHE+0E+E/LjIYnrp7SQi+cVKeGI+KMFA0WyNr+oU8B64f3b0aKIiRSPUuPjDWsL/WNpfKuKSh/7zsE7lbMNoshaupMTdsMy/WqAWu5FSLdRzJSx/HIxpn0qw74maG8TgOFCQmIAAVR0ZLy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782935868; c=relaxed/simple;
	bh=CxLRqTBgzkQaCEBILNZMW3t/HVZ9PM6TBFwHKmFqjDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkjCLf4sMx4hggxlkg+evWvhzVPWfdK9C+Nm4dbTuAB3ujgygdFIHatq7iVOKz4/PWwpai7CpZcv4eVEQZOKJcYUSsWvsvMcDsFpe5iwgyffzrVWOAtK2GsP7dDxrAxWdncmOJeZckXH8g63Sfu0/uZ753fUYwGV2J7k/4t176g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yr5NZeCZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1AD1F000E9;
	Wed,  1 Jul 2026 19:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782935866;
	bh=+arrMtj0DzOjS+9coYsG+5hWSiHSvK3/4PG3jfqqWpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yr5NZeCZXMQmA5hZ9BLTzxWyf0sMBJtUAh93FS0JWrS/CdsboO/vt63wwXZH6iFC+
	 t+X4Z8AF9n3L0gM1g9aSWugOXbgNRCsIHsT2HOnt6kELthS6/Di4isS9ASFJ7I58V8
	 QFzVFxElIhiU2jwyi69Ge1hQ1tKiv0fMN2IC4JKIKPVXUkZjMomiX7fHV8Idbd/Bc5
	 Bqmj0MBrdu9jOiOP7zZxHMaWyIg79f6mPNJJx6u/VXtbkmDHjcVEcQB560fd+bswqV
	 bK5Rrh7hdBJdmxXl/Rg+gtT/aZGOa1RE7vlIbb96TrP3w3kgBlvjV/zTm9nf1lL6BD
	 tWCJ5HRr0fRVQ==
Date: Wed, 1 Jul 2026 14:57:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH] dt-bindings: sram: qcom,imem: Narrow allowed reboot modes
Message-ID: <178293586432.1654597.1308385994723132950.robh@kernel.org>
References: <20260701105832.197036-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701105832.197036-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115781-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andersson@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA8BA6F13C2


On Wed, 01 Jul 2026 12:58:33 +0200, Krzysztof Kozlowski wrote:
> Only few Qualcomm IMEM devices actually provide interface for setting
> reboot modes, but top-level schema allows "reboot-mode" child for
> everyone.  Narrow this to specific compatibles.
> 
> syscon-reboot-mode schema allows arbitrary "mode-.* properties but only
> a subset actually makes sense and is valid.  Provide negative look-ahead
> pattern to disallow any modes not supported by the device, which
> tightens the binding even more.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sram/qcom,imem.yaml   | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Applied, thanks!


