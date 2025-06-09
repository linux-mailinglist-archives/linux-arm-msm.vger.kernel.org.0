Return-Path: <linux-arm-msm+bounces-60658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6819EAD21EC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 17:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62C461890EE9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 15:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4267E19ABC2;
	Mon,  9 Jun 2025 15:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="msVG7mix"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1528215DBB3;
	Mon,  9 Jun 2025 15:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481271; cv=none; b=XRzqPvRtZRHlVd/IQMV50ORJyGRY5ataavvWvGWmyjNLMBTY048ehcSg8ADLkA/hi8OBlUiKODgM2KuS2Lkd6SvIba9fM1wMy8yOtjYRbtupZhPx1En2fjtO4RLEbZ99WzkGU3NSmIZ+8kFP3fPVxKeNn6bgeRsH059TwDE6JVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481271; c=relaxed/simple;
	bh=Kk1C/xz8EqCX3okdo6soLe+p8AKdGz5sR9IyN+hBa/w=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Yd5j6QQoBU6fx45RUDZ4BzDEfUc0CivM+1lTkcWQ9guIPtShQkzD8tE3R+NImuFZj95oRHME2kfrs6FFEbFHfRRB1qX+A0tE0KeNHqvVzv2jF4co0TGeidboGV7se6g8+BfYB+DTt1VueetO7iKZDRTLk4FD2sahCeCzSMLlEYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=msVG7mix; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92B3C4CEED;
	Mon,  9 Jun 2025 15:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749481270;
	bh=Kk1C/xz8EqCX3okdo6soLe+p8AKdGz5sR9IyN+hBa/w=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=msVG7mixbRDFg3kELrAl1BkWF63Hy5SVGwoddOgbCq6bIQ0FV2QDtviD3OUpBCfi3
	 Fj9FS8RZW1NAjwxrtXhDWwn4iYNtHQwqFka8Fdz7YxRUyMm5XDGTKHdfNMA1ewsY3D
	 plPfViaUM4XY16m/9Nb5WQx5MaDCv+PhGbNIAw1hBLgj736L+O7nUjgTTz4WaJ67QX
	 U/rw8pF6BVH2iS4CpAMVx/QFnL8dHa22hKwe/u0wEW+z8FpNHbP5tMRu9UNXemFzEs
	 gC++s7kjVJUFwQx4udCAQ8HWF49XRjvf6Gp9rYVvUutsDzzL7cq4Cwa0+lcbU5ehzL
	 tAkKzDTRDfjGA==
Date: Mon, 09 Jun 2025 10:01:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, maud_spierings@hotmail.com, 
 Nikita Travkin <nikita@trvn.ru>, devicetree@vger.kernel.org
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
In-Reply-To: <20250607200229.30538-1-alex.vinarskis@gmail.com>
References: <20250607200229.30538-1-alex.vinarskis@gmail.com>
Message-Id: <174948104809.2282509.3764172546278596028.robh@kernel.org>
Subject: Re: [PATCH v5 0/4] X1E Asus Zenbook A14 support


On Sat, 07 Jun 2025 22:00:44 +0200, Aleksandrs Vinarskis wrote:
> As requested, 1/4 was merged to linux-next by USB maintainers.
> Resending 4/4 rebased on top of latest linux-next. 2/4, 3/4 already
> landed.
> 
> 
> With this in mind, and taking into account that this patch was
> already reviewed some time ago, any possibility to still add 4/4 to
> 6.16?
> 
> ---
> 
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
> NVMe SSD depends on [1]. USB Type-A over USB MP controller  depends on
> [2], or equivalent proposed solution.
> 
> Qualcomm FastConnect 6900 on UX3407QA did not work out of the box, and
> additionally required both newer firmware and patches to `board-2.bin`.
> I added a short how-to [3], as it is not exactly trivial.
> 
> ACPI dumps can be found on aarch64-laptops' github [4]. HWids on
> dtbloader's github [5].
> 
> [1] https://lore.kernel.org/linux-arm-msm/20250319094544.3980357-1-quic_wenbyao@quicinc.com/
> [2] https://lore.kernel.org/all/20250318-xps13-fingerprint-v1-1-fbb02d5a34a7@oss.qualcomm.com/
> [3] https://github.com/alexVinarskis/linux-x1e80100-zenbook-a14?tab=readme-ov-file#wcn688x-wifi
> [4] https://github.com/aarch64-laptops/build/pull/134/files
> [5] https://github.com/TravMurav/dtbloader/pull/4/files
> [6] https://lore.kernel.org/all/20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org/
> [7] https://lore.kernel.org/all/20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz/
> 
> Changes to v5:
> * _Only sending 4/4 as other patches are already applied_
> * Rebase 4/4 on `next-20250606`
> * Moved gpu enable from dtsi to respective dts as per discussion in [7]
> Link to v5: https://lore.kernel.org/all/20250523131605.6624-1-alex.vinarskis@gmail.com/
> 
> Changes to v4:
> * _Only sending 4/4 as other patches are already applied_
> * Rebase 4/4 on `for-next` of qcom tree, adjust makefile to generate el2 dtbs
> * Picked Konrad's R-by for 4/4
> * Droped 'qcom,x1e80100-dp' as per [6]
> Link to v4: https://lore.kernel.org/all/20250426130203.37659-1-alex.vinarskis@gmail.com/
> 
> Changes to v3:
> * Drop redundant comments
> * Drop incomplete wcn7850 as it is causing dt errors
> * Picked a-by
> Link to v3: https://lore.kernel.org/all/20250416232345.5240-1-alex.vinarskis@gmail.com/
> 
> Changes to v2:
> * Fix/re-add PS8833 as fallback
> * Add EC's i2c address
> * Add pwrseq for wcn6855, placeholder for wcn7850 until its tested
> * Rename x1-zenbook.dtsi to x1-asus-zenbook.dtsi
> Link to v2: https://lore.kernel.org/all/20250402084646.10098-1-alex.vinarskis@gmail.com/
> 
> Changes to v1:
> * Drop PS8833 variant, fallback to PS8830 as they behave the same
> * Drop wrong pcie6a_phy compatible revert
> * Drop redundant comments, fix order of properties in the device-tree
> * Fix device name bindings, express in model names instead of the soc
> * Fix GPU firmware name for UX3407QA
> * Fix model string, enclose variant in parenthesis
> * Added missing new lines before 'status = "okay";'
> * Updated cover letter to reflect some of the above changes
> * Left SPI10 disabled as it is unknown how/what for to use it as of now
> Link to v1: https://lore.kernel.org/all/20250331215720.19692-1-alex.vinarskis@gmail.com/
> 
> Aleksandrs Vinarskis (1):
>   arm64: dts: qcom: Add support for X1-based Asus Zenbook A14
> 
>  arch/arm64/boot/dts/qcom/Makefile             |    4 +
>  .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    | 1302 +++++++++++++++++
>  .../dts/qcom/x1e80100-asus-zenbook-a14.dts    |   37 +
>  .../dts/qcom/x1p42100-asus-zenbook-a14.dts    |  141 ++
>  4 files changed, 1484 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
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
 Base: tags/next-20250606 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250607200229.30538-1-alex.vinarskis@gmail.com:

arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: gpu@3d00000 (qcom,adreno-43050c01): 'zap_shader' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#






