Return-Path: <linux-arm-msm+bounces-43385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DA89FCCAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:28:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60B717A14D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F821D63D0;
	Thu, 26 Dec 2024 18:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VS/WF1tv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5623B1D61BC;
	Thu, 26 Dec 2024 18:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237640; cv=none; b=UuV4PCSX+stMhYWjpLWEjv5qBtxkft99g4prxPxalTKuQQOEtteOdjweT4FL0RyenI4yD+PwOk5zpEYQ6HbPCQNaNHsErLQafYgGV70OvSMFWrdyNEgSs/KIFd3d6GZwgb+Gqeb4wTWScy8wr1R6sQ+dK76felmSMs4ZXepnBeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237640; c=relaxed/simple;
	bh=uvhF0H+/nhPDwYsGew61/jcKc8p5FEUPO62yxb7+xA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jAnq2tGemIVS4SAMwdzgkwPfiuQhB0I+kQQvTe+yg5xOLCPNb56l1fiq8EFbOHJHSPQaYba6rofeQXp+3nMVxOUF/wFM7bpwhnS5YRwmgD0HGKgnWrEurJTJ/cV6G9b+CwmGonGbuqjivsAicfnbJJ0BCy1L8F+xKQ2Dq366LWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VS/WF1tv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FABC4CEDD;
	Thu, 26 Dec 2024 18:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237639;
	bh=uvhF0H+/nhPDwYsGew61/jcKc8p5FEUPO62yxb7+xA8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VS/WF1tvc7d8RVr1Y7wQgrCCdiURXH4sdFM8eWq4RecQuRjzrxZ94qXS1T2IClggs
	 Sc5UeaOeMeyl89jP3pH/xLsOv5nskZEANPvVDZKfLXoIZ0wGe7dECwelEHtqasHRT6
	 vY4hGobIXMrSxRP0OjOlkTHTRmUJJYb2m60ZV+LKbhmSzoAdqKCcb2ZbMyMYpSADQc
	 MFA0RA6/sbG+HqH13qrRXphZgcEoJe/gq4kY9EpdCEP1Z0HEbYBg4MdA2qzkrBFkYe
	 Fudgqgj2m4bxnlmaYOCDupCC0fLyFh6+h31gwvXpMyvGMuaYnj9+NAEC1BHgTQuCYJ
	 fq5FAfsnCP5Zw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: x1e80100: fix USB OTG regressions
Date: Thu, 26 Dec 2024 12:26:38 -0600
Message-ID: <173523761368.1412574.8069026110047769537.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210111444.26240-1-johan+linaro@kernel.org>
References: <20241210111444.26240-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 10 Dec 2024 12:14:41 +0100, Johan Hovold wrote:
> A recent change enabling OTG mode on the Lenovo ThinkPad T14s USB-C
> ports can break SuperSpeed device hotplugging.
> 
> Abel noticed that the corresponding commit for the CRD also triggers a
> hard reset during resume from suspend.
> 
> Dmitry had already reported that enabling role switching can break UCSI.
> 
> [...]

Applied, thanks!

[1/3] Revert "arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports"
      (no commit info)
[2/3] Revert "arm64: dts: qcom: x1e80100-crd: enable otg on usb ports"
      commit: 2e5e1a7ea692dc2b9f1acf0ebeb75bc282733cac
[3/3] Revert "arm64: dts: qcom: x1e80100: enable OTG on USB-C controllers"
      commit: 7db0ba3e6e6c215353c1e58b42dfd77c7ab89256

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

