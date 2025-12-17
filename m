Return-Path: <linux-arm-msm+bounces-85598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9BDCC9BF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 23:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94A5530164F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 22:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6B332F763;
	Wed, 17 Dec 2025 22:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="snzz35Gn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0EA155C82;
	Wed, 17 Dec 2025 22:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766012371; cv=none; b=bSq7YcGB5UUnoLB3Jh+TTH8L4eYW1a8LlXwbN+7Z8BG8sWkBfG39gaV6at6TIVRxP2ebIXuYcKbkSa2jiBgLMdOdm0/m9zrMmKzTvNNSEad/kO0loFqoxvd5yR6jlGAJlS0MV4FhAjv4bg2EPxXi6U0fyLbRyfCVnOBz9bIQVUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766012371; c=relaxed/simple;
	bh=hyFV97u/BLe0EoCLJ01E9yFHMupwWwOivPwO1GnFOqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=apGaydJF+WH0cwFy8rNe5cRTcN9fPJyXDggkH3TQSojMhBK0OIY3MY+LX3UYkRENuo1Fer2w5rveHPlw0ZLEKSOaEzQadqE6eumrXPDC5Um74ONyrRIB1T4tkwTI2fz/5XJ7EuA5DPNpvwTXuNBCOqn0Uz1xHUGRPhrvc59/XGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=snzz35Gn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E8CC4CEF5;
	Wed, 17 Dec 2025 22:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766012371;
	bh=hyFV97u/BLe0EoCLJ01E9yFHMupwWwOivPwO1GnFOqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=snzz35GncaCJtx2+ZELyWkDFXyA6UhFXVZz0D+KfI69MmkZ/G8XelMHZnxY97Epaq
	 bkn+6+IbOHypJ1jm6F9BG/76XRvqEBmJIVlx7KbPM0fuMcJMjm23hLoQjNkmcu5kdX
	 X1D8suGsrMWEedqu1i6B2VolVivVPESuTqQkUuMI7z7t03w66pfD7qXN2bDw5/Vn7x
	 SRpLf/XuYI3AHzANizBf9w5Q1fiH4K0yBF8O6DUdi2fhUSg/TfdtsOI+8+qk8UZ6eY
	 n41zfV98lJTgDAK30ZtyFH+l0bafp3hewVvHuOSeQgBCw8PXCNslv3WJeLj3Ffs2n2
	 zkj8iLUo6tAsg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Georg Gottleuber <ggo@tuxedocomputers.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ettore Chimenti <ettore.chimenti@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	stefan.schmidt@linaro.org,
	stephan.gerhold@linaro.org,
	wse@tuxedocomputers.com,
	cs@tuxedo.de
Subject: Re: [PATCH v2 0/6] Add Medion SPRCHRGD 14 S1 (X1E78100)
Date: Wed, 17 Dec 2025 17:07:33 -0600
Message-ID: <176601285477.201175.5602129986876039349.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204155212.230058-1-ggo@tuxedocomputers.com>
References: <20251204155212.230058-1-ggo@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 04 Dec 2025 16:52:02 +0100, Georg Gottleuber wrote:
> Initial support for Medion SPRCHRGD 14 S1 notebook, which is based on
> Qualcomm Snapdragon X Elite SoC (X1E78100).
> 
> Changes in v2:
> - Add patch for tuxedo vendor prefix
> - Add patch for tuxedo,elite14gen1 dt binding
> - Minor changes to GPIO attributes in dts
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: vendor-prefixes: Add prefix for TUXEDO Computers GmbH
      commit: 9f76530e52b51a93643dfd2aa893caf00047a563
[2/6] dt-bindings: arm: qcom: Add TUXEDO Computers device
      commit: 32d68e51bf492580bc2b84adcad8a20427d4b2a0
[3/6] dt-bindings: vendor-prefixes: Add Medion AG
      commit: a4c5af1a94c401e99d7eb22707dd848d54bff80d
[4/6] dt-bindings: arm: qcom: Add Medion SPRCHRGD device
      commit: 5851f2a20c60dd5aa39b99e4872e96ce358598b6
[5/6] arm64: dts: qcom: Add dts for Medion SPRCHRGD 14 S1
      commit: 8cf65490cdb03c0254448a54f9098686bf9029ec
[6/6] firmware: qcom: scm: QSEECOM on Medion SPRCHRGD 14 S1
      commit: 23ec0d891e09441b3d0353b56b73e35e3f3c5dad

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

