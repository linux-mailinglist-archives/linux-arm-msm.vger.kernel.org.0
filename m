Return-Path: <linux-arm-msm+bounces-48072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AEDA36877
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 23:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37E10189318A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 22:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E574C1FDA65;
	Fri, 14 Feb 2025 22:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AECZGR6C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DC61DE2B4;
	Fri, 14 Feb 2025 22:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739572712; cv=none; b=bMQNeba1uwPUZAG518wmHCmbQ3Ww3IXaj/7eJLYrQCfzTpVr6EFB4Q+N6mNpYXNx+R1LRRTtuz7uWZeK91/rnQLOLM4+sfRZrXh3GrADOmfABHQMjMWJM5FoCN8RDz2T5OA+X8AIpwWFR9RU0TKNxjkvpwNWG+ZBy04Hprg4NAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739572712; c=relaxed/simple;
	bh=q6LtkGb0WhcDiO2mICpWEpf5smiU8aORVVy5c59Ug5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ey3jiBQK043AcuBGLhJQoOS7ScGMcanQqJ7jJU8wH4tBMmDNgmjHFOTfJeqzfhExZpCdzg+wcKrGwzb9SdXguwbtU8n9tJuS1jEY3vJloBg0fYozzaFkoc3L74zaJdOpM+N4uqzPrQpIP+YkguBY077TGnZUs7ct3EXfMx2IXaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AECZGR6C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6972CC4CEEC;
	Fri, 14 Feb 2025 22:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739572711;
	bh=q6LtkGb0WhcDiO2mICpWEpf5smiU8aORVVy5c59Ug5c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AECZGR6CqfTD8uMSOplbLmFqQrfTaE5dKsGtghzbTkSNVclsmTXo5J94lDF1r4McS
	 ezP/xeay8jlWfnsuyFKZg1GlZ++A9VR8DHtr/qc0+Tl2oDVHM+qmvPtYli6L5epp6e
	 FaSRCxMoUrAzBOtws23hLejYbJ38bNVgBk7cbudjYPmM0pr1PEY1ExbkKmI9W1ngiA
	 DhTHYgj6Kg4jfzMnqVY5KAW7oFNaiE4d8U3Iwk3dDpvxTzkJyxCa0kUMG27x0lf8OU
	 9vz/bhk8tpU3ZM5keRuvSVKL1Z2ozhs+iinU9XhufYMkcHLrKblCmlzJfNf+usvArT
	 iTk/wF0E+5tAA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v10 0/4] clk: qcom: Add support for multiple power-domains for a clock controller.
Date: Fri, 14 Feb 2025 16:38:13 -0600
Message-ID: <173957268920.110887.11371056980059784937.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-0-13f2bb656dad@linaro.org>
References: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-0-13f2bb656dad@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 17 Jan 2025 13:54:06 +0000, Bryan O'Donoghue wrote:
> Changes in v10:
> - Updated the commit log of patch #1 to make the reasoning - that it makes
>   applying the subsequent patch cleaner/nicer clear - Bjorn
> - Substantially rewrites final patch commit to mostly reflect Bjorn's
>   summation of my long and rambling previous paragraphs.
>   Being a visual person, I've included some example pseudo-code which
>   hopefully makes the intent clearer plus some ASCII art >= Klimt.
> - Link to v9: https://lore.kernel.org/r/20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-0-f15fb405efa5@linaro.org
> 
> [...]

Applied, thanks!

[1/4] clk: qcom: gdsc: Release pm subdomains in reverse add order
      commit: 0e6dfde439df0bb977cddd3cf7fff150a084a9bf
[2/4] clk: qcom: gdsc: Capture pm_genpd_add_subdomain result code
      commit: 65a733464553ea192797b889d1533a1a37216f32
[3/4] clk: qcom: common: Add support for power-domain attachment
      commit: ed5a0d065fe87d7f64e2aa67191bc73299b830bd
[4/4] clk: qcom: Support attaching GDSCs to multiple parents
      commit: b489235b4dc01ff2b53995c03f30726fb1ea8005

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

