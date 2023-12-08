Return-Path: <linux-arm-msm+bounces-3986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6E280A626
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67BFC1F214C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09004225DF;
	Fri,  8 Dec 2023 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMtssf5E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57631F94C;
	Fri,  8 Dec 2023 14:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50CD1C43391;
	Fri,  8 Dec 2023 14:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047093;
	bh=ilm8bRNtzJLA54Zj2yn6UjdZz9VCFVwyXwI43qcyg7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oMtssf5Eex2g+o6RdbZl97u/QLg9hYcZQQn7Fpp5/7E4B+k98xgJdgoEYeQ9iWWLD
	 mycw+sHrqlFvwlGekAzcSfB/DP+tzLA3ZUeN+wRK04aVb4JzebQnuBmQolitptxdQp
	 CDZHMKojROPLJ1G/Wo3qddS/1zhF6B5sOeA9pRNfNmxRC4kCMe7ZZRguCjE3M5Wzuw
	 1ShEMet4EVft82/n01sm3UKIvMaE4m8TWcEMi1VrX7ERsvk5+gSh7aZi2Op6Mcx4no
	 RElfFkZxCBhcGJYKzw5t80302JdRsOiCQAX3I5oTFPznaSNMM49fF5lBBfjQsa/JVu
	 H3FA0L1Puazmg==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Vincent Knecht <vincent.knecht@mailoo.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: clock: qcom,gcc-msm8939: Add CSI2 related clocks
Date: Fri,  8 Dec 2023 06:55:39 -0800
Message-ID: <170204733614.342318.15697921791345644925.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029061948.505883-1-vincent.knecht@mailoo.org>
References: <20231029061948.505883-1-vincent.knecht@mailoo.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 29 Oct 2023 07:19:47 +0100, Vincent Knecht wrote:
> When adding in the indexes for this clock-controller we missed
> GCC_CAMSS_CSI2_AHB_CLK, GCC_CAMSS_CSI2_CLK, GCC_CAMSS_CSI2PHY_CLK,
> GCC_CAMSS_CSI2PIX_CLK and GCC_CAMSS_CSI2RDI_CLK.
> 
> Add them in now.
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: qcom,gcc-msm8939: Add CSI2 related clocks
      commit: 3f373de6da2c960f0630a63890dded7d53358e2a
[2/2] clk: qcom: gcc-msm8939: Add missing CSI2 related clocks
      commit: 8f799d304c313f6628c4b21cd0227ac56b581944

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

