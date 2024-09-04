Return-Path: <linux-arm-msm+bounces-30730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB26C96BE9D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 15:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7919F282785
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 13:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE671DA0E5;
	Wed,  4 Sep 2024 13:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fg3m3SrU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0881922CF;
	Wed,  4 Sep 2024 13:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725457000; cv=none; b=m9QIzB9rm6aTBUvb+mtSFckNSIT9pRgYuxJqJ3LNlU5lSJ71PFCP4zRjemNxmwWHnK/QF7iwEvIhOEK6h8ijKMBlwZMp0sBbooyAWH48Twc6bQp8uFQvtfInVHMMyKkNh55p0OhLC55nbfHgzo2u/Ho2NspfIlVdQSpc7MHmADo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725457000; c=relaxed/simple;
	bh=/Xba/z/OPB606WHPiOKSTAezbSjI5nOa2jtHocFEb8U=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=bw9xtC60JrfKclGMCTe2tRxNlIykeM1ELKgyfCwP/QFSQj26dI8hVTdunoZuhhRvKrB6psxK8eXylEq228GYUe7cik5CHafYWEKdUn+4Zp1YdTph2VkjvyMA0i2m8BIiM4omPZNc6QX+sia5HNnjIVrNyBYGjPYCzolAo85Kdzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fg3m3SrU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BC4C4CEC3;
	Wed,  4 Sep 2024 13:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725457000;
	bh=/Xba/z/OPB606WHPiOKSTAezbSjI5nOa2jtHocFEb8U=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Fg3m3SrUZPUaPwyLGd8HvreoR9psd23ZKDV0IThUAzO6/3I+U4FNOPr9SVOONsgN1
	 3ykSR4/633ZCWKifjSXGAnwipg5CXFNBk6zxrIifINnJrrcZ+/NCctWVB2mOlF72PA
	 1HfhEW3S1Ln+fCqwTocih4oWzde4g7c+YCDlc7uHg3wszpCuYfje25oesN2SeGN9NY
	 Hl3uG/HKs52HBu2kdQEcQhvygSFaQjWJsbFc6tpodRo/AEwetz1cpYeeY2Sr4NjQq0
	 0fryTzKqQ+p9kpRYX88LZe+h2HFXtkgm9U/1tubcPRxQx513mygiuI0U9/nzXmHTFe
	 nKG3chRXwzjKw==
Date: Wed, 04 Sep 2024 08:36:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20240903224252.6207-1-jerome.debretagne@gmail.com>
References: <20240903224252.6207-1-jerome.debretagne@gmail.com>
Message-Id: <172545685699.2410417.8409373340722800877.robh@kernel.org>
Subject: Re: [PATCH 0/4] Microsoft Surface Pro 9 5G support


On Wed, 04 Sep 2024 00:42:48 +0200, Jérôme de Bretagne wrote:
> This series brings support for the SC8280XP-based Microsoft Surface
> Pro 9 5G.
> 
> Jérôme de Bretagne (4):
>   dt-bindings: arm: qcom: Document Microsoft Surface Pro 9 5G
>   firmware: qcom: scm: Allow QSEECOM on Microsoft Surface Pro 9 5G
>   arm64: dts: qcom: sc8280xp: Add uart18
>   arm64: dts: qcom: sc8280xp: Add Microsoft Surface Pro 9 5G
> 
>  .../devicetree/bindings/arm/qcom.yaml         |    1 +
>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>  .../sc8280xp-microsoft-surface-pro-9-5G.dts   | 1099 +++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |   14 +
>  drivers/firmware/qcom/qcom_scm.c              |    1 +
>  5 files changed, 1116 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-surface-pro-9-5G.dts
> 
> --
> 2.45.2
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


New warnings running 'make CHECK_DTBS=y qcom/sc8280xp-microsoft-surface-pro-9-5G.dtb' for 20240903224252.6207-1-jerome.debretagne@gmail.com:

arch/arm64/boot/dts/qcom/sc8280xp-microsoft-surface-pro-9-5G.dtb: geniqup@8c0000: serial@888000: Unevaluated properties are not allowed ('surface-aggregator' was unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-surface-pro-9-5G.dtb: serial@888000: Unevaluated properties are not allowed ('surface-aggregator' was unexpected)
	from schema $id: http://devicetree.org/schemas/serial/qcom,serial-geni-qcom.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-surface-pro-9-5G.dtb: /soc@0/geniqup@8c0000/serial@888000/surface-aggregator: failed to match any schema with compatible: ['surface,aggregator']
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-surface-pro-9-5G.dtb: pinctrl@f100000: ssam-state: 'oneOf' conditional failed, one must be fixed:
	'function' is a required property
	Unevaluated properties are not allowed ('wake-int' was unexpected)
	'pins' is a required property
	'wake-int' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc8280xp-tlmm.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-surface-pro-9-5G.dtb: pinctrl@f100000: uart18-state: 'oneOf' conditional failed, one must be fixed:
	'function' is a required property
	Unevaluated properties are not allowed ('cts', 'rts-tx', 'rx' were unexpected)
	'pins' is a required property
	'cts', 'rts-tx', 'rx' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc8280xp-tlmm.yaml#






