Return-Path: <linux-arm-msm+bounces-27544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEB19431F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 16:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1853B2445A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 14:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D1A1B5810;
	Wed, 31 Jul 2024 14:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sxzNc61Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E672A1AE85E;
	Wed, 31 Jul 2024 14:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722435940; cv=none; b=uSqUtpvbf/uCQwZU8eRuK2Gj+0TDImCHA+nSYbteE0sD6iR9afympTLL1J2j3xF3011OKJJySLW032coAqGrjg6GIc2wZqsOexRfqIyTXp/yFa8eFq+vutbic6LcXlnDWYNjFb20SnX/YmtpFe6kVuzPzZUI+jwuIJ43k/lIw9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722435940; c=relaxed/simple;
	bh=pS9J1rziTWqbAUaa9TbwxEFT2fa70ib1zWNhi/CApQ8=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=E1N2yP6R9ghIMe46WKlj4PgGeq8NmHyn30YiMh6MSNSZoExHfjqJkeNNVZU5Ru/jPfML6wHielpKcq9siXLnM3cmKKYUMqDlfLEJcMWccGTAnMRZHE3/H1AlqhrXGLwm49y8vLzNeXwX+Zr0MJNEvxviK/N5BQjzaVZW7dRNglM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sxzNc61Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428E2C116B1;
	Wed, 31 Jul 2024 14:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722435939;
	bh=pS9J1rziTWqbAUaa9TbwxEFT2fa70ib1zWNhi/CApQ8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=sxzNc61Q99tHxUzl8OhvzEwMH40OK/M1tLYLjiuFqnTU+33fHhdd0gZGocxsEMq6P
	 S1LlEYic17BKiUEEK4MV4W9ARif2GTBIeTUqbwEtqSOpBVnMUo9UwDS6y3TsPFDq0v
	 kp+IWiTAfoWi3bv8zH6gMej5axB0cuvUEqP9f72edK8HRzuPw4odrLq5nYhyJEo1bu
	 8l+2u7kX288ls1XM9qgvkE1HNXtt9sKO/WJueHcWEN8IXL5QuIV5rw7XQ9LABcQyB9
	 cW3SdRX86+s9KVjOZA0olnC5ys9Av2klMnqUwAzlKHcpiZBdG1GjJNNQ+Da6sKPv8X
	 BLuSzxwMZJXRg==
Date: Wed, 31 Jul 2024 08:25:38 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nikita Travkin <nikita@trvn.ru>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 =?utf-8?q?Adam_S=C5=82abo=C5=84?= <asaillen@protonmail.com>, 
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Anton Bambura <jenneron@postmarketos.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20240729-msm89xx-wingtech-init-v3-0-32c35476f098@trvn.ru>
References: <20240729-msm89xx-wingtech-init-v3-0-32c35476f098@trvn.ru>
Message-Id: <172243537200.718642.16313954167444233211.robh@kernel.org>
Subject: Re: [PATCH v3 0/3] Introduce msm8916/39 based Lenovo devices


On Mon, 29 Jul 2024 21:38:46 +0500, Nikita Travkin wrote:
> Continuing the work of upstreaming the various msm8916 devices from the
> backlog, this series introduces few 8916 and 8939 Lenovo/Wingtech
> devices (where Wingtech is the ODM for these designs).
> 
> Included devices are:
> 
> - Lenovo A6000 (Wingtech WT86518)
> - Lenovo A6010 (Wingtech WT86528)
> - Lenovo Vibe K5 (Wingtech WT82918)
> - Lenovo Vibe K5 (HD) (Wingtech WT82918hd)
> 
> Note that "HD" variant of K5 is based on msm8929 which is a lower bin
> of msm8939 SoC. A simple dtsi is added for this soc along with the new
> devices.
> 
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
> Changes in v3:
> - Minor styling cleanup (Konrad)
> - Link to v2: https://lore.kernel.org/r/20240722-msm89xx-wingtech-init-v2-0-0c981bbc5238@trvn.ru
> 
> Changes in v2:
> - Reorder pinctrl properties (Konrad)
> - Convert msm8929.dtsi to be more in line with other soc dtsi (Krzysztof, Dmitry)
> - Link to v1: https://lore.kernel.org/r/20240712-msm89xx-wingtech-init-v1-0-64f4aa1870bd@trvn.ru
> 
> ---
> Adam Słaboń (1):
>       arm64: dts: qcom: msm8939-wingtech-wt82918: Add Lenovo Vibe K5 devices
> 
> Anton Bambura (1):
>       arm64: dts: qcom: msm8916-wingtech-wt865x8: Add Lenovo A6000/A6010
> 
> Nikita Travkin (1):
>       dt-bindings: arm: qcom: Add msm8916/39 based Lenovo devices
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |   9 +
>  arch/arm64/boot/dts/qcom/Makefile                  |   5 +
>  .../boot/dts/qcom/msm8916-wingtech-wt86518.dts     |  87 +++++++
>  .../boot/dts/qcom/msm8916-wingtech-wt86528.dts     | 158 +++++++++++++
>  .../boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi    | 215 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8929-pm8916.dtsi       | 162 +++++++++++++
>  .../boot/dts/qcom/msm8929-wingtech-wt82918hd.dts   |  17 ++
>  arch/arm64/boot/dts/qcom/msm8929.dtsi              |   7 +
>  .../boot/dts/qcom/msm8939-wingtech-wt82918.dts     |  17 ++
>  .../boot/dts/qcom/msm8939-wingtech-wt82918.dtsi    | 252 +++++++++++++++++++++
>  .../boot/dts/qcom/msm8939-wingtech-wt82918hd.dts   |  17 ++
>  11 files changed, 946 insertions(+)
> ---
> base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890
> change-id: 20240710-msm89xx-wingtech-init-e07095e2b2ec
> 
> Best regards,
> --
> Nikita Travkin <nikita@trvn.ru>
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


New warnings running 'make CHECK_DTBS=y qcom/msm8916-wingtech-wt86518.dtb qcom/msm8916-wingtech-wt86528.dtb qcom/msm8929-wingtech-wt82918hd.dtb qcom/msm8939-wingtech-wt82918.dtb qcom/msm8939-wingtech-wt82918hd.dtb' for 20240729-msm89xx-wingtech-init-v3-0-32c35476f098@trvn.ru:

arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: iommu@1f08000: clocks: [[31, 129], [31, 140], [31, 175]] is too long
	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: iommu@1f08000: clock-names: ['iface', 'bus', 'tbu'] is too long
	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: iommu@1f08000: clocks: [[31, 129], [31, 140], [31, 175]] is too long
	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: iommu@1f08000: clock-names: ['iface', 'bus', 'tbu'] is too long
	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: iommu@1f08000: clocks: [[31, 129], [31, 140], [31, 175]] is too long
	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: iommu@1f08000: clock-names: ['iface', 'bus', 'tbu'] is too long
	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: pmic@0: mpps@a000:mpp4-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	[1] is not of type 'integer'
	[1] is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: pmic@0: mpps@a000:mpp4-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	[1] is not of type 'integer'
	[1] is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: pmic@0: mpps@a000:mpp4-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	[1] is not of type 'integer'
	[1] is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: mpps@a000: mpp4-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	[1] is not of type 'integer'
	[1] is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-mpp.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: mpps@a000: mpp4-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	[1] is not of type 'integer'
	[1] is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-mpp.yaml#
arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: mpps@a000: mpp4-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	[1] is not of type 'integer'
	[1] is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-mpp.yaml#
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: pmic@0: mpps@a000:mpp4-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	[1] is not of type 'integer'
	[1] is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: pmic@0: mpps@a000:mpp4-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	[1] is not of type 'integer'
	[1] is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: mpps@a000: mpp4-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	[1] is not of type 'integer'
	[1] is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-mpp.yaml#
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: mpps@a000: mpp4-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	[1] is not of type 'integer'
	[1] is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-mpp.yaml#
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: /usb-id: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: /usb-id: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: /usb-id: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: /usb-id: failed to match any schema with compatible: ['linux,extcon-usb-gpio']






