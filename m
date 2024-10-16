Return-Path: <linux-arm-msm+bounces-34556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 025909A02CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 09:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B55D428994E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 07:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F651C4A10;
	Wed, 16 Oct 2024 07:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKqPdkhp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6DA1C3038;
	Wed, 16 Oct 2024 07:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729064383; cv=none; b=bvAV07WudR+dOY19F6NgN+GOU+E8nEHjvMcid+3vbsCIvazZ3TRiqEUceS/gXtfr0FcfPcDpCCPTOEQg9YDZq6qCZjUIg2zONp8/cixdaRyVsTcerrXifENuQqh4XLVQD9sn8TTV+cbhaO+X++BS7HJMSQU39hKmoPNH5FV1Vv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729064383; c=relaxed/simple;
	bh=JwlapJ+AcLRxc8DJk5lCV6cAs+f8NWoxtM5p0m6/BRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpXKKm3tWEZ4X+Y4y8fqfjoFEbi9nrBYj65b0bqWGI5qdAZYUvMbVX1A0/KiNbxEARWrlR2vZRnNnAqXLdMqe0LF+joHR+M7ogYtfgEN1gN5Zm9HQCNNlNZXkIuHsS3CiyRO6EqIm6yttL8H9m1YQ7Kf9b+WSacQ46u0Jllr38o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HKqPdkhp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21089C4CEC5;
	Wed, 16 Oct 2024 07:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729064383;
	bh=JwlapJ+AcLRxc8DJk5lCV6cAs+f8NWoxtM5p0m6/BRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HKqPdkhpzRULtlbjRsA7XfTRCuekD2rMTiiaBvAkSqyzeUwgvv4+G8cAuI0bw0LQB
	 DKHrIFd/nkQpKOeA/oTNyIQ/Yz/htcPwyHgSryWhstoFDIz4zrw/hTPQgIvlG8yZX8
	 luRmbhqcMxgazv1XrTBNtcu+sveCz5gYgFBLG1cg6iTY1xIuGI5Ygtdva49JpRM3g4
	 nI8ebQvaLXO5uNPp9zWxqhy3hF5R8ksBLIBRu6Hg4LwYv2yG0wPBT7BoUyugdESsh+
	 5RcHZ3ZECOr9di+xLIgMAc1v20+O4F0boi88wgZWCtA9BlLlRL+yfcGEi01gIR9NO7
	 VsA1864MI+FXQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t0ydJ-0000000065Y-2NWQ;
	Wed, 16 Oct 2024 09:39:49 +0200
Date: Wed, 16 Oct 2024 09:39:49 +0200
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH] clk: qcom: videocc-sm8350: use HW_CTRL_TRIGGER for
 vcodec GDSCs
Message-ID: <Zw9txV7gmWE5D8BE@hovoldconsulting.com>
References: <20240901093024.18841-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240901093024.18841-1-johan+linaro@kernel.org>

On Sun, Sep 01, 2024 at 11:30:24AM +0200, Johan Hovold wrote:
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
> using the out-of-tree sm8350/sc8280xp venus support. [1]
> 
> Update also the sm8350/sc8280xp GDSC definitions so that the hw control
> mode can be changed at runtime as the venus driver now requires.
> 
> Fixes: ec9a652e5149 ("venus: pm_helpers: Use dev_pm_genpd_set_hwmode to switch GDSC mode on V6")
> Link: https://lore.kernel.org/lkml/20230731-topic-8280_venus-v1-0-8c8bbe1983a5@linaro.org/ # [1]
> Cc: Jagadeesh Kona <quic_jkona@quicinc.com>
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

This one did not make it into 6.11 and should now be backported as well:

Cc: stable@vger.kernel.org	# 6.11

Bjorn, can you pick it up for 6.12-rc?

Johan

