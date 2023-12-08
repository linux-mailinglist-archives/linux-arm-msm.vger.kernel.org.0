Return-Path: <linux-arm-msm+bounces-3819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F23528099B2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 636751F21316
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC505223;
	Fri,  8 Dec 2023 02:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+GyhKvC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2264C8B;
	Fri,  8 Dec 2023 02:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D8AC433AB;
	Fri,  8 Dec 2023 02:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004014;
	bh=mY4Mc6uwF0vHasw2kbyA/nmgIFXLTBWx3yvpd073w74=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=e+GyhKvCK2FU4wcc8owpUaopc+YJ5Hxl5OuN8axsGqLxWCedVUyQPOniIpd5HWBqf
	 YP/WspXw5L2Td364/B3ofHx45mSe50vyFkHem1DM40sD3o1pvmRwprSq6dg7cJoMkS
	 FXkVV9rwIO/1cuDYYReJIVKjpKAIdNz1ThyXpxvFVwFzYdcg7Kk96pUCOXfGTWv7Yz
	 UYe+8dFDJ4mSz/7snLJScOINEawliYnp/IDt6ubrAsMwghMBPKTBEcrpMVvQTnSGQB
	 quR04sc5m96xaZ+/ls+vC0ruOIyCk56F5fe7EqomTN7Y5FYe9WPtekjr+QXXdpNhh0
	 cG+XiIbCNuMvg==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc8180x: align APSS with bindings
Date: Thu,  7 Dec 2023 18:57:38 -0800
Message-ID: <170200426920.2871025.8560389508354811931.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231111204725.35707-1-krzysztof.kozlowski@linaro.org>
References: <20231111204725.35707-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 11 Nov 2023 21:47:25 +0100, Krzysztof Kozlowski wrote:
> SC8180x APSS Devicetree bindings expect qcom,sc8180x-apss-shared to use
> qcom,sdm845-apss-shared fallback:
> 
>   sc8180x-lenovo-flex-5g.dtb: mailbox@17c00000: compatible: 'oneOf' conditional failed, one must be fixed:
>     ['qcom,sc8180x-apss-shared'] is too short
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc8180x: align APSS with bindings
      commit: cdecce12d55cfd25b4b8755abc3c0b320e45d1d7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

