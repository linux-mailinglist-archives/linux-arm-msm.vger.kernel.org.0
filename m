Return-Path: <linux-arm-msm+bounces-44303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D926A0524E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 05:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34D341889894
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 04:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3191A00D1;
	Wed,  8 Jan 2025 04:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZdxK6D5e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE1A2594A1;
	Wed,  8 Jan 2025 04:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736311671; cv=none; b=f3pgdrnsRK8FIhd7xVW4jLHsERjcaD9sGLpFbphPdm1ro/x9MFIDBJdc9fRJXH4bcTEwfVWocH7NqMxxnoscLrq8HETB0w0LSn9LL9wNTe9TNMURVPRyljiMTnItY87yC2BMJFRKzyEwD0FznSDVZR8W1Fq8I2677RTeoZt5xis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736311671; c=relaxed/simple;
	bh=ypsb/ZZ4QFXncumZoivAJu+ebUwuEjPNhMmDVNqVeSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XpkmYfGloQN+Rwq2C2dAsgiJ28B3Px1fDUzi6hxxEV50Ljy66SEJhRumz9y84cR9hbP123aFMMhTd9JxUMaM1H1CaA5wD8ehrChyzgNZMXZTAowhimEiNLyyjwceKrWwYyi/28dTmBJ1hmW2uw3Io6lT5pDu4yKfcq+fAd/3Kb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZdxK6D5e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3B6C4CEDD;
	Wed,  8 Jan 2025 04:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736311670;
	bh=ypsb/ZZ4QFXncumZoivAJu+ebUwuEjPNhMmDVNqVeSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZdxK6D5eFpCTaHfKzbbXlmy+VjG+/VSTysvhXs2pbrg0nnEgOMSfqxAni4UPelAnL
	 MYG2+F3FbKOu4v+6BeCTEG4PJp+lmeQnFNeFnlMPnjMlHzfkFAz4st1BpRD63AE9bh
	 9GM3Rtq4hpZ1sKpfiE8e/wlnqYCfxrfgYMw++YIPDP2VZ3tXsExwsJm6DQj9QGojyS
	 CFiKv9ZF1eRNMvIcdnYDlCQMKl6YdhR+dXPBgck5O4NdfXCETTDfx8qpbtvZ+MqbNW
	 sw/59RStnE8egtYQCTY8lbw9LMzMTKmgWKEV/ejUwSnbcEWb/nngBHW/JHQqzy+5lo
	 Wf7wT/zdoDObg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Lukas Bulwahn <lbulwahn@redhat.com>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] clk: qcom: Select CLK_X1E80100_GCC in config CLK_X1P42100_GPUCC
Date: Tue,  7 Jan 2025 22:47:47 -0600
Message-ID: <173631166534.112242.4954341816323781467.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107104728.23098-1-lukas.bulwahn@redhat.com>
References: <20250107104728.23098-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 07 Jan 2025 11:47:28 +0100, Lukas Bulwahn wrote:
> Commit 99c21c7ca642 ("clk: qcom: Add X1P42100 GPUCC driver") adds the
> config definition CLK_X1P42100_GPUCC. This config definition selects the
> non-existing config CLK_X1E8010_GCC. Note that the config for the X1E80100
> Global Clock Controller is CLK_X1E80100_GCC.
> 
> Assuming this was just a minor typo in the number, i.e., 8010 instead of
> 80100, change the definition to select the existing config
> CLK_X1E80100_GCC, similarly to the definitions for three configs
> CLK_X1E80100_{CAMCC,DISPCC,GPUCC}.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: Select CLK_X1E80100_GCC in config CLK_X1P42100_GPUCC
      commit: 5e419033b5cb20f9150bfec15dc6cdf10049e654

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

