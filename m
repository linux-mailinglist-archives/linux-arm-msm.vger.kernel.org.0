Return-Path: <linux-arm-msm+bounces-62714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E276AEABE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 02:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0126E162ED6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 00:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03C218C932;
	Fri, 27 Jun 2025 00:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VoCzdsbk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE52188006;
	Fri, 27 Jun 2025 00:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750985229; cv=none; b=m/sNdHSGVq1rXuCMDrKaXjgzOianr7ZdW2N2SPXMnJAgsSubRLgNljGjzC4mGPkf+sUPy0tUBxcKmuJR3vpH5+zjuCZRyKKRYKmtigH3VguRlEONooWa1SRO9b3B9mChUCdPdx6Acc0yG77Sf33ZAZGqybA2jSpeviPdDhnGxpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750985229; c=relaxed/simple;
	bh=Sy0MNRkr7OgPAHkYaJle+oDt6of3ltgYZS+pBtmnxsg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iV545AR7AaW/MokXQKyUas3+yYmeEBS+z6EBdCpOczLtPls2nL23rzvWlQC9T3oqebsME8a5XOUGSs5zrDwB5FYq3RoqeTJI+JlIP/croIUu2JoKBPnn+ECFwbOCv3Grv9NjsqvfAT0sbKch/fIsnMK21sYbxOHnPumtkcbs/GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VoCzdsbk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5888C4CEF3;
	Fri, 27 Jun 2025 00:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750985229;
	bh=Sy0MNRkr7OgPAHkYaJle+oDt6of3ltgYZS+pBtmnxsg=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=VoCzdsbkoo5sJQ5ESRkQH6mdo6fdZbKn223ORwnlRljqQfJxlMZXm4fARn4KKSWG7
	 SQDiY0v8hoj/YxqCxbiDHrW4e0aXYOwPamWrDx5wePdwKeToVxyvHLe7TknxzveLSO
	 pMy46atriyTYv9jc9RMvWIfJhX0WWaZGNu3eugoLxwa83Y0T93+qNYTwyvn2NtNa1x
	 C7NvyS0X/HSvqQaV6cj2eCdthkpDw7Bv7tFhHcqHUoJBt3EvRUabqzlq6Bm2Q2JbIr
	 Va9ewMSgzlu0z8c5uk2Hr9YRwqwUVb0arnAMLRYCAiLO868GrjHM0rlNsoDEKqdE4D
	 sosbrhir9Dv9w==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Melody Olvera <melody.olvera@oss.qualcomm.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250616062541.7167-2-krzysztof.kozlowski@linaro.org>
References: <20250616062541.7167-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] phy: qcom: qmp-combo: Add missing PLL (VCO)
 configuration on SM8750
Message-Id: <175098522871.106297.918831691026558846.b4-ty@kernel.org>
Date: Thu, 26 Jun 2025 17:47:08 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 16 Jun 2025 08:25:42 +0200, Krzysztof Kozlowski wrote:
> Add missing DP PHY status and VCO clock configuration registers to fix
> configuring the VCO rate on SM8750.  Without proper VCO rate setting, it
> works on after-reset half of rate which is not enough for DP over USB to
> work as seen on logs:
> 
>   [drm:msm_dp_ctrl_link_train_1_2] *ERROR* max v_level reached
>   [drm:msm_dp_ctrl_link_train_1_2] *ERROR* link training #1 on phy 0 failed. ret=-11
> 
> [...]

Applied, thanks!

[1/1] phy: qcom: qmp-combo: Add missing PLL (VCO) configuration on SM8750
      commit: 304c102cff7382353a28039907a7017bde795db9

Best regards,
-- 
~Vinod



