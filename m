Return-Path: <linux-arm-msm+bounces-40171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FD09E321A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 04:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07666284DC1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 03:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5083614A4E9;
	Wed,  4 Dec 2024 03:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o981C59W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9422745E;
	Wed,  4 Dec 2024 03:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733282944; cv=none; b=uGJgHl1u/aZNNw2GX17w0g+fEM3+7NMV2AKYePx0ZBGBSm5VZQlI3ciWKW8+C5eIQKo9v8YTgH86JwuWXjZk6WpxUAmZ9Jl7hUdfpWaGA2ezcuDYhp3n/bRaDQlLoAauztfpv2AxGLgmJwpLPIcJq4XaHouX+CC9hObz+hMhLfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733282944; c=relaxed/simple;
	bh=5Rjgp/VIG+mrvRzrXwsjZlf0OGDLrjFESpHXXJ3leeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ccIgX6WdyHSBJw7wiMy4puZ6+8UO2vYApFuGqG49aE/4rMGrCCyQkUyD4dYV1fPIP91Rlq3y2ojlZHefJYqa1BVqi9HMfsGJQcpTs1++esE5Gdu9bnDPIK84RP6EaN78SSlKU2KEPLe0Tuch+975FSINq16t4KRH2TN65Ho9UrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o981C59W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B781C4CEDC;
	Wed,  4 Dec 2024 03:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733282943;
	bh=5Rjgp/VIG+mrvRzrXwsjZlf0OGDLrjFESpHXXJ3leeY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o981C59WlKvB86a3QmUaV+F6LosyfaWniMHxVOqBbkpV5UiCXw0eHOgC+ugp6dlzw
	 GQ38vn71Ea4Dp0FjhnWnRUL1PEX3tOzpssvahevxwS1M0iyLDEXGw/Hq+cK8olFgUB
	 YIKx4+oM2FoSWMOAIXmLOkifbw5wD+6mzcp9YoXj9PgckwYp6RKbQXv2ZoXfrRthHe
	 /KeNnP5bT0ezhVh1+U/pycJYAppzzvLtS+s2gW5M1pSUPO9JIxnyoTTQmo9rRrH8Yj
	 SJJmjcizGKXLyKPAcDY8FRUM2ITOEKSeLhs/dLj86fWq1KoWiC2xkmrHz5Di3CaqTS
	 6PwHrKmsNwGPQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jingyi Wang <quic_jingyw@quicinc.com>
Cc: quic_tengfan@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH v4 0/4] Add initial support for QCS8300 SoC and QCS8300 RIDE board
Date: Tue,  3 Dec 2024 21:29:00 -0600
Message-ID: <173328293797.350699.5295104276161877235.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241203-qcs8300_initial_dtsi-v4-0-d7c953484024@quicinc.com>
References: <20241203-qcs8300_initial_dtsi-v4-0-d7c953484024@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 03 Dec 2024 17:27:11 +0800, Jingyi Wang wrote:
> Introduce the Device Tree for the QCS8300 platform.
> 
> Features added and enabled:
> - CPUs with PSCI idle states
> - Interrupt-controller with PDC wakeup support
> - Timers, TCSR Clock Controllers
> - Reserved Shared memory
> - GCC and RPMHCC
> - TLMM
> - Interconnect
> - QuP with uart
> - SMMU
> - QFPROM
> - Rpmhpd power controller
> - UFS
> - Inter-Processor Communication Controller
> - SRAM
> - Remoteprocs including ADSP,CDSP and GPDSP
> - BWMONs
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: qcom: document QCS8300 SoC and reference board
      commit: d511280ce9cc5920442e78a589946f63c247dd3b
[3/4] arm64: dts: qcom: add QCS8300 platform
      commit: 7be190e4bdd2bd1aca84afef06bb755c06a85473
[4/4] arm64: dts: qcom: add base QCS8300 RIDE board
      commit: 45d55e2da9bd10d24c4730b452b11a76dc3960b8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

