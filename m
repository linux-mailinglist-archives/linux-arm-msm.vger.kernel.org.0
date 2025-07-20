Return-Path: <linux-arm-msm+bounces-65755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F8BB0B2F0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 02:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD95C3AFDCD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 00:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041BA6FC5;
	Sun, 20 Jul 2025 00:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pEtxp9jq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C627F522A;
	Sun, 20 Jul 2025 00:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752970010; cv=none; b=jOgetxCvha1SlLkr4MB3AncLBHbJ5NwC17p/LRiVFmv0SF2CjfImI/WDvhCJ2s0pz46V0dZtIkWuSKnVjiolExbt3Z220qhuI6/fCmcm8OVC7uBxTVthk3v+u6IvU+2Pa7F1NSAR3+Y0tN2dDPeIssF2j1a/JPVMMUe8iRJaf3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752970010; c=relaxed/simple;
	bh=EApa/B3qVNDfcExaLR6bhySD8ifVqpdKzBSj8T1Yzv8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=GiDtAbEWZ8aSIkIPh6NfnkApsHTjrc1WP9+0Krb2/qHhXAq2UMYodN6gVbiJ0ZWs9eE7bHG53mEU1013GnGLMNpvwvbjEpoo5d+gtQFK2pKnERI4d5Bx59L9ntcae+Nr9GVCzvl4WyUg3DidYJWwwZKCUQmQXwUZYa4pjKPgQxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pEtxp9jq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13700C4CEF7;
	Sun, 20 Jul 2025 00:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752970010;
	bh=EApa/B3qVNDfcExaLR6bhySD8ifVqpdKzBSj8T1Yzv8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=pEtxp9jqGZO/EZuUwwHs96LA4wrnlAkGCZ4Pg0R4zbUB4294vQFYHYJTV1LBCw2H1
	 04kSoJNYJMhAtTEUS7WcSFj0U3uh7AAnoun76XMx8phL4VcGr0ejm4qGizm0MnRhwi
	 bsAhIocqOL2gdDrJk1yPAkxQmmD8KfytwnDGJkt26gwL29NcHKv7tZa+1kZPF56Ty8
	 D3q5im5bsSV5jcEnWvJo9ek5gcWPf3KOzh3Oh8RP7MRnoCAZ9uCAQO8GaLyLCNoxld
	 ZDb5f/yRhPsNzBzlGohtFYDLYlaVe+kNf4a+KhbJLutSbLx0FZ96kG2jMVDoyCLjjz
	 34Q0P2ptEK31Q==
Date: Sat, 19 Jul 2025 19:06:49 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>, 
 freedreno@lists.freedesktop.org, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Yongxing Mou <quic_yongmou@quicinc.com>, 
 Danila Tikhonov <danila@jiaxyga.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>, 
 linux-kernel@vger.kernel.org, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-clk@vger.kernel.org, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Mahadevan <quic_mahap@quicinc.com>, 
 Simona Vetter <simona@ffwll.ch>, Konrad Dybcio <konradybcio@kernel.org>, 
 devicetree@vger.kernel.org
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
Message-Id: <175296991792.777248.14434286781609695390.robh@kernel.org>
Subject: Re: [PATCH v3 0/5] dt-bindings: msm/dp: Add support for 4 pixel
 streams


On Thu, 17 Jul 2025 16:28:42 -0700, Jessica Zhang wrote:
> On some MSM chipsets, the display port controller is capable of supporting
> up to 4 streams.
> 
> To drive these additional streams, the pixel clocks for the corresponding
> stream needs to be enabled.
> 
> Fixup the documentation of some of the bindings to clarify exactly which
> stream they correspond to, then add the new bindings and device tree
> changes.
> 
> ---
> Changes in v3:
> - Fixed dtschema errors (Rob Herring)
> - Documented all pixel stream clocks (Dmitry)
> - Ordered compatibility list alphabetically (Dmitry)
> - Dropped assigned-clocks too (Dmitry)
> - Link to v2: https://lore.kernel.org/r/20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com
> 
> Changes in v2:
> - Rebased on top of next-20250523
> - Dropped merged maintainer patch
> - Added a patch to make the corresponding dts change to add pixel 1
>   stream
> - Squashed pixel 0 and pixel 1 stream binding patches (Krzysztof)
> - Drop assigned-clock-parents bindings for dp-controller (Krzysztof)
> - Updated dp-controller.yaml to include all chipsets that support stream
>   1 pixel clock (Krzysztof)
> - Added missing minItems and if statement (Krzysztof)
> - Link to v1: https://lore.kernel.org/r/20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com
> 
> ---
> Abhinav Kumar (4):
>       dt-bindings: Fixup x1e80100 to add DP MST support
>       dt-bindings: clock: Add SC7280 DISPCC DP pixel 1 clock binding
>       dt-bindings: display/msm: drop assigned-clock-parents for dp controller
>       dt-bindings: display/msm: add stream pixel clock bindings for MST
> 
> Jessica Zhang (1):
>       arm64: dts: qcom: Add MST pixel streams for displayport
> 
>  .../bindings/display/msm/dp-controller.yaml        | 53 +++++++++++-----
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 14 +++--
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 11 ++--
>  .../bindings/display/msm/qcom,sc7180-mdss.yaml     |  3 -
>  .../bindings/display/msm/qcom,sc7280-mdss.yaml     | 12 ++--
>  .../bindings/display/msm/qcom,sm7150-mdss.yaml     |  5 --
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 11 ++--
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 21 +++----
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 34 +++++++---
>  arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 10 ++-
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 20 ++++--
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 72 +++++++++++++++-------
>  arch/arm64/boot/dts/qcom/sm8150.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/sm8250.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/sm8350.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/sm8450.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/sm8550.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/sm8650.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 30 ++++++---
>  include/dt-bindings/clock/qcom,dispcc-sc7280.h     |  2 +
>  21 files changed, 235 insertions(+), 133 deletions(-)
> ---
> base-commit: 7a88d609b069b7d2f4d10113b18fea02921bedb1
> change-id: 20241202-dp_mst_bindings-7536ffc9ae2f
> 
> Best regards,
> --
> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
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
 Base: base-commit 7a88d609b069b7d2f4d10113b18fea02921bedb1 not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/v6.16-rc2-698-g6b93840116df (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['edp-panel'], 'enable-gpios': [[71, 74, 0]], 'power-supply': [[258]], 'pinctrl-0': [[259]], 'pinctrl-names': ['default'], 'port': {'endpoint': {'remote-endpoint': [[260]], 'phandle': 257}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['edp-panel'], 'power-supply': [[276]], 'phandle': 597, 'port': {'endpoint': {'remote-endpoint': [[277]], 'phandle': 275}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['samsung,atna45dc02', 'samsung,atna33xc20'], 'enable-gpios': [[275, 4, 0]], 'power-supply': [[276]], 'pinctrl-0': [[277]], 'pinctrl-names': ['default'], 'port': {'endpoint': {'remote-endpoint': [[278]], 'phandle': 274}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['samsung,atna45af01', 'samsung,atna33xc20'], 'enable-gpios': [[268, 4, 0]], 'power-supply': [[269]], 'pinctrl-0': [[270]], 'pinctrl-names': ['default'], 'port': {'endpoint': {'remote-endpoint': [[271]], 'phandle': 267}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['edp-panel'], 'power-supply': [[272]], 'backlight': [[273]], 'port': {'endpoint': {'remote-endpoint': [[274]], 'phandle': 271}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['edp-panel'], 'power-supply': [[268]], 'port': {'endpoint': {'remote-endpoint': [[269]], 'phandle': 267}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['samsung,atna56ac03', 'samsung,atna33xc20'], 'enable-gpios': [[261, 4, 0]], 'power-supply': [[262]], 'pinctrl-0': [[263]], 'pinctrl-names': ['default'], 'port': {'endpoint': {'remote-endpoint': [[264]], 'phandle': 260}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['edp-panel'], 'power-supply': [[276]], 'backlight': [[277]], 'phandle': 603, 'port': {'endpoint': {'remote-endpoint': [[278]], 'phandle': 275}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['edp-panel'], 'power-supply': [[272]], 'backlight': [[273]], 'port': {'endpoint': {'remote-endpoint': [[274]], 'phandle': 271}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['edp-panel'], 'backlight': [[266]], 'power-supply': [[267]], 'port': {'endpoint': {'remote-endpoint': [[268]], 'phandle': 265}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['samsung,atna45af01', 'samsung,atna33xc20'], 'enable-gpios': [[278, 4, 0]], 'power-supply': [[279]], 'pinctrl-0': [[280]], 'pinctrl-names': ['default'], 'port': {'endpoint': {'remote-endpoint': [[281]], 'phandle': 277}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['edp-panel'], 'backlight': [[266]], 'power-supply': [[267]], 'port': {'endpoint': {'remote-endpoint': [[268]], 'phandle': 265}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#






