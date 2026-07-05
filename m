Return-Path: <linux-arm-msm+bounces-116609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CCWJEyzHSmoEHgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:05:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E8270B6E4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:05:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eOiVejbD;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116609-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116609-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A93F30B8FD7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 21:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB803B8412;
	Sun,  5 Jul 2026 20:58:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDA73B8128;
	Sun,  5 Jul 2026 20:58:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285109; cv=none; b=dFuQ9Q1F9bl2jn/X04YTS53EQsrknFIa/nLuXLF1hhhoQhRxSyGdF3WbaAvxBtR8DAYm8qqSJJwijeURGu+8ZQgS8TLoCDwCnURBUTphWw1OTAS6j85j5EzGNkn+8rOkwEpdw5batkLoAiK7inTIp+DpT8m31KTXc93JazaYY3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285109; c=relaxed/simple;
	bh=PQ2lPTC7NpTNNgxQP3TW1oGfNbL21feBWthcc9qvV7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hOBiJffEY0vYKd5jOhMDbsOlOZADtdVegEM2Rq9drE/kQwiEPsLcNvj1B2zDNJx7wyAOeBOsyGYhimkeKet5sMjJ1tz+bwffxCUowoXTP8rg047NThFpQwac/KMxNeXjhdjuCmyP5/RU3sctOLRumJUrlFcti/Gxnnm1L6jfV04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOiVejbD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8F61F00A3A;
	Sun,  5 Jul 2026 20:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285108;
	bh=Bl1Jxdvc6GwyfXCq5ELid+03Ej5gq/wsr021ZiMEBPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eOiVejbD8WPzbsh6xPCinJfU2Z1oTjVwT2f0q53XpLUqfhGrdugDoPV6bmu3AzlN7
	 rMNC3GsmDZH8W7NNQUCsbLUzHnEn+Pln4Ki1SZIIYm7PoIDskVFISzN+Xn/7i7rO3R
	 PRHPjAk6qxB0A1xcxTaB4JBMslTI9UmEHONPLKnK/6r6qEg+5oKR/zGX1DjO/TqJHZ
	 ee22+3qCbFPw+MZpA2iEEDputVOjpARC1E9CON7cDQ21TEvsBpZAgdwPimdqxdLLpO
	 SHwmiNOX2Ld8zx+lZpd2xEoW82a2/8Sf14r79pLiTfId6rqbFccA5u/ltZe7M9P9mS
	 q7U5gYu9nc5Xg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manish Pandey <quic_mapa@quicinc.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: wire UFS to ice instance
Date: Sun,  5 Jul 2026 15:58:03 -0500
Message-ID: <178328508281.1157743.2836982929405843115.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429-sm8750_ice_dt_fix-v1-1-2540dc337082@oss.qualcomm.com>
References: <20260429-sm8750_ice_dt_fix-v1-1-2540dc337082@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mapa@quicinc.com,m:melody.olvera@oss.qualcomm.com,m:quic_nitirawa@quicinc.com,m:kuldeep.singh@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:wenjia.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-116609-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 37E8270B6E4


On Wed, 29 Apr 2026 15:05:40 +0530, Kuldeep Singh wrote:
> The Inline Crypto Engine (ICE) exists as a standalone DT node, but the
> UFS node lacks the required qcom,ice phandle reference.
> 
> Add the qcom,ice property to explicitly associate the UFS controller
> with its ICE instance.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8750: wire UFS to ice instance
      commit: ac456227d22952b656ad291ebd2d3d3e498e3d95

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

