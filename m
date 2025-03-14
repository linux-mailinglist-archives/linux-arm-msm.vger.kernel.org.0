Return-Path: <linux-arm-msm+bounces-51499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC98A61BCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:08:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D33667A6FA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304AD216399;
	Fri, 14 Mar 2025 20:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kv88ivhH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057E6215F6E;
	Fri, 14 Mar 2025 20:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982521; cv=none; b=m/eovm3m1ujNV6y9jSF5BfO/VKDe2uJttuA/CQzijgWlfKtu2UaN5zs6i144jNuknmDCCcZ7MlMKX9rrVJKFTkHMiI0un2T6hTmYGKbYPQUV0fA2V38XsQ06NIveHwpk7yzT2wLCHowdatMO/k6E/S2Iw6+eJk2UQCFTYOq0ScU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982521; c=relaxed/simple;
	bh=H+lIMIida1YPLKiqGQvJnGjwP8jxGk4Ha/Ca/iVClOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nFnOPUe0jtUIOCPpBQolDXsspQprmkuJGiKypMJ/x8rKW3QjwNV8dAlqS5sKPKB3eG2lD3uuHwjT6f0S89oMZhqt3PcMC0NMLnL3h3O6ZD5DyrxPDoBwSRFITRChScuLE5o4oBLMj+Ndnn+S0l1OlosY+pjYJxPDMJiI1Tmqpfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kv88ivhH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4B7C4CEF0;
	Fri, 14 Mar 2025 20:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982520;
	bh=H+lIMIida1YPLKiqGQvJnGjwP8jxGk4Ha/Ca/iVClOg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kv88ivhHPFjDHYwRtjNzfjKe7yUyTwpl+uYOYkP3wWrSb+tjKEAeWUOhLA/U6eILh
	 sJ+cRZC383+E1jKsNnvuRdLLXIT/JmwZMj4H/o/Q7z1/OZsF48HVu45Zgz/SGZtus1
	 jXtnEuSFi7H0aYIC5bqUDbJBMoPP/9n2CyhVTi0LYfcTFPX13H6JW3xlGcvaG1KqYb
	 YHxN9Zn9lhF+qMrI1+giCmplnFMOkxq6a/ik0NhpqBxE3xnYMYNCxxbmrdV+/6OO+b
	 oJFpmhjcGvIeED4kwI3QSjot8R2yj5AVG+60VHfTDZjShyte0VCR48fC6bJSuhRM6p
	 Khtfm0/8j+3FA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: qcom: gdsc: Update retain_ff sequence and timeout for GDSC
Date: Fri, 14 Mar 2025 15:01:13 -0500
Message-ID: <174198247873.1604753.9788641578266920775.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214-gdsc_fixes-v1-0-73e56d68a80f@quicinc.com>
References: <20250214-gdsc_fixes-v1-0-73e56d68a80f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 14 Feb 2025 09:56:58 +0530, Taniya Das wrote:
> The retain_ff bit should be updated for a GDSC when it is under SW
> control and ON. The current sequence needs to be fixed as the GDSC
> needs to update retention and is moved to HW control which does not
> guarantee the GDSC to be in enabled state.
> 
> During the GDSC FSM state, the GDSC hardware waits for an ACK and the
> timeout for the ACK is 2000us as per design requirements.
> 
> [...]

Applied, thanks!

[1/2] clk: qcom: gdsc: Set retain_ff before moving to HW CTRL
      commit: 25708f73ff171bb4171950c9f4be5aa8504b8459
[2/2] clk: qcom: gdsc: Update the status poll timeout for GDSC
      commit: 172320f5ead5d1a0eed14472ce84146221c75675

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

