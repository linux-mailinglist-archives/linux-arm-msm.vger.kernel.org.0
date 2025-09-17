Return-Path: <linux-arm-msm+bounces-73962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DACF2B8063D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 17:10:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEC9E1C81BD8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D82D32E72E;
	Wed, 17 Sep 2025 15:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eyxr26a/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C203333AB6;
	Wed, 17 Sep 2025 15:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758121243; cv=none; b=ljwlsU9JldhiePKBungNqptbABCjWb3eczbkIkz2CFRdPg7UrxgP+2EwUGIr0HGxwKR0a6KcjAOdQFeZ0OPcGYxJsTTJTWjIPG49eriDkvCTWW8jvUwsI4n08srV9wvhHLiU+1tcJq21KqaYVzz+2APyFOopdaj+D+y7ahAi1es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758121243; c=relaxed/simple;
	bh=uKTzGagGhtTrXiBZUakEIOCIX+NG+7SQ5Y4JJ+cUDsU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=PYJH65qChf1bybMR/6sqQpx1GMZznOuyF8dBeqxXeGr6Uqw+x3VmR6tPyB73yPh8hPw/BEiIQKEBcl+hP1ZtBzTEJVFbFBbuplOfyO33UD2u3oaXcCTyFLDjopSciFRHys5dKhgdHUQdzKbEtWrbaOu73huYv0AlO6k0JLsfIU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eyxr26a/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DA32C4CEF0;
	Wed, 17 Sep 2025 15:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758121242;
	bh=uKTzGagGhtTrXiBZUakEIOCIX+NG+7SQ5Y4JJ+cUDsU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Eyxr26a/Rt2KgGizbTuCA2IUVZrVVuRqbvmp5/HB46TnrhJjoaS1XiCgpsy1jf/Dj
	 x/AMKfw3rxqmADP0Dl4eTN7KKfF+cmtv0VXAtlGM5qL1X7jpPFkVikhJcwwmaDa9jU
	 cZf/0lVYVhLKpzKHn28CrVjtCkGxC630FMJsaOmMQou1rjraFT8OoRaBhp8A+LZUef
	 k4Qocg0FSHWgg4ZYg+KR5aX5jTMRvvct7QBoKzraeez73o4it6FqoaA6JIjm+HS8CX
	 TKuH1IftkU2oAVoj2VsKCN0xGVkhMFW1dAEF4RWy9W7Ht5ql5+fyoRZldBAey5qDec
	 R2/nUG3wlipEA==
Date: Wed, 17 Sep 2025 10:00:36 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 David Heidelberg <david@ixit.cz>, Christopher Brown <crispybrown@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
To: Paul Sajna <sajattack@postmarketos.org>
In-Reply-To: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
Message-Id: <175812100543.2051686.13703690250183906386.robh@kernel.org>
Subject: Re: [PATCH v2 00/13] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Improve HW support in dts


On Tue, 16 Sep 2025 18:09:46 -0700, Paul Sajna wrote:
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
> Paul Sajna (11):
>       arm64: dts: qcom: sdm845-lg-common: Sort nodes and properties
>       arm64: dts: qcom: sdm845-lg-common: Add uarts and Bluetooth
>       arm64: dts: qcom: sdm845-lg-judyln: Add display panel
>       arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes
>       arm64: dts: qcom: sdm845-lg-{common, judyln}: Add wifi node
>       arm64: dts: qcom: sdm845-lg-common: Add chassis-type
>       arm64: dts: qcom: sdm845-lg-judyln: Add fb_panel dimensions
>       arm64: dts: qcom: sdm845-lg-common: Add camera flash
>       arm64: dts: qcom: sdm845-lg-common: Add bootloader-compatible board and MSM IDs
>       arm64: dts: qcom: sdm845-judyln-common: Remove framebuffer reserved-mem
>       arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
> 
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 222 ++++++++++++++++++-------
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 136 ++++++++++++++-
>  2 files changed, 296 insertions(+), 62 deletions(-)
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
 Base: tags/next-20250916 (exact match)
 Deps: looking for dependencies matching 3 patch-ids
 Deps: Applying prerequisite patch: [PATCH 1/3] drm/panel: Add LG SW49410 Panel
 Deps: Applying prerequisite patch: [PATCH 2/3] dt-bindings: display: panel: Add devicetree documentation for lg,sw49410
 Deps: Applying prerequisite patch: [PATCH 3/3] Update MAINTAINERS for lg,sw49410

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org:

arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[206, 0], [206, 28], [206, 32], [206, 34], [206, 37]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: wifi@18800000 (qcom,wcn3990-wifi): 'qcom,snoc-host-cap-skip-quirk' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml#
arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: framebuffer@9d400000 (simple-framebuffer): 'fb-panel' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml#
arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[209, 0], [209, 28], [209, 32], [209, 34], [209, 37]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: wifi@18800000 (qcom,wcn3990-wifi): 'qcom,snoc-host-cap-skip-quirk' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml#






