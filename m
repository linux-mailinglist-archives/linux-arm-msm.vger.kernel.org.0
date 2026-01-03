Return-Path: <linux-arm-msm+bounces-87285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7425CEFAA6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 05:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E7903011429
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 04:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4AD21FF3F;
	Sat,  3 Jan 2026 04:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebn/fhhH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89859219A81;
	Sat,  3 Jan 2026 04:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767414872; cv=none; b=hoouyO5gXFV7pn0G6weRkzeROPC5oun5q4bNdnKC6WhQ8ZShbLWwj/7NYD5bhPurebNfiMqztbgHRRu6+Tzb0zB8Fk7o3SY4D5JJ/Gxj+lGWCgsnbHaf5NlwCqwN4FMd36Dq1gM+/uD2Mx8tWOeoMlIzT+dWaJJzvNxQQ1KsoX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767414872; c=relaxed/simple;
	bh=zJLNuqjJo8JSyAfKtWlFzw6htbmTx3tk4UMdE6ePqOo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SHMXb7jrqDVSQ7gz0CVBDwfS14GISNRu6xXltpJVpNtAA6qr8mhjy1L8jrOEFtMEXHBFCeq4y5zE0AlVrzfpf03PFyllh2MSTjOk4H7GKgBUG+gY4b+O73SCi/5oWldYYAwW5+fz03auKna20EE5DmhU7/ueStz3AVAnb8n933o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebn/fhhH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CCE4C19422;
	Sat,  3 Jan 2026 04:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767414872;
	bh=zJLNuqjJo8JSyAfKtWlFzw6htbmTx3tk4UMdE6ePqOo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ebn/fhhHASCh9lvI/N00Z3xeJkSx4vMlyMNel7Y2xsfxQgbhzQaJGZYIOUBeN6K/U
	 9SXreAuq7GJkew57XzXr//B7OGf+TmIEn94PZIz+lhSpBwQLbfUqQj26YcxhGs45g5
	 oKuBP68xkNM77tA6pwxEuQ4cG6II6oLtrRlm6BDFPXATjOR7me8P+kHWZzIIMoapvO
	 t4ioirBtcdmnsACPpUDdBon6QYjsxbhGIEPKRLQPq56TwJ8ddZcsy9woHoOvLemtjM
	 JXJniSIf+eAU3SbWA/IWTdx0tKjlvm+P/RQZPyovKoD6C9G1inU5Ln9MRsuQCTArPj
	 4Ugd8bU/6ntuw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 1/2] clk: qcom: gcc-kaanapali: Fix double array initializer
Date: Fri,  2 Jan 2026 22:34:27 -0600
Message-ID: <176741484221.2558240.12492908303952193297.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 Dec 2025 12:22:58 +0100, Krzysztof Kozlowski wrote:
> [GCC_QMIP_VIDEO_VCODEC_AHB_CLK] element in clk_regmap array is already
> initialized, as reported by W=1 clang warning:
> 
>   gcc-kaanapali.c:3383:36: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
> 
> 

Applied, thanks!

[1/2] clk: qcom: gcc-kaanapali: Fix double array initializer
      commit: e77ff7d32b2029851a3567f1ccf7ab9db5cfa137
[2/2] clk: qcom: rpmh: Fix double array initializer on Kaanapali
      commit: bb466f234f2cfeea1c65b2d777ed878ee783b3ba

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

