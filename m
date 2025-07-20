Return-Path: <linux-arm-msm+bounces-65828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCF4B0B913
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 01:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1020F174140
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 23:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C365230BE0;
	Sun, 20 Jul 2025 23:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zl74uxxR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2100522FF2E;
	Sun, 20 Jul 2025 23:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753052817; cv=none; b=FvXp/3KoXlZofOH91Q+yIv+JhK+VRL1KzMeltUueYKdnVBVW2lBjuW9xZ4SGYVU2NMceq/4M6QXNS5bxUiJgD2AFMmrIe0Qtt71Y/VuDkLYN9A3W6Rf4kticVQIB8aLvvU0UkykwNrSTIeho0vVIOkC0+qA4Osf1oi/RSiw0Ai4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753052817; c=relaxed/simple;
	bh=ZTRDpmmSvFamTynuWfGd9M42MeY4cjtfxbCCGNJvTt0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Xc2styIIfkeXAMuVlELqtXOBCTUysY/Ayiib/Z1fT3gn5NkCWFB6cN6m75qiUWtsQnXs0EeFP+hBqj25RvhSRXdFyhcbqz4fc88CeblWwwJnR8XIbwbjKSpMWanFoIhegRNhO7VAziWdMFwqZbyuLq2Eq2SrFatyKCBci66qBL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zl74uxxR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D68EC4CEED;
	Sun, 20 Jul 2025 23:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753052816;
	bh=ZTRDpmmSvFamTynuWfGd9M42MeY4cjtfxbCCGNJvTt0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Zl74uxxRf9HOX9xGXAwOMlQ1KtqP3q7BlruidfveRTJJg2JpBIbdE4jq4h1bM19n1
	 EsgmUcm2JfW2siseCQpqRJMyYPll2ds+FHhpYCDziIwt5PC91/gMwz31bC91GMyMCn
	 o31p+p1HUMtqidBCXW54TFzzpnsT0vT9wn/zaEx3zlLVRdtaR2sb0wnA2pThovz1tE
	 DU8bxenOTZFDH6Bg2vcau85btikLdvE5+QezUzxJubPCG1a4topG/irETeKWskwEMM
	 zpc/AjX6BjE9SkLIA1WB0pLJsWSuh6bbbBqMmlDTKfT74kBw5DZIxJqA9/6pDpIEUS
	 +TuyQsXsNle0A==
Date: Sun, 20 Jul 2025 18:06:55 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 linux-kernel@vger.kernel.org
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250720072125.1514823-1-krishna.kurapati@oss.qualcomm.com>
References: <20250720072125.1514823-1-krishna.kurapati@oss.qualcomm.com>
Message-Id: <175305254851.3034438.3710403978107682400.robh@kernel.org>
Subject: Re: [RFC PATCH] arm64: dts: qcom: sc7280: Flatten primary usb
 controller node


On Sun, 20 Jul 2025 12:51:25 +0530, Krishna Kurapati wrote:
> Flatten primary usb controller node and update to using latest
> bindings and flattened driver approach.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> DTBS check has been done on all platforms. This patch has only been
> compile tested since I dont have access to many of the platforms.
> If folks from community can help test on any platforms, it would be
> helpful. Thanks in advance.
> 
>  .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   |  6 +-
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts      |  7 +--
>  .../boot/dts/qcom/qcm6490-shift-otter.dts     |  6 +-
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  6 +-
>  .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  6 +-
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts       |  6 +-
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi      |  6 +-
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          | 59 ++++++++-----------
>  .../boot/dts/qcom/sm7325-nothing-spacewar.dts |  6 +-
>  9 files changed, 42 insertions(+), 66 deletions(-)
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
 Base: tags/next-20250718 (best guess, 8/9 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250720072125.1514823-1-krishna.kurapati@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/sc7280-idp.dtb: usb@8cf8800 (qcom,sc7280-dwc3): 'dr_mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#






