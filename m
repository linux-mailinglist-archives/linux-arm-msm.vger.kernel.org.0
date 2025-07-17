Return-Path: <linux-arm-msm+bounces-65505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B369EB09124
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 17:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0224A46484
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 15:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8F82FEE33;
	Thu, 17 Jul 2025 15:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+WVgK1Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23362FE374;
	Thu, 17 Jul 2025 15:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752767762; cv=none; b=TmyKCF/6wjmlQxjA+ys5Ih7DbGCGPyykCwKnRqlTfYdTr5CL5Sjf88s3Pr78LyvEn3lIh0sRKBeTXO6oN4fLKciCz6VvFiRDQumWxuq3julFe8ECUbWgX7+6YNnEAz0ZXDt8ER/74z5LXAQPKXOfEK67yScXr0MvH0wPyDmRE1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752767762; c=relaxed/simple;
	bh=haPR3gFkU31ZIdETf/9gMJWywdFLOCeSJukaQQMsCzo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=S3heDF/9x/ghtupstSXky2sNwC7sIC85FaXVRCHky3CXrWkLNFtLz9TmhgE+z1I1jDb+zkfr1RXFED2L2wGGQ7at2fKLReMRyTuzdH7ZgKIjbkiH8GrUOqu7LfFHKlUqBZk7PWKJPy50jf5UkKDbkhQzHM+73M/Nhz6luutSi5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+WVgK1Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F500C4CEE3;
	Thu, 17 Jul 2025 15:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752767762;
	bh=haPR3gFkU31ZIdETf/9gMJWywdFLOCeSJukaQQMsCzo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=g+WVgK1Zo0qJ1xmmgVWIuv579y7wMkl5XJGHt3dx/FqI69J0yr8eEAw65qPBLNfmk
	 xe4EVdTUm1Rd03i9l5EBXouLHsMt220T7jiiyu/SK0TP2F6fX2PQHoz3A7YjJsWbQm
	 XyrysiH8URbJrW7M6vwGoLyUjOSzBhkrPuZi7lbUzc01jJkR38Y3ImaSdZ5ZIh76Yu
	 giXl3mw3wcJ6pIWi577GMer/R8QtlCL3UdtSKS2cBxuFnjGJzHFqle/sQ7h7mJfSkT
	 Nt1T6ZCgvOWFRxCZ1n74D0Yv89V7ShYZfy7Bjcp0P/c4Xo4eANyPkG6Y0bGu78jSO2
	 yXrf9SoumGn7g==
Date: Thu, 17 Jul 2025 10:56:01 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>
To: Violet <violet@atl.tools>
In-Reply-To: <20250716231710.99983-1-violet@atl.tools>
References: <20250716231710.99983-1-violet@atl.tools>
Message-Id: <175276729714.3490929.8274727016823655876.robh@kernel.org>
Subject: Re: [PATCH v6 0/2] arm64: dts: qcom: add initial support for
 Samsung Galaxy S22


On Wed, 16 Jul 2025 23:17:08 +0000, Violet wrote:
> Changes in v6:
> - Remove debug features (bootargs, etc) that slipped in the v5 DTS
> - Format and organize nodes correctly based on existing DTS,
>  move "status = "okay";" to the bottom always
> - Solve "ddr_device_type" and "qcom,rmtfs-mem" warnings, the rest are
>  from existing SoC .dtsi
> - Disable buttons, ufs and other features for later revision
> 
> Signed-off-by: Violet <violet@atl.tools>
> 
> Violet (2):
>   dt-bindings: arm: qcom: document r0q board binding
>   arm64: dts: qcom: add initial support for Samsung Galaxy S22
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   1 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 145 ++++++++++++++++++
>  3 files changed, 147 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> 
> --
> 2.50.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: failed to guess base

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250716231710.99983-1-violet@atl.tools:

arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): power-domains: [[98, 6]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): required-opps: [[55]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#






