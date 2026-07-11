Return-Path: <linux-arm-msm+bounces-118457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0J1jErNdUmp8OwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 17:13:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D3087741EBA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 17:13:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kmuXmTNO;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118457-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118457-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 389F330065F9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 15:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756113191D6;
	Sat, 11 Jul 2026 15:13:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4702D9EFB;
	Sat, 11 Jul 2026 15:13:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783782831; cv=none; b=JTp5ZgyAbvuAH0PPlv1SFFOQGV6GQYMRwDOB2ow81Us/qf0Euw3BFY3A/xuc4EIAuBoeNlPNMkS6NbRc3MtALUUl26j9qY9TCcnsiuSmnFBLYWuGqVyAfgueMKvwiEgHXIs1dzAQnQ8h67Qt3/6sEyaYC1rln8fxAV8wPZMqIsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783782831; c=relaxed/simple;
	bh=v1BHfo8Xlrvs89hfhBo4Lk4XF9nbQ9WKyjABFD9NQ5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uHGpNan9Ldh+6+LS0iA87OEAjtoK++ENRyxgfM6hEpxEVb5WWp3zGbe92av/YC71kyFCOkykvH+P4D01DJ+/53162+GN0zfEdAvW2Rg1ZX3ZHS3ApP3NNabQlCJQBeYpJMm2Wr3dr4lqoLj7XpNXe5RIdIG/E+DEc+6tUO+NKCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmuXmTNO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A8E1F000E9;
	Sat, 11 Jul 2026 15:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783782830;
	bh=+NPRc3pxS/F2qlIp2S0rI/vJl3kJSiHMCR2dukHW7yE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kmuXmTNOg6J8DA+cGQLawuhxBUNOPVqHL6KdB2BnjRNLvWsoc+nQcck7ZBbX7JP1g
	 4VfIDEZ8uRY3AmC2p9JRiGDjFUm9b2OxaY9Tb9piqxplenYe2CAsTrm+GqDEemZzkz
	 iGH+pSfan8RHjzty1+WENNPYyyTCKdhheDgFR6JrrnNm+4TUIomNlYwR5m0jONAbJF
	 DSur1B9r1GVfWIuBuVmaEsXZrLTgcRlRdFK9NaglBzYOADw8UaoAhLLNcMo0qRKQqu
	 rBrYJtF4YRgdroRVSFhcSGSeIUWHCE2dCwZg9eBDcSbiySg77deooRE+beuJpYw5Wn
	 yGyXGW1NEFYMw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/5] soc: qcom: Kconfig improvements
Date: Sat, 11 Jul 2026 10:13:46 -0500
Message-ID: <178378282267.119479.4576908957568734087.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
References: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118457-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-pm@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3087741EBA


On Sat, 11 Jul 2026 15:25:00 +0200, Krzysztof Kozlowski wrote:
> Merging
> =======
> Defconfig change (last commit) depends on earlier changes, thus that
> patch could wait a cycle.
> Alternatively, everything through Qualcomm SoC tree, but then please
> keep these on a dedicated branch in case defconfig has to be shared
> with soc tree to avoid conflicts.
> 
> [...]

Applied, thanks!

[5/5] ARM: defconfig: qcom: Drop Qualcomm SoC drivers with defaults
      commit: 86690b3fabd66970e43f1d1fd4a9ed641850b924

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

