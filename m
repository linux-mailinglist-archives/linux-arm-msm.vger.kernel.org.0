Return-Path: <linux-arm-msm+bounces-27168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3E893EC23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 05:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD7691F21DEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 03:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA1112C465;
	Mon, 29 Jul 2024 03:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLdm4HON"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3223F12BF25;
	Mon, 29 Jul 2024 03:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225526; cv=none; b=imDjGc3kk3GxFKn5vuqeeqz3QXHpcnok+QV0t+qmDKnR1VgOrRTWYpq5NrzalSLhISiunxqIW6t9CU+34zgKAZUeTc91VdxVsINIaD3Yt25uEnl3twuViAi8galfx1WyrsWmklwOgVJsboCwHDpcXwaPn/VOrYABMn+DVaXrv2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225526; c=relaxed/simple;
	bh=5g9TjamPa9BtqtBlGld2K47F132HfpIDeyJio/6UEsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XsA5q9uvWAVlJy0r21LtlVRzf/6e00uXQtD2IM+69QGp6onlPsp5aVcbhksVu17/7qqEM6WU/0yEYURby/jm/2SQo5wdGMKwOowQ+6ZDSYlOXGpGAq9c6S7gjJ3KSADsgf/u8nXg6XJc54wA8OZ2aX9UrOHMbn6b5z1NgHP2CDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLdm4HON; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32197C4AF10;
	Mon, 29 Jul 2024 03:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225526;
	bh=5g9TjamPa9BtqtBlGld2K47F132HfpIDeyJio/6UEsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KLdm4HONtDJ3ovplmxbbHGmF4HPriTvP1GCtOz2Ym7DQvJ0dRg5IsN26+ieR6daTx
	 jo/4I5S5qT+c85AdNLQcpZdIn54TopfMg00mDgsvMRAEW84vER8TDT1WuksK8gQLtw
	 a3yj9XXDM1aeng7qzaR5U6Z7B4luoXufyntb/RqX4iLkEZbLMUxpJG5DlhGG2Ud45Q
	 hN0EypFbrb8TX/ycaf5C8GuuFkfx8kwK8huLjzf6rYGrudm/dFIvtwXEAB3XygQJyL
	 /jleDEFTg/q7KSi5zAnPD+6kuI9wmYT9HgE6mjdTCUk2UE5xXK4bNFHk8g52Rlxmng
	 +paV2DmlwPZdg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: dts: qcom: x1e80100: PCIe fixes and CRD modem support
Date: Sun, 28 Jul 2024 22:58:12 -0500
Message-ID: <172222551321.175430.276790638540513119.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240722094249.26471-1-johan+linaro@kernel.org>
References: <20240722094249.26471-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 22 Jul 2024 11:42:41 +0200, Johan Hovold wrote:
> This series fixes some issues with the current x1e80100 PCIe support,
> adds the PCIe5 nodes and enables the modem on the CRD.
> 
> The fixes should go into 6.11, but the modem support depends on them so
> I decided to send everything in one series.
> 
> As Konrad noted some of these issues have been reproduced in the other
> x1e80100 dts. I'll send a separate series addressing that.
> 
> [...]

Applied, thanks!

[1/8] arm64: dts: qcom: x1e80100-crd: fix PCIe4 PHY supply
      commit: 47b543e215b87d311afe0de28ad741f342dd56b0
[2/8] arm64: dts: qcom: x1e80100: fix PCIe domain numbers
      commit: 3782328d84602bcccad1b6db7d913facd754a303
[3/8] arm64: dts: qcom: x1e80100: add missing PCIe minimum OPP
      commit: 49162e60b8413deecfe13d220b20bd67d67c7adb
[4/8] arm64: dts: qcom: x1e80100-crd: fix up PCIe6a pinctrl node
      commit: 9aa27050f3d9c6f413c49b5011fae70c475084f6
[5/8] arm64: dts: qcom: x1e80100-crd: disable PCIe6a perst pull down
      commit: 5d40cfc17eab68d5f2272e74e92cc814a08c08fe
[6/8] arm64: dts: qcom: x1e80100-crd: fix missing PCIe4 gpios
      commit: ba9db8faa26205cfc12f35b832735d11f960fcc2
[7/8] arm64: dts: qcom: x1e80100: add PCIe5 nodes
      commit: ce59448ce722ce81f672dd9ffc9d17b98cc05896
[8/8] arm64: dts: qcom: x1e80100-crd: enable SDX65 modem
      commit: 2eb91146ced41187b554ebb8feccd4b9e9639194

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

