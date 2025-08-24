Return-Path: <linux-arm-msm+bounces-70510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E30B32D38
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 05:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97D1616F9B4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 03:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E002566E7;
	Sun, 24 Aug 2025 02:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijt8Nvhv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1771F099C;
	Sun, 24 Aug 2025 02:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756004179; cv=none; b=hfL69KNvikhB4rnreUV4qJr9kTc43NchP8AI38SX2sDPXFVmO2bCsWKerMbISapIRR6NHAe4JdCvszNtILbSroSHzpNJmf2iW0JhHGqTNMeWJOvOPkD/VLExYW0B3t/bNc8837V71HSGDnZSM8x4pFQM6ft0OEy4am9Q0u9zO44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756004179; c=relaxed/simple;
	bh=VV91vdBXA8d9qWSJl3TObVqPtHZmvy4upSc3OH706w8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iB25kXFoxKDlAMPqEABjYNxN4+64I/HhIO8XZoB547GxEC5iQOsCV+VTD+fnr5SdoKK17aMuofAZCz4D36K8GHPCZVebnPT/H63TN1vKHS52/vvPMUFjA8ja63+ZkUaPVV4Yv7ybBTwjTtUOI2DfPbhGlA4tuZ9ax4T/aq1PxI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijt8Nvhv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F049CC116B1;
	Sun, 24 Aug 2025 02:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004179;
	bh=VV91vdBXA8d9qWSJl3TObVqPtHZmvy4upSc3OH706w8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ijt8NvhvVcgsjudQdiJ/cgpbjvhl/0LJ8mC1132uoRbv8p6oNFqb+gWGlZJqFPtkb
	 6EsA8wqaSGY8ePenCofI8+7gghrxFSWVuIWfbfvqbMW2UcRCMRI9Xaff0FRmYIqnsI
	 wCU+XXX1ZEvafYvcRDL4a4K1fAR3Xa8GcxfRL3Mha6wKFv+Ombv4B3gmczcU1VE0FF
	 Xbudx6cCYvr0y/Hr8BloIrYkrC1kuZyADIfFiqDrezM+ka4rQ+ZKOJsYidwl7xG3SG
	 eVjhkMRo8tMnHFoBG9POzNmnSzWFKk+ZQi4MLxcsLqzWdGhM6L9bMOZubEWDmc7OGI
	 dFV2eNCaFg74w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Fix slimbam num-channels/ees
Date: Sat, 23 Aug 2025 21:55:53 -0500
Message-ID: <175600415287.952266.11540622753161405983.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250821-sdm845-slimbam-channels-v1-1-498f7d46b9ee@linaro.org>
References: <20250821-sdm845-slimbam-channels-v1-1-498f7d46b9ee@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 21 Aug 2025 10:15:09 +0200, Stephan Gerhold wrote:
> Reading the hardware registers of the &slimbam on RB3 reveals that the BAM
> supports only 23 pipes (channels) and supports 4 EEs instead of 2. This
> hasn't caused problems so far since nothing is using the extra channels,
> but attempting to use them would lead to crashes.
> 
> The bam_dma driver might warn in the future if the num-channels in the DT
> are wrong, so correct the properties in the DT to avoid future regressions.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845: Fix slimbam num-channels/ees
      commit: 316294bb6695a43a9181973ecd4e6fb3e576a9f7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

