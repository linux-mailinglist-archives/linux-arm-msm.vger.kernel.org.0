Return-Path: <linux-arm-msm+bounces-65361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E15CB08408
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F9497A0F55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FB5221704;
	Thu, 17 Jul 2025 04:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJe7Mm2n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2137D22156C;
	Thu, 17 Jul 2025 04:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752726696; cv=none; b=R4yncfLhAUf8zOcuLUzyXh1TCJBrojndQkB7gpMMPKNkwrM2JLZQIPCvYIf2iSZo+eaH1WB3hJ8G9MwD2CulHo6NJCYRuZgo/Eua+DF0xUGp4IuS6SeMVuEdYkWLunY9SsTYSWjcKDzIJ61MVYMfWkNNyxPh8mVc+ovzhLRhr9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752726696; c=relaxed/simple;
	bh=gte0n1IPy5vUP3szt7JdTPRXmu6BeeRcJ1AV9NExVOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fUyrTj+Whu+O4QLVDgPGU1Nno0GIJA3oh4NwsBG0HgRIaS1BIGI/MBmxpK/xSh/gaDMw/kPetUszYoPx3a4LDmhb8HT0CUPKSugVhOJY33/lRCHyOR2Q8Nc/TDa9lpd8nHdh4BPolRnFs8N4QqpbgaACZ+VA98RpPWqNjoXoVH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJe7Mm2n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9186FC4CEF5;
	Thu, 17 Jul 2025 04:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726695;
	bh=gte0n1IPy5vUP3szt7JdTPRXmu6BeeRcJ1AV9NExVOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eJe7Mm2nd85GkvDTKCHvAYOfpA9es1Siy2trbF920m/ksfY7umA1X01er1zfSgaHm
	 Ds9WpTsvQah+zyOuxERZ0++zw2+vqYxQhrqSjgqBe5/CwNOCRJNHcJnNkWt0fOIf5U
	 n2BnQgqfBcWLm/edlNk4TySXV4n72ydt1XJwWAyUIKYL4isLLr7IqX/7DU9NB3icmc
	 oRfxVX2CZ6Y3DKDtu65uCdIFL+3eNfHcsFy4ooN00A9m8J++wQlnMdo1tYU8rtJwRB
	 3aLt0vjeQOTtSR0XEqF6wgeQc+81wfFLl0h6onEttMNSDnosDFCXM3Z2nF54yyKECS
	 lM52v0dzMV/QA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/11] Add clock drivers for Milos
Date: Wed, 16 Jul 2025 23:31:07 -0500
Message-ID: <175272667155.130869.14196509096081261613.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250715-sm7635-clocks-v3-0-18f9faac4984@fairphone.com>
References: <20250715-sm7635-clocks-v3-0-18f9faac4984@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 15 Jul 2025 09:19:00 +0200, Luca Weiss wrote:
> Document and add the clock drivers for GCC, CAMCC, DISPCC, GPUCC and
> VIDEOCC on the Milos SoC (e.g. SM7635).
> 
> 

Applied, thanks!

[01/11] clk: qcom: common: Add support to register rcg dfs in qcom_cc_really_probe
        commit: b21b5b3ae0fce4db3eab052d3e3cc17890e78523
[02/11] dt-bindings: clock: qcom: document the Milos Global Clock Controller
        commit: 95ba6820a665c25f372a3cdc9c469bb0a86bf174
[03/11] clk: qcom: Add Global Clock controller (GCC) driver for Milos
        commit: 88174d5d94226b0f0931f4ae97913e498f76d2a2
[04/11] dt-bindings: clock: qcom: document the Milos Camera Clock Controller
        commit: dbb9d53b7197b6b13d0137c0ea45902ef26e2bb4
[05/11] clk: qcom: Add Camera Clock controller (CAMCC) driver for Milos
        commit: f003800e2d3596770fc42bfff7de9528923dafe2
[06/11] dt-bindings: clock: qcom: document the Milos Display Clock Controller
        commit: 63edb206a3a93f523579df7f49f2989aae4e8450
[07/11] clk: qcom: Add Display Clock controller (DISPCC) driver for Milos
        commit: f40b5217dce1832e5a270ee10f03d3d23233d720
[08/11] dt-bindings: clock: qcom: document the Milos GPU Clock Controller
        commit: 7e5368a14b8c295470ab07d2a9ad8ee9bf7187ee
[09/11] clk: qcom: Add Graphics Clock controller (GPUCC) driver for Milos
        commit: 980d7c84461a0ae88ec915735553067c7743ba4c
[10/11] dt-bindings: clock: qcom: document the Milos Video Clock Controller
        commit: a4937e9741867865bb307ae9dde6ef393b68540b
[11/11] clk: qcom: Add Video Clock controller (VIDEOCC) driver for Milos
        commit: 633a81bead863881373cf3399e26d9d10d31315e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

