Return-Path: <linux-arm-msm+bounces-36863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B11169BABAF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 05:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50C0A1F21604
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 04:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98D4176AD8;
	Mon,  4 Nov 2024 04:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boyrvFy0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE294C6C;
	Mon,  4 Nov 2024 04:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730693630; cv=none; b=TRzCOHbdG77tpsGyzuQl3OnoS/gy5fF9i7iMq/H8ynZ9+5YojJxPakNWcb6if9Ud1mJSti7XS2Mx8UUU+hYs8vycntw5X+iOvnK+XUpD7nQyrQ0ED3xaVVvx25N6Ih25qbXxGZt6KbJj9UXgUqztXs2dpyLjZBNvKXYlrEIOcjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730693630; c=relaxed/simple;
	bh=y9MUnlS3ecSYXvvZ1j0sMTSR/e+uubshMnnKUKejncw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TQlP+hYzftRdeDjX4qaogsIkMhAkHRtvMshRh1c1jSyQ5+gjo5KhlkLCFRHzoB1/EPl0uaz3vIfMmmZ1R3i/kZziYBRvDn9Jo0NWaEqXZu0vLR9QYfDzBF9CJB2jFlghixkyD5J70bwg9sEHxt64dat0/0kwtsSfEqUQyGVq09s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boyrvFy0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82C2C4CECE;
	Mon,  4 Nov 2024 04:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730693630;
	bh=y9MUnlS3ecSYXvvZ1j0sMTSR/e+uubshMnnKUKejncw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=boyrvFy0rxrMdrSaQUfrRAtw8RFDRL/qL6uv6sxwsEJlYbYF1bC0XsFtlgeIN4rVY
	 6mXXUyqAN7Sjk8YAarMzpzzbK0JfgS0IKv2+1RZZPGjkIxn94FmLpQGFeDCGSuLVwA
	 XuvDVSx4oawIHEptRwf4s9BPXkvNe7QVqumyo1C5mW7VwP8Jy0I6BlhfArEcpL4AZ+
	 tq376nynbv1deqAIGbv1qKujyLJQupGAOOU8qy4JQtOWEn1GfmsmDaSr5kek15y0yS
	 Ahd8RGjQ1H9OHQUuAmSIEP1nUOQ+IIc6myeDe0J7ucxruYZ+DvEWR8+0XzDzUtYPFC
	 hQz6v2/Om56Mg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v5 0/3] arm64: dts: qcom: sc8280xp: enable WLAN and Bluetooth
Date: Sun,  3 Nov 2024 22:13:37 -0600
Message-ID: <173069362371.23540.11806758740923582100.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241008102545.40003-1-brgl@bgdev.pl>
References: <20241008102545.40003-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 08 Oct 2024 12:25:41 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> This correctly models the WLAN and Bluetooth modules on two boards using
> the sc8280xp SoC. For the sc8280xp-crd we add the PMU, wifi and bluetooth
> nodes with the correctly modelled wiring between them. For the X13s, we
> rework existing nodes so that they align with the new DT bindings
> contract.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sc8280xp-crd: model the PMU of the on-board wcn6855
      commit: e848528bdfc2a933590498c326d3320d85078c93
[2/3] arm64: dts: qcom: sc8280xp-crd: enable bluetooth
      commit: 38439741623c5fede0c171da801bf0a8b6a2e293
[3/3] arm64: dts: qcom: sc8280xp-x13s: model the PMU of the on-board wcn6855
      commit: 36937845ce2ab3a645e27c6a11642cc0b4f038fe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

