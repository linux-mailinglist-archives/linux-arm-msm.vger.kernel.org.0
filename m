Return-Path: <linux-arm-msm+bounces-23518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C895911B2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 372ED1F220E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 06:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C498116EBF6;
	Fri, 21 Jun 2024 06:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="biQBUHB4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A86316EBE8;
	Fri, 21 Jun 2024 06:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718950308; cv=none; b=gNmYDLOvUJaHBFrWLMXkRl0aYcpwL7Fhi+1swCWSUgmffDWpcq8FkZtI198ghCzsQjMfUK5F248m7lLOrF2b3QHRTm+VB0srlhfc+QNOCI74OIV6U2pP6JbrgxEwq0T4oDSfqzMqMx88dkmwtOVseXLmurckvdo82yV6OY39s3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718950308; c=relaxed/simple;
	bh=Rjeq2f6+/LU/dx94vTkY6FX6cQL8X5ChA6Y7UFLcU0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hcv8WnuMuXMMqMe7Iu8PZ3isUc915of0V3mk8ZHGmjpUDWJNRKSK5gT2lX+7EvnOIOBROfgonDB0e8Ghy7yJ4uXzT4iVSojRpmHiY/TT26RMD+XYpLdZ/heykCU3BmVU8GPrGpryHsxAQzlDy1Pi87V70h+FB7kPV1zL1VnxLi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=biQBUHB4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D737DC4AF09;
	Fri, 21 Jun 2024 06:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718950308;
	bh=Rjeq2f6+/LU/dx94vTkY6FX6cQL8X5ChA6Y7UFLcU0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=biQBUHB4De/RqAisRyrC8Mu9OHu8Bx0lYR09gBef5pFHVykrB1RiPkHBkqr2bl34W
	 OEVsafsDbPHhKmySY8z7TzTrcGistSmpeDu5j0I81b10uoCOX3OY/rGoIHVCCXM3fC
	 viMEJ3HD8+++1GcJZaRh9IluzuqEaXdvCNDmWUUan2vsplnukahERxXyEQwwAqYrzL
	 5iWUGMrNSel6JLMbypnD0P0QfCq+orLzRZxKZpLusLTbgQWYJT9RPObWw0IRB6ai+w
	 8PB0Dee3kVipo2UCZOH5CvIKOrn37rhGZCqVyVTKyDu4EiGspqg3cWiif3b/aeCXEB
	 900wSWK2M+8LQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	Tengfei Fan <quic_tengfan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH v10 0/4] arm64: dts: qcom: aim300: add AIM300 AIoT
Date: Fri, 21 Jun 2024 01:11:31 -0500
Message-ID: <171895028812.12506.17324795855835558511.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618072202.2516025-1-quic_tengfan@quicinc.com>
References: <20240618072202.2516025-1-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Jun 2024 15:21:58 +0800, Tengfei Fan wrote:
> Add AIM300 AIoT support along with usb, ufs, regulators, serial, PCIe,
> and PMIC functions.
> AIM300 Series is a highly optimized family of modules designed to
> support AIoT applications. It integrates QCS8550 SoC, UFS and PMIC
> chip etc.
> Here is a diagram of AIM300 AIoT Carrie Board and SoM
>  +--------------------------------------------------+
>  |             AIM300 AIOT Carrier Board            |
>  |                                                  |
>  |           +-----------------+                    |
>  |power----->| Fixed regulator |---------+          |
>  |           +-----------------+         |          |
>  |                                       |          |
>  |                                       v VPH_PWR  |
>  | +----------------------------------------------+ |
>  | |                          AIM300 SOM |        | |
>  | |                                     |VPH_PWR | |
>  | |                                     v        | |
>  | |   +-------+       +--------+     +------+    | |
>  | |   | UFS   |       | QCS8550|     |PMIC  |    | |
>  | |   +-------+       +--------+     +------+    | |
>  | |                                              | |
>  | +----------------------------------------------+ |
>  |                                                  |
>  |                    +----+          +------+      |
>  |                    |USB |          | UART |      |
>  |                    +----+          +------+      |
>  +--------------------------------------------------+
> The following functions have been verified:
>   - uart
>   - usb
>   - ufs
>   - PCIe
>   - PMIC
>   - display
>   - adsp
>   - cdsp
>   - tlmm
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: qcom: Document QCS8550 SoC and the AIM300 AIoT board
      commit: 6d97b93acf9d0b29d3eddf38186d9556e5360368
[2/4] arm64: dts: qcom: qcs8550: introduce qcs8550 dtsi
      commit: bb8a2dc3bd89628a7f4aac577894d47dd0f4db3c
[3/4] arm64: dts: qcom: add base AIM300 dtsi
      commit: 0b12da4e28d8f6ecb492c98313e325eff11b5bb8
[4/4] arm64: dts: qcom: aim300: add AIM300 AIoT
      commit: e7931a52c7b68fb5143e118778092a23cfc5b0fc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

