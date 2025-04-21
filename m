Return-Path: <linux-arm-msm+bounces-54869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD860A95352
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 17:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B999D1891910
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 15:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6A21DE2A8;
	Mon, 21 Apr 2025 15:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3dbrZmg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9BF1DDC04;
	Mon, 21 Apr 2025 15:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745248056; cv=none; b=pBOLPsTvRiyEayG6uvNBbVKYmmY/hkHW5BJpKm65DmBlI+ERwFPk7rPO5Ey4qhAfXrAP7No64TTPrxCVZSNEhMg6AR7g8moSTbmwWp+87EKW7dTpgb0eWUhRsvAjUeqEzrb0GfudODiUS1v4kjLn7q5OhqAXIMVVCGrjxQY/lXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745248056; c=relaxed/simple;
	bh=0xCh5wqVJ+Pwx9Dj6kk6jwRIQyw4IxE9zWEwRgW0SGw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Lj5Wbd98Adly1Wfm62/tV9u3Slc54xjk/v8n25fcOhq9h7Os/Z+7DSoT1G/T6jKobvsheZdSsWB8KcPui41fjvq2nZzdqv/qtjcqhh2yxe9/MaHS/mHd8vY7rOlgJK+of4983NEk1RKqFbDOMp5K0k6YfpSYAJWOA0MCKlT6g+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3dbrZmg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB2CC4CEE4;
	Mon, 21 Apr 2025 15:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745248055;
	bh=0xCh5wqVJ+Pwx9Dj6kk6jwRIQyw4IxE9zWEwRgW0SGw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=W3dbrZmgZvdGa42yEBSI6hSjt55QDwL26LNH8cg3NkVSOsUY/ae0r8sEFxdfwHpz1
	 luXq7JJH21WyiRuoSyqUbz9NNBiFRMO/hsbM8AbASU0ZQfaSvKGtxgEMJghf3RGXki
	 jIZ7So4QOXrh+uLKKrjzYF2cbFAJd79Gi0QFHXhWIQq52utZS1/xLeLZfT1YnF8OQM
	 LhoSMhywASKSEa1spU3HcvlTfNjSV30eRopAfef8FpciFEGnnQWOorCNG1skAS/iIp
	 nEu/D+o+eBWUQQ6ikZzGjgotO/NaZIdlv0V00ONvAxkg666yni2G6eUj0Qwt+NCBYk
	 5pWIx02FM2naQ==
Date: Mon, 21 Apr 2025 10:07:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, 
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, 
 Adam Honse <calcprogrammer1@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, phone-devel@vger.kernel.org
To: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <20250419-hlte-touchkey-v1-1-9d93c3e2b31f@lucaweiss.eu>
References: <20250419-hlte-touchkey-v1-1-9d93c3e2b31f@lucaweiss.eu>
Message-Id: <174524752186.2425711.13225157448230184467.robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: qcom: msm8974-samsung-hlte: Add touchkey
 support


On Sat, 19 Apr 2025 11:08:19 +0200, Luca Weiss wrote:
> From: Adam Honse <calcprogrammer1@gmail.com>
> 
> Add support for the touchkeys on the Samsung Galaxy Note 3 (hlte).
> 
> Signed-off-by: Adam Honse <calcprogrammer1@gmail.com>
> ---
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
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
 Base: using specified base-commit 8ffd015db85fea3e15a77027fda6c02ced4d2444

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/qcom/' for 20250419-hlte-touchkey-v1-1-9d93c3e2b31f@lucaweiss.eu:

arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dtb: i2c-gpio-touchkey (i2c-gpio): $nodename:0: 'i2c-gpio-touchkey' does not match '^i2c(@.+|-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dtb: i2c-gpio-touchkey (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'touchkey@20' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#






