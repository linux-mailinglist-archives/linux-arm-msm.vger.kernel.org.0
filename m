Return-Path: <linux-arm-msm+bounces-9065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2178842B1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 18:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4F981C24B3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 17:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D7014E2E3;
	Tue, 30 Jan 2024 17:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kvage8bk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B466A14E2E0
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 17:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706636391; cv=none; b=lGBu2QwMSv4q4Uc0lHNYoRhqLCFTH5onXMvMXjjVonzVcWl7RADThLlph5EHC676L+U43ee9Yt6C4Q67v5SXL5thNl/x/J2R0yToNtxKJ4/hJJmQ7hUwJz03zD6UR8UXWJAA/Uz1XaLdFEjFtWclK/343kEIVqi/Zf1Yf3xGLhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706636391; c=relaxed/simple;
	bh=0KVES+c/qiNdmAzRUl5nNBHLQTsiHe9IdeaRUX2obNg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nTwmsCUOzeK1K92PQsriu6dIuof3TqL3JYdFWgjUvXslnvSCz8T/NFfl+gqDNXmZMzVyUi/MA3oNkuP+ZTqsWokt9qG6UbqJdLUS25RfiYkLGY+NGwMpnpyMgoePaG52w9oJVSjgeRgmMMKvhUp2cC98PkyHra25YPwYn/FAKvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kvage8bk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C66C43390;
	Tue, 30 Jan 2024 17:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706636391;
	bh=0KVES+c/qiNdmAzRUl5nNBHLQTsiHe9IdeaRUX2obNg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kvage8bk5r4ujFcezK8yWQyJrSuBYVBKI8DfRgpBhCihmtGbM0dgrIWf0y77m7jvG
	 zm0ChOmsuPaVktmawlwL9fq2GlSlP1DfFL7WOV29hx/RykRfZw1ub4L0s7NvpNDhLb
	 VysS8NVGxd87hW0oPaX+Nq9ThFfc3CC8kie3YB76yE5XiNiVVRkvGcpbYITY7SqkY0
	 Tc1hNXW7dFdgMlxwcoHtsf0zuGjmHubAAHnqGy9FKLOlS4QR04cXFkPiviAzTN9vcz
	 I2hEYBqGlDG/gA7YH7PDwritXKbmd1+BUmUIRDTNaGgnruTleKK3G7NvuPV8OgvSZ4
	 GC6LYTK+zuH6w==
From: Vinod Koul <vkoul@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org>
References: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org>
Subject: Re: [PATCH v2 0/8] phy: qcom: merge common register defines in QMP
 drivers
Message-Id: <170663638848.685888.15892193883816117048.b4-ty@kernel.org>
Date: Tue, 30 Jan 2024 23:09:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Fri, 26 Jan 2024 01:22:34 +0200, Dmitry Baryshkov wrote:
> After the split of the gigantic QMP PHY driver, individual drivers
> contained common regster bits definitions. Move them to the global
> header. While we are at it, also remove register definitions from the
> phy-qcom-sgmi-eth driver, which is yet another QMP driver with its own
> embedde register defines.
> 
> 
> [...]

Applied, thanks!

[1/8] phy: qcom: qmp-usb-legacy: drop single-lane support
      commit: 982f92d5eea4e22e7c445ff5f508de1b63d8baba
[2/8] phy: qcom: qmp-usb-legacy: drop qmp_usb_legacy_iomap
      commit: d3e7e79ccbaa643c264e3e626e05d2eeeba7399f
[3/8] phy: qcom: qmp: move common functions to common header
      commit: 53d7776ea765ffd79f3ccfe627c2de3a0c7c2265
[4/8] phy: qcom: qmp: split DP PHY registers to separate headers
      commit: ef643d55fdeb30299367e0e15ef47945f60d5a11
[5/8] phy: qcom: qmp: move common bits definitions to common header
      commit: c01e03f97c4ea501fbd7dfe3eb7920a9a855e635
[6/8] phy: qcom: qmp-usbc: drop has_pwrdn_delay handling
      commit: fe3ec7600a16649812bf73f058e991429ccc28fb
[7/8] phy: qcom: sgmii-eth: use existing register definitions
      commit: df71879bec89541e1cc8886c6d85ca4d5d61b422
[8/8] phy: qcom: sgmii-eth: move PCS registers to separate header
      commit: 25ee21fc97db6cb7f476464e4aa8616652b3be49

Best regards,
-- 
~Vinod



