Return-Path: <linux-arm-msm+bounces-35516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF1F9ABCDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AC3F1F212EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 04:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82D6157E82;
	Wed, 23 Oct 2024 04:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJcsc+lw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFCF13D2B8;
	Wed, 23 Oct 2024 04:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729656989; cv=none; b=eU7O+3mT9dnifGLiiUCJvrHYIixMT2a+Gn1OnGNoMrKqEyTpi+67Gx0vIhXs2eM6ipQxx2murqCyHvkoAwc67IGD69h9tj9xdwF7iiFd8tvK4Pe/LtMNFBXrasWYq3Sf6Do2Ex+P623wSfsYbIDT1IZ3Zx9ZcvkWCcP22Ra+9+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729656989; c=relaxed/simple;
	bh=DBCxr4AMOxIAmdx/NsysO9kOwO1VZZNaAI64HHpxqqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AU2aWmwed271KsUwaaA2MLm2mVGHSAd0Shk/vKnpg14asmMaDbxPMDIvDQGfdOAlAWX4kiXy+sBUoJE6wzjVuvwuNGNu2NWICJK+qceZ91v5Amzf/KLIHuUKp5DRLVnR3nBV+1A5OQi0xVeqOqN9Y+ix6ldVeWSuIfSebRCcsY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJcsc+lw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1E6C4CEE7;
	Wed, 23 Oct 2024 04:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729656988;
	bh=DBCxr4AMOxIAmdx/NsysO9kOwO1VZZNaAI64HHpxqqs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IJcsc+lwMgt1OmrlrTQ/Ph6duM0iAclgNAicgCN+aqsTBRJIUBQKZK2LZPAIh1Mup
	 /3MDTXll0OkR79LNUSbCe+4h87DnZ9ysVvc3qMbkXAumUrT9YGA6jYWzsfHhg9i89Q
	 KQ5vupNbHBIhVTao2LCW1qHSb4D8cnIxYTMSdVdqEEYKnwW9PJO58vJOioT7euStk+
	 MkVOpZKZnSgMyWLWvu1If37624nx01WhEEo6823CBZipfMieF+OcDc/iBmz4vA4xYm
	 w2xuCDtSAp1kn5tzEDmAP0FsqDEXa+ec88ndhq1TEvV6ybzEmV8dU2YUiKlPxJCz2f
	 mCHcmPJoYavTQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	quic_imrashai@quicinc.com,
	quic_jkona@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v5 0/8] Add support for videocc, camcc, dispcc0 and dispcc1 on Qualcomm SA8775P platform.
Date: Tue, 22 Oct 2024 23:16:04 -0500
Message-ID: <172965696399.224417.2176069731135434872.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com>
References: <20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 11 Oct 2024 00:28:30 +0530, Taniya Das wrote:
> [v5]
>   Rebased the device tree patch to add clock controller nodes.
> 
> [v4]
>   Changes in [v4] compared to [v3]
>   Videocc: Update the mvs0/mvs1 gdsc to use HW_CTRL_TRIGGER [Konrad and Qualcomm
>   internal discussions]
>   Camcc:   Add new clock to the clock tree.
>   Change the patch order for 'Update sleep_clk frequency to 32000 on SA8775P' [Krzysztof]
> 
> [...]

Applied, thanks!

[2/8] clk: qcom: Add support for Video clock controller on SA8775P
      commit: 9c28d1b9ec6038ba654e28599532251a691c2ed0
[4/8] clk: qcom: Add support for Camera Clock Controller on SA8775P
      commit: 84c74dfbecc5f809e6e536c2ec74fd0a582399ec
[6/8] clk: qcom: Add support for Display clock Controllers on SA8775P
      commit: e700bfd2f976903428df422f78c6b725ea142564

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

