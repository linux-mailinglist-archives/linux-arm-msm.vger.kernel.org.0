Return-Path: <linux-arm-msm+bounces-1776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DCA7F6B9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 06:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7D921C20A10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 05:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A1DA55;
	Fri, 24 Nov 2023 05:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="awxRRuS0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25D63D90;
	Fri, 24 Nov 2023 05:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 889F5C433C8;
	Fri, 24 Nov 2023 05:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700802808;
	bh=hagFZGT8Lu9FB4is0l4tvlmYdCQ6vvVTipY5bbk8lgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=awxRRuS00+ASnIfcDh6qu9/zntoouhOmUlG8lbDMGf+h3bFc4FdiphfxdYWMajLQO
	 uiLqRNq0V5b9kJTzEt0jV5nPzCITn6P6f3nl3Xudjs/+2cdAjk6OozbBUuCYYnoba2
	 mHTaLRM/Oa28ExhuvRTv4epvw3cbpjnm0NbFQtRpo9OjKY1i/XoSRWi0VvUSgFTcvu
	 L2pgvNvZzhTX5c6rRzALPq+nL2XjLsXtUZjSmV9USUEAv+uxBBATvBEhr6/yp9admC
	 hVndkmygF3O/o+rQhiCVC6cznDOXVALoQ24hPCdwuVK74NjSh1KLOKxypcM2UU8xLV
	 LifT6/+GnRsQA==
Date: Fri, 24 Nov 2023 10:43:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sneh Shah <quic_snehshah@quicinc.com>
Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@quicinc.com, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [PATCH net] net: stmmac: update Rx clk divider for 10M SGMII
Message-ID: <ZWAw85nx/T0xC+Vk@matsya>
References: <20231124050818.1221-1-quic_snehshah@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124050818.1221-1-quic_snehshah@quicinc.com>

On 24-11-23, 10:38, Sneh Shah wrote:
> SGMII 10MBPS mode needs RX clock divider to avoid drops in Rx.
> Update configure SGMII function with rx clk divider programming.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

