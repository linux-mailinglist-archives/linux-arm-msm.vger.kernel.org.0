Return-Path: <linux-arm-msm+bounces-109450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBj8EegPEWrggwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:24:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4355BCA2E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDEC130667E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5241136A03B;
	Sat, 23 May 2026 02:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eTtMi0br"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1E8365A03;
	Sat, 23 May 2026 02:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502828; cv=none; b=qwSswRLJOCpyOJ00HU/orPU2S/FAFnSJuKAGCH7TdnYCmvfX00VHT51YO+3NSsDmPBQ6NCxdaMD71FsirHBbYzACWrlAYSEW8eXZjThqkud7fHBW5rHLhzHhowTeuSrkkaaDt2SHsam4HSedGDTrJqiHpUk42w/RaC5O4NWArF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502828; c=relaxed/simple;
	bh=fHxbMhSX/ESv0e467MtGXOkR3iYhBVXdeW0jY3FigMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZjnXxBMyaJmw+XJfwZOTPfeX8ggWvttcrP7GeG1lfbIZKBwlyucE+/aggjjk1srn8IT9ChCc54V6f3IaNIq3XYf0iGyl1WaIQSszWEAQ+quXUWD/5CjD+YKeyO+jF14a02upI2NkGNdk6oXry0wUAjSPzGnHwhRoTadef4viubc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eTtMi0br; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6CA91F00ADB;
	Sat, 23 May 2026 02:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502826;
	bh=7jSmJrUA2ykxY4cWXuaUI9jY9hqz32lmJzqHxtuRlrM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eTtMi0br+npeF/3VASr02j1y4GKmDHdgJaQleIZ8jSyWJgNbIjWDVSTlQh19MZGjM
	 do8O32vTWsT33vgeAzzn7eFDEc9SmvHwjhnA4B20lVWmSe8zjRLiBMUUMgq7HK2s/r
	 UaasILDzvTqrvDVBaSY3Nml/7smXRiomMCzVTlVtikO05zSl3+VzRdL1QumVP5dGrf
	 reVtP6D7iaM/OE0IGn2Wx1Jo4b682qvwLe6PWuHqDlsfqMGNiJwzbwUifVRpenAMex
	 eUVtyaT7vq2TgK1R8hBvMX7zZ25MuROwPopYIZtQ5QTcWzNuKDTDldb4FwklvTpbyf
	 P8NrPRGhXn5Ew==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: eliza: Add display
Date: Fri, 22 May 2026 21:19:54 -0500
Message-ID: <177950280319.1097700.3031962058289380542.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506-dts-qcom-eliza-display-v3-0-9e46401f467a@oss.qualcomm.com>
References: <20260506-dts-qcom-eliza-display-v3-0-9e46401f467a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-109450-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DB4355BCA2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 06 May 2026 14:30:25 +0200, Krzysztof Kozlowski wrote:
> Dependencies
> ============
> 1. Depends on USB patches:
> https://lore.kernel.org/all/20260504-eliza-adsp-usb-v2-0-18e0b0b0407f@oss.qualcomm.com/
> 
> 2. Bindings were mostly merged, except a change to SM8650 DP bindings
>    here:
> https://lore.kernel.org/all/20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: eliza: Add display (MDSS) with Display CC
      commit: 159d252ed80025cfdc218dd38cdcbdc7eb4beddf
[2/3] arm64: dts: qcom: eliza-mtp: Enable DSI display panel
      commit: 72f758277a4400be7c459653f709ce5fc70a9dcd
[3/3] arm64: dts: qcom: eliza-mtp: Enable DisplayPort on USB
      commit: 193fd5f1aadf464c5e2a2fe2dfcbfe51d9dee645

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

