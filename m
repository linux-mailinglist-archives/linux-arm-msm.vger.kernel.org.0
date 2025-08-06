Return-Path: <linux-arm-msm+bounces-67921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EA4B1C7C3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 16:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C8A2189DD2B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 14:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D8C28C84B;
	Wed,  6 Aug 2025 14:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o4DTWTcF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E633428C5BF;
	Wed,  6 Aug 2025 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754491231; cv=none; b=tiCUfdPptMgGCCRkkPIg2wJYP0A5AcfYJ2CwD2GkZrtcCgBwtO329U2rMrxYD+cPuAnsp3fC7Rlx9yqMHa7lrjt4Ak8avEzcmoWJ3x1lYh3EVSImQyqiYw1srkPnUecZk9ZWXSMzOzhDPBtzrTJXQfOxVvTYJdOw6yr3CYXO9O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754491231; c=relaxed/simple;
	bh=IkP5zCNemQYmyt6yqGgfOTiHen1wjFgC2/LbB4Hw44E=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=QN4HXcIu72sbz5c0AJPUhikbAP1aJ/8VTdz5D9jcv1qapN62WmqS2x+T0zfij67LY9xmuZmYJLMXIRP6ONkFjnWq8O/gy8XtBM3v1Z+XQVqxWsdZD4JdG9U1wqy9knCCS3YWM53Za0vDre0U1YJLXezNTL9/OR0rIhLcuxnOLs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o4DTWTcF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 641E4C4CEE7;
	Wed,  6 Aug 2025 14:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754491230;
	bh=IkP5zCNemQYmyt6yqGgfOTiHen1wjFgC2/LbB4Hw44E=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=o4DTWTcFbeng2GWjWaxI9OPPL63VAhk6K7TaGazUGEXOqvTfDJUTEEPVkC7M0Dll0
	 K7hIW+bXdcw1ZrA0fxa1oBcuOZOjDSMnAY7UpAj9mi3dsc4va37qles+2N6dO2NTuw
	 lxYrjx3VL1ns4ePqf6964Sp5O9Jdnl/u7sXlW9Zuu50LyE/5D011JJFLdjPT9MJdHc
	 q+p/oANBwEdiXE76BMB59tE7m/1v1h+3v2n76fTzePtNZpIKyZUhMVlYFA67465kwe
	 Hw4LD2hZi3C2t3zPbkfe0pK591XsEYGK3G1AlGD7rksDAY3Yy9IB2dNrsE+EIaxUuM
	 JTc1lIL0l4y7A==
Date: Wed, 06 Aug 2025 09:40:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org>
References: <20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org>
Message-Id: <175449112353.639494.1882304081892662235.robh@kernel.org>
Subject: Re: [PATCH RFC v2 0/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5


On Wed, 06 Aug 2025 14:38:29 +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> Changes in v2:
> - Patch #1: Add RPMHPD_MXC (Konrad)
> - Link to v1: https://lore.kernel.org/r/20250714-b4-sm8750-iris-dts-v1-0-93629b246d2e@linaro.org
> 
> RFC because depends on old series (6 months old!) which received
> feedback and nothing happened since that time.  I assume author
> abandoned that series, but unfortunately unmerged bindings for
> qcom,sm8750-videocc block this patchset:
> https://lore.kernel.org/all/20241206-sm8750_videocc-v1-0-5da6e7eea2bd@quicinc.com/
> 
> The bindings for new compatible qcom,sm8750-iris:
> https://lore.kernel.org/r/20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (3):
>       arm64: dts: qcom: sm8750: Add Iris VPU v3.5
>       [DO NOT MERGE] arm64: dts: qcom: sm8750-mtp: Enable Iris codec
>       [DO NOT MERGE] arm64: dts: qcom: sm8750-qrd: Enable Iris codec
> 
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts |   4 ++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts |   4 ++
>  arch/arm64/boot/dts/qcom/sm8750.dtsi    | 113 ++++++++++++++++++++++++++++++++
>  3 files changed, 121 insertions(+)
> ---
> base-commit: 709a73d51f11d75ee2aee4f690e4ecd8bc8e9bf3
> change-id: 20250714-b4-sm8750-iris-dts-ebdb5dc4ee27
> prerequisite-message-id: 20241206-sm8750_videocc-v1-0-5da6e7eea2bd@quicinc.com
> prerequisite-patch-id: ada17af875101625f7754335fabc909c8ab9cd20
> prerequisite-patch-id: 3cb47a7c47cd96e02b5a4a05490088541f97c629
> prerequisite-patch-id: 8c77b8e0c611b5e28086a456157940d773b323ab
> 
> Best regards,
> --
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
 Base: using specified base-commit 709a73d51f11d75ee2aee4f690e4ecd8bc8e9bf3
 Deps: looking for dependencies matching 3 patch-ids
 Deps: Applying prerequisite patch: [PATCH 1/3] clk: qcom: branch: Extend invert logic for branch2 mem clocks
 Deps: Applying prerequisite patch: [PATCH 2/3] dt-bindings: clock: qcom: Add SM8750 video clock controller
 Deps: Applying prerequisite patch: [PATCH 3/3] clk: qcom: videocc-sm8750: Add video clock controller driver for SM8750

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org:

arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/video-codec@aa00000: failed to match any schema with compatible: ['qcom,sm8750-iris']
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/video-codec@aa00000: failed to match any schema with compatible: ['qcom,sm8750-iris']
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#






