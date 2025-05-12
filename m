Return-Path: <linux-arm-msm+bounces-57607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C81AB37C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 14:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D6B9188E8DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 12:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2432957B4;
	Mon, 12 May 2025 12:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qp9gQWSd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254082957AC;
	Mon, 12 May 2025 12:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747054176; cv=none; b=jVUuVhBzbqU7pa6B+BfHY2G1bBl49zR07qEO4SwMnnoCHSlyhW6EWKEvVzClMfwsNyg3c5630Cn7Vl+31F5qNGbETdbTo6hBzvBv/PdHm/mFK78dV2jcSs+YDq6rQfbPcPbRpX0ZQUjBP4LOnvzKW/tp3O2FGPGHW2pTTPep7aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747054176; c=relaxed/simple;
	bh=tBDxyhfJLYTyQ5qc/wV3CLyT6odxMJOOJPQADjsy3/s=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ZAZ7LYvyzdQrjnG688hTfB2L55jikOTJ+VIWrvCevV8d1X5bels/Mewb61ppsodkziMRpReBblfb21tBG/yp/8aMHgGv5otEKElpoOKFvMTj3SfStV7anXIiDsXjjirskoNv9dUoC7mlLCk5+ofd5XsxeUpE4GcWesTtsmMp64A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qp9gQWSd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40BBC4CEE7;
	Mon, 12 May 2025 12:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747054176;
	bh=tBDxyhfJLYTyQ5qc/wV3CLyT6odxMJOOJPQADjsy3/s=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qp9gQWSd854BackKxr72WZDdkTZzcGjBRIDsqZfkHss9xbkzMZRPf1SQ9XeQPro5m
	 aRHAS1Yy6xZT2dfvAYS28pTWbvL1N7f9QSuFR14siYYztH2dGzhTIWeLnUg/+hvTWz
	 jdWfSV0q3BDS7UZytW/1gPnqo09GDsw2ywDAsuw5ufRb3zX/NK5t01/2EqiADu08Af
	 FaULtRmGO8WGypatSUdHV1HUfSPj9xcAmrte58VGV4qZSFF5YvaGxAlwj6wKHSBf9B
	 uKjZt/RgIhdo4a23tY1qc0zN3HWhUmEZl2U4K8tKbMWREXVrC11UNJvPWybFcchqXM
	 6+MZGTOVp3fqA==
Date: Mon, 12 May 2025 07:49:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20250509-topic-sm8x50-upstream-iris-8650-dt-v3-1-f6842e0a8208@linaro.org>
References: <20250509-topic-sm8x50-upstream-iris-8650-dt-v3-1-f6842e0a8208@linaro.org>
Message-Id: <174705404432.2941372.629677839808498998.robh@kernel.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: sm8650: add iris DT node


On Fri, 09 May 2025 17:28:22 +0200, Neil Armstrong wrote:
> Add DT entries for the sm8650 iris decoder.
> 
> Since the firmware is required to be signed, only enable
> on Qualcomm development boards where the firmware is
> available.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v3:
> - Removed useless comment
> - Fixed opp required-opps
> - Link to v2: https://lore.kernel.org/r/20250424-topic-sm8x50-upstream-iris-8650-dt-v2-1-dd9108bf587f@linaro.org
> 
> Changes in v2:
> - removed useless firmware-name
> - Link to v1: https://lore.kernel.org/r/20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org
> ---
>  arch/arm64/boot/dts/qcom/sm8650-hdk.dts |  4 ++
>  arch/arm64/boot/dts/qcom/sm8650-mtp.dts |  4 ++
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts |  4 ++
>  arch/arm64/boot/dts/qcom/sm8650.dtsi    | 93 +++++++++++++++++++++++++++++++++
>  4 files changed, 105 insertions(+)
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
 Base: base-commit a7dca088884312d607fff89f2666c670cb7073ac not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/v6.15-rc1-102-g2332d042e9b2 (best guess, 3/4 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250509-topic-sm8x50-upstream-iris-8650-dt-v3-1-f6842e0a8208@linaro.org:

arch/arm64/boot/dts/qcom/sm8650.dtsi:5395.4-27: Warning (interrupts_property): /soc@0/video-codec@aa00000:#interrupt-cells: size is (16), expected multiple of 12
arch/arm64/boot/dts/qcom/sm8650.dtsi:5395.4-27: Warning (interrupts_property): /soc@0/video-codec@aa00000:#interrupt-cells: size is (16), expected multiple of 12
arch/arm64/boot/dts/qcom/sm8650.dtsi:5395.4-27: Warning (interrupts_property): /soc@0/video-codec@aa00000:#interrupt-cells: size is (16), expected multiple of 12
arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: /soc@0/video-codec@aa00000: failed to match any schema with compatible: ['qcom,sm8650-iris']
arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: display-subsystem@ae00000 (qcom,sm8650-mdss): interconnects: [[179, 3, 7, 32, 1, 7]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: /soc@0/video-codec@aa00000: failed to match any schema with compatible: ['qcom,sm8650-iris']
arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: display-subsystem@ae00000 (qcom,sm8650-mdss): interconnects: [[188, 3, 7, 32, 1, 7]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: /soc@0/video-codec@aa00000: failed to match any schema with compatible: ['qcom,sm8650-iris']
arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: display-subsystem@ae00000 (qcom,sm8650-mdss): interconnects: [[196, 3, 7, 32, 1, 7]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#






