Return-Path: <linux-arm-msm+bounces-39920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 076349E0BAF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 20:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24047B48427
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC66016DEB4;
	Mon,  2 Dec 2024 15:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I1gACQe7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A159B16C854;
	Mon,  2 Dec 2024 15:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154677; cv=none; b=d4mBIK8Er41H3f3OX9aG0M25FGXfBFx6VAOM7E004RpIG/8/nrmMFow0M1mVTr/RdM2uYpRUNwH9IRd/I8+lQnxdK16bK5+TFNyK2+K0Za6mKsU/9utebXebtQeLK/iRgOlrGTdLm4KnzCMLJd1gjuGmAJKXLG2P8KYE/ca632I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154677; c=relaxed/simple;
	bh=w3NWLI4KLgT4dwNTEWZOaquyn8q5LoNO7IbYT08kOhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YyA4zve9dmC3rsip8zeFCbpuxhTKD1ZbogBTPz9dGZnbWnZWjBTGbeYZKVx/8BRAIWJaluICjxpl9UmG9dlCcDpedM4ueb21LYzROj+pTKIiALcjEUjvgfdkO0GvybPy74T3ZxW0RzZCigcfsZtKOs1osieKuzgu80Alc2LHnR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1gACQe7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3F2C4CED6;
	Mon,  2 Dec 2024 15:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733154677;
	bh=w3NWLI4KLgT4dwNTEWZOaquyn8q5LoNO7IbYT08kOhc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I1gACQe7pbQ63vIYvLOl2iS0pHLrxq/xlA8hsxZERrAbNjaAgR6SJ1HTYrl3kl0T8
	 GJ74eum+Eu3brFtUGevA4CH8viR0TUpPmbDF7hxhNN/hwWYZEnsTzotDYpYRJ+30i8
	 m+fKYaI95hrK0e8BH9la/CA/lJCrKk4y3dMx8ie6/hSrxm4y2Tl++2tFgyIg7zwUfY
	 Io3IHIsooK8PoAqjgXL5WNvgxXhro9B555GvFN8l8nIIil0QE6/ys966sGe/w9T1Xs
	 kSq7k1o0/Myl3cJGg7j5EAc1V/9RuPawhf4QGVogw2rVu2N1zIuIF2biXhlMA0JMKa
	 WwVrVZiKgTGRA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lijuan Gao <quic_lijuang@quicinc.com>
Cc: kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v5 0/5] Add initial support for QCS615 SoC and QCS615 RIDE board
Date: Mon,  2 Dec 2024 09:51:03 -0600
Message-ID: <173315466527.263019.11318467939121751784.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
References: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 04 Nov 2024 17:10:07 +0800, Lijuan Gao wrote:
> Introduces the Device Tree for the QCS615 platform.
> 
> Features added and enabled:
> - CPUs with PSCI idle states
> - Interrupt-controller with PDC wakeup support
> - Timers, TCSR Clock Controllers
> - Reserved Shared memory
> - QFPROM
> - TLMM
> - Watchdog
> - RPMH controller
> - Sleep stats driver
> - Rpmhpd power controller
> - Interconnect
> - GCC and Rpmhcc
> - QUP with Uart serial support
> 
> [...]

Applied, thanks!

[5/5] arm64: defconfig: enable clock controller, interconnect and pinctrl for QCS615
      commit: 9eec6ce36b5dc981327e9f58025d012e524687b4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

