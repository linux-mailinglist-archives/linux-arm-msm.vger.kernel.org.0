Return-Path: <linux-arm-msm+bounces-44272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EEDA05071
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 03:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9F6A188521D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 02:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44AB81A8401;
	Wed,  8 Jan 2025 02:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pNrGV3WN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6261A83F2;
	Wed,  8 Jan 2025 02:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736302404; cv=none; b=s6ECJ8ip2amta2qcR3RdF+uvC8jzoNjztNFQFb/OZKVPbLhJ6DrygT5CrU5EMg+LPE0bw8tscJgwMvUTealBFpnCWI+2lqL4WqBO428QguT/2FFUoWuuUXWmZ3EieqS/XsvaGRUECoqAIbEAgEYki7qH/Nagg3jB3MiVPLP3Ct8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736302404; c=relaxed/simple;
	bh=2z3GC/lH58ciwNrcR5bwiJexgKFhAtymvWOzkfarNWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PSFldOCvoUdgP0J1A14mIRcatZlK39t4fFydaIC87MXz6XUojMoeywKt3bJZW64/fkVWloc/1YwwXzvQVNMh56zA/UNF4Dpk9m8L5X42hS//9+OgfK0qaaGbifMsZ1khyP/JX8+zhCVdfVIQoChIBjdskX263rFCte+/Me1Mseg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pNrGV3WN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22ABBC4CEE0;
	Wed,  8 Jan 2025 02:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736302403;
	bh=2z3GC/lH58ciwNrcR5bwiJexgKFhAtymvWOzkfarNWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pNrGV3WNpnETSiIE2zBUqIZbFUxohYvFMcYSgJHuHF3JVxz714b2Iwl7PO3Kvw0Td
	 qqh3A7SK5wbhkzpx64/bhfDkjzb856DzYWH2Prt65utTrPd6EKerppsvmyxz4L+/zT
	 OWElU+BNJ0ek3cGClEylbDpYYpN4oWGeLSkUpUHFSyQxmn3s8RIIq+eYEVamXpurf+
	 +yGFAy5HWsCG/y/eCuOljyQ47XBkAr9zL+LHzoQf3I5nT0YeaXnJZJCEFR47NEv+UC
	 hU5jwF7wqVvvm1uQyq0/BJkttXLyRwyHz8vAsi8b9BNO/siSvbxzHu9ntVIO0TjDKx
	 2ayjx6tFBMCBg==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Amit Pundir <amit.pundir@linaro.org>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND] clk: qcom: gcc-sdm845: Do not use shared clk_ops for QUPs
Date: Tue,  7 Jan 2025 20:13:14 -0600
Message-ID: <173630239537.95965.15555715821539127766.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209174912.2526928-1-amit.pundir@linaro.org>
References: <20241209174912.2526928-1-amit.pundir@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 09 Dec 2024 23:19:12 +0530, Amit Pundir wrote:
> Similar to the earlier fixes meant for sm8x50 and x1e platforms,
> we have to stop using the shared clk ops for sdm845 QUPs as well.
> 
> As Stephen Boyd pointed out in earlier fixes, there wasn't a problem
> to mark QUP clks shared until we started parking shared RCGs at clk
> registration time in commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs
> upon registration"). Parking at init is actually harmful to the UART
> when earlycon is used. If the device is pumping out data while the
> frequency changes and we see garbage on the serial console until the
> driver can probe and actually set a proper frequency.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-sdm845: Do not use shared clk_ops for QUPs
      commit: f760a4bb5e927a133dcd75f7b69ccae2a331e42c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

