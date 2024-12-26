Return-Path: <linux-arm-msm+bounces-43436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C7D9FCEAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 007431883660
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2EAF1D8DFE;
	Thu, 26 Dec 2024 22:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxMPoQRa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08801D8A04;
	Thu, 26 Dec 2024 22:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252750; cv=none; b=fCYpKugMmuTZR/cZShR5kJp8cbgq0od0onWKZt9GizuQjQjEnF1fhbpJKrr0SXJR60qBkdILrANGc93hR+UQQ9PxY1YtDYLA3WRwxC6t8zcD2fg03kC0ZUktHn7QeL9j22OO0T1L0+tFWsXXUIJbTr893DSlcyI4w8P7itLNBfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252750; c=relaxed/simple;
	bh=+RXCqt+iNZcaUif2XtyI5LwtUaXAQ0XSI65MsanBs/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RMwc/kKcxcwGA8C2iusFswq6idJuor20Lcmdc2olFgxhezacRZ6XcVPAhZFcctOFWopHfmh0MWWQo33Vw5q1UTozPOcSFA6aVqgR/B5RJobrUUaeNruFFHaFDb/NI4Ms3dfO0FNFlrqEtbK86AzwReF+zvU4dgGqJCscNXQGn7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxMPoQRa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B763C4CED3;
	Thu, 26 Dec 2024 22:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252750;
	bh=+RXCqt+iNZcaUif2XtyI5LwtUaXAQ0XSI65MsanBs/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hxMPoQRaaKAX8xVcKL6KDHl9YV0scIvaZjzGEFkoasmChLqGStNq5ntFMrBgnCqFx
	 BKFqRFw3Yp8wZHxx2VO1SrXBvo74NJ9583gP9BOXwmqi9nHDRTKUGEzIlct8V4LnjR
	 74JEoYqsQnToxi0gJ4KHQ8g5/xQD8qxemagDR0VYP+8WhNTB2FyXRupfKfee+R6FUM
	 bTe6B0Zl8QEAzmGvKPqElAls5ekj2p5lmfAHGkW3aPKm32TaDO5nb3PNgFJIJxz+0w
	 YaRINyAPqbu6nxoLRSxWy7Gyo9ZMJW8dvvhn0staLcSIbDTB2rAaD6G6RXI2/bvVFh
	 JC2wB9nzeoOvQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/2] Add missing parent_map to clocks in SM6350 clock drivers
Date: Thu, 26 Dec 2024 16:38:40 -0600
Message-ID: <173525273261.1449028.9949887980005310718.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220-sm6350-parent_map-v1-0-64f3d04cb2eb@fairphone.com>
References: <20241220-sm6350-parent_map-v1-0-64f3d04cb2eb@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Dec 2024 10:03:29 +0100, Luca Weiss wrote:
> If a clk_rcg2 has a parent, it should also have parent_map defined,
> otherwise we'll get a NULL pointer dereference when calling clk_set_rate
> on those clocks.
> 
> Correct this on clocks in both gcc-sm6350 and dispcc-sm6350.
> 
> 
> [...]

Applied, thanks!

[1/2] clk: qcom: gcc-sm6350: Add missing parent_map for two clocks
      commit: 96fe1a7ee477d701cfc98ab9d3c730c35d966861
[2/2] clk: qcom: dispcc-sm6350: Add missing parent_map for a clock
      commit: d4cdb196f182d2fbe336c968228be00d8c3fed05

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

