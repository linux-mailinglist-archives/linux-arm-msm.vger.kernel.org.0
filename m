Return-Path: <linux-arm-msm+bounces-36303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D70B29B49FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 13:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26191B23332
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 12:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BE5205E24;
	Tue, 29 Oct 2024 12:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWU1NB6T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED43205AB9;
	Tue, 29 Oct 2024 12:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730205895; cv=none; b=WtuRT0A4IU/mIVQlUy77KIOBLTrmqvPBojRXJxUd/saqXRMkCQ8ffmegeE0az7slF8yaQL8zbQHtEIxQZYDW7Zb7L+Jt3ZCfbJ6StofiJPI7mFHInvckDgKlEslsUIqYfdsRJGmINSLJ9dGVnIZ2fmxMhx9DtxffVw/pWKkZy/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730205895; c=relaxed/simple;
	bh=UHHZyh36wS1+tVaLEZw8BZDQMWzwC3l6H8IzPXdwMac=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=DfSBarocoyvJVwWhI0teA4z1T93f8mqoKM3WtqLfbt7gzo0UAbPqe9EyidCYWE2RGO71b0HkgW8FdT2YKm0AVwaVmThkt2Ok3nScmQZWx3hketWD/M2yaOtPnBRH1+M/qHZqxCBsM/4ZGQVp9x4/NxTGSHUBgMjYWNi7PkbqosY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWU1NB6T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42657C4CEEC;
	Tue, 29 Oct 2024 12:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730205895;
	bh=UHHZyh36wS1+tVaLEZw8BZDQMWzwC3l6H8IzPXdwMac=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=YWU1NB6TPYM/xhe6Kqh6lJTAEBZG91ToszoCNqhvN1TgI7Lkm9h8W4wUSpE+PaRiu
	 PV05hnGxHGiyEc5oE9QNrSOLZdlgDpsS6cNeIhWR/Iwi5ayCsLlLH9OWtKe0wCErzA
	 tBf3w9oJOph6IpmSbKXoaSmdAxJW12N1IVtyp1y40/aCETj5uOitgB1h5NOcf/Zq2B
	 s0ayGS53U8M09ah1BA2OTluYD7ZP4GnVDOlkPRforjjnPcC9By2DCfe0RjoDeqFp6P
	 qiB0uNFgZ/Ibx+tG0gMHrhlSlSiY3rMxWBvZAeXZLcQqTjBURbQ/HwwZo7XGJ8xkY8
	 2f38AZ91xMLCw==
Date: Tue, 29 Oct 2024 07:44:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20241027-sar2130p-dt-v1-0-739d36d31c33@linaro.org>
References: <20241027-sar2130p-dt-v1-0-739d36d31c33@linaro.org>
Message-Id: <173020571945.130862.4564238396525556187.robh@kernel.org>
Subject: Re: [PATCH 0/3] arm64: dts: qcom: add QAR2130P support


On Sun, 27 Oct 2024 03:24:02 +0200, Dmitry Baryshkov wrote:
> Add device tree bindings for the QAR2130P also known as Qualcomm
> Snapdragon AR2 Gen1 Smart Viewer Development Kit. The device boots,
> provides serial console, I2C / SPI interfaces, WiFi (requires external
> BDF) and BT (requires external firmware).
> 
> Dependencies:
>     - https://lore.kernel.org/r/20241026-sar2130p-clocks-v4-0-37100d40fadc@linaro.org
>       (clocks bindings)
>     - https://lore.kernel.org/r/20241017-sar2130p-nvmem-v1-1-6cc32789afc6@linaro.org
>       (critical bugfix)
> 
> Additional bindings and drivers required for the device to function (on
> top of linux-next):
>     - https://lore.kernel.org/r/20241027-sar2130p-adsp-v1-0-bd204e39d24e@linaro.org
>     - https://lore.kernel.org/r/20241027-sar2130p-tsens-v1-1-8dee27fc02ae@linaro.org
>     - https://lore.kernel.org/r/20241018-sar2130p-iommu-v2-1-64c361fceac8@linaro.org
>     - https://lore.kernel.org/r/20241017-sar2130p-pci-v1-1-5b95e63d9624@linaro.org
>     - https://lore.kernel.org/r/20241021-sar2130p-phys-v2-0-d883acf170f7@linaro.org
>     - https://lore.kernel.org/r/20241017-sar2130p-usb-v1-1-21e01264b70e@linaro.org
>     - https://lore.kernel.org/r/20241018-sar2130p-cpufreq-v1-1-822e00b9a663@linaro.org
>     - https://lore.kernel.org/r/20241026-sar2130p-llcc-v3-0-2a58fa1b4d12@linaro.org
>     - https://lore.kernel.org/r/20241017-sar2130p-mbox-v1-1-906aa78b1358@linaro.org
>     - https://lore.kernel.org/r/20241017-sar2130p-mmc-v1-1-c84da16a001e@linaro.org
>     - https://lore.kernel.org/r/20241017-sar2130p-pdc-v1-1-cf9ccd9c37da@linaro.org
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (3):
>       arm64: dts: qcom: sar2130p: add support for SAR2130P
>       dt-bindings: arm: qcom: add QAR2130P board
>       arm64: dts: qcom: sar2130p: add QAR2130P board file
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml |    7 +
>  arch/arm64/boot/dts/qcom/Makefile               |    2 +
>  arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts  |  551 ++++
>  arch/arm64/boot/dts/qcom/sar2130p.dtsi          | 3091 +++++++++++++++++++++++
>  4 files changed, 3651 insertions(+)
> ---
> base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8
> change-id: 20241027-sar2130p-dt-68d3eee86973
> prerequisite-change-id: 20241027-sar2130p-adsp-fc3fad54ded3:v1
> prerequisite-patch-id: a19263ac2521636a3a7b0ed846cf1714326832c7
> prerequisite-patch-id: 7401c6f72aa9e510a01774b82586e5941980fbcc
> prerequisite-patch-id: 0b132b0936dda8e4c7443b4e7e23ff427dc0d798
> prerequisite-change-id: 20241027-sar2130p-tsens-01baed7d9254:v1
> prerequisite-patch-id: 20d50df9440a16e1cea78fb674794ebb7dc9e352
> prerequisite-change-id: 20241017-sar2130p-iommu-4ce763051f01:v2
> prerequisite-patch-id: 22f9d4a5b0c8d50b5a7317375060ff07ebcae4c3
> prerequisite-change-id: 20241017-sar2130p-pci-dc0c22bea87e:v1
> prerequisite-patch-id: 70ad0a8594e6d224648e0206f9d783fcbb69887d
> prerequisite-change-id: 20241017-sar2130p-phys-426733b80169:v2
> prerequisite-patch-id: 263dca689cc6e8334d825b19ec9005a44cdc979b
> prerequisite-patch-id: fcb8d377116bbcf9f165abba416d25c9be86d930
> prerequisite-patch-id: da7fe2737145e858d9572ff51dff3478cf15e1b0
> prerequisite-patch-id: 14e7540ecc4d365d2cea78016b2f9ffbac366921
> prerequisite-patch-id: 6b2ecc0490d903cee517301c462053d2472e6992
> prerequisite-patch-id: 874e118cd420166faa6247754c5f0a3f24de8a1b
> prerequisite-change-id: 20241017-sar2130p-usb-0e9ccdef61d6:v1
> prerequisite-patch-id: 283d975b372781bc4ab258583c82aa7edaa11edf
> prerequisite-change-id: 20241017-sar2130p-cpufreq-d7ba612fd9d7:v1
> prerequisite-patch-id: f0e7e53020e954149fc06988a583d4ca9deb7209
> prerequisite-change-id: 20241017-sar2130p-llcc-0c2616777cde:v3
> prerequisite-patch-id: 6ca6eacd9ceca6d060d23ef95594fb892e51a506
> prerequisite-patch-id: dc04e235391820e4ab04c72ac64fd852e73fade5
> prerequisite-patch-id: cdb161d351ba3ff4f9e53efaa67eb32b603af435
> prerequisite-change-id: 20241017-sar2130p-mbox-1ff72d8eb5c8:v1
> prerequisite-patch-id: f3975127d993dadf15bcffb81feb99d213471a22
> prerequisite-change-id: 20241017-sar2130p-nvmem-5f856d99bbb7:v2
> prerequisite-patch-id: a5520c74bc1a96a952ff6f744ea57636893f6278
> prerequisite-patch-id: 7a260ae7850d966e8fecd3ebc5114ac157d23c87
> prerequisite-change-id: 20241017-sar2130p-mmc-7f8b32889e31:v1
> prerequisite-patch-id: 76b640936b8b98775f8e17f719b98147dbb7be4f
> prerequisite-change-id: 20241017-sar2130p-pdc-18d3f08abdbe:v1
> prerequisite-patch-id: aa2d8a846ea684d1e127f94e01414ded8b599763
> prerequisite-change-id: 20241017-sar2130p-clocks-5fbdd9bf04ee:v4
> prerequisite-patch-id: e6927fe4ae24ab139d5fe595b36b9a9182960b70
> prerequisite-patch-id: 7cb0ec3c7122856fc33337b9e1e54693a6a7d0fa
> prerequisite-patch-id: ec05d49fb2cabbd37a462cee2761bb9509a6aa5d
> prerequisite-patch-id: 6c2171274b0615cef421498695bb61b3f1ec44d2
> prerequisite-patch-id: 3e7615c0e77e3dbe18267fe556bec7bd5b413c56
> prerequisite-patch-id: 8c0359d6075820139b0658ffcf74f8cd91f50875
> prerequisite-patch-id: a500c056466cd165fbe3acf824e0b96ee225794e
> prerequisite-patch-id: 0abbc5930afb89780a8d833b4fb7cf16865dedcd
> prerequisite-patch-id: a8016b8cda7f0f766acd92e6ba8644f45b04f30d
> prerequisite-patch-id: ddb641d43225f1165b30bb03b0243fc5bc3e7a96
> prerequisite-patch-id: 37062c04b8a3fc2a4434a32bed4b0ec66325ae2d
> 
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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


New warnings running 'make CHECK_DTBS=y qcom/sar2130p-qar2130p.dtb' for 20241027-sar2130p-dt-v1-0-739d36d31c33@linaro.org:

arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: geniqup@ac0000: 'uart@a84000' does not match any of the regexes: 'i2c@[0-9a-f]+$', 'pinctrl-[0-9]+', 'serial@[0-9a-f]+$', 'spi@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: uart@a84000: $nodename:0: 'uart@a84000' does not match '^serial(@.*)?$'
	from schema $id: http://devicetree.org/schemas/serial/qcom,serial-geni-qcom.yaml#
arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: uart@a84000: Unevaluated properties are not allowed ('bluetooth' was unexpected)
	from schema $id: http://devicetree.org/schemas/serial/qcom,serial-geni-qcom.yaml#






