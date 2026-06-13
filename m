Return-Path: <linux-arm-msm+bounces-113022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id achpFSDgLWrllwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 00:56:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E5F67FFD3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 00:56:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Bsnum7D3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113022-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113022-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCC77301A920
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 22:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7777439099C;
	Sat, 13 Jun 2026 22:55:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831E030D3FE;
	Sat, 13 Jun 2026 22:55:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781391348; cv=none; b=kqBcgTMX3u/IXzOUOqCAjo3rQf5zpDM1hYGGrGtwbaEnqvJQHNBpNxwDE2Y/VrX629QH2UjrWsB5uI7gY93PrjwpusLJwQdlcIGoG477NUGB0CmOx94WQtMIDU+bZLZljaWe4hx1OHBjFDCmWn1ufjwjw7JVdUHeFpL3X1L0qd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781391348; c=relaxed/simple;
	bh=waFcLfIWDrFtfyHeoFg4ES5dRKtg1IRhVdKp4lqp/rw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=lqSPR3LyHy4JnGn8udmZGx8zq+iag6Bk1mo/DohEdTNq8k5PU7HRZKeUfDydFVbyPkN64a54Jv1S3+ePSHnn/OxqlC9pOp0B0+AIbdzLERuCUJM/B3vnSm4dJ3NwAH6rWs7RDi7MZIis4WCU9a+N8DIvDq2F2gadgYwI8KKKDaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bsnum7D3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9EF1F000E9;
	Sat, 13 Jun 2026 22:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781391347;
	bh=8Y9czviEfUCs9RDuFGMQRHETjuWFS4198YhyV0ORENA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=Bsnum7D3HeZqfpgRMb8xikPmhEOVSat1u5u8opBITtAkcWMVEgAmbJgdLsHq7gm/C
	 GMVOCc5iOJ6jFCJ7qv6zS6rEHeEJJMBqQXPdLKlFkZhXqtLzOA9hb6tn+b2pCeQUTi
	 PoWfjMhuLVnSnUpiLtLeZdPmJViT3Xm8rGx75r7X/5sr6vfkFtZODbd+V7/PtWoLX1
	 9/A1dWuhmiU/ECglT3EBs8OaVluvPzgEm8l/S8tftU/3QONSn3R4M02BSDxEmHKK+a
	 oS32GjUUZvLkNKg+F/UN96HtdmmCZxRB8GapW3jY9txi+akDib6yVC47zCGqe28M7z
	 bXhuA4iwzrpWg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260612224825.852551-1-andersson@kernel.org>
References: <20260612224825.852551-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v7.2
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>, Luca Weiss <luca.weiss@fairphone.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Luo Jie <jie.luo@oss.qualcomm.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, Alexander Koskovich <akoskovich@pm.me>, Biswapriyo Nath <nathbappai@gmail.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Phillip Varney <pbvarney@protonmail.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Sat, 13 Jun 2026 15:55:45 -0700
Message-ID: <178139134534.819343.861205819784064327@lazor>
User-Agent: alot/0.12
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:vivek.aknurwar@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:jie.luo@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:akoskovich@pm.me,m:nathbappai@gmail.com,m:konrad.dybcio@oss.qualcomm.com,m:pbvarney@protonmail.com,m:andersson@kernel.org,m:linux-clk@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sboyd@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113022-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,oss.qualcomm.com,fairphone.com,pm.me,gmail.com,protonmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A0E5F67FFD3

Quoting Bjorn Andersson (2026-06-12 15:48:25)
>=20
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>=20
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-7.2
>=20
> for you to fetch changes up to e108373c54fbc844b7f541c6fd7ecb31772afd3c:
>=20
>   clk: qcom: regmap-phy-mux: Rework the implementation (2026-06-08 09:17:=
24 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

