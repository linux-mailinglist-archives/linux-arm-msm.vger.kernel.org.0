Return-Path: <linux-arm-msm+bounces-70509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBADB32D34
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 05:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43D6B17BFF6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 03:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D983F24FC09;
	Sun, 24 Aug 2025 02:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fP5sHJu5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE73A1EEA55;
	Sun, 24 Aug 2025 02:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756004178; cv=none; b=u2dyOlx+wTOdLFPh4h51Dpw7sQrvL+eNHT4PPIN5V8ODQeOKNHaj1a81gU8mPq/N1InOBtlusGg3eK53lJ3Q9ZUlWjejmAQt1rmZMihksro+E37ht1/g60dXLPsGaKyDFiJdvEaOboAF6oc9h4HRB1s3nBxDnjKVoHWaD9MEaSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756004178; c=relaxed/simple;
	bh=w5s3VKw/52zAQPDfQwO5H1+d5vTY5VPJQn/tvPs+PCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cp3iqifLEttyTbf6qL2CtPWilW0aDUzj6gZz8J39ffX5mJntl5y+7c13O+TnsSOuzVntYlp81eYCc48NX8Lf74m0XFL3LI13AUpu5vO2+V9g+uZDbZF7Zrz4I/DxeMSVjFVRApJCov3GaC8m2HFsl+O0VhSDV9jIaD9hWA6Sddo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fP5sHJu5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6543C4CEE7;
	Sun, 24 Aug 2025 02:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004178;
	bh=w5s3VKw/52zAQPDfQwO5H1+d5vTY5VPJQn/tvPs+PCg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fP5sHJu5s+XJ95HGf0zPD7Pi5kWxX8CQuLdktr/znC6O6bhYRY6MhZq/FdBR5GZr0
	 LSJGsJUSPpkGDhoXBSyZYlkiHKjPV5MmwBJVEx2J0PCKzbCgmqWurrZZx32VXvKhZX
	 7ghjacPwk1ec77m0Kw9ae0k4EjVzGuPWMxSxLxcE+dnEPJIn361IJhgA8ZfHgR/EP9
	 /LHNRi9vas5c9cSgMM5315vGvERXA3Al6SEq9ZMFY4eAuCYg1bCeI4V5QMXqNZXMyn
	 NYbsE+XzXEiN/jaX/5MC9hjbBoarLq3GlbpieQAnowrRbAbYfZDezT4MZlLnUN7E7A
	 j7sOCMGR0w9jA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Maud Spierings <maud_spierings@hotmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/4] arm64: dts: qcom: x1: Fix swapped USB MP repeaters for boards with 2 ports
Date: Sat, 23 Aug 2025 21:55:52 -0500
Message-ID: <175600415294.952266.853699915604660417.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250819-x1e80100-fix-usb-mp-repeaters-v1-0-0f8c186458d3@linaro.org>
References: <20250819-x1e80100-fix-usb-mp-repeaters-v1-0-0f8c186458d3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 19 Aug 2025 12:45:19 +0200, Stephan Gerhold wrote:
> The &eusb3_repeater belongs to the first port of the USB MP controller and
> the &eusb6_repeater belongs to the second. This is obvious if one looks at
> e.g. the CRD or the Dell XPS where only the second port of the USB MP is
> used: They only have the &eusb6_repeater and already specify it for the
> &usb_mp_hsphy1.
> 
> Swap them for the affected boards with 2 ports to set the correct repeater
> for each of the USB ports. Boards with just a single port used (CRD, Dell
> XPS) are already correct.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: x1e001de-devkit: Fix swapped USB MP repeaters
      commit: 59a4b94a8c46c71f6c7aac00c21dc781b525fd6d
[2/4] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Fix swapped USB MP repeaters
      commit: c3994b495111bd0ae663c63fc96a869678d03e6c
[3/4] arm64: dts: qcom: x1e80100-asus-vivobook-s15: Fix swapped USB MP repeaters
      commit: d5d72e326762c24f2fbc48e5f223cb674cecad1a
[4/4] arm64: dts: qcom: x1e80100-qcp: Fix swapped USB MP repeaters
      commit: 6dcc44fc695b11bf4e654774a7c865abf96a2af3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

