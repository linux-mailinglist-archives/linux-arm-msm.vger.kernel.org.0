Return-Path: <linux-arm-msm+bounces-38070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8059CF3D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 19:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C6EA283E26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 18:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CC81865E2;
	Fri, 15 Nov 2024 18:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b4xc2xO3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272B414A088;
	Fri, 15 Nov 2024 18:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731694940; cv=none; b=ihWT4e5n9s/3VF8GdEnH2f0SEvnCwaXGzxfP2rDcey7h47Fmq5b0HrBu7GAlFjgFMjsynfFF2mYijhL2YHpD5QAXZ6IBGAhPowGzQE+Lgamod5oruBNgJGU6pmRO3W5WUKNq/tEjTFEy8RHcNk1j6zlKrzGBQe4nywfRlKJ7s2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731694940; c=relaxed/simple;
	bh=nEvQIj4kM2xrWxf0N7acS60PjdZbsF5tcM6/af6IjB4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=E8PfdFPa7UOHsfc3cTl9hNA7d032ei4LysRuwmeMycXGLA4R88zspLWM1IQ5Ww141mKlgXUZ3nf1EApiMqym422WZGA6yo9316vE3AXrwLmhykg9CJJ4rUHNffyzaqLSa3KWfXohC3EI6c2/ZeK/eUh4HBD8aIRSnWPxmgH8kVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b4xc2xO3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6037AC4CECF;
	Fri, 15 Nov 2024 18:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731694939;
	bh=nEvQIj4kM2xrWxf0N7acS60PjdZbsF5tcM6/af6IjB4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=b4xc2xO3mHRXYt5VEsDjUPYSkgdcrtq5JLfzQBbkJczJCkWJh8RTehAWRd4kSF/Xr
	 rGglJ85VYkffg+AoHvfjy3TBk6QbLH46Kuvpt4C1Yt0adTzffXHNvV60deLG7tvFda
	 MZ2PKNfOSAG2fSz/fdsZNUMp16/+aOZNdK6LyJ5754W6+SIyUI0p3nOqTGte1wTf+C
	 4IQ7RXK33jRosBlgANuWfrPC7CX3Zsy8K5lFv+CxaElIUIPsdQzf2W+Vg3uc8lLvBD
	 GTziFj4cPZ1X+sj+Lq9YaSPDHDolZnnnrN9zWx/KGVyLaARy2snRFXIR0ed46xKQ7H
	 XDwqzZQAu675Q==
Date: Fri, 15 Nov 2024 12:22:17 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
To: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20241115-topic-sdm450-upstream-lab-ibb-v1-0-8a8e74befbfe@linaro.org>
References: <20241115-topic-sdm450-upstream-lab-ibb-v1-0-8a8e74befbfe@linaro.org>
Message-Id: <173169491073.3496872.7603773020009415015.robh@kernel.org>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: sdm450-lenovo-tbx605f: add panel
 nodes


On Fri, 15 Nov 2024 11:20:52 +0100, Neil Armstrong wrote:
> Add the necessary nodes to enable the DSI Panel on the Lenovo
> Lenovo Smart Tab M10.
> 
> The panel is already upstream with:
> https://lore.kernel.org/all/20240828-topic-sdm450-upstream-tbx605f-panel-v3-0-b792f93e1d6b@linaro.org/
> 
> And the LAB-IBB bindings changes was sent at:
> https://lore.kernel.org/all/20241115-topic-sdm450-upstream-lab-ibb-bindings-v1-1-1f4bff4583b0@linaro.org/
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Neil Armstrong (2):
>       arm64: dts: qcom: pmi8950: add LAB-IBB nodes
>       arm64: dts: qcom: sdm450-lenovo-tbx605f: add DSI panel nodes
> 
>  arch/arm64/boot/dts/qcom/pmi8950.dtsi              | 17 ++++
>  arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts | 97 ++++++++++++++++++++++
>  2 files changed, 114 insertions(+)
> ---
> base-commit: 2d5404caa8c7bb5c4e0435f94b28834ae5456623
> change-id: 20241115-topic-sdm450-upstream-lab-ibb-5acee981556c
> 
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
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


New warnings running 'make CHECK_DTBS=y qcom/sdm450-lenovo-tbx605f.dtb' for 20241115-topic-sdm450-upstream-lab-ibb-v1-0-8a8e74befbfe@linaro.org:

arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dtb: gpu@1c00000: clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dtb: pmic@3: labibb:compatible:0: 'qcom,pmi8998-lab-ibb' was expected
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dtb: pmic@3: labibb:compatible: ['qcom,pmi8950-lab-ibb', 'qcom,pmi8998-lab-ibb'] is too long
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dtb: labibb: compatible:0: 'qcom,pmi8998-lab-ibb' was expected
	from schema $id: http://devicetree.org/schemas/regulator/qcom-labibb-regulator.yaml#
arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dtb: labibb: compatible: ['qcom,pmi8950-lab-ibb', 'qcom,pmi8998-lab-ibb'] is too long
	from schema $id: http://devicetree.org/schemas/regulator/qcom-labibb-regulator.yaml#
arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dtb: /soc@0/spmi@200f000/pmic@3/labibb: failed to match any schema with compatible: ['qcom,pmi8950-lab-ibb', 'qcom,pmi8998-lab-ibb']






