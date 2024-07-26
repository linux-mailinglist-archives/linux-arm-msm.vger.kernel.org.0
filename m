Return-Path: <linux-arm-msm+bounces-27095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFEC93D545
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 16:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A74CD28145C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 14:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B0B3FBA5;
	Fri, 26 Jul 2024 14:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DFgMpQ2a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9F11F95E;
	Fri, 26 Jul 2024 14:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722004969; cv=none; b=pJ/O3CtK6var9aAvva4QFYx98wbteK6qsROISz0eN0G758v8v3jpllY8uyA6Ev6sQ7IDgcb+/5RS6sLHIhbjs1ee7waW6jli4IxkL5gwmq0YNsO/ls2eIzNG5P+B3gGOZNourQf8myqRLbTVswVNcIeeHjLhMfxMLKsBtA1cnQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722004969; c=relaxed/simple;
	bh=WOCZVmBumpMvycaaLQcxAvn7GF0bRsPrFEHU+CS4DZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2vYzo4tjl0/fvJJ0t7shFUIkJ45MCZSisNBGFKTa/Xr+TlRk10tIOHL36BhdPTBIsIXr+Z7B7Anm4umgnAVfI+zYQwO8Q7tvyy4ZANw0IXvv1KcNXsQmp7siWF14vc/T8bxgFTwSM+VAJvqITox8kadbaNlJT2h2RMeHqytCsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DFgMpQ2a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5593DC32782;
	Fri, 26 Jul 2024 14:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722004969;
	bh=WOCZVmBumpMvycaaLQcxAvn7GF0bRsPrFEHU+CS4DZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DFgMpQ2aykFxrc+Co4iu7UGhEmwJpgz4ZGOUL5124UL9PmpkrUH0EwJ4Ci5fUcoAt
	 bjzxfDyv/qo5O7qWcM0O4+ZCG8HjBe2DSElOkSrpACfTks81EGzJ3C+8HQvdENLmwK
	 ayOqtXPmRZjH31QiU7w6i0FFQZ0IKL0MVdvItLoqEUBAxPy7mhs2FfrCH1LPEEmUMu
	 AEuXm8Uu2VSN1k9IpBWxkYdHhbN3dwIFKKpuVPH5xUa5eBooSQ20ACEbtVnKH+ubxI
	 mQmYSSyRCou6DxR+WJKEw1WGewgDeuC6LTCsrDm/hX6nkW3DghNgKqempMwVpy1MWx
	 rcocXfRB1+NPw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sXM9m-000000007Wv-2Yiv;
	Fri, 26 Jul 2024 16:42:54 +0200
Date: Fri, 26 Jul 2024 16:42:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, Qiang Yu <quic_qianyu@quicinc.com>
Subject: Re: [PATCH] phy: qcom: qmp-pcie: Configure all tables on port B PHY
Message-ID: <ZqO17rPoitKbUa_9@hovoldconsulting.com>
References: <20240726-phy-qcom-qmp-pcie-write-all-tbls-second-port-v1-1-751b9ee01184@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726-phy-qcom-qmp-pcie-write-all-tbls-second-port-v1-1-751b9ee01184@linaro.org>

One more nit: subject prefix should be just

	phy: qcom-qmp-pcie:

Johan

