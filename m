Return-Path: <linux-arm-msm+bounces-70507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7509CB32D41
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 05:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF6721882DB1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 03:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40699246768;
	Sun, 24 Aug 2025 02:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQmaTTGK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D58524502D;
	Sun, 24 Aug 2025 02:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756004177; cv=none; b=VsuYn69RoE87ZPTtszJec/zSJ3izinbL3wOn+J6FpaN2Gm15l0RolCi4Bb36V/N3kYi2kRWhqDnbmSZeRrpdV7AP7fqxKYrUbxrJ8DxsUyxtzGDWvE4AYLuUpYgdnEQRhdzMTL5WEj3Z64gWyZyf5ADyk7UHNjcnPkHcja2X9Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756004177; c=relaxed/simple;
	bh=Ib6MVpnSQ/lRd4i3sjkAEuseQhQRFD3H7JWFSjhFmqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GP18T47JY8MfTwkvQo1TTP+iFulckSh98vZjVvvlvr7JB28JX3YSISgjSXYaYVFsQrt/lPN7t5/iqbe6QTaeG+g0hqdp5HUAmvNLJ7IL/og4mE3YjXkydzcZSD3qd1Y5b61o9szTY2igUjFq+szS56+Y1srpLQxE1WEmxGPutOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQmaTTGK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03C2AC4CEE7;
	Sun, 24 Aug 2025 02:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004176;
	bh=Ib6MVpnSQ/lRd4i3sjkAEuseQhQRFD3H7JWFSjhFmqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LQmaTTGK8Nh0htH/TLQpP/x9S1ic3SCnoDHnPezeQtTCdxOwesn/fOAalUa4wnEQN
	 UzVnwO4BvyuZef92lneud8zyALjxD61JCVuH06fyPlS65fuhLkG7u1z4WYYMp9C0B0
	 bqN28Dh7LK+ihhCxOkR7qtRPg/SaFaxIJS9ni0Xy3/3HX6BZyb0VeLHovqDPhxMWWd
	 JbZXVPTI8DX072eWRAEONMZMFb0bhZpR1r2LQfNUshop6DMv09KXxDusgKwopbmhL/
	 wXfWNNMKkwEnCQD7z1CuyyovSBZw4gypgpR7jstHHeZ/I/MZS5Kg7CfVuOzPj0suTG
	 z/cMlGQvXuaVQ==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	Raymond Hackley <raymondhackley@protonmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] ARM: dts: qcom: msm8226-samsung-ms013g: Add touch keys
Date: Sat, 23 Aug 2025 21:55:50 -0500
Message-ID: <175600415263.952266.15140026240923293247.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708122118.157791-1-raymondhackley@protonmail.com>
References: <20250708122118.157791-1-raymondhackley@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 08 Jul 2025 12:21:42 +0000, Raymond Hackley wrote:
> Touch keys feature on Galaxy Grand 2 is provided by Zinitix touchscreen.
> Add property linux,keycodes to enable touch keys.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: msm8226-samsung-ms013g: Add touch keys
      commit: e0d48bea315a4beef9e76c8d6ba7bc95948582cc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

