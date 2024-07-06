Return-Path: <linux-arm-msm+bounces-25434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D13E1929587
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 00:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84E691F2175D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 22:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A77145A0A;
	Sat,  6 Jul 2024 22:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TfLuSL72"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8621459F6;
	Sat,  6 Jul 2024 22:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720303302; cv=none; b=jU3mQ288z+4XRZKW9ppphfehEtYXvpesFCwKcvV73SwJ/re/oVwbVGkCGxlKpIgiWWdytSWWtIGSdboHWylXp4I2DisoBBsm1s2QYLzCgQgXRu+k9ozSAdUheRd1y8HZjGf6sYcG7BkLRTP9nWU5SNAO/ZsF/jY/PSD6/7e866c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720303302; c=relaxed/simple;
	bh=k3NqKbmpti9Yr+egPC2rVOimUuKEGA/mgxNPyUyTfhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h7537vvAa7kaTaB0DA673MbQkhoYvWOpwbPVucWOL22FA/IqnJFru+d0qNYbQBdamHnXsK5m9X4BzR/cOAuQ5tl0QaBRrLHfdcPBmPOoPQ4U1aUX9mIPuDu7bZprL4KxQjsDrAkYBsRhUYVSafJCcZDhz97JRvvdlxR5IUQfSvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TfLuSL72; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC295C4AF0B;
	Sat,  6 Jul 2024 22:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720303302;
	bh=k3NqKbmpti9Yr+egPC2rVOimUuKEGA/mgxNPyUyTfhU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TfLuSL7299Cb3u/c+vaKIsRhBakJSulCfQYRCdZ8lwNVS7GzZ1D1JhKLGfHFG1DIP
	 3NfGKoI84O/jb06wyD+MAfMFyjs94lpsVCAmQdoy9azsw971c0Z+R7xQYUzzQSG3ua
	 WDwjtPsc/+z7gZjS9iB/qxycATnVanN2ui/AQR/qfKyQRVeIvMMozj5915mN8J4UCb
	 g4o4rS6t6nDsza520n2Gsy27uO7tKmZtiL9ikCDroZ+wQPh/3kISFavwTkKN5JRntl
	 HU4d+BWW6KSk+2gjCkCZXbnAKsdUtgN+kYTdnubOBCvzWzlb1utXO6auqU+cRhzSDI
	 IAtCdMOEPrbrg==
From: Bjorn Andersson <andersson@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	ansuelsmth@gmail.com,
	Chen Ni <nichen@iscas.ac.cn>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: kpss-xcc: Return of_clk_add_hw_provider to transfer the error
Date: Sat,  6 Jul 2024 17:01:25 -0500
Message-ID: <172030328804.28909.10939951639905101858.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704073606.1976936-1-nichen@iscas.ac.cn>
References: <20240704073606.1976936-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 04 Jul 2024 15:36:06 +0800, Chen Ni wrote:
> Return of_clk_add_hw_provider() in order to transfer the error if it
> fails.
> 
> 

Applied, thanks!

[1/1] clk: qcom: kpss-xcc: Return of_clk_add_hw_provider to transfer the error
      commit: 9db4585eca22fcd0422a94ac792f87dcbf74b643

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

