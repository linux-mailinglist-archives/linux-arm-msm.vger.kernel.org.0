Return-Path: <linux-arm-msm+bounces-117071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FI0hEKtWTGpmjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 03:30:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8494A71698C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 03:30:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bhVZLcrJ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117071-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117071-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B530306BA84
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 01:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F729324B31;
	Tue,  7 Jul 2026 01:27:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151863161A2;
	Tue,  7 Jul 2026 01:27:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387663; cv=none; b=Ov465hLy86bV3CmumhnbzAyRYRzP11q4NAS1yRHfLVK/X6s0S0acFa6QRNTBoQNY54O/cmYYI7tLxP4tMdmcpimU1mFdHGXq8t/5K+VW9xP1FV4c1uTV2+mq0jNs6IQ8Nbt/V845T5nMauxGs0YL4s9BqnUekfC0i5vqionnkp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387663; c=relaxed/simple;
	bh=dwNpSMECq9gYVh+Eo6yucJmIIh57a4o7wTKks07Y5RI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sf2uzY/mKF5PZ8NObKWVQHEg5GX+oCa1GFgIV766GAB7ISsOnDXgkMbgFFMfql8ypxiVqHkG4gqzz8kAKGY2MAWtL26m1q0p5qK9qBXyWwmqA5seyyp+3weLIPGD2BKjAIquNfA30ctZ1v87FzVwcEPvTeeTccfZHSlWYIY0MVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhVZLcrJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548A01F000E9;
	Tue,  7 Jul 2026 01:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783387661;
	bh=3PbBPhtx9PJtDL0zN5XogJ97GElbZdrfIuaDp68YGI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bhVZLcrJwg9ZphUYQLdJM9q3B3K1s3M+Kw+jkueXv/vnemg8wUuthCuFRYEl0jmsN
	 wKuGm/U4hupmcdq7n5Xe7Dp/Fa6zpbRzL8VZ/XCpAUnUN6nTEcAnCl2Bej7p+sHkbL
	 DTYrrJnOGJpq/SLnpSSJx0JaWchHQCkBLH0NPgvP6ccIbPYzqklm8sE6n8DZDFGzgG
	 EdU3j9U6P2Z4mcLOpfPSzZ2RKi5PQHVDyG6hckww/Eesl+/kGBkteIXWn8OVzXAQGu
	 jX+w64UcYNDS8ZBEXbp/cFeQXafi3w74chvLOq0RLKfeiZUEwT7emjmhQ/Dt6lZzOs
	 m33bm4C80hEBQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add wakeup-source property to usb controller
Date: Mon,  6 Jul 2026 20:27:23 -0500
Message-ID: <178338764547.1558388.12259202020411719156.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702184511.442129-1-krishna.kurapati@oss.qualcomm.com>
References: <20260702184511.442129-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117071-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krishna.kurapati@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8494A71698C


On Fri, 03 Jul 2026 00:15:11 +0530, Krishna Kurapati wrote:
> USB controller on SM8750 can be configured as a wakeup capable device.
> Add wakeup-source property indicating the same.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8750: Add wakeup-source property to usb controller
      commit: 2f57d03ea7b78fe24fe6f965d65fe1ff9eac60ed

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

