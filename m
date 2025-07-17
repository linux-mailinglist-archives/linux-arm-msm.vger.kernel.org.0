Return-Path: <linux-arm-msm+bounces-65349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62222B083D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A92EF4A855F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C818820C469;
	Thu, 17 Jul 2025 04:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDwkfBVY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973171ADFFB;
	Thu, 17 Jul 2025 04:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752726682; cv=none; b=CDsNy6KHHYtAzXwajv4odW3a9m1W1fTPnXIfe9w1mi9YWlxTNh0G6jVnzDOJTrMPy87z6jpqrvd+AIwGiNDBnhnA5ipcr5v+HUKLS6e3YHYSqvBiwYQZ5fYAWoDcq+Z/pE/zNaqNDsSS7qHzxgNWmL0JOrOvW2tmNukZLOuAsD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752726682; c=relaxed/simple;
	bh=AYiGcW5LXQG22qWNR7kIzwJHzASQsDRufP44m+rTla4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TsFEKmd5U6ySamszcgwcvCHb/eyVvp2v92urNwl+2w8uIbo5eFijFEpAlAMArQaWraVWGuz24m8QXR9TIHgOazGY3vOvJWNFydU1EJ/H7+IPEAk/qVLDA0wWi8Km+PrrZl7wzqO+IPNRsYv0cbkk2fkixrok+mIS/fJ5/EHISH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDwkfBVY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EB3C4CEFE;
	Thu, 17 Jul 2025 04:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726682;
	bh=AYiGcW5LXQG22qWNR7kIzwJHzASQsDRufP44m+rTla4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YDwkfBVYTJ46hnyCOjVU+bDIxuPNvO/O8VpVy5s5pUxt0t39WMFCbnz/7qyH/BKmD
	 AxCcYVuLV3YQwbr3n1npYwW+k41P+oCeBpL64M6ZtckfgJIZk4/5JbfPQgrTQ1qurj
	 OVqRBVvvNrrJ6uKwrghFPwjFICmnD5NxXfVgwXsxXnVVX26ZFdTb8t8EjwOfj1mtAn
	 FQ0RxP4hFKOUe0ua2xBurqFKDMynHnsjNgx7uIHJAkVxy92N5rMf1UD3vyQrRR2roc
	 KE0rb5MpVjtZRB19R4oDJiJ1t6+FnyZeZfFVVk5IC+jV0/WkGI23VTL+cUPqUIDCO8
	 SLrUUhgk0INHg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luo Jie <quic_luoj@quicinc.com>,
	Lee Jones <lee@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/5] Add CMN PLL clock controller support for IPQ5018
Date: Wed, 16 Jul 2025 23:30:55 -0500
Message-ID: <175272667141.130869.3942726331849650833.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516-ipq5018-cmn-pll-v4-0-389a6b30e504@outlook.com>
References: <20250516-ipq5018-cmn-pll-v4-0-389a6b30e504@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 16 May 2025 16:36:07 +0400, George Moussalem wrote:
> The CMN PLL block of IPQ5018 supplies output clocks for XO at 24 MHZ,
> sleep at 32KHZ, and the ethernet block at 50MHZ.
> 
> This patch series extends the CMN PLL driver to support IPQ5018. It also
> adds the SoC specific header file to export the CMN PLL output clock
> specifiers for IPQ5018. A new table of output clocks is added for the
> CMN PLL of IPQ5018, which is acquired from the device according to the
> compatible.
> 
> [...]

Applied, thanks!

[1/5] clk: qcom: ipq5018: keep XO clock always on
      commit: 693a723291d0634eaea24cff2f9d807f3223f204
[3/5] clk: qcom: ipq-cmn-pll: Add IPQ5018 SoC support
      commit: 25d12630561d8d0906f1f5eceb055da3af67c8c9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

