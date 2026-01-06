Return-Path: <linux-arm-msm+bounces-87729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AE73DCF9F8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 19:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE818305878E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 18:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE3C33A6FE;
	Tue,  6 Jan 2026 17:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACj6Fdzm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043C133A003;
	Tue,  6 Jan 2026 17:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767721976; cv=none; b=Q5s7GjhZS5AzrIPlLzCcvnY3eu4dVXJAjBtCnf3CblN2PQDRR+/9eZOHf3dR3u17KIjeXjaNDFcUEPavngqq+S0Z3F+eI0LCWz7Im7n6GnGz546KGGFzMuBzO4T1CL2ThEMucHkn4gyd9C9uybimbWOBTU/nW2/3OLrX3rvPEQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767721976; c=relaxed/simple;
	bh=TYr/HLKbtkL4zdI4yZFxob2Bqal5LW2iewldEZo+O3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bR3150X5jxBGFiQjzxg3vMH0+sA6n5kjdtP/YoRpxrAaqv7MZXIk07Jrc2Imsu7Uo7BFGEGHk4MPb2olh0Z9iI0Ct7rWsuIMiTMiNclmLHRgMaZ12TcxJtmPEyrfa6lyFFB7k45zXGmfDIg8NWRg9TT3jFDaUQUxITCtfwBD3yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACj6Fdzm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4AC9C16AAE;
	Tue,  6 Jan 2026 17:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767721975;
	bh=TYr/HLKbtkL4zdI4yZFxob2Bqal5LW2iewldEZo+O3k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ACj6FdzmPV5d3pS2XzGgLCdA8tk56faq5zPfmA2AGWNss0ICYax5cRRKBa1oDl3lk
	 AMO4r/eoRBePrITT5ilyQihSuRgL/et0sL4bHliiNu6HcnnBvKOQoWrtDPtbv/wckN
	 M5hIh7TYyT4EjctKYd05ORPYSzp1ViDVuwno9LRb1V9O5h9Ym+BRmwzTARfRar3lR7
	 Ebq1BWBk7/zIbJjSvzGvO0D2XrIOehGoO8MItSV04VqtG9enuwuMQecTe5alC3CJDE
	 yINEq/9IzAV+wlz/lHLPYT9cl/mzMsH2vnbzdEiqtqHTYHK0QHW/exhsgRVlf6j8kx
	 Dzy12JBLaSctA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 1/3] bus: qcom-ebi2: Simplify with scoped for each OF child loop
Date: Tue,  6 Jan 2026 11:52:50 -0600
Message-ID: <176772196925.3106040.16051762780281428458.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 05 Jan 2026 15:36:58 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied, thanks!

[1/3] bus: qcom-ebi2: Simplify with scoped for each OF child loop
      commit: 9c252f3c8f390fae4ca09de36c9262a35ae88ace

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

