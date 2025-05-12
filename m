Return-Path: <linux-arm-msm+bounces-57646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 192EFAB46A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 23:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 143DA19E40F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 21:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21309299A80;
	Mon, 12 May 2025 21:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KnDLm9yY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FC622338;
	Mon, 12 May 2025 21:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747086553; cv=none; b=feXeTB6Hqejo8MGYYS1h0TeI90vjE9GT3iRHSBFCPaZir6nNzAkOGQ0qK4CL1P4TzOFeIMU4bP2AVJNxg0xnbF+a6rzIfpdw6/231t7QjsbqAN6Rxj73wiqtBCIM68Ekk3Z5Z7RMfFPg391VQ4ISF0I45GEibr//DhbypFpc+90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747086553; c=relaxed/simple;
	bh=SSHE2Q9h3ca4wmvKYP6qG9vFPFuZtu+s8qCmar2P2UM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cGBLfgKGLpgROe5c2J7Cayd8e4oG5AO5waFD+hUwKkld1QwgIsZpxwCD77Clb/OEoQ1Oa8kIu5xSwkVi6LFOsS1IG4DY0UefmXCgdM55/pzFIbQaaWMUEKXFjBQkAOZb2WwcLcoWJvLh2ZBH2mWIJW9fTtxuw9UKKmZ+90SCU9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KnDLm9yY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21127C4CEE7;
	Mon, 12 May 2025 21:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747086552;
	bh=SSHE2Q9h3ca4wmvKYP6qG9vFPFuZtu+s8qCmar2P2UM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KnDLm9yYjGpnYILSzzaMI4opkTuagD/jMZ33GNSSWMZd4tfflGXTjloYICvenJH4j
	 yZFtaEPvlx3UVnWcgcMifsEAZSgGnlpztWyJclU0h2QlfjiJIxyX8V+sgutakEJKkj
	 lx1mrAu+o+v7gPGz/WWmiVvdPzD0jGnxWTYWQLNVWn+8ZepMdvjRVvOMsxjdeknix2
	 2CTYVkbX0Ktt6Z0/UaU8XUZalGCKbM9pDZovIGgEGc1R76uAe6bgf0FSl6oZ7Ea3lP
	 J7Ysrf2ZG8LQgDc5sWnT71NrNhSTUjQRzFj/RO45Ul7SeCUjD8YM6ZV2dizPpxv+na
	 cmfMCdtqltqPA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/4] Introduce LLCC v6 used on the SM8750 SoCs
Date: Mon, 12 May 2025 22:48:51 +0100
Message-ID: <174708642737.3671.6493388672703045310.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512-sm8750_llcc_master-v5-0-d78dca6282a5@oss.qualcomm.com>
References: <20250512-sm8750_llcc_master-v5-0-d78dca6282a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 12 May 2025 13:54:40 -0700, Melody Olvera wrote:
> Add documentation and functionality for LLCC v6 used on
> the SM8750 SoCs. LLCC v6 rearranges several registers and offsets
> and supports slice IDs over 31, so new functionality is necessary
> to program and use LLCC v6.
> 

Applied, thanks!

[1/4] dt-bindings: cache: qcom,llcc: Document SM8750 LLCC block
      commit: 33f7187efd3b5f9e03d50e8209d86a08d215d413
[2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
      commit: 9186a0f3e4f2ebdd3e5ef1d87cef0418101a47dc
[3/4] soc: qcom: llcc-qcom: Add support for SM8750
      commit: 2c04e58e30ce858cc2be531298312c67c7d55fc3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

