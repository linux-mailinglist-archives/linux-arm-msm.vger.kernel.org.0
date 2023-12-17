Return-Path: <linux-arm-msm+bounces-5129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FCE81611C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 18:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70ABA282460
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 17:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEE646BA8;
	Sun, 17 Dec 2023 17:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3Ws8Apl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0375AB98;
	Sun, 17 Dec 2023 17:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C72C433C8;
	Sun, 17 Dec 2023 17:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702833737;
	bh=2SnAOr69W/Z84ZOWAP07kivteDSsGVV1h13C5U8qC/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g3Ws8AplG0UcCmGSQ1RJCu7C/34gkDlPiaZDgaiR1aE2LWvuv5ErmOybKHPluQrWz
	 3LByxAo+x0r6rwOSrN6f/8Oj7Ft8vNbvswnYq2ID/s5okwmeXHSwO9PoaVaIt6F3BL
	 DRgtj6ntYH+PzYZXn1pABvvdG2EWvPT9pjmVgEfNL46KjrG9rxzfjRbmCJ54zLsDgW
	 KGTpAGYCtonExAhpU2FDkNTAA98cEv/hmsY3W2Cp3cuWiNIrTABsej4fKaDnjm74IG
	 xHYi6kfu1Kym9MRA5/fU05612BcXg2rdY5N6Zp5RjSfm+do5SkzDEwFUHshr7DmFkq
	 xH4rfLAIuX/KQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v3 0/4] Add runtime PM support for videocc on SM8150
Date: Sun, 17 Dec 2023 11:21:27 -0600
Message-ID: <170283349407.66089.16926824200074029025.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231201-videocc-8150-v3-0-56bec3a5e443@quicinc.com>
References: <20231201-videocc-8150-v3-0-56bec3a5e443@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 01 Dec 2023 15:20:23 +0530, Satya Priya Kakitapalli wrote:
> Add runtime support for videocc on SM8150 and update the resets
> and video_pll0_config configuration.
> 
> Changes since v2:
>  - Update pm_runtime_put to pm_runtime_put_sync
>  - Link to v2: https://lore.kernel.org/all/20231118123944.2202630-5-quic_skakitap@quicinc.com/
> 
> [...]

Applied, thanks!

[2/4] clk: qcom: videocc-sm8150: Update the videocc resets
      commit: 1fd9a939db24d2f66e48f8bca3e3654add3fa205
[3/4] clk: qcom: videocc-sm8150: Add missing PLL config property
      commit: 71f130c9193f613d497f7245365ed05ffdb0a401
[4/4] clk: qcom: videocc-sm8150: Add runtime PM support
      commit: f6bda45310ff165fdd69b8c3eb6679f0552f8a5f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

