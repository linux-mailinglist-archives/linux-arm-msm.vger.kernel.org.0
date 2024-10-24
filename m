Return-Path: <linux-arm-msm+bounces-35706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 259069AEAEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 17:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 239331C2210B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 15:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BDE71F5839;
	Thu, 24 Oct 2024 15:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtSxxJVL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2011F5825;
	Thu, 24 Oct 2024 15:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729784627; cv=none; b=MlV8FhEgLX/BlbgCrYT1n8P5QoCa7AMwrGhcR9wdFtuurdQXMy2sa9bHU7n/lkYIS7VXS00nWCXl2KU99gaCWcL2cbf+1vsf71W9GOsHCJvDqo/uu7urKxepzJm9DezC57nMsPfZO0Eubqcq6IEmtRVi4R9adyZ88Fu8gxd3n24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729784627; c=relaxed/simple;
	bh=hRw3miUChWaU6dh+Q8eA+3PaVQ9BfixeDUhj7d+b/HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IfvR9Rg+m/5rw8XnvsBRoT4mag+qD12DzX06laZ0+RoTBsK+j82GJwERzSTEXoI7AQalXb4VHb3EBGJUePgJ3sFCfx1YhwE0I3DaxPZUEA0U+WxeGNRMM0725XiQxCRu9v7cD5RBxqVWBaPFrNKfrUm1MV7repuSR79wtBeaBBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtSxxJVL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9FBC4CEC7;
	Thu, 24 Oct 2024 15:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729784626;
	bh=hRw3miUChWaU6dh+Q8eA+3PaVQ9BfixeDUhj7d+b/HY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QtSxxJVL8mpBVnLtlk3eerxbbvrUhYgGPeIyoQYEDKEXCw56kGf9rJrVJ1BDCt/Sk
	 Ut/kJGVt+4zXBMinUQiQmZcL6c2zpKSSYcPvMKqCeUiPSpcBd6c6oJW3itEbRvK4cm
	 FCH7OSkU5aLEeE+ILN36+A1VLxy+Bz21CyDMCD8z6G/zvSktmGTBk+K6WS2MEbLaAA
	 YsYfCJ5yyx2tc2j/pxQabtW7b2QORfSwiggH2DLfwmrlX9nhQK5NZ0lezb7kCHphqO
	 +7c3OZ5tGIb3qK3Cz3UYjBNKsBcazP8ZeX/e9ml+TINuYGA7mm5DVRd8I9raJNZ9HX
	 8NkMs0taKFptQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: dmitry.baryshkov@linaro.org,
	manivannan.sadhasivam@linaro.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Add PCIe nodes
Date: Thu, 24 Oct 2024 10:43:43 -0500
Message-ID: <172978462070.300538.13331718382889000397.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241024-enable_pcie-v2-1-e5a6f5da74e4@quicinc.com>
References: <20241024-enable_pcie-v2-1-e5a6f5da74e4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 24 Oct 2024 18:58:49 +0530, Krishna chaitanya chundru wrote:
> Enable PCIe1 controller and its corresponding PHY nodes on
> qcs6490-rb3g2 platform.
> 
> SMMU v2 has limited SID's to assign dynamic SID's with the existing
> logic. For now, use static iommu-map table assigning unique SID's for
> each port as dynamic approach needs boarder community discussions.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs6490-rb3gen2: Add PCIe nodes
      commit: 267643b3e3a4e6cb7996da77f6d7f89ed8f5d554

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

