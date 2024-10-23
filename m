Return-Path: <linux-arm-msm+bounces-35503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 229559ABCB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 506B41C20AFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 04:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D07A146A7A;
	Wed, 23 Oct 2024 04:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+LH6nYa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F300883CDA;
	Wed, 23 Oct 2024 04:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729656976; cv=none; b=HzsOvriiezKIHJfUy4ySiy4f5Ggik25mvyx9lVzrzJxc50fDigI1Oqb79245eaq2TN+DmnWDWkmutBXqZ2o7+snNb4J6IGEXawooJIa0UJoclckmZQFa0xNtssLgZQkreCHjNgO5z4NUxtbAXFJidSNDotwajk+MDxyRBiUQA9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729656976; c=relaxed/simple;
	bh=fAznswwC8vg0ZKULJ80WB9lOPTcXF9zCKaZwE+DqUWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GSjLEZEa7v0U5G8RZDGcQ05p2cmmyD1SQU2V/sNQbkEqfYOURuTtV/Iy2Rc+Cy1S78/LzFD9079gHOc6ifVtiPesXO6Y0OhRAYxMU+Olet3qpWrtNP71+VEEqnKX2Be/UDFiMlLyvlpLB2dPhC2hXG+f6bXSywfOf4DmzRPFjV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+LH6nYa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01098C4CEEF;
	Wed, 23 Oct 2024 04:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729656975;
	bh=fAznswwC8vg0ZKULJ80WB9lOPTcXF9zCKaZwE+DqUWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i+LH6nYaZLeJ8HOpV9laxW3JdfU+L14nJxkN+3fq+qsylGYsXdxJxgnl7JNMlxaKv
	 K+ZJ6lRY9FqMtQjEtXGpJkEzo4pKGbd8XrsQT7sj8gtPvQ8of5aRneoXwdvu05f5HM
	 2Vwwhga4P7yoQ2dhS+vfS/3ev+l/NeHCBrRvR96QZM6bVRUd5cJPRWJSKK2U9ZkjE+
	 bj73LtSdShbameDR3pHJxTWozXO1SYOk1orLazZmXcZAcZF8tcKbyBhrqQ4o+0ytDZ
	 iBqzEbEQoIknvSBI97sK1uA8PdtPVIN3gfg0qCi85nJbeirEswH68lwZU6By31rwQX
	 4lP3uhtze1DMQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Gabor Juhos <j4g8y7@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-qcs404: fix initial rate of GPLL3
Date: Tue, 22 Oct 2024 23:15:52 -0500
Message-ID: <172965696410.224417.417251056134093970.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241022-fix-gcc-qcs404-gpll3-v1-1-c4d30d634d19@gmail.com>
References: <20241022-fix-gcc-qcs404-gpll3-v1-1-c4d30d634d19@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 22 Oct 2024 11:45:56 +0200, Gabor Juhos wrote:
> The comment before the config of the GPLL3 PLL says that the
> PLL should run at 930 MHz. In contrary to this, calculating
> the frequency from the current configuration values by using
> 19.2 MHz as input frequency defined in 'qcs404.dtsi', it gives
> 921.6 MHz:
> 
>   $ xo=19200000; l=48; alpha=0x0; alpha_hi=0x0
>   $ echo "$xo * ($((l)) + $(((alpha_hi << 32 | alpha) >> 8)) / 2^32)" | bc -l
>   921600000.00000000000000000000
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-qcs404: fix initial rate of GPLL3
      commit: 36d202241d234fa4ac50743510d098ad52bd193a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

