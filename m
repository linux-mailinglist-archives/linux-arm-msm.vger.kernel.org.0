Return-Path: <linux-arm-msm+bounces-54868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19382A9534E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 17:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5011516BDD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 15:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F081D7E42;
	Mon, 21 Apr 2025 15:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNeRvD3u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C78F1D5CF2;
	Mon, 21 Apr 2025 15:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745248054; cv=none; b=GuLTULuXP76bwBmqVpwfgq7NLe+mfrdjfeUfby5zzYMvzfrC9aB1iNBialiaN4E3J1UraMzGDvXXv9QIuMq+dtmMSZnCrr3spm7jC2nA57YL49SgQrY0Gl72cU4s284eAyyDuCKU2p91u6kIdoRtP6JVtpUYccBMJSeEgReywqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745248054; c=relaxed/simple;
	bh=kw64iU4YMwLhqLglY+NTrWxwg2cQIuZ8MS4yYFaqHeQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ABMYfRXRxggvToVzZkwj6RpglKF3rKMmf+5roDNX/8IqH5lyU87xqiXbO+qXJZEnNOeFfz/qfxsnP9k5vhn80VKgC+tgzzNyhzijzM42lSF4KJ/kTmO4gJsH43NctKhc6SC7UpY4dZyhgRAwLwFbEHD6yRmaHLbn85GySlgkuN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNeRvD3u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C821AC4CEEA;
	Mon, 21 Apr 2025 15:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745248054;
	bh=kw64iU4YMwLhqLglY+NTrWxwg2cQIuZ8MS4yYFaqHeQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=GNeRvD3u4ATE9GpIi6Q0jAaR2uoIXpToaPo4IH2ocdP+4AhlIUsBgbjqdn7ZnQgj6
	 VjHsh9qA0wIXWhTrNj0cveKObg5agc/g4GKFGbQgYZguXXPOZmF/VGlsHwWXoNT33X
	 vrDjrXE5qndoU34TM4Pw1ovM5vpPksk8iRKdqx98pVwdaF+7NwhYVO1H0nWX+302Jk
	 R/GBdaa1ImCc4t3C/be19fWpj72TyOXWi+puBy0N5o7K9vBNl1rPLDEJMbJLkXQObJ
	 4mL/nuKUZY4ItsHtfqJl9MCDkvjsJUz+bjkRZ6WuG/QnGIyKehX+V7AfhjwayK9HJ5
	 vRcZhwz+qDJrA==
Date: Mon, 21 Apr 2025 10:07:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org>
References: <20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org>
Message-Id: <174524752131.2425678.9933516191586672546.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: add iris DT node


On Fri, 18 Apr 2025 15:20:35 +0200, Neil Armstrong wrote:
> Add DT entries for the sm8650 iris decoder.
> 
> Since the firmware is required to be signed, only enable
> on Qualcomm development boards where the firmware is
> available.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-hdk.dts |  5 ++
>  arch/arm64/boot/dts/qcom/sm8650-mtp.dts |  5 ++
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts |  5 ++
>  arch/arm64/boot/dts/qcom/sm8650.dtsi    | 94 +++++++++++++++++++++++++++++++++
>  4 files changed, 109 insertions(+)
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
 Base: tags/next-20250417 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org:

arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: /soc@0/video-codec@aa00000: failed to match any schema with compatible: ['qcom,sm8650-iris']
arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: /soc@0/video-codec@aa00000: failed to match any schema with compatible: ['qcom,sm8650-iris']
arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: /soc@0/video-codec@aa00000: failed to match any schema with compatible: ['qcom,sm8650-iris']






