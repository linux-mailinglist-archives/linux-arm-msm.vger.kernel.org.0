Return-Path: <linux-arm-msm+bounces-75147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCFFB9FE54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 16:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 978064E39D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 14:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9362C21D3;
	Thu, 25 Sep 2025 14:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UU0T3pc0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211D72C15BC;
	Thu, 25 Sep 2025 14:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758809555; cv=none; b=T4WVUKBKwHjJAIAf9LKclZt+cq8BFyP49D0qRaRB8VBr6kEB4nSBUgy4nAm9MzE1dKe3HgkqjV9Tcam88GSCzJOwnKiS9c4TNRN2pfs9QH2p3k5hKMx1f0wGoO1VtdqlIcvUcbqXn1xBaTxJFKfBTwH25k0lsWEnnq20wDzdMCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758809555; c=relaxed/simple;
	bh=1vyxGwtjiGL2rnIKM6Bn8m6jVXq/TnHR8oRRcP/oPJk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=qWXt2i4YJplleP50Bzcp0qrHpw3IZCr4NczMbVG0N4YC+mQoaF3vbJpiTqQeKT2Kjfrm/bcTrj/HtJ8MY51nSZ7fV7CkD8KzfSa6ehlnY7+dzMTJbu2AyaaikyCFlRxB1cCZi9pOd3R/C2tVehMvcuco6L5D9hZfPtc2nUrusEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UU0T3pc0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB9CC4CEF7;
	Thu, 25 Sep 2025 14:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758809554;
	bh=1vyxGwtjiGL2rnIKM6Bn8m6jVXq/TnHR8oRRcP/oPJk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=UU0T3pc0FF2wFfPhEKXpDoO4w8nYaCrUtjVf70Pa44wSxk8fBHg56SaET3X4tOaBq
	 PnOkMCB87iPNPQTC7OdoziohljObnYjhcirEUzoi2B7KJxGAxe5eL4UkekJIVw1h3b
	 y5DnlDt5qw/CUxmTrbDvdReJVrNIGzwXeI98zwY+YkqSCvy0G/aZpq7tmFJZfIISU0
	 taP8MTsn6JA3NPFpFEp5cD645iJ6VUYQo80pPgNxHEs5R8KCwnlxjgciwdTqEKB3II
	 Lvl5FeXi8rAFWZp0rHj+RgHTeLGaAdm9pg4GHm7rCvTMbhEy8UEt78eryhcVRUUkDg
	 15OBR0plyNQhw==
Date: Thu, 25 Sep 2025 09:12:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Casey Connolly <casey.connolly@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>, 
 devicetree@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 David Airlie <airlied@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org
To: David Heidelberg <david@ixit.cz>
In-Reply-To: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
Message-Id: <175880949068.820285.11045140052982213642.robh@kernel.org>
Subject: Re: [PATCH 0/8] Add OnePlus 6T display (Samsung S6E3FC2X01 DDIC
 with AMS641RW panel)


On Thu, 25 Sep 2025 11:12:46 +0200, David Heidelberg wrote:
> This patchset enables display on the OnePlus 6T smartphone.
> 
> Minor adjust to the device-tree of OnePlus 6 had to be done
> to properly document reset GPIO used. Also same adjustments
> had been done to the sofef00 panel driver (used by OnePlus 6).
> 
> In the last step new DDIC driver is introduced together with AMS641RW
> panel sequences.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Casey Connolly (1):
>       arm64: dts: qcom: sdm845-oneplus: Describe panel vci and poc supplies
> 
> David Heidelberg (7):
>       dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC with panel
>       dt-bindings: display: panel-simple-dsi: Remove Samsung S6E3FC2 compatible
>       arm64: dts: qcom: sdm845-oneplus-fajita: Reflect used panel in compatible
>       arm64: dts: qcom: sdm845-oneplus: Correct panel reset gpio polarity
>       arm64: dts: qcom: sdm845-oneplus: Document TE gpio
>       drm/panel: samsung-sofef00: Invert reset gpio polarity
>       drm/panel: Add Samsung S6E3FC2X01 DDIC with AMS641RW panel
> 
>  .../bindings/display/panel/panel-simple-dsi.yaml   |   2 -
>  .../bindings/display/panel/samsung,s6e3fc2x01.yaml |  77 ++++
>  MAINTAINERS                                        |   6 +
>  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |  31 +-
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |   2 +-
>  drivers/gpu/drm/panel/Kconfig                      |  13 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c   | 404 +++++++++++++++++++++
>  drivers/gpu/drm/panel/panel-samsung-sofef00.c      |  10 +-
>  9 files changed, 536 insertions(+), 10 deletions(-)
> ---
> base-commit: ce7f1a983b074f6cf8609068088ca3182c569ee4
> change-id: 20250923-s6e3fc2x01-f9550b822fe5
> 
> Best regards,
> --
> David Heidelberg <david@ixit.cz>
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
 Base: using specified base-commit ce7f1a983b074f6cf8609068088ca3182c569ee4

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz:

arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: panel@0 (samsung,sofef00): 'poc-supply', 'te-gpios', 'vci-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml#






