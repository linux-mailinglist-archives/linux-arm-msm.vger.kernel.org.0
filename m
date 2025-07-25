Return-Path: <linux-arm-msm+bounces-66642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EB8B116F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 05:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A2225A3F3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 03:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801B72367A0;
	Fri, 25 Jul 2025 03:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eeGUR07I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F7023505F;
	Fri, 25 Jul 2025 03:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753413567; cv=none; b=cLYoXDBzNXdK2VHT5OtpqTofuclGYKVka8K3gAEh6osm0RoEKVN0OZb1mfuE+UFYh8Fr1/GDq6zn5twhFtf5v0dUr8QgpYdo7LV8vel9jzLAN3KkELncSDQpKqulUjNTG5kVkakkgNOUH9O33Hy/XSr/8vveMDzHwLOhhG4fk98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753413567; c=relaxed/simple;
	bh=JJN33OJIwpY19nsSYMGwbgXfV0/0i1MvwbuPrqV/Nao=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Sx24xwiGLyaWBy2NjxpFpsFQzdHQEm49yyZH3mxMnJYtaOZo5tmPUZ9FbHPqOetJfHczbc0t8OM4gzPwCnxNXsqOLNPJqO8AP/4E999JnYkwFp9uWYtyjEWpqxblzPqFr0XDyLfMWcUp744Wjz/gR9+QeuNPNe8SJ8e3g/+q1Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eeGUR07I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA65DC4CEF1;
	Fri, 25 Jul 2025 03:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753413566;
	bh=JJN33OJIwpY19nsSYMGwbgXfV0/0i1MvwbuPrqV/Nao=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eeGUR07IdCKgve9nSgolOGQ/dcftANCWfwl9DdRj4dFyuAwGNWoEoQRcR9EafhETe
	 sUWldYRa8NByM6H/VhkhGo1RKxvVQn2RatjZqR0Aw3xzzxUodfj36ImBNRaS+qprAC
	 66pEIT3JPJ4GEgnvLZG1jyPSl3q6dLyOoPA9sub/eW7qUC6aYxIf7EPQjee+Zfwx/q
	 G+Q5UBM/1gc3ZGltdKQIPFKiok0qXuRMbSz37NWwJFyYRhx/pfKoFFFiqu0zOx3BBw
	 0C8FIRHHWs7wrs3xuKGWw4/V3alBHvFL6oGq5kadhB/rEjTZbyM8j2hIEG+35okvfu
	 OiOteLAt+UPKQ==
Date: Thu, 24 Jul 2025 22:19:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, andersson@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, konradybcio@kernel.org
To: srinivas.kandagatla@oss.qualcomm.com
In-Reply-To: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
Message-Id: <175341328198.3754729.2356512730492122653.robh@kernel.org>
Subject: Re: [PATCH 00/23] arm64: dts: qcom: cleanup DSP audio services


On Wed, 23 Jul 2025 23:27:14 +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> All the SoC level dts has exactly same device tree entires for DSP Audio
> sevices (apr, gpr, afe, apm, asm, adm) and its child devices.
> 
> It does not make sense to keep copying the same content over and over
> for each SoC, This patch series moves DSP services to common dtsi file
> so that it eliminates duplicate content,  makes audio dts much consistent
> and makes it easy for adding audio support for new SoC.
> As part of this cleanup, two common dtsi files (elite and audioreach)
> based on q6dsp framework are added and a SoC level audio.dtsi needs to add
> the required iommu configuration for the audio stream service.
> 
> This patch series also addresses another issue found with multiple
> instances of wsa codec macro, his can lead duplicate dapm widgets
> and mixers resulting in failing to probe sound-card if both of
> these instances are part of the dai-link.
> 
> Tested this on X13s, any testing is appreciated.
> 
> Srinivas Kandagatla (23):
>   arm64: dts: qcom: x1e80100: move dsp audio nodes to dedicated dts
>   arm64: dts: qcom: sc8280xp: use dedicated audioreach dtsi
>   arm64: dts: qcom: sm8650: use dedicated audioreach dtsi
>   arm64: dts: qcom: sm8550: use dedicated audioreach dtsi
>   arm64: dts: qcom: sm8450: use dedicated audioreach dtsi
>   arm64: dts: qcom: sar2130p: use dedicated audioreach dtsi
>   arm64: dts: qcom: sm8350: move dsp audio nodes to dedicated dts
>   arm64: dts: qcom: sm8250: use dedicated elite dtsi
>   arm64: dts: qcom: sm6115: use dedicated elite dtsi
>   arm64: dts: qcom: sdm845: use dedicated elite-audio dtsi
>   arm64: dts: qcom: sdm630: use dedicated elite-audio dtsi
>   arm64: dts: qcom: sc7280: use dedicated elite-audio dtsi
>   arm64: dts: qcom: sc7180: use dedicated elite-audio dtsi
>   arm64: dts: qcom: sm8750: use dedicated audioreach dtsi
>   arm64: dts: qcom: msm8916: use dedicated elite-audio dtsi
>   arm64: dts: qcom: msm8939: use dedicated elite-audio dtsi
>   arm64: dts: qcom: msm8996: use dedicated elite-audio dtsi
>   arm64: dts: qcom: sm6350: use dedicated elite-audio dtsi
>   arm64: dts: qcom: msm8953: use dedicated elite-audio dtsi
>   arm64: dts: qcom: sm8450: add sound prefix for wsa2
>   arm64: dts: qcom: sm8550: add sound prefix for wsa2
>   arm64: dts: qcom: sm8750: add sound prefix for wsa2
>   arm64: dts: qcom: sm8650: add sound prefix for wsa2
> 
>  arch/arm64/boot/dts/qcom/apq8039-t2.dts       |  1 +
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dts   |  1 +
>  arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts  |  1 +
>  .../arm64/boot/dts/qcom/audioreach-audio.dtsi | 45 ++++++++++
>  arch/arm64/boot/dts/qcom/elite-audio.dtsi     | 86 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8916-audio.dtsi   |  5 ++
>  arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi  |  1 +
>  arch/arm64/boot/dts/qcom/msm8916.dtsi         | 44 ----------
>  arch/arm64/boot/dts/qcom/msm8929.dtsi         |  1 +
>  arch/arm64/boot/dts/qcom/msm8939-audio.dtsi   |  5 ++
>  arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi  |  1 +
>  .../qcom/msm8939-sony-xperia-kanuti-tulip.dts |  1 +
>  arch/arm64/boot/dts/qcom/msm8939.dtsi         | 44 ----------
>  arch/arm64/boot/dts/qcom/msm8953-audio.dtsi   |  5 ++
>  arch/arm64/boot/dts/qcom/msm8953.dtsi         | 78 +----------------
>  arch/arm64/boot/dts/qcom/msm8996-audio.dtsi   | 14 +++
>  .../boot/dts/qcom/msm8996-oneplus-common.dtsi |  1 +
>  .../dts/qcom/msm8996-sony-xperia-tone.dtsi    |  1 +
>  arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi    |  1 +
>  .../boot/dts/qcom/msm8996-xiaomi-gemini.dts   |  1 +
>  arch/arm64/boot/dts/qcom/msm8996.dtsi         | 48 +----------
>  arch/arm64/boot/dts/qcom/msm8996pro.dtsi      |  1 +
>  .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   |  1 +
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts      |  1 +
>  .../boot/dts/qcom/qcm6490-shift-otter.dts     |  1 +
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  1 +
>  arch/arm64/boot/dts/qcom/qcs8550.dtsi         |  1 +
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  1 +
>  arch/arm64/boot/dts/qcom/sa8540p.dtsi         |  1 +
>  arch/arm64/boot/dts/qcom/sar2130p-audio.dtsi  |  5 ++
>  .../arm64/boot/dts/qcom/sar2130p-qar2130p.dts |  1 +
>  arch/arm64/boot/dts/qcom/sar2130p.dtsi        | 40 +--------
>  .../boot/dts/qcom/sc7180-acer-aspire1.dts     |  1 +
>  arch/arm64/boot/dts/qcom/sc7180-audio.dtsi    |  8 ++
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts       |  1 +
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  1 +
>  arch/arm64/boot/dts/qcom/sc7180.dtsi          | 56 +-----------
>  arch/arm64/boot/dts/qcom/sc7280-audio.dtsi    |  8 ++
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi      |  1 +
>  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi    |  1 +
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          | 68 +--------------
>  arch/arm64/boot/dts/qcom/sc8280xp-audio.dtsi  |  9 ++
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     |  1 +
>  .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts |  1 +
>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    |  1 +
>  .../dts/qcom/sc8280xp-microsoft-arcata.dts    |  1 +
>  .../dts/qcom/sc8280xp-microsoft-blackrock.dts |  1 +
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 38 +-------
>  arch/arm64/boot/dts/qcom/sdm630-audio.dtsi    |  8 ++
>  .../qcom/sdm630-sony-xperia-ganges-kirin.dts  |  1 +
>  .../sdm630-sony-xperia-nile-discovery.dts     |  1 +
>  .../qcom/sdm630-sony-xperia-nile-pioneer.dts  |  1 +
>  .../qcom/sdm630-sony-xperia-nile-voyager.dts  |  1 +
>  arch/arm64/boot/dts/qcom/sdm630.dtsi          | 45 +---------
>  arch/arm64/boot/dts/qcom/sdm845-audio.dtsi    |  8 ++
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |  1 +
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  1 +
>  .../arm64/boot/dts/qcom/sdm845-lg-common.dtsi |  1 +
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts       |  1 +
>  .../boot/dts/qcom/sdm845-oneplus-common.dtsi  |  1 +
>  .../dts/qcom/sdm845-samsung-starqltechn.dts   |  1 +
>  .../boot/dts/qcom/sdm845-shift-axolotl.dts    |  1 +
>  .../dts/qcom/sdm845-sony-xperia-tama.dtsi     |  1 +
>  .../qcom/sdm845-xiaomi-beryllium-common.dtsi  |  1 +
>  .../boot/dts/qcom/sdm845-xiaomi-polaris.dts   |  1 +
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          | 49 +----------
>  arch/arm64/boot/dts/qcom/sdm850.dtsi          |  1 +
>  arch/arm64/boot/dts/qcom/sm4250.dtsi          |  1 +
>  arch/arm64/boot/dts/qcom/sm6115-audio.dtsi    |  8 ++
>  .../boot/dts/qcom/sm6115-fxtec-pro1x.dts      |  1 +
>  arch/arm64/boot/dts/qcom/sm6115.dtsi          | 69 +--------------
>  .../boot/dts/qcom/sm6115p-lenovo-j606f.dts    |  1 +
>  arch/arm64/boot/dts/qcom/sm6350-audio.dtsi    | 17 ++++
>  .../qcom/sm6350-sony-xperia-lena-pdx213.dts   |  1 +
>  arch/arm64/boot/dts/qcom/sm6350.dtsi          | 62 +------------
>  arch/arm64/boot/dts/qcom/sm7125.dtsi          |  1 +
>  arch/arm64/boot/dts/qcom/sm7225.dtsi          |  1 +
>  arch/arm64/boot/dts/qcom/sm7325.dtsi          |  1 +
>  arch/arm64/boot/dts/qcom/sm8250-audio.dtsi    |  8 ++
>  arch/arm64/boot/dts/qcom/sm8250-hdk.dts       |  1 +
>  arch/arm64/boot/dts/qcom/sm8250-mtp.dts       |  1 +
>  .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi |  1 +
>  .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  |  1 +
>  .../boot/dts/qcom/sm8250-xiaomi-pipa.dts      |  1 +
>  arch/arm64/boot/dts/qcom/sm8250.dtsi          | 53 +-----------
>  arch/arm64/boot/dts/qcom/sm8350-audio.dtsi    |  8 ++
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts       |  1 +
>  .../qcom/sm8350-microsoft-surface-duo2.dts    |  1 +
>  arch/arm64/boot/dts/qcom/sm8350-mtp.dts       |  1 +
>  .../dts/qcom/sm8350-sony-xperia-sagami.dtsi   |  1 +
>  arch/arm64/boot/dts/qcom/sm8350.dtsi          | 67 +--------------
>  arch/arm64/boot/dts/qcom/sm8450-audio.dtsi    |  5 ++
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts       |  1 +
>  arch/arm64/boot/dts/qcom/sm8450-qrd.dts       |  1 +
>  .../dts/qcom/sm8450-sony-xperia-nagara.dtsi   |  1 +
>  arch/arm64/boot/dts/qcom/sm8450.dtsi          | 40 +--------
>  arch/arm64/boot/dts/qcom/sm8550-audio.dtsi    | 10 +++
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts       |  1 +
>  arch/arm64/boot/dts/qcom/sm8550-mtp.dts       |  1 +
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts       |  1 +
>  .../boot/dts/qcom/sm8550-samsung-q5q.dts      |  1 +
>  .../qcom/sm8550-sony-xperia-yodo-pdx234.dts   |  1 +
>  arch/arm64/boot/dts/qcom/sm8550.dtsi          | 45 +---------
>  arch/arm64/boot/dts/qcom/sm8650-audio.dtsi    | 10 +++
>  arch/arm64/boot/dts/qcom/sm8650-hdk.dts       |  1 +
>  arch/arm64/boot/dts/qcom/sm8650-mtp.dts       |  1 +
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts       |  1 +
>  arch/arm64/boot/dts/qcom/sm8650.dtsi          | 44 +---------
>  arch/arm64/boot/dts/qcom/sm8750-audio.dtsi    | 10 +++
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts       |  1 +
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts       |  1 +
>  arch/arm64/boot/dts/qcom/sm8750.dtsi          | 42 +--------
>  .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    |  1 +
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi          |  1 +
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  |  1 +
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  1 +
>  .../dts/qcom/x1e80100-asus-vivobook-s15.dts   |  1 +
>  arch/arm64/boot/dts/qcom/x1e80100-audio.dtsi  |  6 ++
>  .../dts/qcom/x1e80100-dell-xps13-9345.dts     |  1 +
>  .../dts/qcom/x1e80100-hp-omnibook-x14.dts     |  1 +
>  .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  1 +
>  .../dts/qcom/x1e80100-microsoft-romulus.dtsi  |  1 +
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts     |  1 +
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi        | 43 +---------
>  124 files changed, 401 insertions(+), 946 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/audioreach-audio.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/elite-audio.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8916-audio.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8939-audio.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8953-audio.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8996-audio.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sar2130p-audio.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-audio.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-audio.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-audio.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm630-audio.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm845-audio.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sm6115-audio.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sm6350-audio.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8250-audio.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8350-audio.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8450-audio.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8550-audio.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8650-audio.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8750-audio.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-audio.dtsi
> 
> --
> 2.50.0
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
 Base: remotes/next/fs-next-11017-gdc9b385a8a2e (best guess, 102/103 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: remoteproc@15700000 (qcom,sdm660-adsp-pas): glink-edge:apr:qcom,glink-channels:0: 'adsp_apps' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: remoteproc@15700000 (qcom,sdm660-adsp-pas): glink-edge:apr: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: remoteproc@15700000 (qcom,sdm660-adsp-pas): glink-edge:apr: 'qcom,domain' is a required property
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: remoteproc@15700000 (qcom,sdm660-adsp-pas): glink-edge: Unevaluated properties are not allowed ('apr' was unexpected)
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: remoteproc@15700000 (qcom,sdm660-adsp-pas): Unevaluated properties are not allowed ('clock-names', 'clocks', 'glink-edge', 'interrupt-names', 'interrupts-extended', 'power-domain-names', 'power-domains', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb: remoteproc@c200000 (qcom,msm8953-adsp-pil): smd-edge:apr: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb: remoteproc@c200000 (qcom,msm8953-adsp-pil): smd-edge:apr: 'qcom,domain' is a required property
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb: remoteproc@c200000 (qcom,msm8953-adsp-pil): smd-edge: Unevaluated properties are not allowed ('apr' was unexpected)
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb: remoteproc@c200000 (qcom,msm8953-adsp-pil): Unevaluated properties are not allowed ('qcom,smem-state-names', 'qcom,smem-states', 'smd-edge' were unexpected)
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb: smd-edge: apr: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,smd-edge.yaml#
arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb: smd-edge: apr: 'qcom,domain' is a required property
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,smd-edge.yaml#
arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: remoteproc@15700000 (qcom,sdm660-adsp-pas): glink-edge:apr:qcom,glink-channels:0: 'adsp_apps' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: remoteproc@15700000 (qcom,sdm660-adsp-pas): glink-edge:apr: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: remoteproc@15700000 (qcom,sdm660-adsp-pas): glink-edge:apr: 'qcom,domain' is a required property
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: remoteproc@15700000 (qcom,sdm660-adsp-pas): glink-edge: Unevaluated properties are not allowed ('apr' was unexpected)
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: remoteproc@15700000 (qcom,sdm660-adsp-pas): Unevaluated properties are not allowed ('clock-names', 'clocks', 'glink-edge', 'interrupt-names', 'interrupts-extended', 'power-domain-names', 'power-domains', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#






