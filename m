Return-Path: <linux-arm-msm+bounces-83305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 463ACC867B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 19:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8255834FF63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 18:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3394432ED50;
	Tue, 25 Nov 2025 18:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DhytB/Yy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D0332ED44;
	Tue, 25 Nov 2025 18:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764094184; cv=none; b=uCa2eSCGLStfTCYO6fZp+rqkdyaCSScpVO/qRz6yc4LsmIHecQ1sdwrEgBvqXUFd/lZ0O2fdjPc+MYdKU4q4Ekmt1JqcYky67bRsGtxFMv2KQOnLTodFzv1u4UDX2rgACmeiuSCFFVdhqShYGxKcxMvs3q02N+HxRxSFvBXAG7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764094184; c=relaxed/simple;
	bh=HjDEF+rR2HjSC1NtLftza1kfymvnmlkFiiQz1/5jyl0=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mPG8SKtuOH6awkiNNBR3ysqN8js/ZsRt4/RffL8Updgmi/9/Gyp48Y6l1nalXBjlsyEZf/+1H7lxfCbvuRYrbFI3xAKsAttyWmcPJYteNM7BWtnsMsfxNuID+kO4FKxcSb+AOYHW++qkdsTwX8uPZ4ehxk/qFw2TQw9hxz5+mIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DhytB/Yy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC44C19423;
	Tue, 25 Nov 2025 18:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764094183;
	bh=HjDEF+rR2HjSC1NtLftza1kfymvnmlkFiiQz1/5jyl0=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=DhytB/YyKsXq6W2YAPwRRxqykeWKDI+/XsFaiwb+mRTJLgG1w4gBzTXTRU70p2bzA
	 9g5ejE1PO/YUg9FhjJWzGuWbm6spL1fTvOEjh7qCyNYbWdAB/5axq/3TySE0y4kYkh
	 Xyr66yKsAPCnNRSfRUgtn2feGRVa3We3SN1CtoKy5k9ButhQGzpIESkwVqnhv5a58Q
	 JsON5v4LNnMZVATYufL/X9nAHW1l5DtzBlfemHhgBd8b+PMWmd3W/qi5Wo5ncyAuBi
	 wc8QRegFBHWDf1yo2MZOQjXoGT7/7ON0wnfoIBOrNwk+AAkIUt57HwtBYFwVp12rS9
	 NdBTqMI5XMQwQ==
From: Rob Herring <robh@kernel.org>
Date: Tue, 25 Nov 2025 12:09:42 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: Amir Dahan <system64fumo@protonmail.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
To: Paul Sajna <sajattack@postmarketos.org>
In-Reply-To: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
Message-Id: <176409396072.3843973.6607161175162499421.robh@kernel.org>
Subject: Re: [PATCH v4 00/12] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Improve HW support in dts


On Tue, 25 Nov 2025 00:12:30 -0800, Paul Sajna wrote:
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
> Depends upon qcom,snoc-host-cap-skip-quirk https://lore.kernel.org/all/20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz/T/
> 
> Co-developed-by: Amir Dahan <system64fumo@protonmail.com>
> Co-developed-by: Christopher Brown <crispybrown@gmail.com>
> Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
> Signed-off-by: Christopher Brown <crispybrown@gmail.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
> Changes in v4:
> - add panel identifier in addition to ddic
> - make sde_te pull-down
> - fixup flash current
> - remove framebuffer reserved-mem
> - remove manual lower guard
> - depend upon https://lore.kernel.org/all/20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz/T
> - reword commits
> - Link to v3: https://lore.kernel.org/r/20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org
> 
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
>       arm64: dts: qcom: sdm845-lg-common: Add LEDs
> 
> Christopher Brown (1):
>       arm64: dts: qcom: sdm845-lg-judyln: Add battery and charger
> 
> Paul Sajna (10):
>       arm64: dts: qcom: sdm845-lg-common: Sort nodes and properties
>       arm64: dts: qcom: sdm845-lg-common: Add uarts and Bluetooth
>       arm64: dts: qcom: sdm845-lg-judyln: Add display panel
>       arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes, change path
>       arm64: dts: qcom: sdm845-lg-{common, judyln}: Add wifi node
>       arm64: dts: qcom: sdm845-lg-common: Add chassis-type
>       arm64: dts: qcom: sdm845-lg-common: Add camera flash
>       arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
>       arm64: dts: qcom: sdm845-lg-common: Change ipa gsi-loader to 'self'
>       arm64: dts: qcom: sdm845-lg-common: remove framebuffer reserved-mem
> 
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 238 ++++++++++++++++++-------
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 138 ++++++++++++--
>  2 files changed, 296 insertions(+), 80 deletions(-)
> ---
> base-commit: 3d53f9ca24dd7492fe88fd0f1a418e3dc8b03515
> change-id: 20250911-judyln-dts-17c41e59dc0f
> prerequisite-message-id: <20250910-judyln-panel-v1-1-825c74403bbb@postmarketos.org>
> prerequisite-patch-id: e51151ea7f8fdad6ad7d90713febc5c6b6fc4f9c
> prerequisite-patch-id: b3dd44250da9cd12bc5b2d0d7e865dbe19ceed92
> prerequisite-patch-id: fd6c8077806cb03fcf37d0e0d730314c2760e334
> prerequisite-message-id: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
> prerequisite-patch-id: 32934e043aa82e7dccdcb962037e78663eae24a6
> prerequisite-patch-id: 9c69ab29256c15a0e8ac1c3b9ef64b27661c7815
> prerequisite-patch-id: 8fce59716f5d0d873c3407937e4f852eb18c75f0
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
 Deps: looking for dependencies matching 6 patch-ids
 Deps: Applying prerequisite patch: [PATCH 1/3] drm/panel: Add LG SW49410 Panel
 Deps: Applying prerequisite patch: [PATCH 2/3] dt-bindings: display: panel: Add devicetree documentation for lg,sw49410
 Deps: Applying prerequisite patch: [PATCH 3/3] Update MAINTAINERS for lg,sw49410
 Deps: Applying prerequisite patch: [PATCH v2 1/3] dt-bindings: wireless: ath10k: Introduce quirk to skip host cap QMI requests
 Deps: Applying prerequisite patch: [PATCH v2 2/3] ath10k: Introduce a devicetree quirk to skip host cap QMI requests
 Deps: Applying prerequisite patch: [PATCH v2 3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable ath10k host-cap skip quirk
 Base: base-commit 3d53f9ca24dd7492fe88fd0f1a418e3dc8b03515 not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/next-20251124 (exact match)
 Base: tags/next-20251124 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org:

arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: panel@0 (lg,sw49410-lh609qh1): compatible:0: 'lg,sw49410' was expected
	from schema $id: http://devicetree.org/schemas/display/panel/lg,sw49410.yaml
arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: panel@0 (lg,sw49410-lh609qh1): compatible: ['lg,sw49410-lh609qh1', 'lg,sw49410'] is too long
	from schema $id: http://devicetree.org/schemas/display/panel/lg,sw49410.yaml
arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: failed to match any schema with compatible: ['lg,sw49410-lh609qh1', 'lg,sw49410']






