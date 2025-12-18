Return-Path: <linux-arm-msm+bounces-85716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68835CCC626
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 16:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9ADCD3007E45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 15:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11CE12D6E76;
	Thu, 18 Dec 2025 15:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="or0nf8VU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA95D28D8DA;
	Thu, 18 Dec 2025 15:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070265; cv=none; b=EPDOupEiFgeVkqLC05Axj7h87zfXqlFUSwXqNnfzYJIgdpAwmXBIzWutixBc3l+ZH8TWm8G8al+gPTbJNrZoxDAT2mFaDw10aVcwMsowTjxcLp/QSAJNBSVs4RWsXXXkLO95XVnURdENn3yYRixXbyIJLZGUTHvUzLCQFrODZh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070265; c=relaxed/simple;
	bh=TZc9Hlw0J1rsEXQ0S3cg/4mmQeIULdQ8BsiItCa/0nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hqzilOScAaDoYpUmbctEJgAwohQYjXvllMBfnyfxHWxi6dWY/75gmhINRHQ/SE8/VqbbFsq43yarshweGJIy8PtaJ99gu1SF+6w8EVkB5GMTUXj1WGncXv9pQrF43hDOkeGIq6O1q6hlVShiVlobG9nLKg1UAYYrrajcZBhOIvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=or0nf8VU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191D4C4CEFB;
	Thu, 18 Dec 2025 15:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766070265;
	bh=TZc9Hlw0J1rsEXQ0S3cg/4mmQeIULdQ8BsiItCa/0nA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=or0nf8VUHQUtT3hN+QIH+SD1Wc1VA8wcJbvDGXZWaZcXFg3zv3BZRf//deLGRlaim
	 ARFCW5RU3zVDBFANug05lEnQ/AUchMNl7jKOgB1w8w6A8JuWvpYOzPMcbW2Cd+WIeg
	 xq+v1OtlKPkFufoRcGENo51C2qqIdoinAmghuVbdaZNfbN+WnKtXirXBnc0l3TKQfq
	 3mH6aiIUstI7F4oO7pBuDlfrNTPLWZGWB3NOPQ3Gvz/NgR/wV1WilA50BPNRLwSnXZ
	 zAw5NRmiGdkj1TxevR0h05Nxu3AgDeEC4202aHuOTfWpZadpQ5TDBHjSF31TVMobtI
	 VXtrQA5BhsKjg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Tengfei Fan <tengfei.fan@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/5] arm64: dts: qcom: Introduce Kaanapali platform device tree
Date: Thu, 18 Dec 2025 09:04:21 -0600
Message-ID: <176607025911.302413.14359032773299957927.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
References: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 15 Dec 2025 01:07:20 -0800, Jingyi Wang wrote:
> Introduce the Device Tree for the recently announced Snapdragon SoC from Qualcomm:
> https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
> 
> Add device trees for the Kaanapali SoC, MTP (Mobile Test Platform) and
> QRD (Qualcomm Reference Device), along with the corresponding defconfig
> and binding, providing initial support to boot to UART shell with UFS
> enabled.
> 
> [...]

Applied, thanks!

[3/5] arm64: dts: qcom: Introduce Kaanapali SoC
      commit: 2eeb5767d53f457913d2b378a3bd9e2269a4098d
[4/5] arm64: dts: qcom: kaanapali: Add base MTP board
      commit: 1cc3a0a0210697a25e96783cf21f93d28a09ebf7
[5/5] arm64: dts: qcom: kaanapali: Add base QRD board
      commit: 0e31dcfefd21ed76ff1b2d05647cd34336ab9772

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

