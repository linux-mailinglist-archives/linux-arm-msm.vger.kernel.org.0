Return-Path: <linux-arm-msm+bounces-34638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B82A9A1446
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 22:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C44A2282936
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 20:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2992221832F;
	Wed, 16 Oct 2024 20:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6KqztLa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3671218326;
	Wed, 16 Oct 2024 20:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729111363; cv=none; b=uOyZ9YveygOgsrXvIOVvkjd53m2BGW5tEcgvHcMoLmkKTnx9lhfdjmNm0w3oswNCdUMwP3kL3y1noOpJsp+AvNLCwfMQOw+iRl0mIFkQYh/uky9CgRbOT8OmI2dmLVDkbs/4MLXLropBqabGLH0Nn0pI4H2Z7M1lLRjAkskSsZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729111363; c=relaxed/simple;
	bh=xrcHJotXkW6+apfYIXWbfsGkJssZ2jj2GI/l7hlvH1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f+mAzwkO5vI0xGpnFRhSNjyg9c72dQP/ywWW2MXUM2csUH/GAjbxJNT4mNJxPE1h/zJfa3g00yrCI0hJXUicqswgYDNDnDIk8iBgbdhOsspJxvXqCzi+zttt9Pss2ZIdbL63sE1rXPOPmxScYDEG/71fQZ6pWffHe34AF2ZitPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6KqztLa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C65C4CECF;
	Wed, 16 Oct 2024 20:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729111362;
	bh=xrcHJotXkW6+apfYIXWbfsGkJssZ2jj2GI/l7hlvH1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N6KqztLapAj49Nee8Te29cfRI+VHZQzVBjKbFOPJq8IyU5BbeNp7CTAVkCmxLhMVC
	 9P175qYSJa9qHcWdca//MEaGT8esqvuR+p4V6Dwk/BtQuxobmeqjB2DmEjywrL0u6h
	 0Bjn/lYjfq2xphUqfWqRPPFieGrSTM9cMXhE7ukofZBWjiBFewYsKTRXfKSQbLZDfT
	 +mMEkhBwCeoZ76eegyokWi+MyoGjg71wZBWIehADBbGhPdLQfRKRPjwS9cM+FxJBC3
	 E2vgALmuMmWGBzhR15H+XAA0SQoqCbCzbNg3/Pci9iiZTIgnWjIIc8kUPBEwHMsel5
	 PfRvSzbvgK42w==
From: Bjorn Andersson <andersson@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH] clk: qcom: videocc-sm8350: use HW_CTRL_TRIGGER for vcodec GDSCs
Date: Wed, 16 Oct 2024 15:42:29 -0500
Message-ID: <172911112238.3304.13650194719684727274.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240901093024.18841-1-johan+linaro@kernel.org>
References: <20240901093024.18841-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 01 Sep 2024 11:30:24 +0200, Johan Hovold wrote:
> A recent change in the venus driver results in a stuck clock on the
> Lenovo ThinkPad X13s, for example, when streaming video in firefox:
> 
> 	video_cc_mvs0_clk status stuck at 'off'
> 	WARNING: CPU: 6 PID: 2885 at drivers/clk/qcom/clk-branch.c:87 clk_branch_wait+0x144/0x15c
> 	...
> 	Call trace:
> 	 clk_branch_wait+0x144/0x15c
> 	 clk_branch2_enable+0x30/0x40
> 	 clk_core_enable+0xd8/0x29c
> 	 clk_enable+0x2c/0x4c
> 	 vcodec_clks_enable.isra.0+0x94/0xd8 [venus_core]
> 	 coreid_power_v4+0x464/0x628 [venus_core]
> 	 vdec_start_streaming+0xc4/0x510 [venus_dec]
> 	 vb2_start_streaming+0x6c/0x180 [videobuf2_common]
> 	 vb2_core_streamon+0x120/0x1dc [videobuf2_common]
> 	 vb2_streamon+0x1c/0x6c [videobuf2_v4l2]
> 	 v4l2_m2m_ioctl_streamon+0x30/0x80 [v4l2_mem2mem]
> 	 v4l_streamon+0x24/0x30 [videodev]
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: videocc-sm8350: use HW_CTRL_TRIGGER for vcodec GDSCs
      commit: f903663a8dcd6e1656e52856afbf706cc14cbe6d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

