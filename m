Return-Path: <linux-arm-msm+bounces-68637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E958DB21BF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 06:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 315B01A209A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 04:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A10D1AB6F1;
	Tue, 12 Aug 2025 04:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCtr7O/n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B2DB665;
	Tue, 12 Aug 2025 04:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754971419; cv=none; b=kZVVgsEAklZ6ooCgTewD5rZU7bPQIOrVvtEwCm77VHrqxT1laqDSuqX9OOGk1SnEQNlNYACDCtaWskpr1ANwqmM2tTz6qbnIfwsNndPqVdf+2h9pNH8YJtCTZXdm8ozHPPWnhHZ2QFTMWLqLvIx1cNaE++G3aMqW4AlrUY8yiwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754971419; c=relaxed/simple;
	bh=s8Zyw8l53l1tq+xntEs4DyTANDAQ9xaSpH8kK4Q/wT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=io3h8OHHRAmpk6PxQEtZ9RZj0O8XlQ4o/IwYJYTySk+uVjhBslK7/I/1Rbivn2xByxIL4s/giKXg06cp1s5u1capZMCUkikMVJyD6CMmY56cqQIzk92ahQwiuiLnenc8/Jhy+EQRYmtinJZ+5x0iGAJzjhmA8zvUcy3gowMw+wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCtr7O/n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6941DC4CEF0;
	Tue, 12 Aug 2025 04:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754971418;
	bh=s8Zyw8l53l1tq+xntEs4DyTANDAQ9xaSpH8kK4Q/wT0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CCtr7O/nlpcwNIRZRy+biz8A5TvNv4t5EBw7seltHTrXBs1//r+s3b5sKeLhEJy52
	 atOSAya+CC2Tgzqzj+i+UKcHSeLG+C1EagFc+utidCLLN+YYYM3HTmfmj3qQXF1lGv
	 7IqirGhI37L18MHeaZt03+8wioB9aOhYH/SCe8VIVvbGcuPDaUABc9OUaYd2tsHcd2
	 AQqsQ+NF3W69FM3eybWAdfk1xMHA2ZO5OMDMsvtwcwtvEwaJmmU12Tsnf95wH3ttaj
	 LF6UCX0BO525IPi3u7Sei5S7z2vqa16vZIGMFXbg2CXRJgCjqT/rUp3DJofYicIJ0Z
	 qgP/rSPe8ZpWA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Jens Reidel <adrian@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] soc: qcom: smem: Fix endian-unaware access of num_entries
Date: Mon, 11 Aug 2025 23:03:35 -0500
Message-ID: <175497141338.170566.3604271939497396373.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250726235646.254730-1-adrian@mainlining.org>
References: <20250726235646.254730-1-adrian@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 27 Jul 2025 01:56:46 +0200, Jens Reidel wrote:
> Add a missing le32_to_cpu when accessing num_entries, which is always a
> little endian integer.
> 
> Fixes booting on Xiaomi Mi 9T (xiaomi-davinci) in big endian.
> 
> 

Applied, thanks!

[1/1] soc: qcom: smem: Fix endian-unaware access of num_entries
      commit: 19e7aa0e9e46d0ad111a4af55b3d681b6ad945e0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

