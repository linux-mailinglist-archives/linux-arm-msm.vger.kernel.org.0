Return-Path: <linux-arm-msm+bounces-78944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 769D0C0E428
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 835D819A2CD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E0130FC1C;
	Mon, 27 Oct 2025 14:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="taT0NdEV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D09730FC10;
	Mon, 27 Oct 2025 14:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761574004; cv=none; b=VIzfRGn6OxdQdbiOwet2TeiwJ6tLtnnGKwTeWFb2nTSG017tQ9gsb2NHP/SQVoTjVHfgZ/xn9mNuTk1U0gxtUBXmnwEwS+AHLeuxvvnyXuy2Ez+LZrgVNc8P5MyQqBB3paxbTGRJQ+HYD3AhoETGcWWfilcTJzl8Nsuq/5ySZJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761574004; c=relaxed/simple;
	bh=q3mF9oWR3jhAbDXElJ4Pet5ssupqe0ig9HDSBwHmRxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pKsVRUVal84G1CecQGPqUYyO1E9tP5Vg8hvHnJrqeOlibtI6IICIaonk+3AH6X664iWPYzcH33LlTs3hnwHRa4j1qj0kiFeH0h+iEzr+wm048txP00tgcIuTp9wj6cNRh8sMLbBDMhmh9oem+Gjg2dZAJAwWGkD7271Gmb6gDjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=taT0NdEV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8728BC4CEFF;
	Mon, 27 Oct 2025 14:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761574004;
	bh=q3mF9oWR3jhAbDXElJ4Pet5ssupqe0ig9HDSBwHmRxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=taT0NdEVcNoZWap1WHEvpFKBeOf93WDzd6EszLavY6txGX4us1GMBZeArp+rn2iWD
	 IoBs6sP1XVuA4UaNSw9h9fLmqgIdZnRoAawazJvQFhSCVW8YupDdxOCPnI40uiw5cq
	 DPUe1VVJn0hpBCycaqNmT7aLgwPLWbWgh5NxKdtTLj7L6fEOa0frPKdPDD2yv7jWhK
	 tEr3s/hKOqyk/wZggybvPq8AVqw+4RYKtpocn+t/YOJG0+o8mXcFB7/kGsRVGn+psI
	 swTKhN+oxTmzP6nXCPBLrAB+DVLJEyIa5teptMmZb0AAHMetOIVrbX8oNJLO3wa2LY
	 jFvZ37uF+GEbA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/6] clk: qcom: camcc: Specify Titan GDSC power domain as a parent to other ones
Date: Mon, 27 Oct 2025 09:09:17 -0500
Message-ID: <176157405436.8818.13044441922895744631.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021234450.2271279-1-vladimir.zapolskiy@linaro.org>
References: <20251021234450.2271279-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 22 Oct 2025 02:44:44 +0300, Vladimir Zapolskiy wrote:
> When a consumer turns on/off a power domain dependent on another power
> domain in hardware, the parent power domain shall be turned on/off by
> the power domain provider as well, and to get it the power domain hardware
> hierarchy shall be described in the CAMCC driver.
> 
> Establish the power domain hierarchy with a Titan GDSC set as a parent of
> other GDSC power domains provided by the SDM845 camera clock controller.
> 
> [...]

Applied, thanks!

[1/6] clk: qcom: camcc-sm8550: Specify Titan GDSC power domain as a parent to other
      commit: d8f1121ebf4036884fc9ab1968f606523dd1c1fe
[2/6] clk: qcom: camcc-sm6350: Specify Titan GDSC power domain as a parent to other
      commit: a76ce61d7225934b0a52c8172a8cd944002a8c6f
[3/6] clk: qcom: camcc-sdm845: Specify Titan GDSC power domain as a parent to other
      commit: ee2867ca99e2b5b6788ff421f7e784d9a0da426f
[4/6] clk: qcom: camcc-sm7150: Specify Titan GDSC power domain as a parent to IPEx and BPS
      commit: 37cf953a120a69114b810eee74530a8836d9a781
[5/6] clk: qcom: camcc-sm8250: Specify Titan GDSC power domain as a parent to IPE/BPS/SBI
      commit: fc3985b21f86db33e4ec8a820d211e4e505c9048
[6/6] clk: qcom: camcc-sm8450: Specify Titan GDSC power domain as a parent to IPE/BPS/SBI
      commit: 70dc5425fe1af90901d8109941e09005de38b7ea

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

