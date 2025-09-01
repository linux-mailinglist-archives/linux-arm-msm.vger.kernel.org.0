Return-Path: <linux-arm-msm+bounces-71435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E91DFB3EE92
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EBC41694F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E451B246BD8;
	Mon,  1 Sep 2025 19:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zu+h+114"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0E522422F;
	Mon,  1 Sep 2025 19:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756755971; cv=none; b=jirr6rgxyc7IyTRjcbtU3x3ShNT3fhlciyt+BWFFHFjK44AcZ8dzDvwaEmz6fhtFd6eCSE23w7vir7cCEW8OGYJ+ipdFzbaH09YRtS4joLo5F9UQwJaZgE2UusN/vBGI+U54p6ur7SY57zZ0w9Nl5APcRO2Q0QeywetprcGpnGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756755971; c=relaxed/simple;
	bh=gi/t1ku9dopetjT0rJix/VRiMy3dyEqLAe0hnwAYXVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qLXCgfHF5Nnxv394z35M7pSFzA/blyi7QvjcMxbTrtJMauaxzhFFLCn6zxDEvt3IkfKD0u9erZSoW3R+mQ5GY7Xmo70SWlmtCU+GsITu6NYyJFaKfrTNvM2Mq9dqX2R4v3RszP+BDK02ke41KiRUhxEjFv8T4+zxarRt6rWE02o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zu+h+114; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B611C4CEF5;
	Mon,  1 Sep 2025 19:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756755971;
	bh=gi/t1ku9dopetjT0rJix/VRiMy3dyEqLAe0hnwAYXVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zu+h+114lry358jCdVXdfh8UocdbxyMxQwleql+ZwV41+NH6cnytOaydiPUad/ZkF
	 qIPgQGP1Za1ZFBZyd+RV46rK1D01jyeyFYhEc7jyXCvj/eM+Cgncx6pT4uDTzO/Nxk
	 FrNxVYTdQajSQYSfeF/ODL1+Pz8ptQFs19yldlUfYblOfBjHOE7ik63kP94bITbJ90
	 8cyVSETvuDQbwGLTKQ+k4td9/fPYRBi6lssNSmCDl3vQAsjeeaYPb+Mg4+cSfVju7F
	 BEkaYlALHXgt3vOlpAAPJHDT1COchF2aq47QdgSGQwyo348nd1x0uqkdSOsZejj5Vu
	 1JHvugEqtKOtw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gianluca Boiano <morf3089@gmail.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] MSM8953 Fix SPI interfaces and add spi_7
Date: Mon,  1 Sep 2025 14:45:52 -0500
Message-ID: <175675595911.1796591.13304213262495434342.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250830-msm8953-spi-fix-v1-0-89950eaf10fe@mainlining.org>
References: <20250830-msm8953-spi-fix-v1-0-89950eaf10fe@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 30 Aug 2025 23:13:18 +0200, Barnabás Czémán wrote:
> This patch series fixing SPI clocks and pinctrls according to
> downstream sources and add support for spi_7 interface can be
> found in MSM8953 devices.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: msm8953: fix SPI clocks
      commit: 4faee358fea854fddba95843c55d9eb9013a4f00
[2/3] arm64: dts: qcom: msm8953: correct SPI pinctrls
      commit: 690bc19286407cf1c0fc189910a936261ae1344c
[3/3] arm64: dts: qcom: msm8953: add spi_7
      commit: 73f7dc09f8e363736a3d3509820666e2006ab277

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

