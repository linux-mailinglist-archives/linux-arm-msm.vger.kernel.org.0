Return-Path: <linux-arm-msm+bounces-71452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33796B3EEE2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CBB81B21C97
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5419C3451B9;
	Mon,  1 Sep 2025 19:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWfyx/5d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D5E3451AF;
	Mon,  1 Sep 2025 19:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756756159; cv=none; b=oz8Hw9O+vb5RBEvpJjJesbLXJMG3TKLigPvPvPtND9lvZL/dCM1ARfWIhcUATgc2mPRfvbpIodcr4gdddmrNk6uDhqs6bRKASwnumHbQim3/JgTa11L2nMQFmOusAc8XyYk0hRW3UuUZMEyfZMuzyBdsP9gpmahT9Nun5YR0mWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756756159; c=relaxed/simple;
	bh=ZN/ppOdjDpHG1KpD8/k+wK1lpyaUN8xko/dNbf++riU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dl8KQ07osGs5gebo5vp2iPF7wneDr/VYAyys3ujnsAcKrSR6Ivt1hWV++VWiEjjGQbgPSD+U16f5dA3Js7Uzg6L1jO23VRfTFcHSOf3TYU1xmUjjJDiqPnN9m59yRCS4Kz+tHbXeMqekbaU5sQ0xZ/NEUnMcDQHuFzWhrpGP+1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWfyx/5d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27007C4CEF0;
	Mon,  1 Sep 2025 19:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756756158;
	bh=ZN/ppOdjDpHG1KpD8/k+wK1lpyaUN8xko/dNbf++riU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MWfyx/5d1FAqM9Wau9RxAevzceJgUWDtuvI9Mg2pExch1pswCgLIEvzDewshrTxqE
	 wYmWVYZSzNhzllgPrQrFitOICjWqmKMXEEWNh6y8XA7DRLYlmdPHfg0HFgNlvvkuu4
	 f1aZ5gRDEGfHx92EjkJMcfUkzC/m43mhbfkJyvHmd/RyCWsXcKkgOiDmhbNxUx5I4q
	 BdJAdYE8ZhM9TmjVu51RkMlWEowC511STCO23xpeg5aq9t/2ipQtUtTmJ/R6CizEVP
	 nkrxvUeJO7oBnd/0RYQDtV0ehF5f+4IUIa4u7z7QNTL97iLet/isS8uu2i/VU002lp
	 5ShdOSl+zqCyQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Unconditionally clear _TRIGGER bit for TCS
Date: Mon,  1 Sep 2025 14:49:14 -0500
Message-ID: <175675615148.1797303.17001643527034579572.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250825-rpmh_rsc_change-v1-1-138202c31bf6@oss.qualcomm.com>
References: <20250825-rpmh_rsc_change-v1-1-138202c31bf6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 25 Aug 2025 11:53:50 +0530, Sneh Mankad wrote:
> Unconditionally clear the TCS_AMC_MODE_TRIGGER bit when a
> transaction completes. Previously this bit was only cleared when
> a wake TCS was borrowed as an AMC TCS but not for dedicated
> AMC TCS. Leaving this bit set for AMC TCS and entering deeper low
> power modes can generate a false completion IRQ.
> 
> Prevent this scenario by always clearing the TCS_AMC_MODE_TRIGGER
> bit upon receiving a completion IRQ.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: rpmh-rsc: Unconditionally clear _TRIGGER bit for TCS
      commit: f87412d18edb5b8393eb8cb1c2d4a54f90185a21

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

