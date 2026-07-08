Return-Path: <linux-arm-msm+bounces-117700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JAnQMPJrTmqSMQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:25:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 53623727F96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:25:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=luVhKy2R;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117700-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117700-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AE9C3096823
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85D049690C;
	Wed,  8 Jul 2026 14:57:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B5E4949FF;
	Wed,  8 Jul 2026 14:57:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522632; cv=none; b=ZDtXvN36hwYg4l1ct/sbfYWzJkLnXcDdtGMKPeS2QAIx/j2WI/e8I9nRfiNvqCJ+ddlNGboOZjLOrq9uLcE0BrEKfh3ARB1jdDqxugJyA4webFBvISHHsKv/f121EUhlsZ6+6540+4Z4sQhiJ5m55t2+SGS9AhsG0NisKnROKGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522632; c=relaxed/simple;
	bh=JwmKX8YjWh2FvF6dCk1g6aQY3r37YS9UiimQ8cyGVKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JqTQdySRtjAaGnDqFAlB1Cib9e+kIDH6xqI8nxWbolTrLg20iP+j4IRGXvGvZGd+oomUJOpL8B5CMg2375MTBBJBifm518MHbDxSjpSRbqPSRb+FAfD2lXJQ9GyNb2Jn9XEyPlGNLeGVCNM0lCgpOYbEMJV4NJQYLhIm6A/BAG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luVhKy2R; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BCA1F00A3D;
	Wed,  8 Jul 2026 14:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522631;
	bh=3B6uGRw36WDW+guedv3fOPchG2vtKYq9n01Rmt1CTqI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=luVhKy2RNvaBBbXsxSvRqbHMJdhsex9wefNGWvskWmg/yQoK7pSB8GNtSBev2d4SR
	 N5VNVd6BYoLKSbM98FdSHDJCg30tL7Alvz/l46n+Owp0hFC6HG90PnYlyo8NHpghl4
	 VdLoIwSPoBB8HDjZVtIfQCET68dV7Nzo1gu4DrEVvP5aV7QURc7fKki5bOi6qw6U9e
	 kKWmPG0au2ejRzjjziH2EbXYxVIn82JRqdIa+xtkIKVUsXxcc0CFZHYMUmajiJ5aZd
	 6oJCO6SfRG7AcLo4QJAn6uTt0A+Z8qrevvU0JmKlW0J7BvYM1lXDZZOXPdc53evber
	 2UBA00rcEYyVw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christopher Obbard <christopher.obbard@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8996: add blsp2_spi5 node
Date: Wed,  8 Jul 2026 09:56:12 -0500
Message-ID: <178352261593.2235436.460450292192515287.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508-wip-obbardc-msm8996-blsp2_spi4-v2-1-8b81a95b1ed7@linaro.org>
References: <20260508-wip-obbardc-msm8996-blsp2_spi4-v2-1-8b81a95b1ed7@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117700-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:christopher.obbard@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53623727F96


On Fri, 08 May 2026 03:30:06 +0100, Christopher Obbard wrote:
> Add the blsp2_spi5 SPI controller node together with its default and sleep
> pinctrl states.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8996: add blsp2_spi5 node
      commit: 1ba506e6438f5ddc26b02783009f6aa2978237eb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

