Return-Path: <linux-arm-msm+bounces-21390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C098F8D73A0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 05:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60C3F1F236E5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 03:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E413238394;
	Sun,  2 Jun 2024 03:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YLMMfYmJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF9E381D4;
	Sun,  2 Jun 2024 03:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717300439; cv=none; b=a3G72nxd6P5tieiww/53b020VksUhf0SF2B1uTL/0rO+x5mStO1RB4iFOuV+2bub3KAixdb7BBj9kWj5PupZN/LqyJk57mYpj3N5YZ21eQwmnQLRC+jmTFTA2BJDUxFo6CX6sC2EX7QfDfZ6sTPxbdnLtn9eNSbbLE2jdWeNPdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717300439; c=relaxed/simple;
	bh=Uq/iB0/HACyOw00ABR9dimhGwSP9o93X+Evte1PJjgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WdBf7LBnFgVcd7dKdMvGV++/SSETsd7jxtnKXeuaHnmjaP0tj76mUA32rsmrxcYYkOFRZ5GCWE2nqH0alt5TO/h19rkuZzfI/oYo3iPeRx4IKh6K5U+a/PYSz6+BG9BuadWKnuh1X6+B8zNDbzowU7eucVRlfNncVK+2ikk3DpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YLMMfYmJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBAD4C4AF0C;
	Sun,  2 Jun 2024 03:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717300439;
	bh=Uq/iB0/HACyOw00ABR9dimhGwSP9o93X+Evte1PJjgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YLMMfYmJq1l3GIYIip08pJuQwB80inSGjCGI3GvdEHXzArY1Mr4tM0qWJe+USzREh
	 8Rdcn3Hcg49isdiHHPrd9IEFJuUe4acaRhPUQvjRPLdwa1H40PrRxvCjv9bQSi6vDc
	 SrkQoG5cNw/fUgOQ0ErXNKTrBwB+ONc6qG+J6KyIzxmNozDI775h3l6vr1ahkEYPhf
	 9Fn5k2Y2xBFmqxLQMStTaiinykuJAegVmCNTXwffCH6T9tRty77BJy4tmkqudJva7A
	 rDLznGGql/TlsRs4ysdUbVeXb5teSqhcoMnN7GKN1rRH38rRPHbKM9xZfBNa2kiMK6
	 pd3iDiAZnw5pQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	quic_jkona@quicinc.com,
	quic_imrashai@quicinc.com
Subject: Re: [PATCH v3 0/3] Add updates for clock controllers to support QCM6490
Date: Sat,  1 Jun 2024 22:53:45 -0500
Message-ID: <171730042581.665897.14151503149058581115.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240531095142.9688-1-quic_tdas@quicinc.com>
References: <20240531095142.9688-1-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 31 May 2024 15:21:39 +0530, Taniya Das wrote:
> [v3]
>    1. Patches for LPASS Audio has been split from this series.
>    2. Updated the commit text as per the comments.
> 
> [v2]
>   1. Move the implementation to support the lpass resets for the SoC
>   using device tree property to new SoC-specific compatible.
>   2. Separate the regmap conflict warning to a new patchset.
>   3. Separate patch to handle the transition delay for GDSC and the mem
>   core bit update for UFS ICE clock.
>   4. Separate the device tree board specific changes to handle the
>   protected clocks and lpass audio clock node. Remove the unnecessary
>   disables of the lpass nodes.
>   Link to v2 - https://lore.kernel.org/all/20240318053555.20405-1-quic_tdas@quicinc.com/
> 
> [...]

Applied, thanks!

[1/3] clk: qcom: sc7280: Update the transition delay for GDSC
      commit: 7f10197853006c45e51f17e5f6b2da8d98b60784
[2/3] clk: qcom: gcc-sc7280: Update force mem core bit for UFS ICE clock
      commit: f38467b5a920be1473710428a93c4e54b6f8a0c1
[3/3] clk: qcom: camcc-sc7280: Add parent dependency to all camera GDSCs
      commit: 63aec3e4d987fd43237f557460345bca3b51e530

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

