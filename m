Return-Path: <linux-arm-msm+bounces-44479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 584C1A068E1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 23:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 169B41888767
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 22:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5BBC205ADC;
	Wed,  8 Jan 2025 22:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3k6joUL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C2B205AD1;
	Wed,  8 Jan 2025 22:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736376715; cv=none; b=hJN4EhbzKVjoE1oQeJaeEzDTLEnJByETSu+0o/1D2IUBVnMJMyTsxVtRHITr+3xRferpO5fZQULRZ9lMfoUHyBekw/15MmId5Up9mBzBVSJH3jVxKvI2Is2FtRgnK/l8/QP3vc7X0IyzrXN/3Q9eJ44upsuKQaHRA2UQSzNNRi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736376715; c=relaxed/simple;
	bh=53PpuYzlhxkGQjfBMi9uYk1FMVX/Bwu8VirVhwC8Z38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GtVYCo49KYKAAflN1kxVCVseiXYUQgqJZWZJkNpvJ6ryvnHZYnTTqv3f5H8kF4vjJ6hM+rOwiRG1oGwIVnEvpz38PZ/K0HyegdnEIyvEeckCR+TWunCcdZmz1BYWca26a9NJfrDOq7YBzXVzaZCSEW9KfJLTvYlDPl1xi29m4Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3k6joUL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73EDC4CEE3;
	Wed,  8 Jan 2025 22:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736376715;
	bh=53PpuYzlhxkGQjfBMi9uYk1FMVX/Bwu8VirVhwC8Z38=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T3k6joUL9QolCPtqjlSw7YDfdZEQPDToWfLr5ukR8ohiq3k8m01dckiMmdg7Q9CpI
	 3zYZDGDanGHdgDJ73FXXCXJd9PHA4VpD+6GK3s56S71QnsX+bGMdkjt6apuIcQrSUQ
	 zGTn90287myttPjDywhKeH4yul0oKgmcuTV+DubrXYU04RL9cwR9asuUWJHMtjvRlq
	 5SOdF+TmhzCYMRin3fL3M4RIiKC/H2bv1f7zd3UirN+P4++Dpi1wjWRR1K7BjaK2im
	 yl0NbP9rFpxbzDMhsNz5CHKeqNBB4vKSpNSNhnK+4qGvGZeibFXj/ltAF/Inpgm4Vv
	 SsFypt70XW8gA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Remove unused and undocumented properties
Date: Wed,  8 Jan 2025 16:51:47 -0600
Message-ID: <173637670471.158785.259622106683105605.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241115193435.3618831-1-robh@kernel.org>
References: <20241115193435.3618831-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 15 Nov 2024 13:34:34 -0600, Rob Herring (Arm) wrote:
> Remove properties which are both unused in the kernel and undocumented.
> Most likely they are leftovers from downstream.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: Remove unused and undocumented properties
      commit: 6888a9559053cd3ee6a116f34edba8d2793b5697

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

