Return-Path: <linux-arm-msm+bounces-53768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5674A83A45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6AFC1B80DEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 07:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BFC204F62;
	Thu, 10 Apr 2025 07:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKoKpYmU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B88418FC75;
	Thu, 10 Apr 2025 07:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268750; cv=none; b=o4pcyboJQJfyQ2uKIUJDOe0gxHJYB9l2ZMd7MMUvkhHW89RRpNRJCDD/uWMTWLKp+cPCdYsuIWO5wEac4YTY0P0XgkijHkBIY0ISB9nUdh6E+hbvUaWiiBag0rY1SX8ZkCVoR2VIfGBAZmTlVGGyKeONgBTQd31vbMdzXwgQPGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268750; c=relaxed/simple;
	bh=sQMGbE8iQy4khTyZej0KqZO749zfTOSan6078zVowmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKA5DUizFtzZfI3ioaF4l6BkJza+myXOrGPmx14AKAFDRld3sjEm3JJs+2ItfKVx71w1lmY++hpvOI37NcW9E7ZJnJTkIMXtWyuU3M3HuwO6MWuk2NERkUgmG9pUUsh4ASWvrTHzhwdvfKPDfxOhx7FYnuvan8wHruQpED1pBtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKoKpYmU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C09C4CEDD;
	Thu, 10 Apr 2025 07:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744268750;
	bh=sQMGbE8iQy4khTyZej0KqZO749zfTOSan6078zVowmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lKoKpYmUk0EEyAIPiq+CRa6jMgDC8jb9pMHG3Btu+TRfkTy9FPheyinJIDxxfJaqd
	 B1MePB9vOkouDxS+cDfRJXivWExkHeIOPbi/PRkUXKWz75RGkUwRx7oCK54RHvOey2
	 B1Hpl01k4n0CNv6DFiTyzeiyQkZ//RA2mb9bQ6HUSfor7TvEpTsTcGKojU4pvyOk4E
	 cKoE3hCErU9FRbFgwEqbAHhNKizOjUhV/6v1szWRBpSrPnV7S8E7kF0btkPC/einIW
	 NfQLN/jxdqC4pW7KUA4d3lDhNPHPhgY5APWYDFk33QW9fTuOA7jp+99I8aZ1Q3tZ8H
	 VWJfnMwcp6f8w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u2lyy-0000000039a-3wN6;
	Thu, 10 Apr 2025 09:05:52 +0200
Date: Thu, 10 Apr 2025 09:05:52 +0200
From: Johan Hovold <johan@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Vinod Koul <vkoul@kernel.org>, kishon@kernel.org, lumag@kernel.org,
	abel.vesa@linaro.org, neil.armstrong@linaro.org,
	quic_qianyu@quicinc.com, quic_ziyuzhan@quicinc.com,
	quic_devipriy@quicinc.com, quic_krichai@quicinc.com,
	manivannan.sadhasivam@linaro.org, johan+linaro@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 6.14 08/31] phy: qcom: qmp-pcie: Add X1P42100
 Gen4x4 PHY
Message-ID: <Z_dt0F-XzGIJWhnz@hovoldconsulting.com>
References: <20250407181054.3177479-1-sashal@kernel.org>
 <20250407181054.3177479-8-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407181054.3177479-8-sashal@kernel.org>

On Mon, Apr 07, 2025 at 02:10:24PM -0400, Sasha Levin wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> [ Upstream commit 0d8db251dd15d2e284f5a6a53bc2b869f3eca711 ]
> 
> Add a new, common configuration for Gen4x4 V6 PHYs without an init
> sequence.
> 
> The bootloader configures the hardware once and the OS retains that
> configuration by using the NOCSR reset line (which doesn't drop
> register state on assert) in place of the "full reset" one.
> 
> Use this new configuration for X1P42100's Gen4x4 PHY.
> 
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20250203-topic-x1p4_dts-v2-3-72cd4cdc767b@oss.qualcomm.com
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Support for this SoC is not even in mainline yet so there is really no
need to backport this one.

Please drop from all stable queues.

Johan

