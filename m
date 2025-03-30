Return-Path: <linux-arm-msm+bounces-52827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED64A75831
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 01:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40A14188B435
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 00:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFFF4C81;
	Sun, 30 Mar 2025 00:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vAZcA0ai"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD013C3C;
	Sun, 30 Mar 2025 00:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743294423; cv=none; b=loA2tENRpCfLwOA2W3UYpmE6Pz/LOeQuxBAr0RbIAkW/ikhwD0FZ4SYtTmIM8jR+iNtDgUSHCVAN/LS5o5BJ3XyloMFa3eveGNEHyps7coKd6v5eC3WBUhYM2qucTENDGXFqbzqc5q0YHhEUOAznHY3MxLFF1ZrTqK9v0zQM1cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743294423; c=relaxed/simple;
	bh=hqrM7xNKkgrwmYt3U5EeEy//ier+fwof/YGETEWtSY0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=IFiviOvKaph7RAKLB7+xjZePkb0Bav4j8yPzbv7Uat9urwnPFFqmtfWbPFTY2eolv12FSlfRiqTCVlsViG2N951kENisjhTWMoKJlApv9G/51n53SQkPhQ1kqCX6aJrYxNd/lHo7vifNU8D16FD8vx4PuX/JIXEI8pevg6iBRSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vAZcA0ai; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1B5C4CEE2;
	Sun, 30 Mar 2025 00:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743294422;
	bh=hqrM7xNKkgrwmYt3U5EeEy//ier+fwof/YGETEWtSY0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=vAZcA0ai3Qulf76VLDmaI5v32TX/eOmRAOqLpxauPWkuiNy5Cw+gflbJcZKrLUJwS
	 yg1BZs47Pa1N4wOmERYtlakxUtTCV+CfUp217Zx63EQiN9JOPIqpOogW3Lbj2UZakD
	 KI+ZSwDzJaPanDnMehyP2wZLHqWRbJVCs+XikFs6qoiHfwIWAvJlFW+9o2D73UV/0B
	 iBMSuYyKUT+TsDrhXuEVDXQ+HZNoSX2McHUH6nFa3OfbqRfztYKInulhG+6Q9p3wMZ
	 tBujoSoc+pRS4pW6vFgfmyU66/qCzDFIe5q3KxSTzpPPvwiwkiCiQkF97rnHs7XAdE
	 fufGz7r6HGrNw==
Date: Sat, 29 Mar 2025 19:27:01 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Rui Miguel Silva <rui.silva@linaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org
To: Christopher Obbard <christopher.obbard@linaro.org>
In-Reply-To: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org>
References: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org>
Message-Id: <174329418093.2439779.7622824447479032708.robh@kernel.org>
Subject: Re: [PATCH v3 0/2] Add support for OLED panel used on Snapdragon
 Lenovo T14s Gen6


On Thu, 27 Mar 2025 16:56:52 +0000, Christopher Obbard wrote:
> The Snapdragon Lenovo T14s Gen6 can be bought with a number of different
> panels. This patch series adds support for the OLED model which has a
> Samsung ATNA40YK20 panel.
> 
> With this patch series, the backlight of the OLED eDP panel does not
> illuminate since the brightness is incorrectly read from the eDP panel
> as 0 (to be clear this is not a regression). This will be fixed in a
> follow-up patch series as it does not block the device tree patches.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
> Changes in v3:
> - Added review trailers from v2.
> - Dropped dt-binding documentation patch (applied by Douglas Anderson into
>   drm-misc-next).
> - Dropped eDP maximum brightness patch (will be sent in separate
>   series).
> - Removed duplicate nodes in T14s OLED device tree.
> - Reworked WIP comments from commit messages.
> - Link to v2: https://lore.kernel.org/r/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org
> 
> Changes in v2:
> - Use the existing atna33xc20 driver rather than panel-edp.
> - Add eDP panel into OLED devicetree.
> - Add patch to read the correct maximum brightness from the eDP panel.
> - Link to v1: https://lore.kernel.org/r/20250320-wip-obbardc-qcom-t14s-oled-panel-v1-1-05bc4bdcd82a@linaro.org
> 
> ---
> Christopher Obbard (2):
>       arm64: dts: qcom: x1e78100-t14s: add hpd gpio to eDP panel
>       arm64: dts: qcom: x1e78100-t14s-oled: add eDP panel
> 
>  .../boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts      |  8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 11 +++++++++++
>  2 files changed, 19 insertions(+)
> ---
> base-commit: b6ae34803e82511009e2b78dc4fd154330ecdc2d
> change-id: 20250320-wip-obbardc-qcom-t14s-oled-panel-b74fed21d600
> 
> Best regards,
> --
> Christopher Obbard <christopher.obbard@linaro.org>
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
 Base: using specified base-commit b6ae34803e82511009e2b78dc4fd154330ecdc2d

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org:

arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: panel: compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,atna40yk20', 'samsung,atna33xc20'] is too long
	'samsung,atna33xc20' was expected
	'samsung,atna40yk20' is not one of ['samsung,atna45af01', 'samsung,atna45dc02', 'samsung,atna56ac03']
	from schema $id: http://devicetree.org/schemas/display/panel/samsung,atna33xc20.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: /soc@0/display-subsystem@ae00000/displayport-controller@aea0000/aux-bus/panel: failed to match any schema with compatible: ['samsung,atna40yk20', 'samsung,atna33xc20']






