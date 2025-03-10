Return-Path: <linux-arm-msm+bounces-50856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3613A597CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 15:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38185188FB2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 14:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D50F22CBF5;
	Mon, 10 Mar 2025 14:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNv16CWj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF2922CBD7;
	Mon, 10 Mar 2025 14:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741617380; cv=none; b=OTK2LLHT65DT59zM42rVNvVVJ8wv3KaC9E0KlF37HJMmvSJa9eD4lVvVX+XTLRLjytuTUJNQqfQbGOh/AjL78FtUYt8yu5XQrWp/SjoGQylwVdLRz+M7HDw6iG7XJIAtRbAQtxeBaoA0xXLy0IBQgYcPzKa4a5f+l15w4Xe5Px8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741617380; c=relaxed/simple;
	bh=LS/oECQPwubMgLMkVFtys9DEM3QQeczYhmGXwL4fRrE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=nELykdjx5sbU7ro1V+69kUQXpld2CmtpLAoo0lkS5iSmP4n+ryp4fOVvIITn3TWTJlXggDDQPLh0fyqd0LS8V0KBf3ascXtJ3wnRGJRMUa9vuErXFLr9sUSfLVCeVeXeBaDrV6kVPuAZgef/Xgl0yAT95GrbI0cZEC0GMO4SV+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNv16CWj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4DECC4CEEB;
	Mon, 10 Mar 2025 14:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741617379;
	bh=LS/oECQPwubMgLMkVFtys9DEM3QQeczYhmGXwL4fRrE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=CNv16CWjYPGamtWTIeIz5KuO8FCd0OGCizIVaiQ5ic1qRnIsPLyujwnMhyHzLnmdy
	 vqDPl2ZrxM3OF1iFpnx3QgU7/pzT9F+9l8Z0/P85oQEuzIByFQ4EnJ7eGcDpxaElR+
	 SreqIzwA0tNECDxpPm1t+9BgJ90CdSXxAzm0tpS0ePpbGR6vHfnTYZppN/ul5TInTk
	 jV0wfDUWFttIuQIINo34+042ANM1ECqDiiQG5YvSTunndRJXunudwdYEb5C2kRmaGU
	 vAbY5DnE74OGVs1bNGghbesRaasTsoSVwGXlWF0sLdxdmC8MkITL2h19Ol8iIT/AY1
	 aswtnk5cN0T3Q==
Date: Mon, 10 Mar 2025 09:36:18 -0500
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
 Konrad Dybcio <konradybcio@kernel.org>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Kees Cook <kees@kernel.org>, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-hardening@vger.kernel.org, 
 Tony Luck <tony.luck@intel.com>
To: Gabriel Gonzales <semfault@disroot.org>
In-Reply-To: <20250308013019.10321-1-semfault@disroot.org>
References: <20250304043742.9252-1-semfault@disroot.org>
 <20250308013019.10321-1-semfault@disroot.org>
Message-Id: <174161712464.4185281.4494690781692098732.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] Add Xiaomi Redmi Note 8 support


On Sat, 08 Mar 2025 09:30:10 +0800, Gabriel Gonzales wrote:
> This patchset introduces support for the Redmi Note 8 (codenamed ginkgo). This series is a follow-up to v1 (message-id in in-reply-to header) which was sent without a cover letter.
> 
> Changes in v2:
> - Add missing cover letter
> - Fix up commit message for schema
> 
> Gabriel Gonzales (2):
>   dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8
>   arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   1 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo.dts    | 294 ++++++++++++++++++
>  3 files changed, 296 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> 
> --
> 2.48.1
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250308013019.10321-1-semfault@disroot.org:

arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4ac0000: #address-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4ac0000: #size-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4cc0000: #address-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4cc0000: #size-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#






