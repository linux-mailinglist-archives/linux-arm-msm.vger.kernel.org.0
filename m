Return-Path: <linux-arm-msm+bounces-44026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91605A02F12
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 18:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1190F3A485F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 17:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CA21DF253;
	Mon,  6 Jan 2025 17:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CaNOnMmT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB601DF244;
	Mon,  6 Jan 2025 17:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736184875; cv=none; b=D3njQX0nfO4tzPmVxpg+JmrrBY4t31sLg/MOd+l04FB6/k7sKBSqjOcc4u+4m4XquCcqrChMWgvOExnKnzPFSnPjsObEm6XjN2Rp330c1UdmKq8UN9g1NsRfvJnQ3awDq9ZKiVHa3xaV5+J741mOpfUrenKRakel6nUFIG+W9AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736184875; c=relaxed/simple;
	bh=YzBD69Ati05p96MYx7b6sryRrVaWQZkIv/X1D/dyxCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i+lp/7kgXM87YBM6j5H7YERsB2kCkfCzQ/suPtU4gRdEQgbVHUv6b8g/Xz1JJu/WFKkexYD8seXcUUt7M7HKynw2b1kVyptRMWz+2/45DwPmYD+r3M0uidDwnG3wHlYiFoioDHBU3LOcIrvHcxFEM/KDoSOkzXcqHP/BVB5P6eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CaNOnMmT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60BBC4CEE3;
	Mon,  6 Jan 2025 17:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736184875;
	bh=YzBD69Ati05p96MYx7b6sryRrVaWQZkIv/X1D/dyxCw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CaNOnMmTPChtOxc6VXw5sN6+sip0t3gP7/xenKzXHT04wWkfbYaDx+UQPpcDTC+ih
	 fxY/JRoDmHTpBvyqBp/tDANWUOm98neX/C/gtarb/nz/E9ktU2CEcKOERRoe1Bxss0
	 BghJg1wghE6V7GwtoVRGjeuD/Cspr2AaTN1S0MQgkzTIVvXsZLrSKNGQE74dC+VhUD
	 PYGVEl4zKBENBCQZDzNlOCOq10aVKjuj6zPtfBvKL8+sBTthILzpeKkp+29ch6SO9j
	 rKFk3WIMtZQW4czywzbteaMa9wZ2X18nIGBq/xzJ/q/6wmgTb+BPl0l7/dWdUInBJL
	 PxZ5p5Cfs0B5Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Melody Olvera <quic_molvera@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jishnu Prakash <quic_jprakash@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Subject: Re: (subset) [PATCH v3 0/7] dts: qcom: Introduce SM8750 device trees
Date: Mon,  6 Jan 2025 11:34:29 -0600
Message-ID: <173618486756.8645.2856249152434296360.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
References: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 04 Dec 2024 15:18:00 -0800, Melody Olvera wrote:
> This series adds the initial device tree support for the SM8750 SoCs
> needed to boot to shell. This specifically adds support for clocks,
> pinctrl, rpmhpd, regulators, interconnects, and SoC and board
> compatibles.
> 
> The Qualcomm Technologies, Inc. SM8750 SoC is the latest in the line of
> consumer mobile device SoCs. See more at:
> https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/images/company/news-media/media-center/press-kits/snapdragon-summit-2024/day-1/documents/Snapdragon8EliteProductBrief.pdf
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: arm: qcom: Document SM8750 SoC and boards
      commit: 5202bca52a6b48bf51500e302dca24d722c40990
[2/7] arm64: dts: qcom: Add PMD8028 PMIC
      commit: 167466c07085d76ce41989edb0a9598f37b56185
[3/7] arm64: dts: qcom: Add PMIH0108 PMIC
      commit: 2cf3496e50f308d80142bad85946a3a3ad7d7248
[4/7] arm64: dts: qcom: Add base SM8750 dtsi
      commit: 068c3d3c83be47fe933679d6cf6f324f60941176
[5/7] arm64: dts: qcom: sm8750: Add pmic dtsi
      commit: 7f9738e0a8dbd78d47b95981792dee013f28981c
[6/7] arm64: dts: qcom: Add board dts files for SM8750 MTP and QRD
      commit: 6a02becf4b42f1664d9443e7d2049dd4e31e5ff5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

