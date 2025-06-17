Return-Path: <linux-arm-msm+bounces-61644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7169AADDE12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 23:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90EDC172B81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 21:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8306C2F49EF;
	Tue, 17 Jun 2025 21:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VOdsZNHI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA552F49E8;
	Tue, 17 Jun 2025 21:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750195906; cv=none; b=rIEBF8RpEYIKdvvXgaQFGISPeBmG9djOm773tcLF1qLgcepdR+3lD3AaDKKVIw4TyEyVxsLYygwl1X4MBNlKsUZcbhOB6/hESf1tXgOsPJosNGsR+Lt4MAoMrBzwv8YBSORJsvC4Wkj1iithWTk+moXvQ9opytI9S21bOnSo81k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750195906; c=relaxed/simple;
	bh=XVcNn3kGuGG0Sj5ovcfiFXhp2IERpbM6UTiTuH9xYn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I0F2ox3BgRInpQRBVvpMgNvVeW/cbnMRWgGdH8MFgZPlofcxGDp1Qo7+E2uaMyhS9ZJUSPFyLM/tVrDCNU3W3L30xu1moxrPDPPhaD3BJbKSv/GDCbh3lMRoWtpL1u4wiViJdf+0NIgDfrDiSmk/PQl7EWtaYco+I7Z+lU6SkKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VOdsZNHI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6AB4C4CEED;
	Tue, 17 Jun 2025 21:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750195905;
	bh=XVcNn3kGuGG0Sj5ovcfiFXhp2IERpbM6UTiTuH9xYn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VOdsZNHIcszr3YdqB2rTzFW0sl8ZgipgKNc/E8cNzzwn5ervxwh84hpFetES5/k9B
	 0EnMOmcTzLDgwlIXplqzeSErxelSp7uJyRVxoBT3DfcAYvec2zIx8iMQFHDIBKi9Yk
	 0bVJNGwFVx5fQ7Diw5nq9TWHlY22WagsAll9is1M7MvPH8UCvAxwVYePoDSSiQaUx0
	 gbTT5BQEkrplgPXZF58velbMDzXPjYJ0mrYlmEPn44mfRZfSzArxxHX4pk3klUSnci
	 J2Et+7Bh/yVEppBNHWsoOisB54UibbFyo+G6FoVNbA67V2qv8x43B5da5Om/ImN3oP
	 w+O7JnKkYOIYw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Doug Anderson <dianders@chromium.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/3] soc: qcom: qcom_stats: Add DDR stats
Date: Tue, 17 Jun 2025 16:31:29 -0500
Message-ID: <175019588861.714929.10584008229873592706.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611-ddr_stats_-v5-0-24b16dd67c9c@oss.qualcomm.com>
References: <20250611-ddr_stats_-v5-0-24b16dd67c9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 11 Jun 2025 11:33:44 +0530, Maulik Shah wrote:
> This series adds support to read various DDR low power mode and frequency
> stats. This was added in past with series [1] but reverted with [4] due
> to some SoCs boot up failures. This series is more aligned to downstream
> implementation and fixes the issues mentioned in [4].
> 
> The series [1] tried to add three feature support
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: Add QMP handle for qcom_stats
      commit: 49b1c8df672a2a6229798e4f4088ce90ed44a103

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

