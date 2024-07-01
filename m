Return-Path: <linux-arm-msm+bounces-24820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFBC91E729
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 20:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A5C3283DD7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 18:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B9B16EB7A;
	Mon,  1 Jul 2024 18:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g2Uvp8Dp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D1F14BF8F;
	Mon,  1 Jul 2024 18:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719857423; cv=none; b=ZUW9rIaYiOwJ9VrdQuHpq4ac7momoU6UmXXxFUl2eHPS8fmrA9AR3B3nHP5JbNt9xWppYittP3vCn8OWi8E2P6J9Sz3ifDcGp76/xHEHYi0katiquDDyLxCTeYp2tgEQ/8KjjN/N8Mz8da9iZq5htVkTH90UeE1UnC+jDuK+cLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719857423; c=relaxed/simple;
	bh=SDo+3jYb5vZJ9zha/uL4/VA0jn8ZgGJdTYL0xPwTQPQ=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=d9KrWWkr5Gg3gGBsgl5gcw2TiQiKXz8JJiG/aTPQoFelUyh9jeAeutRoIJYt2yqhKuiMrhS6rj77Q78KLi1rPW2kWUP+9e/SmKxuiijthgOcveoUJ3Kvu9cnK4qhynbDdDrIPDtz5wvYNTWuX+kZXPgacMuc8GuTzIsGl+JA2io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g2Uvp8Dp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6BBAC116B1;
	Mon,  1 Jul 2024 18:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719857423;
	bh=SDo+3jYb5vZJ9zha/uL4/VA0jn8ZgGJdTYL0xPwTQPQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=g2Uvp8DpqIBCINVxyR9wcpodhBVP5uu2ryqkvkoPr2LywNSnMoAbzM6sN8tWIbSlU
	 6CDBKQpE0nTwJPJzRzOocGnw7zJeWJpddH3uayw63UxNh94XBGvHe40tCFNmu/zECd
	 oxMZKrlKQDM2032yb8eEwVP7+QJ9qfx75hV461JdxEYPTSg9HYWrDaAf6k6rjlZtvZ
	 IvY/WKklfSsCP2ahfAyYIK2vaR/9SaCAZun72G/u4SI7C/tozly9N1SJXa0cucviVc
	 f9omSLER4ZIkeTdYbxACXAqSCOX4njCkoRPrQLZp7k1CVKPi11uFeOdAsMTFm2KV1F
	 bEBdmzQuc4bEQ==
Date: Mon, 01 Jul 2024 12:10:21 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Raymond Hackley <raymondhackley@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20240630132859.2885-1-raymondhackley@protonmail.com>
References: <20240630132859.2885-1-raymondhackley@protonmail.com>
Message-Id: <171985715734.313644.1089702604125173934.robh@kernel.org>
Subject: Re: [PATCH v3 0/2] ARM: dts: qcom-msm8226-samsung-ms013g: Add
 initial device tree


On Sun, 30 Jun 2024 13:29:13 +0000, Raymond Hackley wrote:
> Samsung Galaxy Grand 2 is a phone based on MSM8226. It's similar to the
> other Samsung devices based on MSM8226 with only a few minor differences.
> 
> The device trees contain initial support with:
>  - GPIO keys
>  - Regulator haptic
>  - SDHCI (internal and external storage)
>  - UART (on USB connector via the TI TSU6721 MUIC)
>  - Regulators
>  - Touchscreen
>  - Accelerometer
> 
> ---
> v2: Adjust l3, l15, l22 and l27 regulator voltages. Sort nodes.
>     Set regulator-allow-set-load for vqmmc supplies.
> v3: Rename node haptic to vibrator.
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


New warnings running 'make CHECK_DTBS=y qcom/qcom-msm8226-samsung-ms013g.dtb' for 20240630132859.2885-1-raymondhackley@protonmail.com:

arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dtb: syscon@f9011000: compatible: ['syscon'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#






