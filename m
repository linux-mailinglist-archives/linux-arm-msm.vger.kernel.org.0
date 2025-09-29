Return-Path: <linux-arm-msm+bounces-75517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A06B4BA9CC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 17:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EF7D3ADE11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 15:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C0E30AD14;
	Mon, 29 Sep 2025 15:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f8NMy3rJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F01284663;
	Mon, 29 Sep 2025 15:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759159739; cv=none; b=RSYWIwGWcly0E77NynCQjS2DHOYbJt9f2SerisklCTlCQ4A3ZjztpJrE1snnUC4XtnnlGNvraFLhcK9QkDhzUMshirYrQOg1DWyowV2xJLEHFPzTNLxnUw25hLp7E5oWNhgpvanN9Lxv5zTM+amN35GdHBkbhjB4jEls77Erg+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759159739; c=relaxed/simple;
	bh=7oZnqyq14webUvB+RE2KVjar1tQcsKEssUnIT9ldzTw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=VpPAOjWrb5eM+Cx6XmlsjJAzGssFQNkBgC59vLP+S6hoeDwaSvBi1C6qreEaEkslq/X6MtuunOFn9OSZoqC6Jvk2Elgi8fx9DhYFAvi63N3Xnud5rZw+MWVobEt1wW9klQxt775/ufZ+CtNZJCOCSC3jfdS8hyES6eHPiiS2Ob4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f8NMy3rJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC88C4CEF4;
	Mon, 29 Sep 2025 15:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759159738;
	bh=7oZnqyq14webUvB+RE2KVjar1tQcsKEssUnIT9ldzTw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=f8NMy3rJ5T/3h2RaJpG0sJkWJXij76T8ItkilqkvhEPnQcxiMQP7MKZmMY/8aAnPP
	 MvPsxxvwEVtyQ4ohtpdR5DUsb1dX/g+x8zX//aaoM1Vlzc0DHmWwYv6twCVGJ87Bax
	 Aj41fRrWE3jxL4gTDd+BfWI/T35ubMYJCXzCmNvu8c5MJtB2uhWFSSomb7J6+5z3ie
	 3JVEbzMJVF7lJOm2MKWUvK8pPxSvLtAb3M2ezvX/rKVn+0jn0wZiPfOczEr9aZO9tZ
	 1IvZwl5dDQdxLGfmdpkZq1tQ7Xc+y0exqUHntDi+MWQwz12Fvj8/2zWRiwZFSqNAs7
	 aTztIHPEe9R2g==
Date: Mon, 29 Sep 2025 10:28:57 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Amir Dahan <system64fumo@protonmail.com>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Christopher Brown <crispybrown@gmail.com>, David Heidelberg <david@ixit.cz>
To: Paul Sajna <sajattack@postmarketos.org>
In-Reply-To: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
Message-Id: <175915953133.54369.5423928834702362900.robh@kernel.org>
Subject: Re: [PATCH v3 00/11] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Improve HW support in dts


On Sun, 28 Sep 2025 22:05:23 -0700, Paul Sajna wrote:
> Rollup of improved hardware support via devicetree for LG G7 ThinQ
> (judyln) from sdm845-mainline kernel fork
> 
> Notably, this patch-series enables full DRM acceleration and wifi,
> among other small improvements in individual commits
> 
> after this patch-series the main things that remain to be worked
> on include touchscreen, audio, and modem.
> 
> Depends upon panel driver patch-series https://lore.kernel.org/all/20250910-judyln-panel-v1-1-825c74403bbb@postmarketos.org/T/#r9a976ca01e309b6c03100e984a26a0ffc2fe2002
> 
> Co-developed-by: Amir Dahan <system64fumo@protonmail.com>
> Co-developed-by: Christopher Brown <crispybrown@gmail.com>
> Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
> Signed-off-by: Christopher Brown <crispybrown@gmail.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
> Changes in v3:
> - change firmware paths to lowercase 'lg' (matching dt-bindings)
> - fix signoffs
> - add wifi dmesg to commit message
> - remove regulator-always-on from ibb
> - remove framebuffer
> - remove msm ids
> - don't continue commit subject into commit messages
> - split bluetooth node
> - add sbu uart details to commit message
> - change ipa gsi-loader to self
> - Link to v2: https://lore.kernel.org/r/20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org
> 
> Changes in v2:
> - sort at the start
> - drop unnecessary labels
> - drop unnecessary gmu
> - multi-led
> - split fb-panel changes
> - expand upon firmware commit message
> - use qcom,calibration-variant instead of
>   qcom,ath10k-calibration-variant
> - change firmware paths to include "LG"
> - remove framebuffer reservation
> - add lab/ibb
> 
> - Link to v1: https://lore.kernel.org/r/20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org
> 
> ---
> Amir Dahan (1):
>       arm64: dts: qcom: sdm845-lg-common: Add leds
> 
> Christopher Brown (1):
>       arm64: dts: qcom: sdm845-lg-judyln: Add battery and charger
> 
> Paul Sajna (9):
>       arm64: dts: qcom: sdm845-lg-common: Sort nodes and properties
>       arm64: dts: qcom: sdm845-lg-common: Add uarts and Bluetooth
>       arm64: dts: qcom: sdm845-lg-judyln: Add display panel
>       arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes, change path
>       arm64: dts: qcom: sdm845-lg-{common, judyln}: Add wifi node
>       arm64: dts: qcom: sdm845-lg-common: Add chassis-type
>       arm64: dts: qcom: sdm845-lg-common: Add camera flash
>       arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
>       arm64: dts: qcom: sdm845-lg-common: Change ipa gsi-loader to 'self'
> 
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 222 ++++++++++++++++++-------
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 140 ++++++++++++++--
>  2 files changed, 289 insertions(+), 73 deletions(-)
> ---
> base-commit: 8394712bc1340df993cb167199568f44013b45d3
> change-id: 20250911-judyln-dts-17c41e59dc0f
> prerequisite-message-id: <20250910-judyln-panel-v1-1-825c74403bbb@postmarketos.org>
> prerequisite-patch-id: e51151ea7f8fdad6ad7d90713febc5c6b6fc4f9c
> prerequisite-patch-id: b3dd44250da9cd12bc5b2d0d7e865dbe19ceed92
> prerequisite-patch-id: fd6c8077806cb03fcf37d0e0d730314c2760e334
> 
> Best regards,
> --
> Paul Sajna <sajattack@postmarketos.org>
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
 Base: base-commit 8394712bc1340df993cb167199568f44013b45d3 not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/next-20250926 (exact match)
 Deps: looking for dependencies matching 3 patch-ids
 Deps: Applying prerequisite patch: [PATCH 1/3] drm/panel: Add LG SW49410 Panel
 Deps: Applying prerequisite patch: [PATCH 2/3] dt-bindings: display: panel: Add devicetree documentation for lg,sw49410
 Deps: Applying prerequisite patch: [PATCH 3/3] Update MAINTAINERS for lg,sw49410

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org:

arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: wifi@18800000 (qcom,wcn3990-wifi): 'qcom,snoc-host-cap-skip-quirk' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml#
arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: wifi@18800000 (qcom,wcn3990-wifi): 'qcom,snoc-host-cap-skip-quirk' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml#






