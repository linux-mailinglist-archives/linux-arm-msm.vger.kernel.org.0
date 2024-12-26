Return-Path: <linux-arm-msm+bounces-43427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A0A9FCE8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7E03188252A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7631BE23E;
	Thu, 26 Dec 2024 22:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwt3JaJP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC5E1BD4F7;
	Thu, 26 Dec 2024 22:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252740; cv=none; b=FWxgwO+H+4XRZ1d0jrnLkhHdE7I5wToBg25tFkzlKWhC/m984yaWHG4+gspuup69IxLyvTvMr53O3qHqd5GQocqYAXIz/zKX1ed/YtXQAmfZ0S+ynObp4PMD9VeIhDIuKUx1ZR4oZ9ij2IJk+w3T2DRtdRJTqlyrQ2ejKY/XB1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252740; c=relaxed/simple;
	bh=PRnqGqye9XLcM7XryqGktyEXPjFZialyNlgxDprsjto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ao0Io2NIatBmAX0DKULR4SjnCFM+8FqWZq+5bsc411Sblqpdm0Fydbh3PgMroALxJILm1dK9cI3aEqGXOSvC2URXsMPV2P5FMI67OtPtK0jjmKK6dVUz9pfeW+imn/VVp0+q2m7mBRdGrRAcj4jaT4I2o0MMRMGw4GgN7rs89gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwt3JaJP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A887C4CEE1;
	Thu, 26 Dec 2024 22:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252740;
	bh=PRnqGqye9XLcM7XryqGktyEXPjFZialyNlgxDprsjto=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kwt3JaJPPleS9RIrUeVFTmRq/7VGdHXr7JFCCzjAVTyUAFdWHDsiP67YyCqjwch2x
	 wEqHhau5xfAiphIyg2obojARRMuFzbhDO7kQ0bCTmFDO6Prpc3I167jqXM9zeG75Zx
	 LVUrEmuTsyWiEJ6HWYYerRE0Oqj6+eNAyIJlzJiVNyac8jFOXz8yLHSAcTW/zhfXgp
	 eXBI4Gqky32dzMKwz+ZnNIM/e/RlkkvsZspSKWBGui6ppLcXXQPslXEmnzFNZ+K5gs
	 66slMAD0K3b8Agg2YRTnvbkg0BKUJVQ6Z5/hQloqwkw6xHIc70iQTExiGsgJCGAh3W
	 GcFSF2KHGQz1g==
From: Bjorn Andersson <andersson@kernel.org>
To: Anastasia Belova <abelova@astralinux.ru>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	David Dai <daidavid1@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] clk: qcom: clk-rpmh: prevent integer overflow in recalc_rate
Date: Thu, 26 Dec 2024 16:38:31 -0600
Message-ID: <173525273254.1449028.13893672295374918386.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203084231.6001-1-abelova@astralinux.ru>
References: <20241203084231.6001-1-abelova@astralinux.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 03 Dec 2024 11:42:31 +0300, Anastasia Belova wrote:
> aggr_state and unit fields are u32. The result of their
> multiplication may not fit in this type.
> 
> Add explicit casting to prevent overflow.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: clk-rpmh: prevent integer overflow in recalc_rate
      commit: 89aa5925d201b90a48416784831916ca203658f9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

