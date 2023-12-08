Return-Path: <linux-arm-msm+bounces-3810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF10D80999A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0CE41F2111F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6632119;
	Fri,  8 Dec 2023 02:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LzowJ7ns"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC6E20E6;
	Fri,  8 Dec 2023 02:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10DFCC433CC;
	Fri,  8 Dec 2023 02:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004005;
	bh=p/RCldjZZRW/Un9LSiHaH+jm6ogwI4wQ8fFrT2ZAQiA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LzowJ7nssvV1gX/vye/WmHpllsRbULq2fRH7pkGhuO8l4g0oawCEqQUk1TzkdtrQX
	 Q4mTQfFzOKox3M1Jjhu3jgxLB6WGlfAyEdV+VhlvGd5tPdYzCCWza752yMaNowvZoo
	 QE1gA+G0soE/X814jL2hJTTUKuJPvZcHZDF2hCY2XL4vp7NZKcHmQLWn+ehHOS3poS
	 xURjlYBZ73K6+HFrKQrAyRt7rqJo6+v9qhHbnFEF0goXyL5tbF1N2s34u6EOG/rP8x
	 kM/pZUWdzf6CnBVGJWJn+pVt9qhUWk4lezIxhYYY7A5vFZ4LVxSJk5CpHiyULU8pHo
	 DvSUsJjxZ0Eug==
From: Bjorn Andersson <andersson@kernel.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	konrad.dybcio@linaro.org,
	agross@kernel.org,
	Alex Elder <elder@linaro.org>
Cc: mka@chromium.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: enable IPA on sm8550
Date: Thu,  7 Dec 2023 18:57:29 -0800
Message-ID: <170200426936.2871025.13229395698754842042.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231124181718.915208-1-elder@linaro.org>
References: <20231124181718.915208-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 24 Nov 2023 12:17:16 -0600, Alex Elder wrote:
> Add the basic DTS information for supporting IPA on the Qualcomm
> SM8550 SoC.  Enable IPA on the SM8550 QRD platform; GSI firmware is
> loaded by the AP in this case.
> 
> 					-Alex
> 
> Alex Elder (2):
>   arm64: dts: qcom: sm8550: add IPA information
>   arm64: dts: qcom: sm8550-qrd: enable IPA
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sm8550: add IPA information
      commit: 32c5a8b93ba543e3cc596b0272b5ed7fac82278c
[2/2] arm64: dts: qcom: sm8550-qrd: enable IPA
      commit: 33eae059ccaf71f6243dd919add405dfefd275e7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

