Return-Path: <linux-arm-msm+bounces-35500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6A19ABCA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4655284A43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 04:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A7A13CFA1;
	Wed, 23 Oct 2024 04:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7vMeJHS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7139713C8F6;
	Wed, 23 Oct 2024 04:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729656972; cv=none; b=RlLlt1sCCbE5uUT7i1Rtk6JuR38SqjY12w0twso2YE9RRNiQs1lPPsynC3jHN2SFejJzQSlM8bePVr6AhIC2Ko/eehWiDDMWDxzFgCmKIaC8beAC1jvnS2LPbpXLEMBf1BW8tt+OcT7jgqvw6OJJZPD+yW8MaaKOkFRjNT/5Ehg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729656972; c=relaxed/simple;
	bh=Ssryh/DeScctPPrI9kLBjogfgqMCqhs16Pkd5Nr7TBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LMcs7P5/c8equVxtLkzJgAa4pPqhZoEev/ZrwTIbGYH15IleKz83iLv/y6YssGNp6ITJTww6XI3gnTi2kyzRIJxZPIrUQIIEyr25QuJ7mnBr0tMjcbya0ClcohY1vUVnTex1jn/I+/1Oq0NC/IDLm6+G3iG/Lv/IXSnt8wkZRwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b7vMeJHS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6553C4CEE6;
	Wed, 23 Oct 2024 04:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729656972;
	bh=Ssryh/DeScctPPrI9kLBjogfgqMCqhs16Pkd5Nr7TBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b7vMeJHST3VEyUf/HCoYwfOa6LyzIxDlyfbQrnhVhGMpZD3hkX+iWj8RR+LiGLrp5
	 5E1NSMfagDJiRotNV80ljbcTSHIToTxxi1YdOJ8E1nMxp9cmvbdxJE5WCPP8hokSMz
	 fro1zrCmom6LOsdpOe2nYCxKgOOASxm7TsP82nZFtflR4ArQ4VWnd5lD61BmX19Ne7
	 eNcdGw/G3qPZcazLu4qKVScCwEHGj8WVTFRl/1Z9jLhLeNhIoAHU1J2xPDhJBMSXhw
	 XhiTIuqRw5b8MZu+/O3GYihh4cMSj7aqi5CCvPIiGypjyBDdiw5fnM3Y8o82EvlxZa
	 NNR3W4nUzirMw==
From: Bjorn Andersson <andersson@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	kees@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	quic_rjendra@quicinc.com,
	andre.przywara@arm.com,
	quic_sibis@quicinc.com,
	igor.belwon@mentallysanemainliners.org,
	davidwronek@gmail.com,
	ivo.ivanov.ivanov1@gmail.com,
	neil.armstrong@linaro.org,
	heiko.stuebner@cherry.de,
	rafal@milecki.pl,
	lpieralisi@kernel.org,
	Danila Tikhonov <danila@jiaxyga.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux@mainlining.org
Subject: Re: (subset) [PATCH v3 0/6] Add Nothing Phone (1) support
Date: Tue, 22 Oct 2024 23:15:48 -0500
Message-ID: <172965696396.224417.9698703565242558835.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241020205615.211256-1-danila@jiaxyga.com>
References: <20241020205615.211256-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 20 Oct 2024 23:56:08 +0300, Danila Tikhonov wrote:
> This series of patches adds support for the Nothing Phone (1), identified
> as nothing,spacewar. The Nothing Phone (1) is built on the Qualcomm
> Snapdragon 778G+ (SM7325-AE, also known as yupik).
> 
> SM7325 is identical to SC7280 just as SM7125 is identical to SC7180, so
> SM7325 devicetree imports SC7280 devicetree as a base.
> 
> [...]

Applied, thanks!

[2/6] dt-bindings: arm: cpus: Add qcom kryo670 compatible
      commit: 82ead233e01042fecdfdee5b05c377c2a9e551f4
[3/6] arm64: dts: qcom: Add SM7325 device tree
      commit: ba978ce20f8134ea9e0e8f1acb16552b5106281d
[4/6] dt-bindings: vendor-prefixes: Add Nothing Technology Limited
      commit: 7e20ecc8de9354c1e8742d37f06e152549f4c439
[5/6] dt-bindings: arm: qcom: Add SM7325 Nothing Phone 1
      commit: 389df37da15a14fa218e86676f6f9a5470d38dfa
[6/6] arm64: dts: qcom: sm7325: Add device-tree for Nothing Phone 1
      commit: 6b3d104e52893493964a5eefa50dd0fdb472515a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

