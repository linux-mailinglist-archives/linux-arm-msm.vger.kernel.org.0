Return-Path: <linux-arm-msm+bounces-51621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74009A65255
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 15:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C98823B30E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 14:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303F223F438;
	Mon, 17 Mar 2025 14:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHDA0cUy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DE423E35D;
	Mon, 17 Mar 2025 14:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742220506; cv=none; b=q8ZSzoBA5y61CVLj3FJf63oNmLOszV+kHiEqaxN9Pm1djHW1k1ZP35+x3t+a2RwNC7EG9fOR44sWfbp/B+FKUZphtXLRK6Ok7ZYquKZ5yzW9Wq3F6knGsTbbJ8wjb0xgADqFOnRAipWOOvwxApwesEYxHikDAZlmbrhjZSpEXWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742220506; c=relaxed/simple;
	bh=FEPHIwDyK7Tr4mXhiKsjBTrxFWaEJhWGW9kE0joAnEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4dUaTOVLO8E3VMxGEjuRKH32XsfAS59J3dt+cvc2kzzP42enH5Zx/KKwYCpf+LTgyLn9GYNqRfmHs+qPiin99ZPLaRLdzaDpqYkaRudLeVh049gjeA7Lw4cfj4shBR7wj0Z7XGfuK1vUxVlMuXrq7YxKmMYfsxzmKUHIWrQ2Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IHDA0cUy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CEBFC4CEE3;
	Mon, 17 Mar 2025 14:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742220505;
	bh=FEPHIwDyK7Tr4mXhiKsjBTrxFWaEJhWGW9kE0joAnEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IHDA0cUyq4XAc4DX4FKFkAV+J5U7Vgze+OeF+RN+Rt9t8HKtTLr0usCZiG7B9lUX2
	 78RL7UkwQ6Ov8pRrumSCoWar33zkK0eKVIfpnJ/4M++v9DTmAF1beUrmZr4Y9hnmIj
	 j2Fo9wQGCb78kV7p4a+OOqe2+ZIoEj2A/B2+8zsoMReBtSGZBGTuB8WxOPz9wJ8T+n
	 eIvkXDMfzs613KUYOSzoh7/89JTYJIpZCcOZXtXcdeLfDZ/ggfSCiH2j+Il1Ly62of
	 ewmP9do4wnTyN2jHObK3NFFuhC1bYIpfo7uZhnHmNTgMZhXCwQfxB46a/k91jsq+IU
	 VunRAG9oVd/AQ==
Date: Mon, 17 Mar 2025 15:08:16 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, geert+renesas@glider.be, lumag@kernel.org, heiko@sntech.de, 
	biju.das.jz@bp.renesas.com, quic_tdas@quicinc.com, nfraprado@collabora.com, 
	elinor.montmasson@savoirfairelinux.com, ross.burton@arm.com, javier.carrasco@wolfvision.net, 
	ebiggers@google.com, quic_anusha@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, quic_varada@quicinc.com, 
	quic_srichara@quicinc.com
Subject: Re: [PATCH v12 4/6] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
Message-ID: <65gl7d6qd55xrdm3as3pnqevpmakin3k4jzyocehq7wq7565jj@x35t2inlykop>
References: <20250313110359.242491-1-quic_mmanikan@quicinc.com>
 <20250313110359.242491-5-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313110359.242491-5-quic_mmanikan@quicinc.com>

On Thu, Mar 13, 2025 at 04:33:57PM +0530, Manikanta Mylavarapu wrote:

> +static struct clk_rcg2 nss_cc_clc_clk_src = {
> +	.cmd_rcgr = 0x28604,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = nss_cc_parent_map_6,
> +	.freq_tbl = ftbl_nss_cc_clc_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "nss_cc_clc_clk_src",
> +		.parent_data = nss_cc_parent_data_6,
> +		.num_parents = ARRAY_SIZE(nss_cc_parent_data_6),
> +		.ops = &clk_rcg2_ops,
> +	},
> +};

This structure definition gets repeated many times in this driver,
with only slight changes. (This also happens in other qualcomm clock
drivers.)

Would it be possible to refactor it into a macro, to avoid the
insane code repetition?

Marek

