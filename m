Return-Path: <linux-arm-msm+bounces-68547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D825B2148B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 20:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AC8B3E3E7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 18:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664AD2E2DCA;
	Mon, 11 Aug 2025 18:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FL775uGd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383442E2DC3;
	Mon, 11 Aug 2025 18:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754937674; cv=none; b=iuY5ET3Be51FVyhugc5XDPRSWKCJp0OEFk7QZV7jeDetp4bDS7uRY2YzjIMGuOTzC7YGhh5jfENg0yxiQQnMHvcWIGPR+CMT1diMcZvCY58gd0yyoPQAn3VPuSdWZ6wPz20WSmrYY8+NM0plQovkHMjGJl5XtJboFSen9sU3QaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754937674; c=relaxed/simple;
	bh=AvOebrjNFwwBhL05sJAsUtMcnL3yGkgGjM3AU4h6AO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GGJ+PddLXZHnue60gCGO9lVQ0/0xA6C/98Goctj7pKJtx1PbVSDUPfzTqFWELbM8j1p3gbHtrBnCNoiHmdCF9TEO4IfguCkKHOz7CYg26FO+fC6sEHP/jvcsgb2DLwbBaylFW/FjZFZiTgW12W7MrFk9D51iwF3BB7lUm4Kkxh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FL775uGd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C054C4CEED;
	Mon, 11 Aug 2025 18:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754937673;
	bh=AvOebrjNFwwBhL05sJAsUtMcnL3yGkgGjM3AU4h6AO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FL775uGd4ijyKK8SeSFDjLWqs7g0oznTF8+k5u1N+H4aZuhMsY9KCohMMMuHLkBHm
	 d+lgbPY8uHswWQ+mWBL9EgNwtbE0QKKiZrQBiLLZcdgztOIyeAhStFn3fMklOTIIWK
	 vpsjdd7uyaFOxPHxRiy8ACyckenOLkwsr5eOEqp2/cilxp9y4FS66cVK7BUSgfNN7Z
	 DPBM9Vdgmt/LTSCp8sSukkXrD/Y4CMgB4TYQpIXcrY+XRk45ImcEltoDQi4tHdr7qU
	 43GtrTg992shNL6Hq6/4483Vi766xw/vWa8lmC0R5rotqUqNBT/1/9EmniKPud4M47
	 y1t0ZCm+i6QPw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RESEND 0/3] arm64: dts: qcom: fix GPIO lookup flags for i2c-gpio SDA and SCL pins
Date: Mon, 11 Aug 2025 13:40:52 -0500
Message-ID: <175493766105.138281.6476150731966428757.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250811-qcom-gpio-lookup-open-drain-v1-0-b5496f80e047@linaro.org>
References: <20250811-qcom-gpio-lookup-open-drain-v1-0-b5496f80e047@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Aug 2025 17:06:47 +0200, Bartosz Golaszewski wrote:
> Resending rebased on top of v6.17-rc1 as this missed the previous merge
> window.
> 
> There are three platforms in the QCom DTS tree that are missing the
> open-drain lookup flag in their DT nodes associated with the i2c-gpio
> device whose driver enforces open-drain outputs. This causes the GPIO
> core to emit warnings such as:
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: qrb2210-rb1: fix GPIO lookup flags for i2c SDA and SCL
      commit: b2659ddbc2999e8b56edbcd12251b3e469bd0bca
[2/3] arm64: dts: qcom: qrb4210-rb2: fix GPIO lookup flags for i2c SDA and SCL
      commit: f07f492773b70efe01f9966703fef658b428f17b
[3/3] arm64: dts: qcom: sdm845-samsung-starqltechn: fix GPIO lookup flags for i2c SDA and SCL
      commit: 25197809e78c5ff521353acce00406cc2b4bbc16

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

