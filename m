Return-Path: <linux-arm-msm+bounces-78942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D07C0E60C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 63C8A500C21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9808F30EF85;
	Mon, 27 Oct 2025 14:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bsNpKT/D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED5030EF77;
	Mon, 27 Oct 2025 14:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761574002; cv=none; b=DP7taDzzCCIaDggSPI8dWXej1jnwhRM28FyJ/12ZehlsYfbb/2sQBFhHWKwaUTpwdLSub8D/zCZY+pDNel6xBQ4CmlakxEisSmVsDMgqDN1NaAFOysNyTkI+W3Ru6Wqn0yOfwO2lmrvfCo5CKsoPzD37UtbY5UDIBrDK3ZeZFSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761574002; c=relaxed/simple;
	bh=6TH2Gbvh6SW3Pgda9bzzqm5Xy3AgAl4VdduXoT0FBfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nQTjvhEXl7AmvscaZH0YGNE67hTr1v2qmqmyPeZW+JszqXb9od3jBpKstGmW9E3quLJ13tOnUyaUtFmXjDxMqSejcLp7pn2CKTSkqKAMry6zUiH2Yrqc6gc+BDBUX//0YzE6Fkt1mORy738NfJY6xxc6nKO/hsdIaUd9ylYw+U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsNpKT/D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0C4C4CEF1;
	Mon, 27 Oct 2025 14:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761574002;
	bh=6TH2Gbvh6SW3Pgda9bzzqm5Xy3AgAl4VdduXoT0FBfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bsNpKT/DUnXyriYCOGEWy8yXhQChZ7cfX6n4yfXM6O9hTk9R40qezrig2i86hpXCi
	 MtMf5V8SlisVtiO8DrTm6s2LUyVxRdxJuJ+4T1DFSo3JeFbQI2/fzlLrVMlRZeSSAQ
	 XqzdiCAzb62GABbjxTi/TgcMHRuiDgxamgZtQH8YyHVEae0JT6eA1X7gRtnP+jkbWu
	 dOyXlaA5QdUnnSdsQxFSIxC/VRrBSI+jdwO7Lo+KRE7GMQmRyTbVvjjyD9ArDSeNOv
	 7SXCzkcvLGAhi+MAh3QPn/VAkwFuGsYkVoX98WGHYj2TRgZhwfabYz06LVwVj/2iPZ
	 f1KAK54CdHdrA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-sm8750: Add a new frequency for sdcc2 clock
Date: Mon, 27 Oct 2025 09:09:15 -0500
Message-ID: <176157405449.8818.11802937362959853728.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924-sm8750_gcc_sdcc2_frequency-v1-1-541fd321125f@oss.qualcomm.com>
References: <20250924-sm8750_gcc_sdcc2_frequency-v1-1-541fd321125f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 Sep 2025 00:08:30 +0530, Taniya Das wrote:
> The SD card support requires a 37.5MHz clock; add it to the frequency
> list for the storage SW driver to be able to request for the frequency.
> 
> 

Applied, thanks!

[1/1] clk: qcom: gcc-sm8750: Add a new frequency for sdcc2 clock
      commit: 393f7834cd2b1eaf4a9eff2701e706e73e660dd7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

