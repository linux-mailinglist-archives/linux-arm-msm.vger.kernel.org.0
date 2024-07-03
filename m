Return-Path: <linux-arm-msm+bounces-24964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D20AA924FC7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 05:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E34028EF78
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 03:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DBF12F5A6;
	Wed,  3 Jul 2024 03:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cu7GumeY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E254812F592;
	Wed,  3 Jul 2024 03:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719977867; cv=none; b=MRu1Ju+6XyfgL7UJ2eWO3nhQKouoSp+g8YGIVWljEdl1JM89fAaHtemIrf1YDinOZBQx/Ub6eR16hTbBGC0tThoUK8g7oGTqu811IPy3UzR4cy7YV1u7HWPYlMcn8HcF3NCv5rYBJRwx8VcC7sfR9721YL4xC8fTJnl5ZCxyomE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719977867; c=relaxed/simple;
	bh=mn6fgtCAr/go49G8FELV7cfQDy/AQHdXAzjUEO6cFeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OBBg/JCF41I2gGh0QvEBOmT/RW7iSRkv+NpB8ks6/2rw3+wPXaMiGPX8Q7lzTqo23pmQNBr3VA5TJhabCrFGjCpNipECZ9zOGX+cdhlxX65H8VMwua2f2SFtdrpNsmZxs4QimDpUKcY21X7dw+JX+ZCWkUReSWhKv3rluroHLq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cu7GumeY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01324C4AF0A;
	Wed,  3 Jul 2024 03:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719977866;
	bh=mn6fgtCAr/go49G8FELV7cfQDy/AQHdXAzjUEO6cFeg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cu7GumeYoedneb7nE+CF854itXrRBxgoq0aXqnndWjRRJPeTCgKw06sIfSuHW5QjN
	 rg3HmmT0sfZZHY2y/pikLsNBurJi2mYr8mP2T4bxEj+i63Jjrvq1D8U/h2moLPljx9
	 WLFBnSbAY9oKa5gb4csnqAIM2ENXXFiQ8P8b/xP0lsHVewfwB3zYBjmAWiV+gp3nPy
	 dP5KHLhNje7pOdAesD85k9ICj4kbOPn9awjO/FOimpp3yyL1D3PxMEioLaWLjS2OtU
	 3pyv40PsKSaGZ8Hh/DHRFBzl7uQdXg1+rvxVqbk4lkeEpedxxy+2OtE1lUCe/I0UOT
	 SKITSzyjQQh6A==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] soc: qcom: smsm: Add missing mailbox dependency to Kconfig
Date: Tue,  2 Jul 2024 22:37:29 -0500
Message-ID: <171997785356.348959.1744316153641275134.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628-smsm-kconfig-v1-1-117d5af4ba1f@lucaweiss.eu>
References: <20240628-smsm-kconfig-v1-1-117d5af4ba1f@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 28 Jun 2024 19:30:23 +0200, Luca Weiss wrote:
> Since the smsm driver got the ability to interact with the mailbox using
> the mailbox subsystem and not just syscon, we need to add the dependency
> to kconfig as well to avoid compile errors.
> 
> 

Applied, thanks!

[1/1] soc: qcom: smsm: Add missing mailbox dependency to Kconfig
      commit: 05a21e8b5d006177bce7332523eea5e3f2ee23ab

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

