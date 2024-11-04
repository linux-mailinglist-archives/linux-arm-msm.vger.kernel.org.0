Return-Path: <linux-arm-msm+bounces-36872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF1E9BABCA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 05:16:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 270EC1F20F16
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 04:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AEAB1AA7B4;
	Mon,  4 Nov 2024 04:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sXdI98mi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D261AA7A2
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 04:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730693640; cv=none; b=nSZTQrdpREuU+42nalliy7c2B1vz22SIafzJGie2fjLn8e1nvOgdRctX4WUnukE8fbR/xRsTh7G/Q0z7WhL8A8pp6JZtSm+9MmMDd+UBBjAn2ahPtXOIUleExR5NJAX6z359kSZ/tghmdSaPNyE5Udkq6Tg/CctvLXROBB8frfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730693640; c=relaxed/simple;
	bh=INpEY8wcvBsJ8Jx/Cwwyoxkp2XDOjLy6fxyDUa3jdTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UMXdLkXIbJl2yXPMc6sOWbMeunGaNawDXLexx0V4juuJ1vb1xAe60Ux7v3ePDakE8RoML3/sAVF8PIOCxbo8ixo8w1bQiB1t5Lc8vDTOcrVg/6ztJvMkl1aHcTnfrkKH8QlE+edHfmPfBnl0t0vJnZzf0d777yVdi0dvdO1+Gsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sXdI98mi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84BF6C4CED2;
	Mon,  4 Nov 2024 04:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730693640;
	bh=INpEY8wcvBsJ8Jx/Cwwyoxkp2XDOjLy6fxyDUa3jdTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sXdI98midpimGyGBCzS9tIQIkeuxudwGFmriGX8YyhLArZErq6o153Py8D/un0txb
	 sc7bm5KuEPttghvVREjvaEKHWuCqG/fO0bryqp7Iv1T6o6LJFp2Ij3s/9HLhINHP0m
	 k6GHNmuwcUCuRv8qEZjkpWOA/uPjxEGeV3Kuyg288WEFpUXd4fqmKgjSmS5u5oIBtJ
	 BxPT5FAFZnsgIXG42L2YFjWTN9ElPXKZ61PRPibNORgE5m2KXfkEvoDbfkxsiNTh16
	 kBg38TMY4YaHdOvuTiOrCzOT0bDWBajk3jl5M2EQ4rLAAqelPc4TDfaXPV18BvUlUL
	 A7sDjNSrgLpgg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	linux-aspeed@lists.ozlabs.org,
	Zhang Zekun <zhangzekun11@huawei.com>
Cc: chenjun102@huawei.com
Subject: Re: (subset) [PATCH 0/4] Simplify code with dev_err_probe()
Date: Sun,  3 Nov 2024 22:13:46 -0600
Message-ID: <173069362370.23540.7771718939151529265.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240909122921.12627-1-zhangzekun11@huawei.com>
References: <20240909122921.12627-1-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 09 Sep 2024 20:29:17 +0800, Zhang Zekun wrote:
> Use dev_err_probe() to simplify code, and we can avoid judging
> if the error code is not equal to -EPROBE_DEFER
> 
> Zhang Zekun (4):
>   soc: qcom: rpmh-rsc: Simplify code with dev_err_probe()
>   soc: aspeed: Simplify code with dev_err_probe()
>   soc: qcom: smem: Simplify code with dev_err_probe()
>   soc: qcom: smp2p: Simplify code with dev_err_probe()
> 
> [...]

Applied, thanks!

[1/4] soc: qcom: rpmh-rsc: Simplify code with dev_err_probe()
      commit: 454381b5236c22ff5995aab5db4f640d34f9ea98
[3/4] soc: qcom: smem: Simplify code with dev_err_probe()
      commit: 876b405004842b10a684f06f967502d20d64384f
[4/4] soc: qcom: smp2p: Simplify code with dev_err_probe()
      commit: cd8ec43758a5ca91c5503d1cde2df95e05b968ca

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

