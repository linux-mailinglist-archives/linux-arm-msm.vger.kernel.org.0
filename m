Return-Path: <linux-arm-msm+bounces-42574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ABF9F5143
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 17:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7452A189301E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 16:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27CD1F7562;
	Tue, 17 Dec 2024 16:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rBDX3RB9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839691459FD;
	Tue, 17 Dec 2024 16:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734453540; cv=none; b=RDLR+LccTOlk+iVPeybsv2HfONRjzrorK00Jy+p5g6UrmoSOvPQsRN3x+zkcuzryl46I1uw8YnEY6rE8XYQ0BE+H0UUKKvMiVe+QuOVK5vgMZg9H8b3o9dKg+eMRn5yMBhnp802HUtuxrODqNAF70wHBlTHe3qJ1K9TnrGtL3p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734453540; c=relaxed/simple;
	bh=3EVg1+Zu1P76l+wUDuDNGuylZNMWDKzjADira60wV4g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T/+7ZrEwqH2qNbYm8FgbEq/sRo/mKnc3LmaIgKWM6IOPsy3ub/REyy+2sOHTTA3ZXY4Vt+bCZ2uykNzsU86kXjtgS5Ws6dS6ylPEAaApaKM3n+Ie6MTcbGeTFGDuNOpDKtZ4Z5+xrVWSe+JSB07NM9z+KnWOMtuEHWcxQ2cWR6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rBDX3RB9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79556C4CEDF;
	Tue, 17 Dec 2024 16:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734453540;
	bh=3EVg1+Zu1P76l+wUDuDNGuylZNMWDKzjADira60wV4g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rBDX3RB9bcYZgm2gRY8/8Cyf6c30ntilys8RuToiugulpIgF1lh6RkvyqJ/vqYuMd
	 R/GpBplXzEdIYETLOYlzeCEG/OGu8j6GCaoa8NOf6/Q/gNbLfreUVTIyEMT+V4GCAR
	 UbavcJI19K8agBxOjfoXGaXIgyGLTLfOixIMtPPi5woDma8vFGeHPMyz+SacIz5hLb
	 Rf+GptszkFt2GSfJlcWK8VFPEwN8wo1u+/3KiOZBSjS2dItX1ctfso0i/sm2Za2DNE
	 0nbHhJVoydbs7iJIEmgCcr3LTmUazivyLOJskPV8JWYBPNiULpb44YkjNVbbnks04D
	 XBDuRsO+bAMFQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: clock: qcom,sc7280-lpasscorecc: order properties to match convention
Date: Tue, 17 Dec 2024 10:38:52 -0600
Message-ID: <173445353299.470882.2185588952896722099.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20240817094605.27185-1-krzysztof.kozlowski@linaro.org>
References: <20240817094605.27185-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 17 Aug 2024 11:46:04 +0200, Krzysztof Kozlowski wrote:
> By convention we expect first "compatible", then "reg" and then rest.
> Order properties to match convention and what is in "required:" block.
> 
> 

Applied, thanks!

[1/2] dt-bindings: clock: qcom,sc7280-lpasscorecc: order properties to match convention
      commit: 2a5711c7dc6f20e132f99b13731952bdb3530acf
[2/2] dt-bindings: clock: qcom,sc7280-lpasscorecc: add top-level constraints
      commit: 9d40c5a698de6ba629f2abc8dd43b8a2db469307

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

