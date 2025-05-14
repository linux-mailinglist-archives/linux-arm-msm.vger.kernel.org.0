Return-Path: <linux-arm-msm+bounces-57988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E825AB7786
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 428087A8F93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94745220696;
	Wed, 14 May 2025 21:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdBjK78t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6475E29672C;
	Wed, 14 May 2025 21:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747256642; cv=none; b=BlHLbP7hvKx5YFifYtUpF/sqsdpTx7lUgeveJm7TfB2yNSFKS6Bj4E1w+p/PqqTXnx/KxbGGL7kt+4cj6CvseHv7sdaxlhjXoqAYxiISakg+3K7orAfiVd3Rv5Fpdhtwjsrnz/ShU3B49GFyBzmGSWJdqCTqdDC9j9/134vU1gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747256642; c=relaxed/simple;
	bh=zQaVTo6uq7GTTyn4JaDd0mSY1eehJrCyokN+2acGXIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BwQ8fuyCwUUlZ7nZc83UF0Hly/qxmqFv5n43hcG5Pba3dz7nf3wYTUnN5gR29uxTf/jy6n6Je7nVecTtlrfOUmx9bIFk6/iQUgOcT0wp78xEJOMrFL/818fC1LlQ8s/2T6IksSfbkYIrsndwCfMRv7CTrSBGeuCExgyl5fpzKcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdBjK78t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78633C4CEED;
	Wed, 14 May 2025 21:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747256641;
	bh=zQaVTo6uq7GTTyn4JaDd0mSY1eehJrCyokN+2acGXIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bdBjK78t2mu2znF3PNzbQjvcBInjt/cdXVljdYMkPRXvPP1wb/dEd0n9CO2CQx2gJ
	 9JI01s5c0mel/5NWw/9DVkxitb/hNCHD5YZZa72W+lDJgzcrnOVhz5I0zR5efWSgJ3
	 Ee7jVDCS5POE3o9ooUZnbQtIqhg3jkoKpM+C7E/S3yh+ALU/ZhxwrsLjgWJI/d6CeF
	 wpsHWVlYLYs4dgung24FIxFQI8Xj817UshUxQot+zY7jD2obUuwztYXVIaTNwrpKHS
	 wytRbt3tgH3qJE+g+WiuXa4GFJSWAvuf+LTOpAQj3riNuaKM3P8m9kYIzl3W1v/EMx
	 k4LKRrLbjqWEg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org,
	darren.kenny@oracle.com
Subject: Re: [PATCH] arm64: dts: qcom: sm8350: Fix typo in pil_camera_mem node
Date: Wed, 14 May 2025 22:03:42 +0100
Message-ID: <174725663041.90041.7175669226462616245.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514114656.2307828-1-alok.a.tiwari@oracle.com>
References: <20250514114656.2307828-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 14 May 2025 04:46:51 -0700, Alok Tiwari wrote:
> There is a typo in sm8350.dts where the node label
> mmeory@85200000 should be memory@85200000.
> This patch corrects the typo for clarity and consistency.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8350: Fix typo in pil_camera_mem node
      commit: 295217420a44403a33c30f99d8337fe7b07eb02b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

