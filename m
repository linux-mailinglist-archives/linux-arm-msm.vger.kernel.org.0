Return-Path: <linux-arm-msm+bounces-117093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KJKAAmZxTGqQkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 05:24:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 828E07170A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 05:24:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PxbPt4rw;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117093-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117093-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB0C130672AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 03:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E027437E2FC;
	Tue,  7 Jul 2026 03:21:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D82352005;
	Tue,  7 Jul 2026 03:21:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394515; cv=none; b=VrSYTJ7k1eWtO4B5FJ+/gOIPdkvBm0BSAwxjDBUGP2nzNuZNE97weDn2C7yQVv48SgL6DqNiaELj9xCm643u/I4mVsaaN56AlZ5jPt6eQxJf2F1DsQkZTnM9O/WeFzWXKZ+oxMZ5kwqg+exRGhkPLV1K90MoffR82Ejck0rtbFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394515; c=relaxed/simple;
	bh=i0zTWYp4eomofffZxLfQys8DIT3WICFBOm2KljJFKC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HtdffNILHGL3gfWOV+W5YfSTfKl6B49KC0WoHZmaedzfa8lCUcIFLFQ+qxa+PpKnONUso6i4Qyd4dQGY8jVOkJMbcqZmH5juUp0nXMTGmtMZ9RztLEFbcLOKPVP45E9n4ZhkW3rZt69d4Ze5WwjO9blokSPSzLkhaFgrXp7778k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxbPt4rw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E7661F00A3E;
	Tue,  7 Jul 2026 03:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394511;
	bh=7JCcMo7dAqtxx7WarVnyQrs/nKqtwRpOuvjPyWW92Qw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PxbPt4rwo1jbIIbBtD8uJ9eVcDVxpi+Ctk8NdtkvakJK3kHKSJHoKHCM+Ddeucndh
	 /u4T4dqWzIa5sw53EnWs9DhPniI6SEr6CCKM1PW1P+5kkNkPk5efFgK9yay2cbp72l
	 aK9DBwjFNhKskRo4Ov2jMH6Lu0NBmg38IYequ3S7P4Nx/e/ilCdNDnipct9CyVy+Cr
	 4Ra3DxwLWs3KFsyLqRiFAHt5Z8Dzkt9f+4g+gE1rUxm1d36i9XGbBEDscKLfqIIjoA
	 1+PkP2bwn8PCjVBp3exw2bJJgwcRIpRGuGimA/0WbSHbAeE45SNOUI8AfIdrelVwYZ
	 l+cfxZeaeR4/Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luo Jie <jie.luo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_kkumarcs@quicinc.com,
	quic_linchen@quicinc.com,
	quic_leiwei@quicinc.com,
	quic_pavir@quicinc.com,
	quic_suruchia@quicinc.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/5] Add CMN PLL clock controller support for IPQ5332
Date: Mon,  6 Jul 2026 22:21:26 -0500
Message-ID: <178339449900.1938770.10101763662447473602.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
References: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117093-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:jie.luo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:quic_kkumarcs@quicinc.com,m:quic_linchen@quicinc.com,m:quic_leiwei@quicinc.com,m:quic_pavir@quicinc.com,m:quic_suruchia@quicinc.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 828E07170A5


On Tue, 06 Jan 2026 21:35:09 -0800, Luo Jie wrote:
> This patch series adds support for the CMN PLL block on the IPQ5332 SoC.
> The CMN PLL implementation in IPQ5332 is largely similar to that of
> IPQ9574, which is already supported by the driver. The primary difference
> is that the fixed output clocks to PPE from the CMN PLL operate at 200 MHz.
> 
> Additionally, IPQ5332 provides a single 50 MHz clock to both UNIPHY (PCS)
> instances, which in turn supply either 25 MHz or 50 MHz to the connected
> Ethernet PHY or switch.
> 
> [...]

Applied, thanks!

[4/5] arm64: dts: ipq5332: Add CMN PLL node for networking hardware
      commit: eba1bea1123924f8bf187ad175d1667036f34e80
[5/5] arm64: dts: qcom: Represent xo_board as fixed-factor clock on IPQ5332
      commit: 985650336dcfe8fa640196a49956c5983dfe2696

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

