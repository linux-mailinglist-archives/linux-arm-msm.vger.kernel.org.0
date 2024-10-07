Return-Path: <linux-arm-msm+bounces-33392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1728992F31
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5618C1F2451D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7ED1D9694;
	Mon,  7 Oct 2024 14:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dnb0SijC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6429E1D9681;
	Mon,  7 Oct 2024 14:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311184; cv=none; b=QbxcaA9JDq85BNaPyQr2Z0phFcQcRabuwUkeTSR508cMT5b6BOELZvcMLzfSMxUQ4I9Wwt2uJEIjnaZs1/IKfc1lrGpbt8cJKy7PyCNueWZcScvsIn7gRXcNV650iQMQHDRmI29bwXTjSEDgzAvYghbBuim7CuV8GwX7YONN9Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311184; c=relaxed/simple;
	bh=owVlYE00R8miKNi19FNeGANnK1PdP8EiYcukTqVTLbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mbl6bVbLq098vaARUgZdNDOOWLZkvjwpbJclEH3TEGwHbMSeTqmaA6Py11V3wbCdPCnlhfCl6OwvGTJf6MfyP6CBvb/T6K2l2uHFw48RdG2+sy5qBF+SCt03SI1trycdyNIkUmgi9q6YaT+P3mR9Hd58k46tPoYWRb05yWBUvmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dnb0SijC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 270B1C4CEC6;
	Mon,  7 Oct 2024 14:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311183;
	bh=owVlYE00R8miKNi19FNeGANnK1PdP8EiYcukTqVTLbw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dnb0SijCH9VzWOR0BiEPrA1uel1YqY7z7xsGiF+tqwPOboxAquFsaAui0bo2C33bF
	 fXit52Zq5C/J+xMKxboytfpL/D4s++kzgiQNAsiPI7UkEqLegJLAinDd1TNI+e9wak
	 no4O36e8ntG5tFBpMJFHg4GwsWcRrW1N2jJRlmAb1L+fY546XVtidETeIrBMNoXMbX
	 YPZ4oTu82v7fosh10cDib33BE2jHe6hmvc53FfanUY52X+xNTqJdq6scnO7Ooxc1Et
	 ONEuEGR73ZYfycp+18gXACOSsxXELCAGoKjd5+2nTqbzKtG+z98vtHp6fbOa5jiHGe
	 FfIXcRPUhOQ0w==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [RFC PATCH 00/11] Affirm SMMU coherent pagetable walker capability on RPMh SoCs
Date: Mon,  7 Oct 2024 09:25:56 -0500
Message-ID: <172831116162.468342.3878021783675879763.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240919-topic-apps_smmu_coherent-v1-0-5b3a8662403d@quicinc.com>
References: <20240919-topic-apps_smmu_coherent-v1-0-5b3a8662403d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 19 Sep 2024 00:57:13 +0200, Konrad Dybcio wrote:
> I only read back the SMMU config on X1E & 7280, but I have it on good
> authority that this concerns all RPMh SoCs. Sending as RFC just in case.
> 
> Lacking coherency can hurt performance, but claiming coherency where it's
> absent would lead to a kaboom.
> 
> 
> [...]

Applied, thanks!

[01/11] arm64: dts: qcom: qdu1000: Affirm IDR0.CCTW on apps_smmu
        commit: 7a52db70c8c5f4e2f6cf404b6cac10beae43f2bd
[02/11] arm64: dts: qcom: sc7180: Affirm IDR0.CCTW on apps_smmu
        commit: 3d89c1984000171665d8091c7fdf20f9cf814786
[03/11] arm64: dts: qcom: sc8180x: Affirm IDR0.CCTW on apps_smmu
        commit: 57222f077bd05b6ef8c5b2998400122f3c202e51
[04/11] arm64: dts: qcom: sc8280xp: Affirm IDR0.CCTW on apps_smmu
        commit: 2b73b83cb82aefb6c907ea91a9977641bbcae683
[05/11] arm64: dts: qcom: sdm670: Affirm IDR0.CCTW on apps_smmu
        commit: e009473c5f5d62d4e0f093a3126cf98e319d8cd0
[06/11] arm64: dts: qcom: sdm845: Affirm IDR0.CCTW on apps_smmu
        commit: 6b31a9744b8726c69bb0af290f8475a368a4b805
[07/11] arm64: dts: qcom: sm6350: Affirm IDR0.CCTW on apps_smmu
        commit: 7abe72765d9f6a900a1c2b6c12b9dd70010a8b0b
[08/11] arm64: dts: qcom: sm8150: Affirm IDR0.CCTW on apps_smmu
        commit: 05bd9923d15e8508cd0fa4f3d03437df1a9362aa
[09/11] arm64: dts: qcom: sm8350: Affirm IDR0.CCTW on apps_smmu
        commit: 051ff563cb3d87c631c8997d9b3636a7b59a12b9
[10/11] arm64: dts: qcom: sm8450: Affirm IDR0.CCTW on apps_smmu
        commit: c9ab6652769d331e39f7489241e8b3427f7e8608
[11/11] arm64: dts: qcom: x1e80100: Affirm IDR0.CCTW on apps_smmu
        commit: 5207d9c75f18db46ce42074f6585c7ca8e4aca75

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

