Return-Path: <linux-arm-msm+bounces-71053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAF8B38F08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 01:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA69B4635DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 23:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BD3311961;
	Wed, 27 Aug 2025 23:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJrqPaYq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057A3311591;
	Wed, 27 Aug 2025 23:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756336736; cv=none; b=qp6ImM/HWoK/0iRc8kcY+Ttre7jlKnG8a/cCVPUf/g/0rZsmUpK7oNG5VfzsgiD52+xysRhY9e/Ha3KyLd2yrGjsfroEjeC5gYSQqdeMzQkscSknMkNyQ6UjWAEfEm2MB7XPJv0VNvspPxD5sBAm88fJQu8yK3YFruqvDKy999U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756336736; c=relaxed/simple;
	bh=Y2qrDmk+8yLfV7UV2eFg+/X7DmZjWSH7Vmf+zCTKOGs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=TrlOmr32xQWsMlOJqcsGjTXz5yYulQCffWTBuPgXX229Bx4gsaEdFlpePhZWKE/f+ttrg0P4QlGmEs5cvoVwlKkjYgvbMSXSofhLbs5KJKlMCzI+6437DhtD34awu8gupsdLBICwwKdJ2yjqJTmMLZZEya9jnSFchlG7OuxPN5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJrqPaYq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86637C4CEF5;
	Wed, 27 Aug 2025 23:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756336734;
	bh=Y2qrDmk+8yLfV7UV2eFg+/X7DmZjWSH7Vmf+zCTKOGs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aJrqPaYqXepJc2QYhzozJrFuChQhkEYczoQIdR+OTVEco/Sv2CgBKSHunPlx+U2zU
	 g++vOHLXtEhxywLv2CROk935aIFwnGndcEzmNPjJCspbQjJiTpaLYmZWlbaNjPOiI+
	 jqdq4qlXL2co1kx7TaGAzqmxi6k+b861Du75+jgmSFQztuU0AsI/UJQT6G8/b+IIX9
	 mme7YKympzV3Tu9AVp3zgH+hhckFgelpF70qtDI7UpAfvDJUvggmTF9/6cmem4k9wP
	 JM7RGU2ufLRKA/dKy3Aem4MF9MjVQakKVDbXAMz/0y4/+Yv+EgFW+gxWb2B1tuTZ+c
	 Hvvs6/7inJTcA==
Date: Wed, 27 Aug 2025 18:18:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
To: =?utf-8?q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>
In-Reply-To: <20250827213414.43033-1-ghatto404@gmail.com>
References: <20250827213414.43033-1-ghatto404@gmail.com>
Message-Id: <175633665064.3746815.5597832646216452529.robh@kernel.org>
Subject: Re: [PATCH v8 0/1] arm64: dts: qcom: add initial support for
 Samsung Galaxy S22


On Wed, 27 Aug 2025 21:34:07 +0000, Eric Gonçalves wrote:
> Changes in v8:
> - Rebase on 'arm64: dts: qcom: sm8450: Flatten usb controller node'
> - Use real name for sign-offs
> - Remove device tree binding patch as it's already in the tree, merged by
>  Bjorn
> 
> Changes in v7:
> - Document the reserved GPIO pins, remove pin 50 as it does not
>  need to be reserved
> - Clarify the phone isn't limited to USB 2.0 but rather USB 3.0
>  isn't implemented yet
> - Add a newline before every 'status' node
> 
> Changes in v6:
> - Remove debug features (bootargs, etc) that slipped in the v5 DTS
> - Format and organize nodes correctly based on existing DTS,
>  move "status = "okay";" to the bottom always
> - Solve "ddr_device_type" and "qcom,rmtfs-mem" warnings, the rest are
>  from existing SoC .dtsi
> - Disable buttons, ufs and other features for later revision
> 
> Changes in v5:
> - Properly format the thread
> 
> Changes in v4:
> - Try to properly format the thread
> 
> Changes in v3:
> - Removed unnecessary initrd start and end addresses
> - Make sure r0q is in right order on Makefile
> - Properly format memory addresses
> - Set r0q to the correct, alphabetical order in documents
> 
> Changes in v2:
> - Attempt to format the patchset thread correctly
> 
> Eric Gonçalves (1):
>   arm64: dts: qcom: add initial support for Samsung Galaxy S22
> 
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 145 ++++++++++++++++++
>  2 files changed, 146 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> 
> --
> 2.50.1
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
 Base: attempting to guess base-commit...
 Base: tags/next-20250825 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250827213414.43033-1-ghatto404@gmail.com:

arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): power-domains: [[98, 6]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): required-opps: [[55]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#






