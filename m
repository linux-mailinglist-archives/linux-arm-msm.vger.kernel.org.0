Return-Path: <linux-arm-msm+bounces-43447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7189FCED1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EA9D7A00F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781D71DE2C5;
	Thu, 26 Dec 2024 22:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OsPMWrBU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7D21DE2BF;
	Thu, 26 Dec 2024 22:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252768; cv=none; b=YpPZblnzIwfA6IkA4YIeKkiIx+wUxSdnrMg9hV1opJK+3OvU8n1UFmizN2ciKx4WLUF2erNtbWK/PPxVyh8RbCOuii78NrouCu6VhL9m4H4+9w8U/3mpxI8AJoqjblxumqQWoGpES1wR5DJnZ9IzFS+jsidihN9syA6vakie9SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252768; c=relaxed/simple;
	bh=ETnzIIuT/50JIzQRbfGEbjGFz0zy4ZPRZComroSntNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WpJwO5K7r/JAE9hFlirHgaFe7vexEH4yrIMsRPeukWJBXbV/usADFAwR6FwfbwFhOwgB0K6YEHOT3sIut35Cwidk64MfOYUk481MNBBIRxBGBY2n0l4acl8GPsswEHmdBC3U/vgp71eYD8ZeoDVG4Jb1xnaCDE2YToayKmiWeRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OsPMWrBU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE3DC4CED3;
	Thu, 26 Dec 2024 22:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252768;
	bh=ETnzIIuT/50JIzQRbfGEbjGFz0zy4ZPRZComroSntNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OsPMWrBUhktKd8HrmGcTlMVhuG0a20TKnZ+DUfTZLXrYV6RWhG01VXMLMNLVMLlgg
	 yrIu24V8FuHhkAGuoyfKkUi8ailAsKS7GD/9r0pTQQrJpLpdRJ/uO3G/Z7FygsVSAx
	 xsDmWO64+1BHJHktx6tkiz4EeNg8siSuTz3LegZerYKC3rmjRYLkwbScV2K9GoGsup
	 O8nh/UchEHxv/jwrSaxWhQ/2Jr5aHbRJ8KIqclxLuT+xYBkdNiKgxqAl+G0j3t58jG
	 jfgocOoKU9anfDPi9CgTayO6FSDunwQnBQUyLpeymZbp7cmHg4u+Rknltvg2rUT3RO
	 /EgnLE/hAYqXA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: (subset) [PATCH 0/3] arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq
Date: Thu, 26 Dec 2024 16:38:52 -0600
Message-ID: <173525273252.1449028.8862228786586450355.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org>
References: <20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 07 Oct 2024 20:22:24 +0200, Stephan Gerhold wrote:
> Enable WCN7850 WiFi/BT on X1E80100 QCP using the new power sequencing DT
> bindings.
> 
> The first two patches add missing power domains and the definition for the
> UART14 instance on X1E80100 (typically used for Bluetooth). The third patch
> adds the regulators, PMU, WiFi and BT nodes to the QCP device tree.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: x1e80100: Add QUP power domains and OPPs
      commit: c8327bb53b8728510aee62833d3d7ee44b54de13
[2/3] arm64: dts: qcom: x1e80100: Add uart14
      commit: 85b4b74ba904c9e5825c99dec8c6bef25222abc4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

