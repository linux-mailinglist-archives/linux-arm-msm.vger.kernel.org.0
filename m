Return-Path: <linux-arm-msm+bounces-49521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3381FA46117
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 14:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36CEE165A84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 13:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B4A221545;
	Wed, 26 Feb 2025 13:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvICAFxO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308652206BE;
	Wed, 26 Feb 2025 13:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740577255; cv=none; b=P/kHsD7jzsNQllWksrnBt8BqYznPaRfAa0y+1TqSmz8FhT7ttWlINcyAplDlaQh3TT4GGbGVeEaftoiT1FJ4apuNNN0HRxeuCHYydA9Fcen+2KFSYfIMxiP2KRm7bcD8eDfBQRa+szBTyG8Cm19khzKF4GkCLnHLSMHzZSkTets=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740577255; c=relaxed/simple;
	bh=bf1EJxLaypb4+0RqKwgkuzgRPbStL7bJ3ns99hinf+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y3xoKXTcaXZqmsjUI7kdZ1MgYqnZHFXFLliVqpPfjXq3g5JdP5gH5L4z/5Jc7McYaHtlrW0cNwGoojHIzrCgSIE1/1Ke3y8OtpDCpaCwvciW+FaiaivMFrowJm25OadK37/eduy1xINd1gXMX+kSiKmB2xmfSjw+EiMfY5qR8MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvICAFxO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF12FC4CED6;
	Wed, 26 Feb 2025 13:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740577255;
	bh=bf1EJxLaypb4+0RqKwgkuzgRPbStL7bJ3ns99hinf+U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZvICAFxO+G7qzoafyqUaczoVwM+I/tesrzirjlBSnFqtq/U5clTHiFqeMjadxiXd3
	 6UfFqGfTriM1HSpt6zBmJdiJsNf5hoZXgUs+hs4FebguZx9Hgc8fN0yWjjXNyJ71M+
	 K4Q6auc6aj+G8u8pzoInsH0sOzNlil1+GjEcePDoBS+m2zTi1yJAg7ADI/kkuhRbVf
	 2fGv2VXVL0BhsnsjCjtmIb8Xwe0QAi0ZLb3TkY0lFv48P4MXwZndP659Z1xujN7SbN
	 JFn1zjUeaKqEI5rbzdZYdD78EkUfNaahmpUFlQwUCF2qQHLdxH/UdGrvHmOzsXQ/zD
	 Sy3c9tzZEe3Zw==
From: Bjorn Andersson <andersson@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: (subset) [PATCH v2 0/6] X1P42100 DT and PCIe PHY bits
Date: Wed, 26 Feb 2025 07:40:45 -0600
Message-ID: <174057724682.237840.3212969107242689758.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203-topic-x1p4_dts-v2-0-72cd4cdc767b@oss.qualcomm.com>
References: <20250203-topic-x1p4_dts-v2-0-72cd4cdc767b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Feb 2025 15:43:19 +0100, Konrad Dybcio wrote:
> X1P42100 is a(n indirect) derivative of X1E80100 - the silicon is
> actually different and it's not a fused down part.
> 
> Introduce the DTS bits required to support it by mostly reusing the
> X1E SoC and CRD DTSIs. The most notable differences from our software
> PoV are a different GPU (support for which will be added later), 4
> less CPUs and some nuances in the PCIe hardware.
> 
> [...]

Applied, thanks!

[4/6] arm64: dts: qcom: x1e80100: Wire up PCIe PHY NOCSR resets
      commit: 62ca6669d62eb554eb467f2953cabb4238e18823
[5/6] arm64: dts: qcom: Commonize X1 CRD DTSI
      commit: fbf5e007588f3f2bace84309b4a0d428ad619322
[6/6] arm64: dts: qcom: Add X1P42100 SoC and CRD
      commit: f08edb5299166b7c6d4eae439b1d3f81c31ba50e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

