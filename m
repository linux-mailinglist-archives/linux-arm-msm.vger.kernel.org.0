Return-Path: <linux-arm-msm+bounces-59265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 940C3AC2A4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 21:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 941C33B6844
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B454C19CC36;
	Fri, 23 May 2025 19:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJ0qWRGP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873B71754B;
	Fri, 23 May 2025 19:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027827; cv=none; b=MGNIZtlLK1hKNdPCxgt8fKiSLKbjF4cJ3VlFVMuFB75O6vPVXz9Jlyy4lgb4+9FgQSgPqYGrstMKPE6aTgh9LRoBfC8YLXnKOB0G9DzBVZpNOpfsicwGum8d3jjOZHBpFJdvnb69pyJ8sEiUecV+5xuYWsF2XgYGAvXonrSDtgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027827; c=relaxed/simple;
	bh=gBfMLerdA5uGEJsXX7pnRE9TlsqxHi90e+Ifj4So1HM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ZbhjHYBN8slhoqLXwJMEhiTy5WTL4sFczeYq5mmbddYP2JVHVi26Rt24VE7rJCkrV/yJZZv0zhUBLKXzxGd5fR+KYHpxNZ7/Viv9I46wFJ6tziwif5LGC8NuP5YdrRzwntajcWzS3CXYQn9Anc3EtDySWjM6t7zFhz4PQ8usebk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJ0qWRGP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27074C4CEE9;
	Fri, 23 May 2025 19:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748027826;
	bh=gBfMLerdA5uGEJsXX7pnRE9TlsqxHi90e+Ifj4So1HM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qJ0qWRGP8QYMj3VZ133JLVkPWemzvD+sP39PsfVw7VC1NYH7p9klArS0PbeeJSOwE
	 G1sL3/6PVV68KWn4vICeEThcALx9gffx9eFZZq0zc0AM9/lEQBVsy/pyr37FRMjPJV
	 iCFsLTzd1MxYfmHGfNXH+0Yw8d6Q1rTX53gm+Wndbln/fdaRbNPR9Pcx78YzjeNmii
	 oJSRWEiqNDVxYxIEIqgGEaENnIPtNHCWahJvK3JCWureJLdTKSDqSjh8XHmw+Vsn9Y
	 kpgdEpebxmZIQq+ih0m1VpmCA5Hqxd9yuhP9oFOThIINXLVIi9oO/tmzXnR6xRJ/vt
	 plaQth2Nb5sDA==
Date: Fri, 23 May 2025 14:16:55 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
 Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, maud_spierings@hotmail.com, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
In-Reply-To: <20250523131605.6624-1-alex.vinarskis@gmail.com>
References: <20250523131605.6624-1-alex.vinarskis@gmail.com>
Message-Id: <174802762673.2701077.451474042042716200.robh@kernel.org>
Subject: Re: [PATCH v5 0/1] X1E Asus Zenbook A14 support


On Fri, 23 May 2025 15:15:07 +0200, Aleksandrs Vinarskis wrote:
> As requested, 1/4 was merged to linux-next by USB maintainers.
> Resending 4/4 rebased on top of latest linux-next. 2/4, 3/4 already
> landed.
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
>  .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    | 1306 +++++++++++++++++
>  .../dts/qcom/x1e80100-asus-zenbook-a14.dts    |   33 +
>  .../dts/qcom/x1p42100-asus-zenbook-a14.dts    |  137 ++
>  4 files changed, 1480 insertions(+)
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
 Base: tags/next-20250523 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250523131605.6624-1-alex.vinarskis@gmail.com:

arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@0 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@0 (qcom,oryon): power-domains: [[4], [5, 0]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@0 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@100 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@100 (qcom,oryon): power-domains: [[7], [5, 0]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@100 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@200 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@200 (qcom,oryon): power-domains: [[8], [5, 0]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@200 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@300 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@300 (qcom,oryon): power-domains: [[9], [5, 0]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@300 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@10000 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@10000 (qcom,oryon): power-domains: [[11], [5, 1]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@10000 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@10100 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@10100 (qcom,oryon): power-domains: [[12], [5, 1]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@10100 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@10200 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@10200 (qcom,oryon): power-domains: [[13], [5, 1]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@10200 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@10300 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@10300 (qcom,oryon): power-domains: [[14], [5, 1]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@10300 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@20000 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@20000 (qcom,oryon): power-domains: [[16], [5, 2]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@20000 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@20100 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@20100 (qcom,oryon): power-domains: [[17], [5, 2]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@20100 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@20200 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@20200 (qcom,oryon): power-domains: [[18], [5, 2]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@20200 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@20300 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@20300 (qcom,oryon): power-domains: [[19], [5, 2]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: cpu@20300 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@0 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@0 (qcom,oryon): power-domains: [[4], [5, 0]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@0 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@100 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@100 (qcom,oryon): power-domains: [[7], [5, 0]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@100 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@200 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@200 (qcom,oryon): power-domains: [[8], [5, 0]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@200 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@300 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@300 (qcom,oryon): power-domains: [[9], [5, 0]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@300 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@10000 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@10000 (qcom,oryon): power-domains: [[11], [5, 1]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@10000 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@10100 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@10100 (qcom,oryon): power-domains: [[12], [5, 1]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@10100 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@10200 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@10200 (qcom,oryon): power-domains: [[13], [5, 1]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@10200 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@10300 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@10300 (qcom,oryon): power-domains: [[14], [5, 1]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: cpu@10300 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#






