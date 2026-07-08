Return-Path: <linux-arm-msm+bounces-117728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zbpbAjxqTmr+MAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:18:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4A2727E22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:18:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Wy60RoBW;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117728-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117728-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B8B0030690CA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3313B409265;
	Wed,  8 Jul 2026 14:57:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0979A3F12EA;
	Wed,  8 Jul 2026 14:57:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522661; cv=none; b=MC7jZxTbipK28VGkSIWVYxngRpsPhBSsSItfx/bM+jqBTnb8UtgSO0BzGTsUxZX3OVgoBAWediWuBkeSgYiEOXL54+Zz0QU7c1MGmCkGsbNhIJS+H/CO3e+7T2ATfPe384qgoufs8LHsZkYon0yslEIsWtax65VEZsq+lPfsLfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522661; c=relaxed/simple;
	bh=/q/fxWutOi1AxQ+tHHUPmXtl+rGuFBVU3ZQTpGi5Q2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KcAcN4BuSZQVEFywpKJMi0afqRD4ozD+FhYDue+rMVTJ0Rbcbj4it3Dj4Z1o/lxZkZIjeXzjcg96FQl9KyKppaD8J4xKG62UjUmejZBiyEdGRsnu6Kswss3mJ1Lajfo6ijFxJ+OvUXSA6tn+KPJ39D0HVr+879yuSWeMkAeil/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wy60RoBW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4001F000E9;
	Wed,  8 Jul 2026 14:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522659;
	bh=qba1OiBGywWI92XNauz/+tp4w4FLw/XVvQpVbQmURdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Wy60RoBWBca7IMaViUbLyTnc1+t0bhhtpZBkLJO4nSR6tb1HgB+nOX3CaUDTAqPM6
	 +gXOkWL27nbGxGXhCVVcizdM79Xtdj3BFqklHJfXIn/U4WaBaplYxoFiNT/u4wtbJn
	 69pHvIzwqg5iP15eGXOVbZy7hpXVPXbNHgUj/jaxisNwbOLkhQoEGGAuDBnNQT32QJ
	 R6ONmufGmAxouqtqBcnIfu57iWJkzkon9ye0iMEIrJn3rzdp+47tDVbnonsvrFypfR
	 NAYfAvEIl/xjeuTfa/7/++h30VdShwe9OisUixupIh01/O+TfVBdtpapQkvJdPMKmq
	 JFLPg6/azMQrg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: qcom: Few style cleanups
Date: Wed,  8 Jul 2026 09:56:40 -0500
Message-ID: <178352261653.2235436.5970190156058633013.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
References: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117728-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C4A2727E22


On Mon, 06 Jul 2026 11:39:43 +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Do not fix splash_region@e3940000 in Milos (damn ABL)
> - Fix indent also in qrb2210-rb1-vision-mezzanine.dtso
> - Link to v1: https://patch.msgid.link/20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com
> 
> Few style cleanups from my scripts and one thing pointed out by checker,
> which we will roll out gradually.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: Use hyphen in node names
      commit: 875828bc0db83dfc3fea8f0619d46f9aee9e3ca5
[2/4] arm64: dts: qcom: Use tab for indentation
      commit: cfda9e4f1ea927602352ba45071e7711ce379b50
[3/4] arm64: dts: qcom: Use lowercase hex for unit addresses and values
      commit: e252339d7ef9e1a8419a734931b9f820b1a2bf56
[4/4] arm64: dts: qcom: Correct whitespace around '='
      commit: e43584952ee7df0f72e8311341d780d84f03159c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

