Return-Path: <linux-arm-msm+bounces-83078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C3AC81041
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 15:30:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A5B33ACF21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 14:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A7E310764;
	Mon, 24 Nov 2025 14:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bt1F4/bV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DBC31063B;
	Mon, 24 Nov 2025 14:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763994521; cv=none; b=V7MIKgX4ol7JzGBhgajeI6RK8xkwjbbXf/7oEBb66DV8PLanKSNWCa70j00fKYsgdSapLeosnwep7vjSmLakH11Is0Z3MgebNprAc9O87sa8QSwR/TsCE484fNRG6XNFGROYKaPKetlPQgYszTApyqSwUIabTLL5ef3Vs4thGn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763994521; c=relaxed/simple;
	bh=eOs9/jrGbFyaeehEP3T86e40+lQR/QfEGBihJufmE4o=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=SHUGsOF4g7SWf0EQdy1pBjJEas+p1k9KVTiYtALU0q6c9vyhmo7h8Sh/twHFEPTlWCZcoqggIY9WpcpYs/0F4GfCli5tFgKF/BC41xzgg3PtzJCMhf3Nvj2hwc8XGJJwjdi+IYzVvS3hzDG+vpM/La2yFbDUdFQQMGxaUN+pLwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bt1F4/bV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E28FC4CEF1;
	Mon, 24 Nov 2025 14:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763994521;
	bh=eOs9/jrGbFyaeehEP3T86e40+lQR/QfEGBihJufmE4o=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=Bt1F4/bVOYSaaXs8HvQw66p/thMV2TXWNwakmgSMB3a5KCoFcI9OCBC/g0vLFjVuk
	 AIhPVyqi1hf7kVUYueC8xsv8GG6p3RWX6Wf2L/VZ5AEt2i6AnZcnWWxcHcUVEDQKPG
	 cJDqbVN/It2Mw/Z5yxpPow8l8iqzK2/XlxJxYIekS5IoO5C4/tXEqWun+VnLT9Zi5N
	 rhFmrxkmwp0vGpqBZYMAc7EGlR2FXgdCUqEytG+rjIogLvJFFdOnMRe+HUOWhEhFhb
	 07qBopuQ8T428JEET20V1g/dARscu18RDAkqMYp70xlIg+b1RVlH5HwDy1xSGUQGpe
	 uB4/CGMLeGkHQ==
From: Rob Herring <robh@kernel.org>
Date: Mon, 24 Nov 2025 08:28:39 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251120-b4-sm8750-iris-dts-v3-0-8715442c30d9@kernel.org>
References: <20251120-b4-sm8750-iris-dts-v3-0-8715442c30d9@kernel.org>
Message-Id: <176399401868.138814.12024065807589918852.robh@kernel.org>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5


On Thu, 20 Nov 2025 18:33:30 +0100, Krzysztof Kozlowski wrote:
> Hi,
> 
> Dependency - video-cc clocks bindings header - is already in qcom clk
> tree for v6.19:
> https://l re.kernel.org/r/20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com
> 
> Changes in v3:
> - Add tags, update dependencies, rebase.
> - Add missing opp-570.
> - Link to v2: https://lore.kernel.org/r/20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org
> 
> Changes in v2:
> - Patch #1: Add RPMHPD_MXC (Konrad)
> - Link to v1: https://lore.kernel.org/r/20250714-b4-sm8750-iris-dts-v1-0-93629b246d2e@linaro.org
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (3):
>       arm64: dts: qcom: sm8750: Add Iris VPU v3.5
>       arm64: dts: qcom: sm8750-mtp: Enable Iris codec
>       arm64: dts: qcom: sm8750-qrd: Enable Iris codec
> 
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts |   4 ++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts |   4 ++
>  arch/arm64/boot/dts/qcom/sm8750.dtsi    | 119 ++++++++++++++++++++++++++++++++
>  3 files changed, 127 insertions(+)
> ---
> base-commit: 9eb88791f9759995910e9b96bb55a9cad54bb84a
> change-id: 20250714-b4-sm8750-iris-dts-ebdb5dc4ee27
> 
> Best regards,
> --
> Krzysztof Kozlowski <krzk@kernel.org>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: base-commit 9eb88791f9759995910e9b96bb55a9cad54bb84a not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/next-20251120 (exact match)
 Base: tags/next-20251120 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251120-b4-sm8750-iris-dts-v3-0-8715442c30d9@kernel.org:

arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml






