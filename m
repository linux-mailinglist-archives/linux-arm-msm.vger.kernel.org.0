Return-Path: <linux-arm-msm+bounces-29206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0147B95A04D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 16:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 823CFB237D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 14:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2A91B1D61;
	Wed, 21 Aug 2024 14:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sFsNERvV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E8B1B251A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Aug 2024 14:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724251611; cv=none; b=SbqSYEasIzb4KoLrABgLVmvE7n9VghHOASUKkQcAcYjsu58EgM0LEcYtwUk3sYWjuX53X2/TZacaUjlHInE9RUK7AWLSICYidYJwyy0DNt0SnYhSXwEAX3o7PoACoioqA1VbBPVao/LtwbHUt9YAYvbUUHUCiHeHQiLWcchMEpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724251611; c=relaxed/simple;
	bh=+vovy3iZv1PMOa/1tZ+nl813539YLJsp99L7pX1nVto=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MvHJ3wiEzFiwL+4VPuZfMgBJRRqzFXK2AcX8tXrZT/cpfSHQhsEpcVldRpxoUxufgxTYYHsD0scCGm7gkZ3I2bXUDqNUHX81Bu9Oi41sXrfyvfw9SBMACDhjeF0HNHz7ghprCDW/C5LfdcNRebQkTXfSgn8+mZtcxtIKD73u5hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sFsNERvV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C8FC4AF11;
	Wed, 21 Aug 2024 14:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724251610;
	bh=+vovy3iZv1PMOa/1tZ+nl813539YLJsp99L7pX1nVto=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sFsNERvVFZYpGwTQovi289ZSMOxSdn/0EfeyvtFtF5o15q5jLTvJfZAMOeHyluLK3
	 KfF1nn86/STbJvZnGJ4JgH4X24Wsf1MCKnYEpGStBOe8Xub9sc/Aqc1ow0zTC7NReR
	 6VN6f3zb/0bpWdDTwuSJFO2pjo5mAkacehzgoeRNSdLcGZVUfhPj5/vDFkM/IZ/tQW
	 cAG/E0LIYCgRLBbrh4fO42rF3WiC914N9ZfUAwd2kJyqB6sv+eykYs/44OcJ3bxltO
	 8ahVfm3k49IcKdxAqGD5UfJXB1VbmOC5tSHxEDtVSmNFc0m0vZ03RbbChtEQlbBco/
	 utwhutgLj5/rA==
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: Re: [PATCH] firmware: qcom: tzmem: disable sdm670 platform
Date: Wed, 21 Aug 2024 09:46:42 -0500
Message-ID: <172425160169.1359444.14439899564253867673.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730013834.41840-2-mailingradian@gmail.com>
References: <20240730013834.41840-2-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 29 Jul 2024 21:38:35 -0400, Richard Acayan wrote:
> The Pixel 3a returns 4291821499 (-3145797 or 0xFFCFFFBB) when attempting
> to load the GPU firmware if tzmem is allowed. Disable it on SDM670 so
> the GPU can successfully probe.
> 
> 

Applied, thanks!

[1/1] firmware: qcom: tzmem: disable sdm670 platform
      commit: 8342009efa2a5e75dce56173d7de026bcc6666d8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

