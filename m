Return-Path: <linux-arm-msm+bounces-58584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06137ABCD1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 04:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0DF54A5154
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 02:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623B125EFB7;
	Tue, 20 May 2025 02:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjF8KoI7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B6225DD12;
	Tue, 20 May 2025 02:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707330; cv=none; b=feCMwiodtq62USPabFHyCRyD83PyURhcFF4nGCiEzB29+tiFlY5Q2RVJjf1E1wayUC+eiTiAF+75FlzhJfkeiIeFnJO5Ga6D8tuvp1gbye0tOmLip6OGQoMzrsDEIhp5/XPlG8S1aE8nm3v5mp/s7daQPLGq/nr30bBwolv4BNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707330; c=relaxed/simple;
	bh=XTHMk6i2tPPM3JKHlaucStHPiYXNKrRtoWA3ciVIYpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZMTFFuFbc9kLPaxdoQ8kvplXObaSEZkpzwuCWcMrkVDBpnlZ4K5E6NN2i2Yj94hS9dn42e6OH2Gt+r4YS239ChQBdLgHGnkXK94m3AXcjyFrSTugy6YiFfLX8MjyZYNmib9Pm8t2NEAjubNTDwQnRTLtOEw3A4bMjyzH+RWvAQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjF8KoI7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA633C4CEED;
	Tue, 20 May 2025 02:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747707329;
	bh=XTHMk6i2tPPM3JKHlaucStHPiYXNKrRtoWA3ciVIYpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gjF8KoI7kUmxtgERU6T1w0/vbtbPK7ac/c4m3JYL9bR+Hjc2jSNk7Q4J6iCYJouLE
	 pHQ73mYcKnj/PZRpIIWMbb9sBwLQQCDewcNPtC5lRxWZtDp58TIL71NDl6rMoqQACG
	 bFNVhAAWBiHJaA66oVQKhnkvxNgCp5NQznATyYxw9mdOEtSuG5PAbEVz5QurKNBo1X
	 h1ioIgbz4WtZgZwSFRZpl0aveuvjqz7GpDNH+zSnuemzuuKKfTCRKK3DVoRPIK+Xen
	 Es9rCdnUE2LEIAvc7mrjBs/VfN/+qo59BVMIJI9+M7YijZn8Y0zzitFijleEHLwAD0
	 CMl59EpvlrOAw==
From: Bjorn Andersson <andersson@kernel.org>
To: cros-qcom-dts-watchers@chromium.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xilin Wu <sophon@radxa.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Mark FastRPC context banks as dma-coherent
Date: Mon, 19 May 2025 21:14:56 -0500
Message-ID: <174770727730.36693.11415805267303193965.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416-sc7280-fastrpc-dma-v1-1-60ca91116b1e@radxa.com>
References: <20250416-sc7280-fastrpc-dma-v1-1-60ca91116b1e@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Apr 2025 18:54:18 +0800, Xilin Wu wrote:
> The FastRPC context banks are DMA-coherent on sc7280 platform. Mark them
> as such.
> 
> This allows LLM inferencing on the CDSP using Qualcomm AI Engine Direct
> SDK on the qcs6490 platform.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc7280: Mark FastRPC context banks as dma-coherent
      commit: 2a49326081e1e5f08e0e6d65a1632652ee11a319

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

