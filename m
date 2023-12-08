Return-Path: <linux-arm-msm+bounces-3985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDB580A623
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC4E01F214C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63F720334;
	Fri,  8 Dec 2023 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dktVDCMf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8797D1E538;
	Fri,  8 Dec 2023 14:51:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28037C433CB;
	Fri,  8 Dec 2023 14:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047092;
	bh=WSC2VtdO9KzSokLGWLoAzT6Jt1aCubjY6IGmC9Hagic=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dktVDCMfWE3iKPQHYCSVxVCYIGOjLmFb5WbLuaS30+Rimsm0U1A0jFaS91eSgYodZ
	 SU6Y2oe1DfzD4X0w+eHuvqsiZ/5AfV3vy2kMHiX2H+tBiVHxcbVst+cSRx7Gozyi11
	 WmJFVQIknjgxufhVqqCV6wyAWn5Zwa72KGiuC8hEk82QFWL87dXJNjzgmRXFoesTPG
	 kT2bzjf5/enBxgRYky25aIoswOWTSV7U5bvEheSAvw+UwbMFtXwIeilyFEi4gyAEjq
	 TgZn4hLHgEwEr4lPFiZ/cgvKpcK1ZtuUwfBUykV7mpbYhktOLWawWNfzYINoDKcL8Z
	 x58tP7JQ0+W/Q==
From: Bjorn Andersson <andersson@kernel.org>
To: agross@kernel.org,
	konrad.dybcio@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	quic_tdas@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Marko <robimarko@gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: qcom,gcc-ipq6018: split to separate schema
Date: Fri,  8 Dec 2023 06:55:38 -0800
Message-ID: <170204733612.342318.7630099958511658964.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231026101931.695497-1-robimarko@gmail.com>
References: <20231026101931.695497-1-robimarko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 26 Oct 2023 12:18:37 +0200, Robert Marko wrote:
> The Qualcomm IPQ6018 GCC clock controller has clock inputs, thus existing
> gcc-other.yaml was not describing it fully so move it to a separate schema.
> 
> Fully document the allowed and required XO and sleep clock inputs, as well
> as update the provided example.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: clock: qcom,gcc-ipq6018: split to separate schema
      commit: cec1f2ffcc065568fea9718921698576c6d1c62d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

