Return-Path: <linux-arm-msm+bounces-102825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKgCJO3a2mlr6wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 01:36:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3278B3E1F21
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 01:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 513CF30182BE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 23:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0973376A9;
	Sat, 11 Apr 2026 23:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gm9juqzu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A794286D7D;
	Sat, 11 Apr 2026 23:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775950557; cv=none; b=HuwxptKjSaFGUu3QOCiFFIYzfv78HIfhXktLcMI+YwYPjAnWfWy7BrSVNcGGOjviBEyXV19n+KNeFXJuif58f/L5ikIdvCsmrBtDvPAPaW55Dc9cUw1RPHmdLbK7djCoMLXy8qK7NuwHpy54Xb9lYfyJCjxke7+SxBCleXIFD0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775950557; c=relaxed/simple;
	bh=cpxZ95ovVNBn8+qnolclvcKra4Be0iJWKicAp3XsLOw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=NrNAcJyEcsvufMR5aumYxEY+QGj4qkEo0KEX+oZkLySB42DF3+lokmzm0kmZ7hyVL9EGDOcw1S0j3aeoDjZP/wAOtO/UqSLYS3PFCB5Lrx5lMvTBvXLAqi+gdCd3P2qk46EQcon8q7gs/xW/2LslctsElcHX8rjLARyFKoZB1vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gm9juqzu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5EAC116C6;
	Sat, 11 Apr 2026 23:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775950557;
	bh=cpxZ95ovVNBn8+qnolclvcKra4Be0iJWKicAp3XsLOw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Gm9juqzuWxcC5ocRH1Ej3PaO/4Y16ZDa3F89i/8BXy5jC6ml43Jxdpi+sm05gqZYU
	 va2uQ/4zd/EZESq5YK+ITiBLZ4+Ikqoc90PqiRjZ8w7aYjdHDtjSR6D+yHMjyiuOIt
	 oCucIz6Gz2uZVLHYJTYGb0PL/lEeQclloyc3IXEEJS0MMYN/+UPW/yD4/kQrVwmEMJ
	 cChanrabpqRw3HePVGOmk30nfZvZo78Zm8sr2ph22D7LdpRqTS/RNy7VtpeD+gFN0o
	 YJMYtJ9dXvTWqX1LAbErCsBhJuFR+QlTl35Mv6P5QRlT7ZRHpv3EFXEryDc/C0Xqzw
	 Uhkv5xKyBeVRA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260410223840.3976134-1-andersson@kernel.org>
References: <20260410223840.3976134-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v7.1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Taniya Das <taniya.das@oss.qualcomm.com>, Val Packett <val@packett.cool>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, John Crispin <john@phrozen.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, Pengyu Luo <mitltlatltl@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, Prasanna Tolety <quic_ptolety@quicinc.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, White Lewis <liu224806@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Sat, 11 Apr 2026 16:35:55 -0700
Message-ID: <177595055509.5403.7319021018800938492@lazor>
User-Agent: alot/0.12
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102825-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,oss.qualcomm.com,packett.cool,phrozen.org,gmail.com,quicinc.com,linaro.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3278B3E1F21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Bjorn Andersson (2026-04-10 15:38:40)
>=20
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:
>=20
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-7.1
>=20
> for you to fetch changes up to a4f780cd5c7aa8c0d2d044ffd153f7a3a13ca81e:
>=20
>   clk: qcom: gcc: Add multiple global clock controller driver for Nord So=
C (2026-04-08 21:00:09 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

