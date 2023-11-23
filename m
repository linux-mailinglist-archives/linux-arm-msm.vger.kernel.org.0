Return-Path: <linux-arm-msm+bounces-1626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 014537F5916
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 08:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC92C1F2041C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 07:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6979016412;
	Thu, 23 Nov 2023 07:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2QxUt5h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472841640D
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Nov 2023 07:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6922C433C7;
	Thu, 23 Nov 2023 07:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700724079;
	bh=OP0/bY80RUPFBGCPYyA8H/XM+iSF8+mpGICoK9yfeTw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=a2QxUt5hPAYdSv3pkgDlCmYd9J5S4ZvTSjKklcxb5FgAe7kl18KTTEF4Ph1gci4ln
	 HpTNFH/hIzzIhKo9r+ZGXOK8+u4TV11OtiJ9uly8uIAlsc0/vUpjeUt5hWGYESEQEr
	 AMbdENmDoT6CrFeJf1Wa/Kj6JiUPH6WisQ1d6ubpCAVcexlPZzarCoWDfHv+T/uGpJ
	 Pzv7njLLnnQkl096K9LDtGD6dEAG+2BKUHGifkYM48tZ9w9byE++8r22bf3fdAhYT9
	 etbuG78QaUrCmBzPP/VT+fgZbJl++nnG4FT8xwzwyYQheWscFCdhBJ4z7k069pIASO
	 ZIIRlikA3suwQ==
From: Vinod Koul <vkoul@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231120190740.339350-1-krzysztof.kozlowski@linaro.org>
References: <20231120190740.339350-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] soundwire: qcom: drop unneeded
 qcom_swrm_stream_alloc_ports() cleanup
Message-Id: <170072407531.674978.2652900488518504446.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 12:51:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Mon, 20 Nov 2023 20:07:39 +0100, Krzysztof Kozlowski wrote:
> The cleanup in "err" goto label clears bits from pconfig array which is
> a local variable.  This does not have any effect outside of this
> function, so drop this useless code.
> 
> 

Applied, thanks!

[1/2] soundwire: qcom: drop unneeded qcom_swrm_stream_alloc_ports() cleanup
      commit: 5c68b66d4d7eff8cdb6f508f8537faa30c5faa6d
[2/2] soundwire: qcom: move sconfig in qcom_swrm_stream_alloc_ports() out of critical section
      commit: 5bdc61ef45007908df9d8587111c7a5a552bdd46

Best regards,
-- 
~Vinod



