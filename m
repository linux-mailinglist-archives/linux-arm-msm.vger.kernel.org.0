Return-Path: <linux-arm-msm+bounces-61055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95326AD6690
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 06:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 207483A0320
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 04:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B25422FF4C;
	Thu, 12 Jun 2025 04:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eP4PZ7A4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711B222FF22;
	Thu, 12 Jun 2025 04:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700869; cv=none; b=SANQkIJs0plT9DvsU+gE4NYYkwOI76NEh75PjUdgIVDJb/Il4itp9edHZ9EislNX7n90BMyc7hlFtCDM2RzEzUrr0Rc2yj7nX6S0odmCXJe0xOvZe8d1hflctC7vLEkauILblaPoDrjL1nT/QUuiOQn/ck3zX4wi6sfS2XdnmPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700869; c=relaxed/simple;
	bh=lK3F2U08cM5K0wGYo6Lrv/2f7+6v78yxpenj7mfrh+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gqhiodFJMN2QKf1EckD60DYDBWv+TQzlGtp82ZXJBnwdYkZUj2hC3A/c0Xt/R78As1NMPBfvhIKSdRpY1saUycVK9XKvEfCD8b4nA4LUuEEXiHA9hDXUPoTagoTVkl3/jia6z+8+I3/f+0n/BH6tmXzL9adj26sX7yE/FXEfu3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eP4PZ7A4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C676C4CEEB;
	Thu, 12 Jun 2025 04:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749700869;
	bh=lK3F2U08cM5K0wGYo6Lrv/2f7+6v78yxpenj7mfrh+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eP4PZ7A4QUCWP781SqjAEBILMbKLuXoVatT6nNPpHTViohwPHd56/N7wG2pcQXlnJ
	 pYJlUtjtXFueBmK/TrW/xZgYMAWPUUIdAM3lvNw5hp97mQ5fNNxKbicu0raTwRrs/1
	 cKD6iRjhYdxL4ttngxROGRjz1p3F3Yziwhv42b3+/8dmidvXfdbyFme+juu8jlVaNA
	 6wk9+tt3BqiO8nXv2sTfhMURWosrIWY2GCkhAfukhpX2+8eVDIaHgwnNvgbUfUpDQM
	 j+9P3Wmi7vMSOUkQwEW6EwBkTCoQHijOVDZCQO0slMdBhfkHQZkdHqPlqZxoZb9F9G
	 m8iGgsakr09sw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Renjiang Han <quic_renjiang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taniya Das <quic_tdas@quicinc.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for video GDSC's
Date: Wed, 11 Jun 2025 23:00:48 -0500
Message-ID: <174970084198.547582.2565577174623601483.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530-switch_gdsc_mode-v5-1-657c56313351@quicinc.com>
References: <20250530-switch_gdsc_mode-v5-1-657c56313351@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 30 May 2025 16:01:59 +0530, Renjiang Han wrote:
> The video driver will be using the newly introduced
> dev_pm_genpd_set_hwmode() API to switch the video GDSC to HW and SW
> control modes at runtime.
> Hence use HW_CTRL_TRIGGER flag instead of HW_CTRL for video GDSC's for
> Qualcomm SoC SC7180, SDM845, SM7150, SM8150 and SM8450.
> 
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for video GDSC's
      commit: 9ed3eccdfd1fb4c8f164aab3cdfc749ccaf58aed

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

