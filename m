Return-Path: <linux-arm-msm+bounces-54291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F76DA89240
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 04:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8E77189C0AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 02:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC9046426;
	Tue, 15 Apr 2025 02:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohCLHh1Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FD02DFA26;
	Tue, 15 Apr 2025 02:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685566; cv=none; b=UZmfVbYL7KO5r9gSvmyOage/N6dpqy7oDIadb2PdVfF48GtSEUQUP5dwMcQRhq6beqRiJlnZvQHs3Fh48wD0LxUC/SW2bhrCZJuD7YljsJahZrCOlMb1GfVZBj0NDQrw/cIsLUPSAdgW10BPqWDYpIhwUzLWcsxh1sKZLXjNYkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685566; c=relaxed/simple;
	bh=D3fHJzips5mW3Ekv3PXGxBas7u/4KPS9mKPQsZ87I3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hycwtjbOZircQpvft+nyi9SaIejsyzZX7KF8g7xES7aJopTLER3lmhFR33RV0HQhfakxoyyAzavOfv6uDS1wFBGAu9+//PGVbHPfLEAv7QV3KL423WvWqIX7TvijDpYoqnzoFLMXoxuubTXlCdK2/jVcDsA9rk5tJ/SRSsNtNQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohCLHh1Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA0FC4CEE2;
	Tue, 15 Apr 2025 02:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744685564;
	bh=D3fHJzips5mW3Ekv3PXGxBas7u/4KPS9mKPQsZ87I3c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ohCLHh1Yma0e41b/axzEao6RgMe6NgeCuBW/g3nAEAZbno22OjGlxldjikPK74MRs
	 AK10ciWi3BodwOGiYmRx/KaxOGkjFX3Gcb5zvvxXrFE40fzNuz/gsnMy6w1U1RD2m5
	 zIG0ES2Mfuryq6VikIKyHt2e0dMbSqiigNzOnbKfhz/I44Chmp9DAfxxD433gwfKLd
	 0tbbpaFtIOtSNJ+IPITE4CBCqXzMRTsZa86/4j0GoXyb+vAwM8/4qnBXGQk7PlrpAA
	 trqv3GEYkzjADGo2xoMsOKs9UPziWrZ5W7PkdmTEXvVcpJIml6rb8UYdy8YUt8iW5G
	 af5EVzscgvccw==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: (subset) [PATCH v2 1/1] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: enable MICs LDO
Date: Mon, 14 Apr 2025 21:52:37 -0500
Message-ID: <174468553409.331095.207120209579526273.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250412124956.20562-1-alex.vinarskis@gmail.com>
References: <20250412124956.20562-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 12 Apr 2025 14:49:18 +0200, Aleksandrs Vinarskis wrote:
> Particular device comes without headset combo jack, hence does not
> feature wcd codec IC. In such cases, DMICs are powered from vreg_l1b.
> Describe all 4 microphones in the audio routing. vdd-micb is defined
> for lpass-macro already.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: enable MICs LDO
      commit: 337921764e31907ea46df02c1d8dd1ae8f2802f5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

