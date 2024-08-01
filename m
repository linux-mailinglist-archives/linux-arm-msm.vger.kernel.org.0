Return-Path: <linux-arm-msm+bounces-27648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6129441AC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 05:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AA14B235C2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 03:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C053B143727;
	Thu,  1 Aug 2024 03:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHNmvvkP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9178814265C;
	Thu,  1 Aug 2024 03:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722482397; cv=none; b=HGLzftAnBpgEh9FO7FEP0VEWhYQCT0pPGnvLwfRwJ55beja3PCNICsvP/43eRt7rZmlZn/E8P7a8KK14eWs0g54IL2H38t3gNbTfBHYvR6L4LsFpt03m8Zq1tWQwq11eyRTjhWHpqL+k9d5iMoUhsZ63p1LZu4PsrSihgGuSRIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722482397; c=relaxed/simple;
	bh=jBGCi2K0Zk3P/o0nSkNiteWFwg/e1ZpKXXHW5soEX7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GuHcH47LDAz2g7rMoZreiILQOMI/feKYUxNz6Cq5nV5JQT7XA2b3xjHOx23b28/c9hMGKkMybWevFGLVlgtT2+P1XYWncJHyQk99xg0hpnJXFsRFl+hZT37KUC+DvqZKHuhRDDFI/fK+UUprmpCVZskfiK/3zwOlhRpzQrRGqes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHNmvvkP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FBB5C4AF09;
	Thu,  1 Aug 2024 03:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722482397;
	bh=jBGCi2K0Zk3P/o0nSkNiteWFwg/e1ZpKXXHW5soEX7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RHNmvvkP5Ior2TiCEPKNaIEnQXuysvqGBi8IFM71CaEqoXuPbYHFUrd3Fsj5DXUm6
	 d2F4CpYocsA1Mp3Rqy7tYy80ek2pTrIvyRamU6B2AQ+yCfDIWhvk/CIZF9fgcj7Fss
	 prmOOx4NTaRFLRzHzXSQBuhXv/6XlS3l5Vj3U+lb1AJmsZyI4w05jgAFGI0QkxAxwG
	 Vm+ZQX512F6evl4g0rQpC9tGVTV+0V2r4ab9maM83cQvkkVfTOMtLpA7I9PKLly/Yu
	 /74y5wzj0dX4S3RROL3HBOFtYP86Ooyfd2ADYV+yINFbP1lYG7K2QE6IExZ9UqnnLp
	 C3fdLwIehmAlQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/7] clk: qcom: merge SM8550 and SM8650 display clock controller drivers
Date: Wed, 31 Jul 2024 22:19:41 -0500
Message-ID: <172248238602.319692.716272921962900816.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240717-dispcc-sm8550-fixes-v2-0-5c4a3128c40b@linaro.org>
References: <20240717-dispcc-sm8550-fixes-v2-0-5c4a3128c40b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 17 Jul 2024 13:04:27 +0300, Dmitry Baryshkov wrote:
> The SM8550 and SM8650 platforms have nearly the same dispcc block and
> very similar drivers. Seeing fixes being applied to one of them, but not
> another one, merge two drivers into a single codepiece.
> 
> Depends:
> - https://lore.kernel.org/linux-arm-msm/20240716-topic-sm8650-upstream-fix-dispcc-v3-0-5bfd56c899da@linaro.org
>   (patches 1/3 and 3/3 only)
> 
> [...]

Applied, thanks!

[1/7] clk: qcom: dispcc-sm8550: fix several supposed typos
      commit: 7b6a4b907297b28727933493b9e0c95494504634
[2/7] clk: qcom: dispcc-sm8550: use rcg2_ops for mdss_dptx1_aux_clk_src
      commit: cb4c00698f2f27d99a69adcce659370ca286cf2a
[3/7] clk: qcom: dispcc-sm8550: make struct clk_init_data const
      commit: eb64ccacd0cd9343926424f63fec76e73eb815a7
[4/7] clk: qcom: dispcc-sm8650: Update the GDSC flags
      commit: 7de10ddbdb9d03651cff5fbdc8cf01837c698526
[5/7] clk: qcom: dispcc-sm8550: use rcg2_shared_ops for ESC RCGs
      commit: c8bee3ff6c9220092b646ff929f9c832c1adab6d
[6/7] clk: qcom: fold dispcc-sm8650 info dispcc-sm8550
      commit: 802b83205519e4253b873bef5c095b147cd69dad

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

