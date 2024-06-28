Return-Path: <linux-arm-msm+bounces-24653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C76491C2CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 17:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DE4B28029B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 15:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2E71C9EB7;
	Fri, 28 Jun 2024 15:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rzY8Jmtw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2A71C232A;
	Fri, 28 Jun 2024 15:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719589318; cv=none; b=NoT7k9iuOTi35JTCkT4LbaIF6RTmf6725O1evBYVlotBI4Szhm7LXuI5oV3Cvgw86GYTUDRR2ed2A+/48dHT5wqXaOAwMTkFTBvibUg/C46m64g6alOsUOgElCLaglG2XqGJ2XGykt4PYEUCEKZtN+0Lr+cyx60Wpi8k9hQO4S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719589318; c=relaxed/simple;
	bh=ymvFz0WiHcyx8yRoT9Izl+kSBov6O15ewnJVOROeaBE=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Cm69la/WRSPP+tkcA0bqPccjM/HM6OfH1Yykzw2+BvmyGREoboFIqjOzzLKS6YLn7OpLiHRNKnMzd5AZMAGfSilk4z48+4TxBrBNurKHuB2xT/XU63ubLnDQh0p4CvBG8mM6BYRb1IKtiJ3b/FtQEFT3nQ00HhUGc/ygz3dM2pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rzY8Jmtw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3050C116B1;
	Fri, 28 Jun 2024 15:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719589317;
	bh=ymvFz0WiHcyx8yRoT9Izl+kSBov6O15ewnJVOROeaBE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=rzY8JmtwoJdmMtk9RXZxz8vnwgshHYk7ndL2ZeeDIB8Y/LDD+LnD3Xhu3jRlF/MSR
	 XQNQ862xw/gQbwO8MNvKUl90+jqBoyr6ZmBhgfQWQF7L02ArzBcA6ZcCzTAii+NhcW
	 Kc12z6630APpVbOyfpVkw1/ERzpAYUAWWQqzIyCfSmf2nVOIBPvxef242o7MsLKsdn
	 WpdwOxQWSM5bjA+FHh++46yVvY8n2VQpQ/q3qFLhWQ1LbZVNM8bd8sI8+RxWGxowyc
	 cdBcME+0xYyLcuVzGSo/UEWm9eV4cR9GDqZNECO4TlkYQ8PLNnvGn1X2DlkztqxDz/
	 Q/VFvez8+lr8Q==
Date: Fri, 28 Jun 2024 09:41:56 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: devicetree@vger.kernel.org, elder@linaro.org, conor+dt@kernel.org, 
 tiwai@suse.com, andersson@kernel.org, perex@perex.cz, lgirdwood@gmail.com, 
 bgoswami@quicinc.com, broonie@kernel.org, caleb.connolly@linaro.org, 
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, krzk+dt@kernel.org, 
 srinivas.kandagatla@linaro.org, dmitry.baryshkov@linaro.org, 
 krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org
In-Reply-To: <20240628010715.438471-1-alexey.klimov@linaro.org>
References: <20240628010715.438471-1-alexey.klimov@linaro.org>
Message-Id: <171958904690.3122888.14426656364563321881.robh@kernel.org>
Subject: Re: [PATCH 0/7] qrb4210-rb2: add HDMI audio playback support


On Fri, 28 Jun 2024 02:07:08 +0100, Alexey Klimov wrote:
> First time I am doing anything like this. This series adds
> mising pieces here and there to allow addition of sensible
> sound card in qrb4210-rb2.dts and enable HDMI audio playback there.
> 
> It is planned in future to add support for other outputs and capture --
> analog audio support.
> 
> The series depends on Srini's sm4250 lpi pinctrl driver:
> c2e5a25e8d88 (pinctrl: qcom: Introduce SM4250 LPI pinctrl driver, 2024-06-22)
> 2ffa7a354662 (dt-bindings: pinctrl: qcom: Add SM4250 pinctrl, 2024-06-22)
> As far as I understood it was already accepted and will go through pinctrl tree.
> 
> Alexey Klimov (7):
>   ASoC: dt-bindings: qcom,sm8250: add qrb4210-rb2-sndcard
>   ASoC: qcom: sm8250: add qrb4210-rb2-sndcard compatible string
>   ASoC: qcom: sm8250: add handling of secondary MI2S clock
>   arm64: dts: qcom: sm6115: add apr, its services and simple sound node
>   arm64: dts: qcom: sm6115: add LPASS LPI pin controller
>   arm64: dts: qcom: sm6115: add description of lpi_i2s2 pins
>   arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback support
> 
>  .../bindings/sound/qcom,sm8250.yaml           |   1 +
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts      |  73 ++++++++++++
>  arch/arm64/boot/dts/qcom/sm6115.dtsi          | 112 ++++++++++++++++++
>  sound/soc/qcom/sm8250.c                       |  19 +++
>  4 files changed, 205 insertions(+)
> 
> --
> 2.45.2
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


New warnings running 'make CHECK_DTBS=y qcom/qrb4210-rb2.dtb' for 20240628010715.438471-1-alexey.klimov@linaro.org:

arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: /soc@0/pinctrl@a7c0000: failed to match any schema with compatible: ['qcom,sm4250-lpass-lpi-pinctrl']






