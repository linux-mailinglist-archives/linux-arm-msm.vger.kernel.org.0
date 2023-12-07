Return-Path: <linux-arm-msm+bounces-3760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E50CC808E1C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 18:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85AC2B20DD0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 17:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA31481D6;
	Thu,  7 Dec 2023 17:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUXL88G2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1A8481D2;
	Thu,  7 Dec 2023 17:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0221C433CB;
	Thu,  7 Dec 2023 17:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701968544;
	bh=Fb3OEJrH9btLg9K1FmUX1cmvE3pr36zNrQMZ9E7ShWA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SUXL88G2c/Hr8KQtofUGU+sEfTDuCefgTxtVpsw3sxg7UMDVFje98c8wewAHxL/rM
	 XaKam7ipwURuIuhShSovT85YC04IHDxnCP+Z4w6Ul+WmiR8nNJf/3lPDaG8ysRFaTY
	 XfjfPlTMET2MT4XokKp+MgpEfMoQXMLs6H2EWglGLJZXpnkIkitkP+1mOR6+NM2DCm
	 Ju1BxETuX8y6xgiMPgWAhGiL9z8e+p6lDJ2eXDv4cFonnDoREdMDqQniScuwMG+AZh
	 ekoDzo3xG9bgTD8BA/eSL26MMJqX6RXYgJcw0PJ3EbykKR0MB9l8pSipBqvv44Q92E
	 PrmXlTKszeQDg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20231206111754.7410-1-johan+linaro@kernel.org>
References: <20231206111754.7410-1-johan+linaro@kernel.org>
Subject: Re: [PATCH v3 0/4] dt-bindings: mfd: fix up PMIC examples
Message-Id: <170196854169.143088.10044379957904828667.b4-ty@kernel.org>
Date: Thu, 07 Dec 2023 17:02:21 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Wed, 06 Dec 2023 12:17:50 +0100, Johan Hovold wrote:
> When reviewing the various SPMI PMIC bindings, I noticed that several
> examples were incorrect and misleading and could also use some cleanup.
> 
> This series addresses the mfd ones along with some related issues.
> 
> [ The PM8008 actually sits on an i2c bus but it is related to the other
>   Qualcomm SPMI PMICs. ]
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: mfd: hisilicon,hi6421-spmi-pmic: fix up binding reference
      commit: e23f1530eab97e8d9dfbbdd9af3802c9c1e026a4
[2/4] dt-bindings: mfd: hisilicon,hi6421-spmi-pmic: fix regulator binding
      commit: d5c005ff9fe33dc7c2c3e13d1bdca698f441ac86
[3/4] dt-bindings: mfd: hisilicon,hi6421-spmi-pmic: clean up example
      commit: 1aa77a7ed020721c6c4a3da16ea3a970f2ce4eea
[4/4] dt-bindings: mfd: pm8008: clean up example node names
      commit: 7bb6a356ed6392c5e78e3d668055090970c1f9da

--
Lee Jones [李琼斯]


