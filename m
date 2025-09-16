Return-Path: <linux-arm-msm+bounces-73779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BB5B59EA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 19:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06AFD4614F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 17:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED5B32B495;
	Tue, 16 Sep 2025 16:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hX/wJur+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FD932B48E;
	Tue, 16 Sep 2025 16:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041917; cv=none; b=HyayqB7ovfkTXh8PAg7b5hDHbSIdDKLZl673ce0TGstTdISLBqwiNMnop/m7A60TIXmfGFb5LtlMOHYRNas1GVcZ8APGVzAyXwVs+dRneoF70qzjbawVcNOeQUpY6Eu9qiKSaleuTlbtbGLtNHS+TzZT0YsZa9qDdkcxcSr/pB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041917; c=relaxed/simple;
	bh=OSicBpBNsKlVFlmTTmpMLFOpWDIRczZmZ/BFMowjpMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lfedi16Isny35QIFpO31vlfYBMsKuryRo6xI4rTUPTxN2QqA9Hv/f13vDJ+Iq1zyrYFc6X9Qk6RS+ey7aenuIpBS62s496umRPbZA1BX/xeYlJ8vqDNk++ULiE2vbVHtNjYf8vx34090IGMBFfzKIH980B2hF2pTQUA7MvnSi3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hX/wJur+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B835DC4CEF0;
	Tue, 16 Sep 2025 16:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758041916;
	bh=OSicBpBNsKlVFlmTTmpMLFOpWDIRczZmZ/BFMowjpMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hX/wJur+zKgXj1n4dyBi46m0HOb6Rblv3vjGDFmDxFkMQu1FJDjSkYzRLZia52crO
	 amujgGOmB5vDKWXATjZjaH3B1naQkRJQnTJW744SN2RLL/WXk4uPF6Kah5wH6q4Vab
	 eMcuHlQdAoySvC4y/zFksl0dDRTJqnUALmOD2CsXO67/OwK8V7XX2zhnc2QU/ikT9R
	 gEdk0GRO1eJ0kxDbrR8gILHfb21xHKfHmUgrrXD8ZAMKeIeBcBnYFMJng8S9zc3C6A
	 2cAgNOm1AF/KAbMzm3dvrZi3QqszC/J41srf9I8JYZ09pdJkrVBevlRGcc/tqOXNiM
	 AcOs305GxlyZA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Anthony Ruhier <aruhier@mailbox.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: Re: [PATCH v2 0/9] arm64: dts: qcom: x1e80100: Add IRIS video codec
Date: Tue, 16 Sep 2025 11:58:19 -0500
Message-ID: <175804189849.3983789.13739066498256926566.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915-x1e-iris-dt-v2-0-1f928de08fd4@linaro.org>
References: <20250915-x1e-iris-dt-v2-0-1f928de08fd4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 15 Sep 2025 12:06:11 +0200, Stephan Gerhold wrote:
> Add the necessary definitions to enable the IRIS video codec for
> accelerated video decoding on the X1E CRD, Lenovo ThinkPad T14s, Lenovo
> Yoga Slim 7x, Dell Inspiron 14 Plus 7441, Dell Latitude 7455 and Dell XPS
> 13 9345. The additions are largely copied as-is from sm8550.dtsi with some
> minor changes necessary for X1E.
> 
> The PAS interface used to boot the IRIS firmware works only when running
> the usual setup with the Gunyah hypervisor in EL2 and Linux in EL1. It does
> not work when booting Linux/KVM in EL2. The code to start it without using
> PAS exists already in the Venus driver, but was not ported over to IRIS
> yet. Discussions how to model the video-firmware IOMMU are still ongoing,
> so disable IRIS in x1-el2.dtso for now to avoid regressions when running
> with KVM.
> 
> [...]

Applied, thanks!

[1/9] arm64: dts: qcom: sm8550/sm8650: Fix typo in IRIS comment
      commit: 893e2abc1ae35f67f29909cd062cff978bf26b44
[2/9] arm64: dts: qcom: x1e80100: Add IRIS video codec
      commit: 9065340ac04dd8a1b07da0f024aa3a1e4dd2cffb
[3/9] arm64: dts: qcom: x1-el2: Disable IRIS for now
      commit: c0f045e303e014cec5d883edf82fe5de74769944
[4/9] arm64: dts: qcom: x1e80100-crd: Enable IRIS video codec
      commit: e2367a67b3de64e1972cd6fdb8029c974fc3b2fc
[5/9] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Enable IRIS
      commit: ee2d56bb33d5fe17155e933326fb0f9b7ff1d034
[6/9] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Enable IRIS
      commit: 98180f6796925abdfce26e44671048fd05387190
[7/9] arm64: dts: qcom: x1e80100-dell-inspiron-14-plus-7441: Enable IRIS
      commit: 647198bd7101cd399b3dbae96630d72db68b8752
[8/9] arm64: dts: qcom: x1e80100-dell-latitude-7455: Enable IRIS
      commit: a80ead38c51e93ed6f19733f2cbdb93abab4dbf8
[9/9] arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable IRIS
      commit: c4376ad753566e44f8e9198b7f05f79145419cd3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

