Return-Path: <linux-arm-msm+bounces-22134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F25A39012A4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 18:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DD301F218D4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 16:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C888F179675;
	Sat,  8 Jun 2024 16:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CLjoMtrK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980DA178382;
	Sat,  8 Jun 2024 16:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717863079; cv=none; b=umS22CifFMi+YeU+XPit9HBIOEqvDxsTK+0U+43n4op57Zg/N/lcJCgaOLYVOIMk/SXiYeo5YvwdyDhYFoSJUXb+7Um0ONW7tIKgnX3nsHBTcW5szXAaDE6FniLnmv+FqG8drWSMgXwK7pJSG7bbuxz9U3qk4dCSczdClk9rgKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717863079; c=relaxed/simple;
	bh=IjZW7s+e5GiUN4hH6yDA8HOWvGUpCfB7ZLtckx4HLJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J8gL3o8z4WT0sed0sB0Obn43l+ksoAZ3qiJ6eSccX3Wt587HOxqW9I8S2RAp0P/1/Y3wyc20MU6zqBxgVAECfA5gN9J8mMtjJrfc9BVNkudg3SNdRYfCBKK0+7maqPgjB39xasoHtfbafkk/wdRcB+wfRnGBIFu4AG/lo0Yb3B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CLjoMtrK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640B4C2BD11;
	Sat,  8 Jun 2024 16:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717863079;
	bh=IjZW7s+e5GiUN4hH6yDA8HOWvGUpCfB7ZLtckx4HLJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CLjoMtrKZInJ2kW0BDfDzudCsnYu2dyZF/kcppjD5soOeqOXEG4Znw1p7+jNe6ZId
	 iZWoIgd0FRklZ4P8eqHQKk4kmrhWqrh9DxbXkuqkqOMM928ebEZNaUvsvL73NMw370
	 v1AZQyNowQlCxTCtprc4leEnDjvtEJ7h3xkRRu2UD1XekGp2RHrISN6IB6qg52BVdZ
	 sXSwXQU1+rl45+PPfPtTNYP7DS/gxu4jjCsYkMBXBKU0u+QQg1HlF77RuJ8QwE3WFv
	 hV2H/WupNAaOj/CJJRJG8XKkko3DmoZYO5veL8Y36D0uUZua6ZpAjCOeHB1pfedl0m
	 uDFvL+EXhjY6A==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 00/12] Adreno cooling, take 2
Date: Sat,  8 Jun 2024 11:11:15 -0500
Message-ID: <171786307409.851553.17581174595985014782.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240510-topic-gpus_are_cool_now-v1-0-ababc269a438@linaro.org>
References: <20240510-topic-gpus_are_cool_now-v1-0-ababc269a438@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 10 May 2024 14:58:29 +0200, Konrad Dybcio wrote:
> For the thermal framework to cool devfreq-managed devices properly,
> it seems like the following conditions must be met:
> 
> 1. the devfreq device has a cooling device associated with it
> 2. there exists some thermal zone provider
> 3. the cooling device is referenced in a cooling map
> 4. the cooling map is associated with a thermal trip point
> 5. the thermal trip point is of the "passive" kind
> 6. the "passive" trip point is being updated (via polling or otherwise)
> 7. the trip point is being hit (i.e. the thing gets hot enough)
> 
> [...]

Applied, thanks!

[01/12] arm64: dts: qcom: sc8180x: Throttle the GPU when overheating
        commit: 7c05517e5e68205c9d5085c029df2ca4e6ad9237
[02/12] arm64: dts: qcom: sc8280xp: Throttle the GPU when overheating
        commit: f7fd6d04c1046107a87a0fc883ed044cf8b877a1
[03/12] arm64: dts: qcom: sdm630: Throttle the GPU when overheating
        commit: 545fef1e5e43fb73083d16507a13820179726ebe
[04/12] arm64: dts: qcom: sdm845: Throttle the GPU when overheating
        commit: b79dd56ed5fcc863f167eb53771b09e8b3d8e317
[05/12] arm64: dts: qcom: sm6115: Update GPU thermal zone settings
        commit: c518b5f6def159222d73f3241fb1802bc846a477
[06/12] arm64: dts: qcom: sm6350: Update GPU thermal zone settings
        commit: 1a558bbffc2ee9b99226b146fd7928e41db79d41
[07/12] arm64: dts: qcom: sm8150: Throttle the GPU when overheating
        commit: c61300433b7b89d5782fddf95bd96a6e819c0377
[08/12] arm64: dts: qcom: sm8250: Throttle the GPU when overheating
        commit: c862b78b7203b72dd6806a77c0feff60fe96dee5
[09/12] arm64: dts: qcom: sm8350: Throttle the GPU when overheating
        commit: 10a5555220ad20b2f8043060d76b0e7f83ae91fa
[10/12] arm64: dts: qcom: sm8450: Throttle the GPU when overheating
        commit: 4be0dd44c39b083148ae9d4c4a7ef6d64e6c0062
[11/12] arm64: dts: qcom: sm8550: Throttle the GPU when overheating
        commit: ed979c039ad1c9b02dd7e9fa6a0dd69209bac6ed
[12/12] arm64: dts: qcom: sm8650: Throttle the GPU when overheating
        commit: 497624ed550604b3f713f53bc506e49ce5046e5f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

