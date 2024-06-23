Return-Path: <linux-arm-msm+bounces-23801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D98D5913E5B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 23:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77375B20E48
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 21:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2723187573;
	Sun, 23 Jun 2024 21:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGvTSP7+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94F8186E30;
	Sun, 23 Jun 2024 21:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719176548; cv=none; b=gXXVK0okuG1qh9OF5U8kG3sK5AliqNEOK2sYphBlHRhGikIhOV82xvVS1i+X2E9T2oPO0k3Y7sOdrYlCl132R/boD/CGTTRl9jbVyn1oaYFpfcKSz2Ek/wW8PiXNLDWyN60iAosrwMHe3PFqet2iCblf8r16Sz7qr59BC2Oxmx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719176548; c=relaxed/simple;
	bh=NXdkyD46wR535PZ6Mm4IhRprYdPLmjGLLdwdQZs+Cb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DDoxa4FTwOzIXJwX8Fj7PvNzDcrVu0u0EKdVyA5XQlYkapP4UbJwULWraCLAop35/woHEy634+6PcceWEKgoXOrbc4JJwje8ZUq2sqKvgr25b3BdanRhn7RNB/AcRZaB8OX95ntdMPnBSpl9NoDNq0uQYvpdOamSB3VIDaAioLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGvTSP7+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA67C4AF0A;
	Sun, 23 Jun 2024 21:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719176548;
	bh=NXdkyD46wR535PZ6Mm4IhRprYdPLmjGLLdwdQZs+Cb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bGvTSP7+kLc3eD/7XT5iT6MufefwE9QrY32IK7/d1DNC1QDacbNSVuaLWB6qCdo13
	 yNL376ydzj1/ujPMF4kgs5VpEJW2RU8qRAmbe+qzfVMY+mPTAwuXiqg4HzA+/rnGqu
	 Urtk/xfLkHWKjo/rb/zDfS4+ahcAoxJv7CoWQpDW5MPGNg1nRWGukvPrFN3FZMX0XJ
	 yP7hq5ot+Th33WDlEUy0YiA3EzdtZhBfkgTk8fM9AycCVtHavlt9qYj4+DnelFGkYJ
	 VVv2QN6/l+2iW/KUVEc10wBH/z7l9OTu78FnAwhMxTnuyT/HeQqiffLtEy3VbWa3DP
	 HxMUjSSOTsTrQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Robert Foss <rfoss@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>
Cc: quic_jkona@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gpucc-sm8350: Park RCG's clk source at XO during disable
Date: Sun, 23 Jun 2024 16:02:19 -0500
Message-ID: <171917653476.4580.18331742881214650946.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240621-sm8350-gpucc-fixes-v1-1-22db60c7c5d3@quicinc.com>
References: <20240621-sm8350-gpucc-fixes-v1-1-22db60c7c5d3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 21 Jun 2024 17:34:23 +0530, Taniya Das wrote:
> The RCG's clk src has to be parked at XO while disabling as per the
> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
> 
> 

Applied, thanks!

[1/1] clk: qcom: gpucc-sm8350: Park RCG's clk source at XO during disable
      commit: 313e2909023bef36ef7b6d1d9ff2d98febcaa28d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

