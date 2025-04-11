Return-Path: <linux-arm-msm+bounces-53949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04564A8557A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 09:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 702D1189C98F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 07:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48752857D8;
	Fri, 11 Apr 2025 07:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7KDETyq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE8B27E1BA;
	Fri, 11 Apr 2025 07:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744356588; cv=none; b=uGEe6hip9Kd+3P9zbI5nHhfdqgNOc1RrIqpiws66wKc2nIYg3UVKRF37K71QBF01w4jOiNMQ6JRYE9fb6xF+xhnC5ehJwfXfWRvxqUsF0UPKUukZC0UEDWWBOFGwlRQ/GZRPEujV8nqEz+xEUk0Wbaigss69bcGkCkVljCACP08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744356588; c=relaxed/simple;
	bh=FpvFJBCNZeQwsrZwlHDgycSPFQVP2F3VGtux5Rvt/7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8e/8Bm0ggE/3q0E42qDtgNtFZmNJyvdjPuVvMQSo+OXXyYdHiTnBkMgWtz5cGd3CbDVeQfV+3o9mGiFtr95V7ywu8iPd2xgzmNW1egXRryC0f4zVh0BR3+qxJnAQ8gLHFOLv3HWfh+nm7gQWjozT2iZPdwxy2q9HtlHkR2LRuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7KDETyq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DDCC4CEE2;
	Fri, 11 Apr 2025 07:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744356588;
	bh=FpvFJBCNZeQwsrZwlHDgycSPFQVP2F3VGtux5Rvt/7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X7KDETyqBKkomQxqCqCT5fjZcfO0jb23vcPrDVG2sfYqceJ+FujzpC3NdTw+6+eH8
	 ymkaW9HwrpugRm1tkoiu4yyUCbdE6FFc9uyLC0Ghx+MzXCJ+yIldW9qrRB5ZQGc6cg
	 dTrVb61IvUc7ne+xSt6VbTT+bKA4Q6v6m1795KE38u8ULO4YsP9VGBOAFtcximuSaZ
	 ds4phx3rmrS8DodJf1vyl/Q4qBfPbu2EnvZX2GWhDM7BPZ37w3ljtnP/Grsp9trsg+
	 xCYkh7D5KkMbLl+Ao0NYtw6nK6MpFesNfCjGTR8zzzdJ/vbQnezh9J8wofR6ynMDVQ
	 ebSTpatkqc3IQ==
Date: Fri, 11 Apr 2025 12:59:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: kishon@kernel.org, p.zabel@pengutronix.de, dmitry.baryshkov@linaro.org,
	abel.vesa@linaro.org, quic_qianyu@quicinc.com,
	neil.armstrong@linaro.org, manivannan.sadhasivam@linaro.org,
	quic_devipriy@quicinc.com, konrad.dybcio@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] phy: qcom: qmp-pcie: Add PCIe PHY no_csr reset
 support
Message-ID: <Z/jE6FzW4MM98hgv@vaman>
References: <20250319094544.3980357-1-quic_wenbyao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319094544.3980357-1-quic_wenbyao@quicinc.com>

On 19-03-25, 17:45, Wenbin Yao wrote:
> The series aims to skip phy register programming and drive PCIe PHY with
> register setting programmed in bootloader by simply toggling no_csr reset,
> which once togglled, PHY hardware will be reset while PHY registers are
> retained.
> 
> First, determine whether PHY setting can be skipped by checking
> QPHY_START_CTRL register and the existence of nocsr reset. If it is
> programmed and no_csr reset is supported, do no_csr reset and skip BCR
> reset which will reset entire PHY.
> 
> This series also remove has_nocsr_reset flag in qmp_phy_cfg structure and
> decide whether the PHY supports nocsr reset by checking the existence of
> nocsr reset in device tree.
> 
> The series are tested on X1E80100-QCP and HDK8550.
> 
> The commit messages of this patchset have been modified based on comments
> and suggestions.

This does not apply for me on phy/next, pls rebase and resend

-- 
~Vinod

