Return-Path: <linux-arm-msm+bounces-85399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 068D9CC4714
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 17:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D864B300444D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 16:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827A21CEAA3;
	Tue, 16 Dec 2025 16:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pxonYLcQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7461A254E
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 16:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765904002; cv=none; b=ILlm5vJ5P3KOS4Dux3Pa3GEkIzjgT0i/q45fs2sTM5orpMa/9tKx3ZpQlyefsLW+DdmKxhTe2/SlnjKyRll+nz9Kq9FIml5B0B3uBlNKC3+5K+djFDFI6EoaSumcHnECabSEdtJldL32nJM2bTHuP4a1nq4bh2i/ZXknsIBtBIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765904002; c=relaxed/simple;
	bh=hB3tjWs2Z2dfiaOVswwyTb3KNiZkv7M5DzbEiPD8jLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8BCEEp24f6zUzTbFj889pdwCPM8HJCcadamheEV8hD1bDpFEih3oTV8Q+DotOhDl60KtyHNnpQ9u5rs2X1eRuAYBFZdJi/xhfHeXgnH2RlcwHjsQzhcl7cSupOr24RKJkw/+Od2J5lliDniw79bZLUG/gCpq3y4E2w2Y3WUPDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pxonYLcQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C33C4CEF1;
	Tue, 16 Dec 2025 16:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765904002;
	bh=hB3tjWs2Z2dfiaOVswwyTb3KNiZkv7M5DzbEiPD8jLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pxonYLcQly7R2o9RURtXVVJNxLDCvcatHnKFucPtmVluBQJEuPacvwBVnSIPNQ5y8
	 fVMQz7Bg2hyTTQrLKjvfi1tR7eX+/rQON2uzzWuLv677iywbnnurBPbkGLQ+x9kimK
	 FCcPFzJLnAgnEhXZbWxsiIqmq7JvnDyBWAmSn8G5AybfMI6iNzv5WnIHulGur+AH5r
	 DlRMKtWLmkwoGx6OoDzVlKuR/Ozq7ObBXFioUzMMAOYGfpA1Ra4kIl5aTyT1MsYzrO
	 3jndKljRcJBb/Fk7Puh//mMGmsjs+rYKoYUNkbqCTyLZJDKpwpFesFs0H45NqzNr52
	 qnMAn8vzAemqA==
Date: Tue, 16 Dec 2025 22:23:18 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Sinan Kaya <okaya@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	Abin Joseph <abin.joseph@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/6] dmaengine: qcom: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <aUGOfs7gI__Q-bua@vaman>
References: <20251027133232.392898-1-sakari.ailus@linux.intel.com>
 <20251027133232.392898-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027133232.392898-3-sakari.ailus@linux.intel.com>

On 27-10-25, 15:32, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().

This one fails for me. I have picked the rest. Can you please rebase
this one

-- 
~Vinod

