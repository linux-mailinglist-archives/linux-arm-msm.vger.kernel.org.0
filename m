Return-Path: <linux-arm-msm+bounces-16423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC24899017
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 23:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BD551C22027
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 21:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DBFE13C690;
	Thu,  4 Apr 2024 21:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2bueAQm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E5413BAEB;
	Thu,  4 Apr 2024 21:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712265803; cv=none; b=ClY4rATOunjiY1/8nl4TGocO9ruEx6tFbVfALeCU3y5qfh1KcxC2F/5jiTtgwRLqmxDWPlXku/SX35EQxEVPaZ460m1cDinRPvuBrj+YI16+DoBg53UMqFv9l3cfTIG6RO95Gqn8wFXhLtFLfJzWiNxGC29cDJ78mzkYfbyvc+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712265803; c=relaxed/simple;
	bh=0edBCNKd6VWtrOrLwNYMhFoIvvYhTJkMAz3sD1qyIpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LvuTrvPwgOykY3fQ+SVFqMZvVzV677U9BajO6SDDrVdU8I166QTOr0TaUgv9Qtuy59KACZBXbkElCHDQzMFVkv6G6MaiLNPR55nLbR+A/2HBH9eN+/coFTFCda7kst66qVumKZwSn584NlvxvUCqMlj8FHcIluXtw9eIiipIUIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2bueAQm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8355C433F1;
	Thu,  4 Apr 2024 21:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712265802;
	bh=0edBCNKd6VWtrOrLwNYMhFoIvvYhTJkMAz3sD1qyIpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F2bueAQm2a1albF71Jr/Ff6JX4t3p54ejaq6lwkeujPmV7ljkpJoaPOacoCr+C4aN
	 BylEuerjSPtbvQjrf9wMRwCElH8imTkS4EW448z27hNMNf4dD3J1NAQ/1hfr08G/Ak
	 EaOogl6B7Yah29LJxW7P+xEN0ctFg4N9mgCd5UvxlJDzlcYnTWn86MAmxFg1pswRkq
	 xanBeoCWnaAREEF6bp5qMZVQHB+fTH+E1NAwIOZd+sJY1cB9tG0JGziY5W+JdEoiRQ
	 eB5D6BcZ1DLAo2QCQ5L5APwR5gMTUWAV0a2zkz4bQhoAEEC+iNAiDolL0loTNJrFfu
	 Pwkyl/OBloLcA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: msm8916: drop dtbTool compatibles
Date: Thu,  4 Apr 2024 16:22:51 -0500
Message-ID: <171226578680.615813.5035652237334595363.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240314-msm8916-drop-compats-v2-0-5a4b40f832d3@linaro.org>
References: <20240314-msm8916-drop-compats-v2-0-5a4b40f832d3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 14 Mar 2024 03:42:47 +0200, Dmitry Baryshkov wrote:
> Only two boards ever has adopted the dtbTool-specific compatibles.
> However the dtbTool should not be used anymore. It was required only for
> the old, broken lk1st bootloader. All users of those boards should have
> updated to use lk2nd instead. Otherwise several important features
> (secondary CPU cores, WiFi, BT) will not work with the upstream kernel.
> 
> Drop these extra compatibles, merging these two boards into the common
> bindings case for msm8916.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom: drop dtbTool-specific compatibles
      commit: 88d0e4e10d77bb4e575b74ac0f6dd3140ecc3bcd
[2/2] arm64: dts: qcom: msm8916: drop dtbTool-specific compatibles
      commit: 3867ad6d39cd97875aca7e5f1b17ea6dd5b1107a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

