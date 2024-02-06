Return-Path: <linux-arm-msm+bounces-10013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F12484BF8B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 22:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E57B9B21D7C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 21:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA0F1B963;
	Tue,  6 Feb 2024 21:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTLGHygp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638421B95A;
	Tue,  6 Feb 2024 21:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707256334; cv=none; b=AeDNFhbS1YU4Hhsk5OqEPpjS0c4PUPFT/9WYFTey9DSb6XwjAWvbKqm/KQ3pxI2dXEv/YeLYR1xVjKnE4paFRturJKZwv8rBfH4IVa045FajQBoudqhiAPTz3s2M53GNGlSF5Xe/SkCUU3WLg3R8g2wLVpleG3T03tx2tG47Xx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707256334; c=relaxed/simple;
	bh=H8+vCoR4mKowgldkPjWk9n+dvBkZ0xRly25CMhTfZMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnHt/arKOMmAfNmSdIpiJRd6foPbYCAm83A1wt9wn/45oWoICfnNDuEbIc7GH8Vw5HuU0GX6hK67Svk5DfNk6LyF3ef/NnENj88w2AKDiYmElhNqnC/oxiFTxI91ryLalUtJvIY8uAWyp5okDQCUmisHAmCUYbkVV+U7S9gGY34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTLGHygp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 498E0C433F1;
	Tue,  6 Feb 2024 21:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707256334;
	bh=H8+vCoR4mKowgldkPjWk9n+dvBkZ0xRly25CMhTfZMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HTLGHygpemhnbgkK97eGUCi8Sys6gw6l9fo9yFaiTfPIv5Fkf3s5GIc76cx/dWZjr
	 SrlS8FRcXNyrbpP+O8HNhYMjRMwsZIx5wrtenT0HUCB14dx6ZRttzkshO33HORuJLG
	 hlWhuSnDI4zF+2jh93wKcF8Ci+/Ssa7XY226x+KUQqRlv4QQALVCJtjh2XM/29Urux
	 ULd0u6xWu7RorlQnzjJgl5E5/Ljud8lPB46C8H/zNQNk7j1JVuQrEv9wmCD4PwO+oV
	 Cw4DWuQAexqKMMZyGq/2Qssb+bPvacEdvKNKtkVwR7snGsK7M2J9HwSyxJ4j1pmNkO
	 L7UJITQeb7muQ==
Date: Tue, 6 Feb 2024 15:52:11 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: drop the superfluous device
 compatibility schema
Message-ID: <t2vjjm5fsitmkszbbrntwcn7qoedhd6oai5t7gx7vvi3loteea@qomgj2voar7r>
References: <20240204-qcom-drop-compat-v1-1-69d6cd92aa0e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240204-qcom-drop-compat-v1-1-69d6cd92aa0e@linaro.org>

On Sun, Feb 04, 2024 at 06:56:35PM +0200, Dmitry Baryshkov wrote:
> The idea impressed in the commit b32e592d3c28 ("devicetree: bindings:
> Document qcom board compatible format") never got actually adopted. As
> can be seen from the existing board DT files, no device actually used
> the PMIC / foundry / version parts of the compatible string. Drop this
> compatibility string description to avoid possible confusion and keep
> just the generic terms and the SoC list.
> 
> Fixes: b32e592d3c28 ("devicetree: bindings: Document qcom board compatible format")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

