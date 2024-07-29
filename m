Return-Path: <linux-arm-msm+bounces-27184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0250D93EC58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 06:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEA1B2819A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 04:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF93614373E;
	Mon, 29 Jul 2024 03:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUXx0giR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C98143737;
	Mon, 29 Jul 2024 03:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225543; cv=none; b=P6M51PX6cudJ4jgj7ha8nWH/Ehj3yR3BdMnRVC1YtxIpaimyHyKKjK6hO+XKuMuVSF6nxc1kXQ1gand+JAUvf7+NvEP9tIr8Dg6wAbYqDRMVsBAPpgwbsN/pTFhejpe6ELA8ZLrwvvgx2JNGrAon8c7I1A/E7gPyZeQAHSG4pNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225543; c=relaxed/simple;
	bh=d7mQ9oAbEN3Huq+8SSbGBTmEpr4TMrj4uYmbvA2I2No=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Phxr/pLHt73Jn8GXy0QXpxukX5TMhWrZikqZEggzQ8xOiQaMBvrIhEtm9PgAhGtfFzj8VQP7EvLVHHjKBFa7Z0eDeBamuFKez5WcF8FMCdJ0tIA4rhKmh0wECBnFHVkgYXK7McnxAS73ImLVWWt5qOSWJcMlaS4miHg5LtGhVt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUXx0giR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8061FC32786;
	Mon, 29 Jul 2024 03:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225543;
	bh=d7mQ9oAbEN3Huq+8SSbGBTmEpr4TMrj4uYmbvA2I2No=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UUXx0giR2NKmXZcAGMaGV+JfmT1OBUWf0uXDGKj5a/FR4wWPvEq9Bie/J0x8SDxge
	 mhLKpuF+DkeOh0wALXAIl88NOgZgk4X1c+2MU686EznsJkInF+h1yMbL8efKVuVOZO
	 Y5eNgNOIafn1kK0SLtQDcYn7CEKua1C1j4uWE3Pm3OzB15PyeaocPFTxDiKv1Z636b
	 527iudfGo3aSEHK4Y2/PdkwtF5UM1/uUiF172GFR837OfqIWpqV5P0J3FPSuyUtOoW
	 /op36JS8Q4FZ8+ljEkbzYxIAjyEArqLqBbmWQL1bKJ+F0ww2IkVG1+kjZTtmx5wqH8
	 Or+jM8BV/jpGQ==
From: Bjorn Andersson <andersson@kernel.org>
To: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: (subset) [PATCH 0/2] Convert Qualcomm SATA PHY bindings to dtschema
Date: Sun, 28 Jul 2024 22:58:28 -0500
Message-ID: <172222551307.175430.11891440918185574607.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715130854.53501-1-rayyan.ansari@linaro.org>
References: <20240715130854.53501-1-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 15 Jul 2024 14:01:05 +0100, Rayyan Ansari wrote:
> The following patches:
> - Convert the old apq8064 and ipq806x text bindings, to a new unified
>   qcom,sata-phy binding in yaml.
> - Remove reg-names from the SATA PHY node in apq8064.dtsi to conform to
>   the bindings
> 
> Thanks,
> Rayyan
> 
> [...]

Applied, thanks!

[2/2] ARM: dts: qcom: apq8064: drop reg-names on sata-phy node
      commit: 89721c0e5bf14e06dea2b42ab5efdff4bf035f83

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

