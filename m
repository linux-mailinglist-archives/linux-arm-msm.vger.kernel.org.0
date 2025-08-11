Return-Path: <linux-arm-msm+bounces-68562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 163F4B214BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 20:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 297703E48EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 18:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152DE2E7648;
	Mon, 11 Aug 2025 18:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VDo77q0r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4062E763D;
	Mon, 11 Aug 2025 18:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754937689; cv=none; b=SBXtC5pHRCKdNXtYcVwJaRrieb5N6W90Bj61KD/yDBXKrZ81JG444w2t8oaiczZfWm3qZ8YTChZl4Di+zdIpGoXzsn2hdHp/dc9taw7H0kK6NioS8LKQLboZUEVVP6EsjHHLe+JoKhze2mDtnLf3dsvdOSH20EYeBr8PHJuEzDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754937689; c=relaxed/simple;
	bh=lPlSy0lEJLpNe+Y/nIc2QlXMDUEHv3EM8ZIdnJ1KLBE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FNjLhOL0EyMLSvsD42HgEgzgtF2S0zI/STAvVG5FDqMohEW9Gc0XI4yqFwiG0AebUeGAkXTndO3qOET0NJ6pslvDLkEm9/+UT09XvrtsY9yEEEFBCMU9Gp80AedxG1+UWezz4/RxkjMd2eW2Ize3/njjL3wnL+gIaV4DL1V2bG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VDo77q0r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D41C4CEFB;
	Mon, 11 Aug 2025 18:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754937688;
	bh=lPlSy0lEJLpNe+Y/nIc2QlXMDUEHv3EM8ZIdnJ1KLBE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VDo77q0rbMgbodzTtBXeCmMPQsYz28c0WlFPP5yghLkYuT/WVm7hXFC+D9yDqpJqg
	 M4vG/DlrMF+Gijf1oG8BwFPbSsiuc8hdVb6VGcadHy/FwJJKUmFuE5N9BETHOaFL7i
	 pPuMxfQN43FvwGNetq8WsX6Ng2EV23dyLDDB4M1TQQPfFXmpmHODhHY3E/xlS+JTEv
	 kjopgbUS8f3v1jXim/qbdlvQjdOcd1PmFpzf1BHMpxCDdcAmzJheqq28C5TvIuaSFI
	 PBoG4FUwCb7GFzuaM0nRWqx3ZX55Whj9f+hCInYJ0bYXYz7DhT2knnsAU4a1LYO2zF
	 Lqlk93h/Ye1Xw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: Re: (subset) [PATCH 0/4] Add support for Dell Latitude 7455 (X1E-80-100)
Date: Mon, 11 Aug 2025 13:41:07 -0500
Message-ID: <175493766110.138281.10940250732321300089.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250525095341.12462-2-val@packett.cool>
References: <20250525095341.12462-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 25 May 2025 06:53:32 -0300, Val Packett wrote:
> just got a Dell that wasn't properly brought up before, works pretty well now :)
> 
> The hardware is very similar to other Dells, especially the Inspiron 14p 7441,
> so big thanks to Bryan O'Donoghue for the patches for that one.
> 
> Works:
> - USB Type-C x2, including DP alt mode (PS8830)
> - USB Type-A & USB fingerprint reader (PTN3222)
> - Wi-Fi & Bluetooth (WCN7850 hw2.0)
> - Display, Backlight (eDP: BOE NE14QDM-???)
> - Keyboard, Touchpad, Touchscreen (I2C HID)
> - microSD card reader (SDHC)
> - Battery info (aDSP, unlike the Inspiron (0.o))
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: qcom: Add Dell Latitude 7455
      commit: 1a67f85c690658a35cac41c070df33e3e5a72868

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

