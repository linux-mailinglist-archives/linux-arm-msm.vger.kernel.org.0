Return-Path: <linux-arm-msm+bounces-19207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8CF8BBB2C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 May 2024 14:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CD331C2126F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 May 2024 12:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8B2225CB;
	Sat,  4 May 2024 12:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjvlCWAL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C4B1EF15;
	Sat,  4 May 2024 12:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714825216; cv=none; b=Gl5AsneMNZgvg1Liy7F+qgVfm4kPxuM80v6s5uvsjjssE40VWR5iivF/aotywGNL4CLnB7YMOzuuHvqjr3iFVhqQ/N3KlwrAqXGwCCvcoV2CfDpbOekCZA1FnhxxQWvTpM9RvaONe3g/BdynxPqH18t1dmDfllmcrPRoB7RAr3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714825216; c=relaxed/simple;
	bh=ineIkKnUDuzzAdF1Glab7iGxw6dnoH+T249xBi2Kn1o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sh2JnOJsyk2ZOdH9YgBwdzbKwD4bMxygRDe19UXqgSc9wNE7M0Nk6vIvSDSg5KDxinPwhdTIxd/OMvvjtSp1dvAhexzDwj/1ZRMEBpEpOHXF7en2TZHq+kYQhaqO8qezZkrxxRDX71l4PzNdOBXWcpxF/SmJFDydEh8xBusWZbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tjvlCWAL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85901C072AA;
	Sat,  4 May 2024 12:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714825215;
	bh=ineIkKnUDuzzAdF1Glab7iGxw6dnoH+T249xBi2Kn1o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tjvlCWALAkayeTgJvVNm6gTy5MqAIbqLLZNjDRYl/VrIsc/bigU5Fn1woEByqb2/I
	 mHVTujEgQNR6ILF/KVLv8KX/IAtazQfVJf0Mb3svLY2HOIyuAIU5VeLNOnAxK4qrvy
	 JDqikK7Hdv8zTwUG9u/v7bVmi2lOocYF5zPEH2i4O+k3VA9DBspailcJH3aks464Wx
	 T0Es8jT74T/XD9+Zx3QfN1SMp8W+BfC2U/1BdsUJhhjYzVKV4G3Zl25RNKFFrwxhq3
	 5u8i4PTckLtYTyBZLGiuM0TEUQSAFJCcVd/XUmk662HSRG087I7VwxhiLvow2scU/S
	 i/+ll8/LrMKsQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 David Wronek <davidwronek@gmail.com>, Andy Gross <andy.gross@linaro.org>, 
 Evan Green <evgreen@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
 Iskren Chernev <me@iskren.info>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Yassine Oudjana <y.oudjana@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20240501-qcom-phy-fixes-v1-0-f1fd15c33fb3@linaro.org>
References: <20240501-qcom-phy-fixes-v1-0-f1fd15c33fb3@linaro.org>
Subject: Re: (subset) [PATCH 00/13] arm64: dts: qcom: fix PHY-related
 warnings
Message-Id: <171482520711.43908.14495514942152454655.b4-ty@kernel.org>
Date: Sat, 04 May 2024 17:50:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 01 May 2024 19:19:26 +0300, Dmitry Baryshkov wrote:
> This series goes over Qualcomm PHY bindings and device DTs and fixes
> obvious errors and warnings reported by dt-validate.
> 
> 

Applied, thanks!

[01/13] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: fix x1e80100-gen3x2 schema
        commit: 484b139a4cd7e629f8fcb43d71997f400c5b8537
[02/13] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: fix msm899[68] power-domains
        commit: 59e377a124dc9039d9554d823b1cb4942bcee9a0
[03/13] dt-bindings: phy: qcom,usb-snps-femto-v2: use correct fallback for sc8180x
        commit: 960b3f023d3bda0efd6e573a0647227d1115d266

Best regards,
-- 
~Vinod



