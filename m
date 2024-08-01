Return-Path: <linux-arm-msm+bounces-27647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BCB9441A6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 05:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B180C1F22A0D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 03:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2953213DDDC;
	Thu,  1 Aug 2024 03:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0DzDDyB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2F913DDA6;
	Thu,  1 Aug 2024 03:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722482396; cv=none; b=NruCQwi9e0ZDRbSDDjPq2drStInYbPGGVRnuor3LB0tBGP5DlzKdq5Dgt5hxMKIVTGU7/xsdL7fRNq7RiaHrsct1aJiSIoeuk6oTEI+DYw8wwFMTenp3H5cjlBJcyc7W8wyQ2UO/dTSr6JwQsqGWw1ij+HAp1plNVJ0Y6eGiaqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722482396; c=relaxed/simple;
	bh=SwcWJVYuniZVBoSS577qS16zzVwVHvPrvOJSGVqYyA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rBSp31FP56tsWRgpfOfJOcQyiBa6dQDg17nySJKaHCXh9qz0f4vzRIKvspFc4SZRA12oYtmhQGkkD5qtnbeoSLQSIA1PqccMoZoOh2RAC8BRg9fhK8XV7rkIir0e9bwPv2CazcjpqBZMAVEgrhPE/ekHqBOD6K9Kdl7bzkTGMA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0DzDDyB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172B2C116B1;
	Thu,  1 Aug 2024 03:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722482395;
	bh=SwcWJVYuniZVBoSS577qS16zzVwVHvPrvOJSGVqYyA8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s0DzDDyBq/x2wtlwNmQMO4z9gqmk3pLpaCpuYSAc9/wmNLSuqwJWLiWzaqHRDNxrt
	 nqNmrZF4dEnLgUGS/tBuCN/Q8hSKCxnnjMC98f08W2NQLRy8ia7tadunfZO8DMGkCI
	 +FdpKl6636zCAJ+kb5AXrByNJsfK/7J8bKvf+Lg8ylgSchx61SV92+PcV+dwFnSARj
	 HIFV7jPffHr/HFfM2n2YKHvMKvEv73etPKR0aQ3sgO2bkIqBnUF1xfSbzsWIsXNXxc
	 po0T8XzUsZyPFudzjIBJkc3HYgfCe/VLLQZ8jdEA2asyttbmxMAPxYfcZRYc1jvA0i
	 bpdsbVerzgAyQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dang Huynh <danct12@riseup.net>
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/11] F(x)tec Pro1X feature expansion
Date: Wed, 31 Jul 2024 22:19:40 -0500
Message-ID: <172248238595.319692.2768074398610917928.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
References: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 31 Jul 2024 13:18:41 +0700, Dang Huynh wrote:
> This patch series expand F(x)tec Pro1X (QX1050) device tree to support
> various components of the device.
> 
> Most notably:
> + SD Card slot
> + Touchscreen
> + MDSS, DRM display panel
> + WLAN (ATH10K)
> + Hall sensor and camera button
> 
> [...]

Applied, thanks!

[01/11] arm64: dts: qcom: sm6115-pro1x: Add Hall Switch and Camera Button
        commit: ff5affd17bde4ea78d153122a601d69b3f302326
[02/11] arm64: dts: qcom: sm6115-pro1x: Add PCA9534 IO Expander
        commit: 4686161eb87168ec746eb54d7b84c5d022073a33
[03/11] arm64: dts: qcom: sm6115-pro1x: Add Goodix Touchscreen
        commit: e46b455e67f836361a94512ca187442a8b699f25
[04/11] arm64: dts: qcom: sm6115-pro1x: Add Caps Lock LED
        commit: 17c98581155e88d3f118cd879ba263e952b83946
[05/11] arm64: dts: qcom: sm6115-pro1x: Enable SD card slot
        commit: 95b19afd734d0a278088456b052a2fb94c4ade55
[06/11] arm64: dts: qcom: sm6115-pro1x: Enable MDSS and GPU
        commit: 8b9f76a6f8fbc81fdc44b5c4b134d20095c38a6a
[07/11] arm64: dts: qcom: sm6115-pro1x: Hook up USB3 SS
        commit: e0674d85c80456782fdc44c36c4884fa64bb3a58
[08/11] arm64: dts: qcom: sm6115-pro1x: Add PMI632 Type-C property
        commit: 79f8d127c46a1311de49db7c175fee84ce827d3a
[09/11] arm64: dts: qcom: sm6115-pro1x: Enable RGB LED
        commit: b5c63330a7ef026c21da5eed4669a790b22ea642
[10/11] arm64: dts: qcom: sm6115-pro1x: Enable remoteprocs
        commit: e055924159df6ec2ffa0f221aa84c49429cfe6db
[11/11] arm64: dts: qcom: sm6115-pro1x: Enable ATH10K WLAN
        commit: 84c1711f27509a6a5841b13ac08fc58b1d091ae8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

