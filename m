Return-Path: <linux-arm-msm+bounces-116994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tVVTOqABTGpDegEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:27:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EA5714F27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:27:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=d+SowUpk;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116994-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116994-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5795436927B2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 17:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE983BCD26;
	Mon,  6 Jul 2026 17:54:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C032F3B7B6E;
	Mon,  6 Jul 2026 17:54:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360490; cv=none; b=UQ2Y3Ce3PE4SP5bkm0SgLmvjDUp9DPfDZOgpz4eXDvrUT7j09W4BD1NIJDn9xr0UAERnnH+wKgfsS90zwN/ExcG/lZRW5VfVFaRSFEr4msbh58L0lpLFddLCPG1ryCZqGla2oP75/2sveaCiqMIx3iRUEiGwhdi95BlL+/tK5Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360490; c=relaxed/simple;
	bh=20+eIpYLQSEkasLN3R4K4LhCfAn3EElc1aXK34PGfeM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jidOBc9UoumF13PewRxL2eaiTdf5gt3mo9xE1fq+h0vFgfnfLyLQChx/QTNXRO5amvwALAUt26pls3CYCzpsgtvSlae67cFeKn0lqYgVqCJnIaPeGyYr3HmKtwvxraDRMwyoFUcXyLjXUmxV9oVd9h4oc2Vni15oP4JwOw3Oqu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+SowUpk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDD71F01569;
	Mon,  6 Jul 2026 17:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783360489;
	bh=WQINCmnczmAlni3GXGy8eyJvLGXu82H8ol03Ze+9DPQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=d+SowUpkIckwSko0YKcO/7h8I7BEfWGtKBC5KjvFT5cRUp6OBPvdJdVab5lnvowKj
	 DlqRhcjVKtx53YNaL8BpzVeePuaQ4ld5EuN5nnKmbefojpGcSNm4rfqAPfjX/wYqi2
	 TLAP2Jqin67JGzA5VGNK0N0owyxeu+J0/ACty1YJ0TzBCOHWvKgmDgK7f91hwetlUd
	 EpJ3xHd3e3tYaTfHubQe/jZcUh2scdrhBpyYSwfDfaQnRaNqufToDT3Z8Nsc8a79hw
	 /g9ysRF6xWra+R72Ma/mtVH3gKWfFGBuHKMTIQWlupp3Lzw4CKgCUp0IUzescGxi6d
	 KPrSQ8GiBCsHQ==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 bjorn.andersson@oss.qualcomm.com, 
 Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com, 
 chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com, 
 chiluka.harish@oss.qualcomm.com, Nikunj Kela <quic_nkela@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260618-enable-spi-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com>
References: <20260618-enable-spi-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/4] Enable SPI on SA8255p Qualcomm platforms
Message-Id: <178334469140.57168.9206112685644722158.b4-ty@b4>
Date: Mon, 06 Jul 2026 14:31:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1727; i=broonie@kernel.org;
 h=from:subject:message-id; bh=20+eIpYLQSEkasLN3R4K4LhCfAn3EElc1aXK34PGfeM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqS+vkp7Hwe2DcANos0VzJEAuUiq58voaX7Qrrz
 2Gwn2pl7dKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakvr5AAKCRAk1otyXVSH
 0H2vB/0XE/VDIGahCwreeQoAESuuFUyTXzXlkZK9p/cL3bdPKDPscjPNq1IFOGr/mIG6t9hBfyv
 MfGnm5jKJOgYu2WLpxmo893eqVp59K1JAcHHUQQIGXuHeQDpiePFc3pWGOP1HxRrRTOSc7JTdNj
 h/HUsMzXKz5I75qbEhx95ai02j6qbWGmGd1Rw0h8OvLPAtKFufrLqv2YZcuYx2lWq8iAr3uYip5
 u2Gt4awEk16NW80fkvGCAr1Rv9Umgsqzl7bRDQpvwf6Fao3O/OYiS1ywOWS2rvBuqNy+lrOx7Ks
 RuCsADX0AQ8fZIGQhXgJOpqWLzg4UT1INA7XofedaPfvVPSz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:chiluka.harish@oss.qualcomm.com,m:quic_nkela@quicinc.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-116994-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48EA5714F27

On Thu, 18 Jun 2026 14:36:38 +0530, Praveen Talari wrote:
> Enable SPI on SA8255p Qualcomm platforms
> 
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power
> and performance protocols.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[1/4] spi: dt-bindings: describe SA8255p
      https://git.kernel.org/broonie/spi/c/59841dc5f6ae
[2/4] spi: qcom-geni: Use geni_se_resources_init() for resource initialization
      https://git.kernel.org/broonie/spi/c/647277240b36
[3/4] spi: qcom-geni: Use resources helper APIs in runtime PM functions
      https://git.kernel.org/broonie/spi/c/059e41aab4c8
[4/4] spi: qcom-geni: Enable SPI on SA8255p Qualcomm platforms
      https://git.kernel.org/broonie/spi/c/b3e1d0948ca9

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


