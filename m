Return-Path: <linux-arm-msm+bounces-115537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8OzfLIcZRGoJogoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:31:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B066E7966
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:31:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lSJnHV0+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115537-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115537-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47C3130C3C8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C67B3CDBDD;
	Tue, 30 Jun 2026 19:28:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94275202F71;
	Tue, 30 Jun 2026 19:28:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782847721; cv=none; b=LhywwcuVjdqxtVEJYpi4VXj968c0Bnsj8NPpBoavOKvBhipeuJfaKInoMdYrQKq/9rSfq5YtbpD9UU8e2jndyLS3XLYpRGlWF3XVMkENGKUAkfBRJhB6z5PPpBRzpEUDNMrp4RO3DCwo9E8h878AU30vBdumWm6of3V3flGJsg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782847721; c=relaxed/simple;
	bh=/EOG9TUpt3hK/si09HBvt4AMoFa4sGWLRgcVcZAWwzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=opLtwMyPMXtL1I0BTtLb/8xksKAhF6QgfLVhyI22ci6vy/Ea2aM1HH2L77nmVAhQ1xCORGWHB20nDvgmppRSun+7t8u1TtQAW/iKJkW8Ml+mWMnOtHHcTAvYLjuOEIz91i4FaFk3+9+UFJmRB7ivd/vpEfAe8bZFxsKNTOMo/fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSJnHV0+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066301F000E9;
	Tue, 30 Jun 2026 19:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782847720;
	bh=3xUokEw784jqQMjsVSWEIlpIvgdkj7DJezvHEDxld74=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=lSJnHV0+4/HlK6Dfa3TlgXQOJUzfXRh45Bll5pkrCzjICnIWpk4nu2YnHV7Lwa/yL
	 J25kjic5DcursnlXyfXShrJOlzDW/rurYoFUewp023b3X2NqZGkeWWKRUnOdpJLuHQ
	 nYw6MZjcQacksfZH7wrSO5hWgd/oV9LhKARcy8+68nTPQ/GDz2LkMWuCfGes4NwoZB
	 zYDGKh5uiy8NhomL2Ct1agvdovSbFp1+uQDfWHScdJwlLjZRJVBIS2q+y7NKiQSsLL
	 651919KORECiUqE0cKqyd+SadUX2xnNI7+lyCNiksRDIq0D0GVHCiJCZxBPel0BfKz
	 J0W2jSfOvTsbw==
Date: Tue, 30 Jun 2026 14:28:38 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH 6/9] PCI/pwrctrl: tc9563: Add API to control endpoint
 power and reset
Message-ID: <20260630192838.GA223662@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-shikra-upstream-v1-6-e1a721eb8943@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:sushrut.trivedi@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115537-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bhelgaas:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09B066E7966

On Wed, Jul 01, 2026 at 12:32:48AM +0530, Sushrut Shree Trivedi wrote:
> Some platform utilise TC9563 GPIOs to enable power and
> control reset of endpoints.
> 
> This patch adds support to parse endpoint reset and power enable
> gpios from each TC9563 port node in the devicetree. To configure
> these GPIO's during the POWER ON sequence, two new API's are
> introduced: tc9563_ep_pwr_en() and tc9563_ep_assert_deassert_reset().

s/Some platform utilise/Some platforms utilise/
s/This patch adds/Add/
s/gpios/GPIOs/

  Add tc9563_ep_pwr_en() and tc9563_ep_assert_deassert_reset() to
  configure these GPIOs during the power-on sequence.

Wrap to fill 75 columns.

