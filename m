Return-Path: <linux-arm-msm+bounces-58254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 368FDABA876
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 07:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 388981BA48EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 05:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F85E19F424;
	Sat, 17 May 2025 05:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MjD6xnFz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DB519E96D;
	Sat, 17 May 2025 05:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747461448; cv=none; b=i0GmLDTFAP5vbKQnwx32MbuoJ5KFRHLUwq+dKvlGAhdEV2kIh88o2t1sR6fvGdzL+9AfhycvEGJj6H293dmTgQ7sIdVZdGvnGFEpviec5yGMiiQgqXhjbLwxxAPYSjs8owd1eZN9QCgAb4I/JisjZBb9VQOk/DIBlRlGp3l0gVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747461448; c=relaxed/simple;
	bh=EC2VP22yfGO3WHCPoTsqpXm5/wdNA1HQFwMFlSrOQV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iqo43FPjEHuzVMlpvR2yvTQ1EerHzbNwYTFrZaNlyQcVRlzbNAwvzeMDY7ob5s8HvMlFSTg8tITlOt9ILyuDcE+F+NkhpXbh9ORe///fV94wJxg4oM+OfoA1o9hWfTmPjE/tcWUkmgYGXThwG+crP78czB9p6gaFGVaXMFEhvDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MjD6xnFz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFCE1C4CEEA;
	Sat, 17 May 2025 05:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747461447;
	bh=EC2VP22yfGO3WHCPoTsqpXm5/wdNA1HQFwMFlSrOQV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MjD6xnFzpCnGynOHyBfNUEMD2raidhYnDE1dnWkvDpF9rMSqt6IDOhoL2jpnTRI7x
	 fA1QIdPxonq/Tsybfh7LF/r0WG9c7ehGVXFbEhy/zSweD4yz2DFcvvxzj7r/+agEEE
	 q1+lgCLM+KGdmNNfLbyoim/+eAMV3txYwvn+8d7mr6kBx+/NA4trr+FWdd3z4AOF3N
	 6o5cCLY4bT3MnBSlIGirJENt5/Bhz8ldIXQzGR3v8KMTX2kmNrsbqg7+yz4WsjJoK4
	 dUkbyFdWGzQv78uY8aZaEWCcRQsl6RJXrB7qDG2JakC68FBdYbS8/oLmkPvjvAR+XJ
	 Ldjo5U0Y/3bNQ==
From: Bjorn Andersson <andersson@kernel.org>
To: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com,
	conor+dt@kernel.org,
	quic_nkela@quicinc.com,
	quic_psodagud@quicinc.com,
	abel.vesa@linaro.org
Subject: Re: (subset) [PATCH V7 0/2] qcom: x1e80100: Enable CPUFreq
Date: Sat, 17 May 2025 06:57:14 +0100
Message-ID: <174746143142.152010.3421284169202347351.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20241030130840.2890904-1-quic_sibis@quicinc.com>
References: <20241030130840.2890904-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 30 Oct 2024 18:38:38 +0530, Sibi Sankar wrote:
> This series enables CPUFreq support on the X1E SoC using the SCMI perf
> protocol. This was originally part of the RFC: firmware: arm_scmi:
> Qualcomm Vendor Protocol [1]. I've split it up so that this part can
> land earlier. Warnings Introduced by the series are fixed by [2]
> 
> V6:
> * Drop patches that are already picked up.
> * Rebase to the latest next-20241029.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: x1e80100: Add cpucp mailbox and sram nodes
      commit: 06e3c7ec804524767f529404d023993fbca9ea43
[2/2] arm64: dts: qcom: x1e80100: Enable cpufreq
      commit: 892c83aa39cb4c1a4c63fbc51d6f6bd76bfa1ec9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

