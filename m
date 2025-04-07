Return-Path: <linux-arm-msm+bounces-53370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 827D4A7DE18
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 14:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A45F81893D07
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 12:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2E424EAB2;
	Mon,  7 Apr 2025 12:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kpT8c2cv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB6724888D;
	Mon,  7 Apr 2025 12:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744030076; cv=none; b=ayQqoJ4b6DzwRSOCnXmIszJlG4XqlN1QnZkwOcKLu1IXtK/AfyzHR+QQVk8GvxNUyN4+cTiSYRtdJKkkzWxtHqVudgDYLYNsIYVl51AhOrj2X1HLGyR4jxHQbuftclzKVYH8NuUU7uqXvSWRwMRoFPd1rnpoY870+BTkJQKzVE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744030076; c=relaxed/simple;
	bh=+IgO/E1P2X9+2yuR3YvVnFoL9ihGcuvDSLanfznzRRA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=rqX0SJeUUqnuYVxR8jBApUes8sN1QEwaQoFMpRqYoKz1m4K5N4lXYkJqNhQZFpl/kRMH38cSvegWXx8j0uHkg0HKaFxQBRYyXevWEnyQ7+v7QImR7RuOLGm5NwnNRzi5LHxQzUn3dcnshqkW/FiCYcJ05fLMOpO/ppqzLgzwcyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kpT8c2cv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0AA3C4CEDD;
	Mon,  7 Apr 2025 12:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744030076;
	bh=+IgO/E1P2X9+2yuR3YvVnFoL9ihGcuvDSLanfznzRRA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kpT8c2cv1xcz5ZHuC/5PEcmSVqNA3JxyZM+ffBQBgaRZFR7rMxiV4lYnjdFRlihyw
	 i1VsA5BelYISKVWIYxkh16w1iduFyQkzYRF/wCNqhglkUVXRvWk6KpvzjBG+hnxEdg
	 ul97TWkE4jge8PmxIEGSMUPv+T7vRz7QBG1ZpvDc6dYQ6pB22L9KGwN3bWpG64Mx39
	 krGyHe6R3ZFoUIk2Itd7rzBGNRxZhKnEXiaOhkui+mQuYnFzruoV7lbE3GnFMz2eI8
	 4FTw35xUBvkdNBb1ruSsBs6oaXVPaXCakyBc0EWXNi4dbdmBaIwGcOEI/6iAGalDa3
	 0YcZ3G+JdTVug==
Date: Mon, 07 Apr 2025 07:47:54 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
 Kishon Vijay Abraham I <kishon@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
In-Reply-To: <20250405174319.405975-1-mitltlatltl@gmail.com>
References: <20250405174319.405975-1-mitltlatltl@gmail.com>
Message-Id: <174402971815.1782886.2804255933275419532.robh@kernel.org>
Subject: Re: [PATCH] phy: qualcomm: phy-qcom-eusb2-repeater: rework reg
 override handler


On Sun, 06 Apr 2025 01:43:18 +0800, Pengyu Luo wrote:
> In downstream tree, many registers need to be overrided, it varies
> from devices and platforms, not only HS trasmit amplitude(0x51),
> HS disconnect threshold(0x53), Tx pre-emphasis tuning(0x57).
> 
> The device I plan to upstream also uses it, so I write the patch for
> it (Oneplus Pad Pro / Oneplus Pad 2, sm8650-mtp based).
> 
> In upstream, only Sony Xperia 1 V is using this, so fixing it for sony,
> in downstream, some crd, mtp, htk devices also use it, I have no
> such device, don't set it for them.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  .../qcom/sm8550-sony-xperia-yodo-pdx234.dts   |  5 +-
>  .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 86 +++++++++++++++----
>  2 files changed, 72 insertions(+), 19 deletions(-)
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
 Base: attempting to guess base-commit...
 Base: tags/v6.14-rc6-274-gf4e35e5f940c (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250405174319.405975-1-mitltlatltl@gmail.com:

arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: pmic@7 (qcom,pm8550): phy@fd00: 'qcom,host-param-override-seq', 'qcom,param-override-seq' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: phy@fd00 (qcom,pm8550b-eusb2-repeater): 'qcom,host-param-override-seq', 'qcom,param-override-seq' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/qcom,snps-eusb2-repeater.yaml#






