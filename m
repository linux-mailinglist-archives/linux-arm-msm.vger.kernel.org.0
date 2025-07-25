Return-Path: <linux-arm-msm+bounces-66722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAD8B1202A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 16:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 407FF189EDA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 14:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA0A1C8626;
	Fri, 25 Jul 2025 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbLlQ58t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C117C190472;
	Fri, 25 Jul 2025 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753454024; cv=none; b=G29ERqLzk1eqCfW7foSemCyVZNssewxztZGaQ7C7iWxcqHojpS/XHM3OXMPJIUjguLA4NMTEhSp/PzytrH7eIaMGkGreSX6VEfWyx1i2vy+c8g7il9s96iBAsXBOH5b4swvNyFvFhw9n8MhmcaZDIZtTgnDtwUesdTZd0S8tfR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753454024; c=relaxed/simple;
	bh=dZJ+XcQoCX8HZqiKQVLfki/ABIy/u4NDULHsqYfvNe8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=u5qDYMXxcNm058H7JpjD3rOvWHcyO1pvCgX+EE8gzE9nb4i+gDWXqVCkM+LilmztqZVR3OvyEWFkb0tDxh2dbybxJlpBRGGEPiRehT48PuiGY4V6mD0ioUgGO8m5yz53G3GIZebnSc/4pspgGRhhQamKbH9kivemgOZq6xq0WL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbLlQ58t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F54C4CEE7;
	Fri, 25 Jul 2025 14:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753454024;
	bh=dZJ+XcQoCX8HZqiKQVLfki/ABIy/u4NDULHsqYfvNe8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YbLlQ58tkJJKVbeGdJP8IL64Amk0A7Ix7z7VFGT9r30GRlgjoXwjDmFguIX43y21S
	 1QqHUcFGePVCD/Y1Vrn5N9oAJeVWJlXjykWWW4QrwZB/eO49Ud6BowN+2I/bLnSfQb
	 yeqaKYjnDETgBeesKdvZ1cyVIM7k2EA1Ohr6sgpauTXihsI7Dy1AI+Y8U3g38zgov0
	 yqQdHAeXQ2hvLmZRsAfLWrtCyDRTUcW1PRTpXOL69/hnQqfkQ2bt9SJdf5gMupVerV
	 uz+16UqZ8ZRJQ4WaWrqMPKtUH7u5+FXeYLpdP+oYPr1ihIHSuLMrIjrBOahMMS9ZeW
	 VuvXBxpqFN5tg==
Date: Fri, 25 Jul 2025 09:33:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250725050216.526327-1-krishna.kurapati@oss.qualcomm.com>
References: <20250725050216.526327-1-krishna.kurapati@oss.qualcomm.com>
Message-Id: <175345393876.1190053.13346690295209363754.robh@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Flatten primary usb
 controller node


On Fri, 25 Jul 2025 10:32:16 +0530, Krishna Kurapati wrote:
> Flatten primary usb controller node and update to using latest
> bindings and flattened driver approach.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Link to RFC:
> https://lore.kernel.org/all/20250720072125.1514823-1-krishna.kurapati@oss.qualcomm.com/
> 
> Changes in v2:
> Fixed base address.
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
 Base: tags/next-20250725 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250725050216.526327-1-krishna.kurapati@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/sc7280-idp.dtb: usb@8cf8800 (qcom,sc7280-dwc3): 'dr_mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#






