Return-Path: <linux-arm-msm+bounces-104736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Nl9DxFh72mHAwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 15:13:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 885DA47337B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 15:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54C1A305046C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66ED73B5832;
	Mon, 27 Apr 2026 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EvV8c97/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90642248A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777295460; cv=none; b=dTnLvMyVc8wNgodv48c3fUBKLcaboilZG4EvjMMSSVhLRV5oeaEzu1YhWiB72SnF+Ym+X6+bfitG4n7koWdUZS+Yp0CiwyRSQ7Bjc1JKBZ/wWOuIOPGR0zdlKolOmM6ssfpO7RTpl6BvsTyK/ANJXzIU50eWFzdXMUMAYZIoo9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777295460; c=relaxed/simple;
	bh=EQ2uiCLaHKjqSFZ3k4aaKc8L453bOMJNJLTLJriu14w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RilblNWUaZKOtFOxWL6zmLap4tnuyE6cFFWPPOwgQ4D79/ufV4mxMsILTX6bpN8nj9ekp6NQIINB0kpigq/w13AD2vEyH+KHHVB6ypepnzzsOwTWjZh+5W+MJTVMB+ekwkb26v/kBi059TH1rQchPNT5vMswCO0mMfRK4lAn+OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EvV8c97/; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 962B84E42B31;
	Mon, 27 Apr 2026 13:10:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CC58600D1;
	Mon, 27 Apr 2026 13:10:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75F73107281E7;
	Mon, 27 Apr 2026 15:10:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777295456; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xpDUCOTuc5gf2Sxw/4nKvzo3zaGCVXqG9hue6PkGoAM=;
	b=EvV8c97/rxPSmctHOR21Cf//fWwDV/QjWeUhh4Gzy4EL8eW1bF0/YkRt0CHU3zbf9r9Lf0
	Kp/kpIcgmPX7uBsZKC8KjFAMOwafKjIn+Q1mNwKTByo9A/Is4+Nz2Rsf1VsKlufH+h1JGd
	jZN180iWZ/59LUu/PYtp8KFmKJOuB63FABlChpl8NIYN3cnXxvEzwgERoIUWf11oeR3mmh
	pNvcFhCyutwQm3hbThA2PWFfPyY47ylIu9bYM/bee3NxWkX70lWgAHYCdMtLjurn+ZOigs
	IYEm2yW1WDNni7LE4qR6QXdluF2/MsTPaVXztGcMDHgCLWOW8ckSfLvvFaXs2A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: =Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
In-Reply-To: <20260427070104.18227-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260427070104.18227-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] mtd: qcom: Unify user-visible "Qualcomm" name
Message-Id: <177729545696.184276.3545705253539297866.b4-ty@bootlin.com>
Date: Mon, 27 Apr 2026 15:10:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 885DA47337B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	TAGGED_FROM(0.00)[bounces-104736-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, 27 Apr 2026 09:01:05 +0200, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
> 
> 

Applied to mtd/next, thanks!

[1/1] mtd: qcom: Unify user-visible "Qualcomm" name
      commit: 01f9557233e3c04be5c6705864d390682f5d7236

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


