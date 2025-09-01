Return-Path: <linux-arm-msm+bounces-71450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCDAB3EEC6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D233206212
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33EEC26562D;
	Mon,  1 Sep 2025 19:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBAB5pK4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A401350D67;
	Mon,  1 Sep 2025 19:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756755989; cv=none; b=Sa8KBIIpuqHqN2jOoz+RfM2jfeV3l7kUsuLlDJv3QoIVRlUPBQ4Q7CSebs+10AyvCCMV/41xP97XRiCDrF1JZWbxKiEmxYrDLUQjTOwCVvhRjaXuKpMd4If7Ne8Vuey861Uk6kNt+q0W/DigpeZjEnsf+/Ly8uOsDyELEEWxdbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756755989; c=relaxed/simple;
	bh=J2E9jGMtyHGvRN19Ep4DieJw7oA3EZqjwxz7QtxwSUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LAvDOXfjO7fhuxI89FcGWXjTPUQAx0eDlu1nHGW2alqt88gEYhgKKxMG96/Wb3p5Ka33b/OhBbZvD+/xsJtdwdCSZI/c+3n8t5BmakCvXXORcFUItraSlEV6YnxdMkynfl0inJp4YtJt4xRCm7RedGJ1WodFX+OzMHQx7JSNIcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBAB5pK4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6408CC4CEF7;
	Mon,  1 Sep 2025 19:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756755987;
	bh=J2E9jGMtyHGvRN19Ep4DieJw7oA3EZqjwxz7QtxwSUk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KBAB5pK43t9rbk7fMu7863/+clAUEyEKGSSWfhQuXfYGmaUR6OvVaeGqo2Jgjw6Dz
	 SGFnIE+xo/uGDTHIpBjFAykmlpg4ZZJXeA5C7n0GVAH40Iav5VZRi65a9rFSn6rAU1
	 kxXU4S5AsCn3wX1j5OHIak9msBpSHzf/XDkdQA7oZvn2dwiochcLd5SS3EfH9dMCDU
	 CF6aQWV8Ox3JMH0r6NDImRGcymO5pLYOSlruuQb6NWhI+8SV1qIInctISvx8aiNYZq
	 pTNsu5e52N5oDsOEypMWy9jcvPvmY5z0KPNsE8fZn9WoWckhGS0ottWmWpiVW02AXu
	 nN45VfivpoZMQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Xilin Wu <wuxilin123@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Christopher Obbard <christopher.obbard@linaro.org>,
	Maud Spierings <maud_spierings@hotmail.com>
Subject: Re: [PATCH v2 00/10] arm64: dts: qcom: x1: Add missing pinctrl for eDP HPD
Date: Mon,  1 Sep 2025 14:46:07 -0500
Message-ID: <175675595921.1796591.3596425415580314899.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250822-x1e80100-add-edp-hpd-v2-0-6310176239a6@linaro.org>
References: <20250822-x1e80100-add-edp-hpd-v2-0-6310176239a6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 22 Aug 2025 11:28:51 +0200, Stephan Gerhold wrote:
> At the moment, we indirectly rely on the boot firmware to set up the
> pinctrl for the eDP HPD line coming from the internal display. If the boot
> firmware does not configure the display (e.g. because a different display
> is selected for output in the UEFI settings), then the display fails to
> come up and there are several errors in the kernel log:
> 
>  [drm:dpu_encoder_phys_vid_wait_for_commit_done:544] [dpu error]vblank timeout: 80020041
>  [drm:dpu_kms_wait_for_commit_done:524] [dpu error]wait for commit done returned -110
>  [drm:dpu_encoder_frame_done_timeout:2715] [dpu error]enc40 frame done timeout
>  ...
> 
> [...]

Applied, thanks!

[01/10] arm64: dts: qcom: x1e80100: Add pinctrl template for eDP0 HPD
        commit: 6dfa62182c3b2b31b3da5e7e5b87c294dc3ddb5c
[02/10] arm64: dts: qcom: x1-asus-zenbook-a14: Add missing pinctrl for eDP HPD
        commit: 35fab4bedcf1fb4a7b2e2f6a5e35b43e9447ad70
[03/10] arm64: dts: qcom: x1-crd: Add missing pinctrl for eDP HPD
        commit: 540020f93b22219690d591fcfd5081ab3d34ad66
[04/10] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Add missing pinctrl for eDP HPD
        commit: d1126668533eedebd6130515c7626af1ef808abb
[05/10] arm64: dts: qcom: x1e80100-asus-vivobook-s15: Add missing pinctrl for eDP HPD
        commit: c95c1ba079f604c504feb8cf7bb038341e2d7805
[06/10] arm64: dts: qcom: x1e80100-dell-xps13-9345: Add missing pinctrl for eDP HPD
        commit: a41d23142d8773614cb2745d7b224e5784cc71ab
[07/10] arm64: dts: qcom: x1e80100-hp-omnibook-x14: Add missing pinctrl for eDP HPD
        commit: 0e94604702eb9f141ef862b10757d67e3880235c
[08/10] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add missing pinctrl for eDP HPD
        commit: f6470367bdb2cde247cd88864208db998fed03ac
[09/10] arm64: dts: qcom: x1e80100-microsoft-romulus: Add missing pinctrl for eDP HPD
        commit: 4b9165960bf2d25817de6f5fda3d2cd07f787927
[10/10] arm64: dts: qcom: x1e80100-qcp: Add missing pinctrl for eDP HPD
        commit: 1616877626228a6ef05ddae4017c9b0f65803a8b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

