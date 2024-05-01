Return-Path: <linux-arm-msm+bounces-19089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E003C8B9087
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 22:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B9E5282BD1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 20:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C089B1649D2;
	Wed,  1 May 2024 20:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lq6Eee/t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9961649CF
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 20:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714594862; cv=none; b=BuBFPCi2x4OSkqRKhcGeW/k0mm1RKUNRrm+fY4Y+fCVmxn8bRTNPRHRPUKBJt96kUgjbWxu/cWYr5UJFtxE9ilc3/vT/S1adb5xwxwt0N3kC9htpv2D8FUcH+fKuy745Gc7jhuDd8ouCqkxE8HwZ1d+QEWGLZXQ+OrwfoLwCdc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714594862; c=relaxed/simple;
	bh=fcOxoRzyqrpedCSZF5cahtgU7lLmEWmcq7EBSzoKhkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qvWRcIsRP+tlnrdq4fwxxpTIVZXegJmKPxFx8tiQ1szCMN2rZ6pe2JrrUWX5d63z1bKemB6frokqwzwosOHRfoMwVnXpSPJITsJRpo5o60O8Ayt58GmU3DSYcAgkBngpeHKbacVdthIUEm0bHoMzrrOJ9j710hHlm5eyJKctpgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lq6Eee/t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7DDC32789;
	Wed,  1 May 2024 20:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714594862;
	bh=fcOxoRzyqrpedCSZF5cahtgU7lLmEWmcq7EBSzoKhkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lq6Eee/t4V7/LLIXHGAYQMorz/qAkQ7Zj+dVJZtJOVq8t2717NJ+Q/D7fHTqF4L6+
	 DAumZSDPFWv0aYjnfu03STSAnq6AJaVThQkSw31cz1DFn4VYcwZXlepkKr9N2ez1q8
	 lKGMymWVyGNL7bcau/uRYQQc2xtTdChGXoJRBGJjUvzzG1tj1+Vl9jN13YJr253J2N
	 iLVmwj5dQIhJKDPgYLfepRYIdjfVjLxbwMaYbWtz/bBnFgKEC8OwFK1PzBV/GTXQX/
	 RVyNjbzq8EBINL8oljCYSsYvpNRDKHq1dtujTJNzZgJM/tjxWkI1dCJJpC4qEoZ2TQ
	 3QycvNC6oynPA==
From: Bjorn Andersson <andersson@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] arm64: defconfig: select INTERCONNECT_QCOM_SM6115 as built-in
Date: Wed,  1 May 2024 15:20:52 -0500
Message-ID: <171459484205.41039.13881965473736581753.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424-enable-sm6115-icc-v3-1-21c83be48f0e@linaro.org>
References: <20240424-enable-sm6115-icc-v3-1-21c83be48f0e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 Apr 2024 04:19:27 +0300, Dmitry Baryshkov wrote:
> Enable CONFIG_INTERCONNECT_QCOM_SM6115 as built-in to enable the
> interconnect driver for the SoC used on Qualcomm Robotics RB2 board.
> Building as built-in is required as on this platform interconnects are
> required to bring up the console.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: select INTERCONNECT_QCOM_SM6115 as built-in
      commit: b052c7fe3cb787282ab7e1fa088c794a1eb7fdb0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

