Return-Path: <linux-arm-msm+bounces-25425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 264C392956F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 00:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91F38B2124B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 22:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D63224EF;
	Sat,  6 Jul 2024 22:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gaIgEyST"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FEB3F9D5;
	Sat,  6 Jul 2024 22:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720303293; cv=none; b=YB0W3oBrlJKnm+py0IzYwEIl3FMJn1eweBaHpDeUSB4C5au69pbKyQ3JfaScJqjVtKxgj/ty4qBESJksND7FNDrTMgpz/4fzFopvSGYgz34cGYrWu5rTteA4gi33Ln9mz/BOgEOVqodeY8B5QNo2I9MlpOo6KM8iitzkZ4yRwjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720303293; c=relaxed/simple;
	bh=cOajdB5OS7Dr3lIV1inCU615l9Mx5HA3FPy2ut97Wqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IMeR2mPfBA2fyC2n4IVFdHdkCMonksJFuJ2puqYFPHGpQcLlMX1aR6EANJgTS8UOhkDXONB/Ocd61wE4O+TrapfOpa74MW0gUHFEiPr70f4ZSvRoNXz/ecBD3hOurn/J0sIyC5kXzzNAUgcoBcayPbVFocBmEoA9K4gpABIXbU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gaIgEyST; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6038AC2BD10;
	Sat,  6 Jul 2024 22:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720303293;
	bh=cOajdB5OS7Dr3lIV1inCU615l9Mx5HA3FPy2ut97Wqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gaIgEySTtJ4sO9VV1ZQyERw2ljkEebE1F8nCU0G2kRzM2ywHmZ9w/l9sRtTj2WlSX
	 ShaXSvraEmt/Z8ahRSn7Ik/q8IXHMS0mbOD3JPga8iSwmYzkUm/4PXI0AAgOTIZ5S6
	 0fRAIDY44Qbrso7Q+QO9O7nQzssflS3K76bzEF8zNTb25PPL0cM7hBN9I9NOT4BzSA
	 B/SUeye7jB9LSct4rOCiAHKFDLFOdyMguX32MStv6Skc4iJeF/1shYj8/0jy4oW9Jn
	 MZQh5RIC3DKpmCNcWEskBCePde2xHfbxQ/2VlgZ/i4jlHMByCbVG7afWrjkjwxYlHS
	 sD2jqPO23G0Vw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Set parent rate for USB3 sec and tert PHY pipe clks
Date: Sat,  6 Jul 2024 17:01:16 -0500
Message-ID: <172030328811.28909.11410609996119660029.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240530-x1e80100-clk-gcc-usb3-sec-tert-set-parent-rate-v1-1-7b2b04cad545@linaro.org>
References: <20240530-x1e80100-clk-gcc-usb3-sec-tert-set-parent-rate-v1-1-7b2b04cad545@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 May 2024 17:05:24 +0300, Abel Vesa wrote:
> Allow the USB3 second and third GCC PHY pipe clocks to propagate the
> rate to the pipe clocks provided by the QMP combo PHYs. The first
> instance is already doing that.
> 
> 

Applied, thanks!

[1/1] clk: qcom: gcc-x1e80100: Set parent rate for USB3 sec and tert PHY pipe clks
      commit: 2bb98a88edd5ddf15ca4cfc65595b7f7588351b5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

