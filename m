Return-Path: <linux-arm-msm+bounces-5115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED738160F2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 18:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 034131F2108E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 17:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A61F4E1D5;
	Sun, 17 Dec 2023 17:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jAaU5vRi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BBA4F600;
	Sun, 17 Dec 2023 17:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF25C433D9;
	Sun, 17 Dec 2023 17:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702833719;
	bh=QrJBcgZnHzXZAUrr/DhpijjExx60OBDfjNzCVzZAvBA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jAaU5vRikzNywGQ/z81MYErJKCyLWdsizgIwPgch7Pyg2XmLaRgRVCbxlRIBXQyB7
	 5bQJDHX3BwDt7SSic4aLgot2W5r70DRgwauHVI1mU5ZlzxMrOm87ZFaOi71j5g/ppx
	 bCe+4FRHjT64Ar5COCNq5iMsRohwFIYj3xgZ4/d76QAB92g2OcBQWTrD+7yGWKvvub
	 Dtc9N53Q6qkuPxk7/ZgIEZ9YitRKJ9Lqd0dRr2bWaxpSCqck0EX7Z6qzshGO7YQFRa
	 cfoxYayW/znGIAxQM0gR6UAz4OFW9vbHntK5V1+qWzP470IC+Z/zpJz6iK0ngYmlf5
	 I5x2vXH/AigMQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/3] dt-bindings: mmc: sdhci-msm: document dedicated IPQ4019 and IPQ8074
Date: Sun, 17 Dec 2023 11:21:13 -0600
Message-ID: <170283349422.66089.12399775138508622170.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211085830.25380-1-krzysztof.kozlowski@linaro.org>
References: <20231211085830.25380-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Dec 2023 09:58:28 +0100, Krzysztof Kozlowski wrote:
> Add dedicated compatibles for the Qualcomm IPQ4019 and IPQ8074 SoCs,
> because usage of generic qcom,sdhci-msm-v4 compatible alone is
> deprecated.
> 
> 

Applied, thanks!

[2/3] ARM: dts: qcom: ipq4019: add dedicated SDHCI compatible
      commit: 7514b28f7a016845a6b912783c4c7f4caf37788a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

