Return-Path: <linux-arm-msm+bounces-3108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5584C8020F7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 05:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87C501C208F1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 04:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA6A3D6C;
	Sun,  3 Dec 2023 04:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9Uuz6pb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398F88F48;
	Sun,  3 Dec 2023 04:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130FEC433AB;
	Sun,  3 Dec 2023 04:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701579130;
	bh=YeuRHBoPNkVCSPmwTY3GoodEH4nWjPlyCrxZ54RUWYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m9Uuz6pbGx11AvtiMJ4etSscKGbgihUgEEV3+UHNl3bp/VgPl8B+NO1t2xzo3rgEZ
	 U7hmQhb4QZREGGcc0vPGOlZ6Y6eLuSJxpJHu1mQm2lyq9kGaGRuyF5iQbURpAsNhO0
	 I8nf38lV1BZotOFB1+s86bGNOJXpfQ9EP6PcTSC3QkG+x/h16Lu9DIMcLLFoUxqrVP
	 PhlLDGKJw35bLbOnPciW7mLHTwHLcnI2J1XyHA5EGBtYSV+Wo6r/Dqg45cJ3ZGgXYq
	 aFjVFwlFWI81d35Lvcht6Sd0NLVVXMUAHzCQAmiTut7oodWJEiW3X/XsvdXXnx/Vzn
	 Mi3L4RUHJsLbw==
From: Bjorn Andersson <andersson@kernel.org>
To: agross@kernel.org,
	konrad.dybcio@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Marko <robimarko@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v3 1/2] dt-bindings: clocks: qcom,gcc-ipq8074: allow QMP PCI PHY PIPE clocks
Date: Sat,  2 Dec 2023 20:54:55 -0800
Message-ID: <170157925810.1717511.14579487412126117705.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013164025.3541606-1-robimarko@gmail.com>
References: <20231013164025.3541606-1-robimarko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 13 Oct 2023 18:39:33 +0200, Robert Marko wrote:
> QMP PCI PHY PIPE clocks are inputs for the GCC clock controller.
> In order to describe this in DTS, allow passing them as the inputs to GCC.
> 
> This has a benefit that it avoids doing a global matching by name.
> 
> 

Applied, thanks!

[1/2] dt-bindings: clocks: qcom,gcc-ipq8074: allow QMP PCI PHY PIPE clocks
      commit: afc4f14be33c50f066392f1e9671473419ba7ded
[2/2] arm64: dts: qcom: ipq8074: pass QMP PCI PHY PIPE clocks to GCC
      commit: 591da388c344f934601548cb44f54eab012c6c94

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

