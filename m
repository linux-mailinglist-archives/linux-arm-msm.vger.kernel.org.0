Return-Path: <linux-arm-msm+bounces-5103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B8B8160D3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 18:23:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C376E282AE3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 17:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47E449F6A;
	Sun, 17 Dec 2023 17:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiDlkO4a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B954F49F64;
	Sun, 17 Dec 2023 17:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B961C433C7;
	Sun, 17 Dec 2023 17:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702833706;
	bh=RpZZAKBu75yTBE35uEgEHgprp5110NNtatf5lp42PbQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JiDlkO4atV36rUozqTApJD5ifGlR7FxRMUolz/XeGbthFzrV3UFlJVGQcfNE//CTU
	 jQTgLZawKW98kVwfBLBJjTC+RopSFertD0jn9BkDaRiTKSihdSj0p9n7c+aeKEloyT
	 T4FDnFmrMuRiEN7+MEEffEzoqFfUKAEV/gvGTIPC53mBbLtO/kWvMhOMqKDa65ObIY
	 eIsr1FPYZW0kd0ks2u8fSRUdYdqAJhkz2TbYF7dOjzyYN9uwQ/cm8tXMKmLyidNYpt
	 DEo6sVWURM5xdjMcxl2Ba5WlsHS97F7gMjoi3NwpdshRLd78hkYQaw4H3rtWAQ0T++
	 Cgd0pzKqOznrQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/7] arm64: dts: qcom: sm8150-hdk: enable display output
Date: Sun, 17 Dec 2023 11:21:01 -0600
Message-ID: <170283349436.66089.15812848393850067305.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231215174152.315403-1-dmitry.baryshkov@linaro.org>
References: <20231215174152.315403-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 15 Dec 2023 19:40:32 +0200, Dmitry Baryshkov wrote:
> Enable display output on the SM8150 HDK device. This includes HDMI
> output through the onboard DSI-HDMI bridge and DP output on the USB-C
> port.
> 
> Changes since v2
> - Rebased on top of linux-next
> - Dropped applied patches
> 
> [...]

Applied, thanks!

[1/7] arm64: dts: qcom: sm8150: make dispcc cast minimal vote on MMCX
      commit: 617de4ce7b1c4b41c1316e493d4717cd2f208def
[2/7] arm64: dts: qcom: sm8150-hdk: enable HDMI output
      commit: 73d1d5b153fe143ad53bef3bc089fb1b9b463e5d
[3/7] arm64: dts: qcom: sm8150-hdk: fix SS USB regulators
      commit: a509adf05b2aac31b22781f5aa09e4768a5b6c39
[4/7] arm64: dts: qcom: sm8150: add DisplayPort controller
      commit: 5dd110c90a5011012d50174740e8a2dff37826be
[5/7] arm64: dts: qcom: sm8150: add USB-C ports to the USB+DP QMP PHY
      commit: 4eb60569e2556da0079b8959017a469d7e47ca34
[6/7] arm64: dts: qcom: sm8150: add USB-C ports to the OTG USB host
      commit: 10da1b9a44281718f470c9dd084be2db618e36bc
[7/7] arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode
      commit: ba712fd55c7b635ad73c48b087a44e0e77d32abf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

