Return-Path: <linux-arm-msm+bounces-57053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EABAAD519
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 07:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBF22986220
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 05:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4A020E033;
	Wed,  7 May 2025 05:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GvAJArGb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF4020CCDF;
	Wed,  7 May 2025 05:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746595097; cv=none; b=PI05rh9RszPvYUoLj3Izj1yXw/FW1D9j70LK+GyXY+nSGZHA7yUGTmvpcuZQMQSJg7j4nKdbErVYPxT3yJSzpTWC4q1yY2VYqT4ehbCgo/Q5b2yNHYoPul7j2Wx9uPwwUMyNwkCpyeryybXEoi/wl9OpZv3hVqG1wDc7yAQgafU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746595097; c=relaxed/simple;
	bh=+w4cM/GGZFGA5zk3eia3zD4xUn5D6wCu1woCl6OKIDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YYW9iYdnNlJNR7okvjdeyYv8VU1NzcLG/jx3KdVcjesjMExTkfeiIxUO/yJXJf9MlscoHtPzKdhG1idQg5RHvAit2ZPLZNZFIj2ssYvfwpaQ9n7w7lDz77tE6cRkuUA0fsMyumphEmEkG0ZAqpkaCVZPdOsP+CCdb7y9S7pRf70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GvAJArGb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C5AC4AF0E;
	Wed,  7 May 2025 05:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746595097;
	bh=+w4cM/GGZFGA5zk3eia3zD4xUn5D6wCu1woCl6OKIDk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GvAJArGbCR5Wmnsvc1s7Jz7+LwT4gpaaU599Bo+koI+rSvkkXD1iEE+Od1BlAvAQ/
	 Em8UUuk1mOswZnxcgxeTHwiGPXwgaWx5gcKnSZzHPiUv/mjcXwGC41Y9XwUL7GJZ7/
	 PAJ8eUcM9kH8dcU5xEqXX2GIC+7y9rZ8Qx1fzSP+qjw0dsANseXHb88hywPq1Fjaen
	 JuRx++MBk0qz48I1YF/T3jfPFACMQGsO4o2XyRVv/+Xy5GaMQ6zZbqeQJn0uUJkS93
	 P3pGkeQblaufE+DXCHwRgnXGElgNz6UlEVJgQSPaHNgynfml3Q41+eQ8smu/VmqWzi
	 wQp/+zXlTQe5g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Marc Zyngier <maz@kernel.org>,
	Xilin Wu <wuxilin123@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: x1*: Fix vreg_l2j_1p2 voltage
Date: Tue,  6 May 2025 22:18:11 -0700
Message-ID: <174659505819.5380.9798660299874590005.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
References: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 23 Apr 2025 09:30:06 +0200, Stephan Gerhold wrote:
> Several of the Qualcomm X1* device trees upstream specify the wrong voltage
> for the L2J regulator. In the ACPI DSDT table, PPP_RESOURCE_ID_LDO2_J is
> configured with 1256000 uV instead of the 1200000 uV. Change all affected
> device trees to use the same for consistency and correctness.
> 
> In the other device trees upstream, the voltage is already correct:
>  - x1e78100-lenovo-thinkpad-t14s.dtsi
>  - x1e80100-dell-xps13-9345.dts
>  - x1e80100-microsoft-romulus.dtsi
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: qcom: x1-crd: Fix vreg_l2j_1p2 voltage
      commit: 5ce920e6a8db40e4b094c0d863cbd19fdcfbbb7a
[2/6] arm64: dts: qcom: x1e001de-devkit: Fix vreg_l2j_1p2 voltage
      commit: 3ed2a9e03abfeece9e30ebc746f935536f661414
[3/6] arm64: dts: qcom: x1e80100-asus-vivobook-s15: Fix vreg_l2j_1p2 voltage
      commit: 0fb9ecf8713a7a458f7378c86e0703467db2ad22
[4/6] arm64: dts: qcom: x1e80100-hp-omnibook-x14: Fix vreg_l2j_1p2 voltage
      commit: 4a09dad9d437a13e9cd4383ff7791a816a6e1652
[5/6] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Fix vreg_l2j_1p2 voltage
      commit: 4f27ede34ca3369cdcde80c5a4ca84cdb28edbbb
[6/6] arm64: dts: qcom: x1e80100-qcp: Fix vreg_l2j_1p2 voltage
      commit: efdbeae860bf0278b050c6c9ad5921afba4596d0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

