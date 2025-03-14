Return-Path: <linux-arm-msm+bounces-51416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CEEA61360
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 15:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 523FC19C1E8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 14:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853BC1FFC72;
	Fri, 14 Mar 2025 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1I1ZoXS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBF11FFC4B;
	Fri, 14 Mar 2025 14:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741961481; cv=none; b=GwFTZMgfvdoXoAANJ1NZExOZx20UN9W9pLidvj6OD71Ri8URTtbFsKP/zZZITgzhG3IYK3R4o18wxPxt50b87WcQCuy+olWCH+o7wZjNLQMtEso8yeCoXF4tQbyQ8l5xayGEIwSu5e3lu8myrugb1PrJlfs6KI8xMoCuQTL8GZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741961481; c=relaxed/simple;
	bh=bz59DFEQD327qDVN2cGR9TZ8G4JDN8ygzzmv/amSG0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uojhKZEjufdpDZmQKvS/axLElllMi7tyN3iPBJHeG4eXzwsVHSIDbnRFGOhKu/TVCR2xV2WNvNmXDSzleV38RLx7YOk6u2JjUZ+XeVgcBPa3PnvTp1EQ7zt0FwKAJSNGLa4EicMP14gq6dC5tylSPwB0jYfhFAbYLPlwVGCmQZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1I1ZoXS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4257C4CEE3;
	Fri, 14 Mar 2025 14:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741961480;
	bh=bz59DFEQD327qDVN2cGR9TZ8G4JDN8ygzzmv/amSG0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A1I1ZoXSJZ/HoftzzNT7OwBrH2CZeWDU9huoWJmrzzf7zdfoY+UfixwevwXk5EgWg
	 WzfLVYyh2wLc3dF/HWUWkuQEtaxuBP/oV9ee23E7IrNzeEhimQRcQxoqDfYXMT+Ssd
	 DItuWLpkKDDOtLZ6eEryBen58FZh2V4lPOqtkvbNGGB0KwAhmX+6op/A/iRo4Zc2lJ
	 YBjKeOqjVrFtW9G6EBxGCSzAploj7M1fHA3R6smKZ5664rLNgomd489DqEoIf/5DnU
	 fiHArSxJ7stzvdjAoc0oUcAQ18X6FavZ15p8iiKICBrtGSfqyWfPKvVt1hqlZE5cI2
	 zSFassawFghVg==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RFC v2 1/2] dt-bindings: remoteproc: Add SM8750 MPSS
Date: Fri, 14 Mar 2025 07:17:10 -0700
Message-ID: <174196182746.401258.18204547306747015679.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221160300.160404-1-krzysztof.kozlowski@linaro.org>
References: <20250221160300.160404-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 21 Feb 2025 17:02:59 +0100, Krzysztof Kozlowski wrote:
> Add remote processor PAS loader for SM8750 MPSS (modem).  Device looks
> fully compatible with SM8650, however it lacks fifth memory region for
> Qlink Logging, according to downstream sources.  This is a bit tricky,
> because updated downstream sources for newer downstream release dropped
> that fifth memory region as well.
> 
> There might be other differences against SM8650, because the modem
> currently crashes after starting.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: remoteproc: Add SM8750 MPSS
      commit: 89f95f2108de52431bbf0ca432e337fc1f40ee00
[2/2] remoteproc: qcom: pas: Add SM8750 MPSS
      commit: 6174206a4b5bebc0b4e01a684672e2bf79df38d8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

