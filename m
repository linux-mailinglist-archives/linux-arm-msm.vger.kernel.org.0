Return-Path: <linux-arm-msm+bounces-117719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vpK0CEBpTmqwMAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:14:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0751727D43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:14:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ll5GY6RH;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117719-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117719-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 739333245DF4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FE94DBD9D;
	Wed,  8 Jul 2026 14:57:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C02480DF7;
	Wed,  8 Jul 2026 14:57:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522653; cv=none; b=EknwW8iLlK1E07OWxj1/jThwKNA9K5cdP/MDei9LivgOd/hLBbgg3jyQ29ZVxyO8fC2uALCMly/B7uw7xiWGL3Yd7Py6g548eZk2f3zmnbnn8yny+v8gTI66EtOmFCIvSFPKLvKSwDtdlbSmJdsc80fSwLwh0oFVPctYt0U3584=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522653; c=relaxed/simple;
	bh=wumjCprAjjcTWsnWT10UXJXwin9qKCyloFM1PN9YTl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s+kvxEBuQLy7/h/wICiFodkHIZxqQrg21k63gZjr8cahlQSHoKmtYVl22OJpL6OOaav8l8Dct80zReBh/n1GFMTX6isHuqi7pxgB1Ev+COB1hxSJCYdiMt6pWulXba5lf/TLoh3VfP7b+X1td7utb+IXvW6Cz8zbvNIhLoT0jwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ll5GY6RH; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85E31F00A3A;
	Wed,  8 Jul 2026 14:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522651;
	bh=Oqi+e3rgaS9iDop7BcUIQJVZqw9Ytj4N3F7TOzeOzQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ll5GY6RH//SWAfVG7wN+Y/hR5c3GX64w6+mBzr4QZON/kqTxr8sMZ4VY4HIypkAxe
	 n7vsmi4sPhZzcbv1yGy7cgpzGiB0fSYHrZOMZHYHlOMZOszdSkTB0C3NSZgbW4gkgL
	 D+RyVZxKF/us8GBXHutN1G3sqAmhXg+VQpiTb5EeOXnnJpWiHHkuNreVNQ2jmLQ2hs
	 rYrFOzbKjp+6sfzVdbQ1uWnlcsBJaEr9U+S2E6gBtvZ+PQC2RgyWgMbEN1Muf6yFV7
	 Sg0i3+ubl+mRFB00hFUXvqhLWKX82SoCgJQiLNVW2APaBXPCjv8m+L5l80p2TtkZT4
	 N+sp9BYdgyW2Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Add missing PCIe global IRQs
Date: Wed,  8 Jul 2026 09:56:31 -0500
Message-ID: <178352261617.2235436.12290927660650329664.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610-ipq9574_pcie_global_irq-v1-1-6d6333b95c43@oss.qualcomm.com>
References: <20260610-ipq9574_pcie_global_irq-v1-1-6d6333b95c43@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117719-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0751727D43


On Wed, 10 Jun 2026 22:28:27 +0530, Kathiravan Thirumoorthy wrote:
> IPQ9574 also has the dedicated 'global' IRQ line for each PCIe controller.
> Add the same.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: ipq9574: Add missing PCIe global IRQs
      commit: 0b967a82e7b3c575af7f71df68d56e7786ab533e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

