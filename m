Return-Path: <linux-arm-msm+bounces-52906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5DDA77219
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 02:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C76503A8B46
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 00:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0614D82C60;
	Tue,  1 Apr 2025 00:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZAgSoRiP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B2C6A33B;
	Tue,  1 Apr 2025 00:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743468726; cv=none; b=R8YZswt3S9qE1w0CrBrv/eJVt2079hiepwGODxBjI44kxUSkMkEbeKSY1fszMdW6yvFVSq6OT574799IE0zxHp2Uef0sykE+0shimySiY8ve6dsMoA/eyFOX+1cdGgrKH14BWBKg6v/3UbpAeUOv3rCnWMw7g5P2L2IHp/9mJbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743468726; c=relaxed/simple;
	bh=/UQ39MEbWY36jpENTddWVVKMd6edVfgsykRn4iYNpqk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Htt7YFCh6BFQ7ngtl2ozLlYoe3Z+FPBktMk8kx9zEgWObdVU9I2JQ35pG9vjTESORCtNvWkhkXHy4Pm2McyOiIepFCi1zYykjloDWLW2do1B1bhZJ5DAOf4BVyUzJC/vQoyso0aQBgMMjfGCv24lNoWQN8G3cJl56TDKPD3ajrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAgSoRiP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E618C4CEE3;
	Tue,  1 Apr 2025 00:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743468726;
	bh=/UQ39MEbWY36jpENTddWVVKMd6edVfgsykRn4iYNpqk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZAgSoRiP2/Glqa3apm0OrrYFKu2FP+QosSu5o8Q3NNEYzYaqT2whGzwArkmSizEwH
	 O8OrwiAoceVgsukjMyIaXguA4CDAGUM7i43iR03n/PogVYIc5t7XiKAZ4qFlTN3T9i
	 uhR5Q1HeMh7jggQnOQAfScEduaumf8nc+SVewgTMvGXztUyPngz2nSwxPFgw+raTT8
	 9CVbD7xzKl9U3WwP76bt9jppbb4wb4BjEfvogpf6PV38Cv4OBJFgcZc0KhNIue5v2I
	 oB+PQzfODYWMyyORLDxQRGxxbqYoBbJQoj0UkhQRieEl4AgsHlfX4AA8ynOMuJpkXK
	 G5a/ehf+XwGKQ==
Date: Mon, 31 Mar 2025 19:52:04 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Johan Hovold <johan+linaro@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-usb@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
In-Reply-To: <20250331215720.19692-1-alex.vinarskis@gmail.com>
References: <20250331215720.19692-1-alex.vinarskis@gmail.com>
Message-Id: <174346870483.3093611.16142139479166173068.robh@kernel.org>
Subject: Re: [PATCH v1 0/6] X1E Asus Zenbook A14 support


On Mon, 31 Mar 2025 23:53:34 +0200, Aleksandrs Vinarskis wrote:
> Introduce support for the mentioned laptop.
> 
> Particular device exists in two model numbers:
> * UX3407QA: X1P-42-100 or X1-26-100 (as tested)
> * UX3407RA: X1E-78-100
> 
> Mostly similar to other X1-based laptops. Notable differences are:
> * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
>   and Qualcomm FastConnect 7800 on UX3407RA
> * USB Type-C retimers are Parade PS8833, appear to behave identical
>   to Parade PS8830
> * gpio90 is TZ protected
> 
> Document new Parade PS883x variant. Move pcie6a_phy's compatible change
> from X1P-42-100's dtsi to be CRD specific, at it seems it does not
> apply to all machines - on X1-26-100 phy times-out when using new x1p
> compatible.
> 
> When comparing device firmware between UX3407QA, UX3407RA, it seems
> that only ADSP firmware is different, CDSP and GPU firmware appears to
> be the same. (At least assuming the GPU firmware name in both cases is
> `qcdxkmsuc8380.mbn`). Since at least some blobs are different betweeen
> X1E and X1/X1P, define new firmware directory for `qcom/x1p42100`. This
> also makes it easier for distros to automatically extract firmware from
> Windows and place all blobs for the model under the same path. If/When
> firmware blobs make it to linux-firmware, same blobs can be easily
> symlinked between `qcom/x1e80100` and `qcom/x1p42100`.
> 
> Qualcomm FastConnect 6900 on UX3407QA did not work out of the box, and
> additionally required both newer firmware and patches to `board-2.bin`.
> I added a short how-to [1], as it is not exactly trivial.
> 
> ACPI dumps can be found on aarch64-laptops' github [2]. HWids on
> dtbloader's github [3].
> 
> [1] https://github.com/alexVinarskis/linux-x1e80100-zenbook-a14?tab=readme-ov-file#wcn688x-wifi
> [2] https://github.com/aarch64-laptops/build/pull/134/files
> [3] https://github.com/TravMurav/dtbloader/pull/4/files
> 
> Aleksandrs Vinarskis (6):
>   arm64: dts: qcom: move pcie6a type change from X1P42100 to
>     X1P42100-crd
>   usb: typec: Add Parade PS8833 Type-C Retimer variant
>   dt-bindings: usb: Add Parade PS8833 Type-C retimer variant
>   dt-bindings: arm: qcom: Add Asus Zenbook A14
>   firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14
>   arm64: dts: qcom: Add support for X1-based Asus Zenbook A14
> 
>  .../devicetree/bindings/arm/qcom.yaml         |    2 +
>  .../bindings/usb/parade,ps8830.yaml           |    1 +
>  arch/arm64/boot/dts/qcom/Makefile             |    2 +
>  arch/arm64/boot/dts/qcom/x1-zenbook-a14.dtsi  | 1251 +++++++++++++++++
>  .../dts/qcom/x1e80100-asus-zenbook-a14.dts    |   45 +
>  .../dts/qcom/x1p42100-asus-zenbook-a14.dts    |   48 +
>  arch/arm64/boot/dts/qcom/x1p42100-crd.dts     |    4 +
>  arch/arm64/boot/dts/qcom/x1p42100.dtsi        |    4 -
>  drivers/firmware/qcom/qcom_scm.c              |    2 +
>  drivers/usb/typec/mux/ps883x.c                |    1 +
>  10 files changed, 1356 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1-zenbook-a14.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250331 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250331215720.19692-1-alex.vinarskis@gmail.com:

arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: bluetooth: 'vddrfacmn-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: bluetooth: 'vddaon-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: bluetooth: 'vddwlcx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: bluetooth: 'vddwlmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: bluetooth: 'vddrfa0p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: bluetooth: 'vddrfa1p2-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: bluetooth: 'vddrfa1p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: pinctrl@f100000: Unevaluated properties are not allowed ('bt-en-sleep' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: bluetooth: 'vddrfacmn-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: bluetooth: 'vddaon-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: bluetooth: 'vddwlcx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: bluetooth: 'vddwlmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: bluetooth: 'vddbtcmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: bluetooth: 'vddrfa0p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: bluetooth: 'vddrfa1p2-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: bluetooth: 'vddrfa1p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: pinctrl@f100000: Unevaluated properties are not allowed ('bt-en-sleep' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#






