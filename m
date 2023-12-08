Return-Path: <linux-arm-msm+bounces-3820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8841F8099B3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 766D91C20CB3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41591442D;
	Fri,  8 Dec 2023 02:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ju0QhnKb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214471FCA;
	Fri,  8 Dec 2023 02:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F4EC433CD;
	Fri,  8 Dec 2023 02:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004015;
	bh=nM8BSXEj29maitOiRsn/Int4RvFo7oixuKmT5mrbqIc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ju0QhnKbBXXqMvEIDZNypjszSBKtKVBqwYQMuE5vqPYP5Hae7GmS+2sxVhZcdzTqb
	 p4Kdn/IV1DiLd7bv0/6XmUXF3B63XnFrDcsf6Zp/XgqpR9aHvC/C2QoBj932l5vvIV
	 95WtMCuaerCU+4PT3sSYX+3Z9bHn3ucaroAUDixvOYm3TsLaTOJDXz2j8lWagF7Z5j
	 yaQH+fOUbPxwtkAfklIwoO+gjNbHLMRFl47zCsSPdoUVBV2XfygXkQSoS4qGKUS0KG
	 aksYbNKew06FI6EtjUVXlxYlHrAYhCMYsG3cYvpLOssaN3nC1qK5nB39OOot+nvhoO
	 FuNrCyqoHbg8A==
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
Subject: Re: [PATCH] arm64: dts: qcom: sc8180x: drop duplicated PCI iommus property
Date: Thu,  7 Dec 2023 18:57:39 -0800
Message-ID: <170200426902.2871025.4888269570677484292.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231112184430.3495-1-krzysztof.kozlowski@linaro.org>
References: <20231112184430.3495-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 12 Nov 2023 19:44:30 +0100, Krzysztof Kozlowski wrote:
> The IOMMUs for PCI controller on SC8180x are defined in iommu-map, so
> drop duplicared iommus:
> 
>   sc8180x-lenovo-flex-5g.dtb: pci@1c08000: Unevaluated properties are not allowed ('iommus' was unexpected)
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc8180x: drop duplicated PCI iommus property
      commit: 2c21e5a84524381977b4744e906fb31862ac5809

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

