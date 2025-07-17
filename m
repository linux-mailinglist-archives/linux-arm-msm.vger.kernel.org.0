Return-Path: <linux-arm-msm+bounces-65356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FC6B083E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6A4217F774
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D69C21B8F2;
	Thu, 17 Jul 2025 04:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxMK1G6g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F4821ADDB;
	Thu, 17 Jul 2025 04:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752726688; cv=none; b=GrBqUKOY/odROQ2di2Vc+dSy7va31vX/XtrusaU0Lt/aXhWyLD9Kmjnuzb659201VSrRgFWlIraAnBWbeyzgNkuba26Jqb91HAw7yyyGyRIvwguF1ohA9nCGt5lRlPPh/5+UePJ7jHOL8iPem/B6XtSZ7NPijzd++wryl4w7gSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752726688; c=relaxed/simple;
	bh=HBA3bXloyBREvYHNaihCstK+AKSc5sT9kCCra/WUA6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m+XC1tSbslUj6L6knOjt+hW29JpQjWon/5fPSHkqa7P7HjIauDK6YHpXjZsahQzfVhWhW7Sxq+46eqkYNCC/vKRokOPg0Wad1Xx0cMeHXlnWeSRD2pTvIcoppX7DkEsouOczN0jTeBn9BG5HpUE2JHvGo6jNIOJpsdSD3A22WIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxMK1G6g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93684C4CEED;
	Thu, 17 Jul 2025 04:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726688;
	bh=HBA3bXloyBREvYHNaihCstK+AKSc5sT9kCCra/WUA6k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XxMK1G6geqzL/Rs94UuEpwHN2KqBq9igCTAgVkUqq1yPLzZJlITvnLNh0zyMMSSoD
	 tyIuy4EERDO4UkE7Ab6QA1lXaoYq93hLECpsCXZNyZNVfede96AVGnfxMgRwFtXs+B
	 dRGPenVbHnrAEH7KrTY5FyZ/UQlq5k7EqEZdDMcxoQ3PPgXoKHAG7gBpnAD1ZOBaYe
	 Z0x7Dgsi6qHkRpit0rwgcOwiHQgaPXfXg/NVY0yNz84VSJQEil/EXPT+3vJK29jDEn
	 isQPXJA+usyDqJZOVuJLtVrF5gEhGmGMD3oVkSDSKV15nxRSF+G3DFDVAwlE/2hqUK
	 T/2sooEE5793A==
From: Bjorn Andersson <andersson@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-qcm2290: Set HW_CTRL_TRIGGER for video GDSC
Date: Wed, 16 Jul 2025 23:31:02 -0500
Message-ID: <175272667145.130869.8545942439591996371.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613102245.782511-1-loic.poulain@oss.qualcomm.com>
References: <20250613102245.782511-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 13 Jun 2025 12:22:45 +0200, Loic Poulain wrote:
> The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
> the video GDSC to HW and SW control modes at runtime. This requires domain
> to have the HW_CTRL_TRIGGER flag.
> 
> 

Applied, thanks!

[1/1] clk: qcom: gcc-qcm2290: Set HW_CTRL_TRIGGER for video GDSC
      commit: 9723807046601f6596fa71515a3bc81f202cde5c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

