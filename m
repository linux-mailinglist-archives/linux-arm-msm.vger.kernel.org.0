Return-Path: <linux-arm-msm+bounces-111767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id seEgOgSHJmqYYAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:10:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6966546B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:10:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=h18i9dEO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111767-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111767-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C3973045451
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52813A0E8A;
	Mon,  8 Jun 2026 09:04:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05911DE8BF;
	Mon,  8 Jun 2026 09:04:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909458; cv=none; b=NqokC8LnOw1+e2ArVwstZgFbCyA0K6uromfgH77bpYlG4ieGawZ04X5XPp3uBZ4cZSHOeNHxi9zfzsgEwaO5Z5jWuZHiTFwUd21LNUV4yQU41uTYC345j6XMWMDweJ8oCHIny57mulOuSpBrkdVU8PAKUilB9FioFvIfqhS2Fhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909458; c=relaxed/simple;
	bh=3wRF0QxJ3j99iS0To6w0zjhVZhWzcfNKvgz4aw2IFyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtlcY9EnOKnXsD+EvoFFn5J2ihzGsa00eaIFvTcZ493XCDJJsj3TLx87xOaVdWc6i6gCNIqiNwlInHUR4ET6fU5DyZVJFNiAlyT+FXjxEwzKxCvjOhHvHKynWRqaF2Vf5+CGNZ9U0c741rxjcPlmDvA+I4S4d+Im16UPcbwiaDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h18i9dEO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB931F00893;
	Mon,  8 Jun 2026 09:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780909457;
	bh=/tyfOc5RIX9dJ1onvopbjdS1gwhJ8hrCTbrl87kbOJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h18i9dEO0BHJZHXVYFRF1OgrNBsUBEygbZGDTKL6AdwNNNx7JoIKGm6hLaHSoc453
	 Uc82hWo2eGeC3XWHI+eWYv86ou7HpP0sYF4EMtXeUT3AQhJxi0dbMYt8ZEWb6S7nMG
	 23/vRhZXsOG5W7UfSwdTzBPsq3Hb6EmwbQYYmOjDt2zxq6blfs1ieAwrJgnE8TsWXA
	 o6p7Sbgma84t2QtLtPn9Y2HvbQRMS6GlKPojUHthH8HZvyXz3Un/lFJJFh07ACOA3h
	 8SUCjWOLGxHCjXfwacgrHjLzvTzgjbDxwLmfmUI8kjJsd3f5dAK5PNRy0wVGUu28e/
	 MWTFRpII/1bsw==
Date: Mon, 8 Jun 2026 11:04:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: sram: Document qcom,maili-imem
 compatible
Message-ID: <20260608-magnificent-turquoise-shrew-84bb8b@quoll>
References: <20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com>
 <20260604-maili-soc-binding-v2-2-21b5e9bd1aa5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260604-maili-soc-binding-v2-2-21b5e9bd1aa5@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111767-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,oss.qualcomm.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A6966546B5

On Thu, Jun 04, 2026 at 10:45:45PM -0700, Jingyi Wang wrote:
> On Qualcomm Maili platform, IMEM is a block of SRAM shared across
> multiple IP blocks which can fall back to "mmio-sram". Document
> its compatible.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


