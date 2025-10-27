Return-Path: <linux-arm-msm+bounces-78934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA19C0E540
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9213C4FF3CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7928E309EF3;
	Mon, 27 Oct 2025 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fiGNjAcL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB5C3093CB;
	Mon, 27 Oct 2025 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761573992; cv=none; b=XNaho+CEBLT1kunpkod0ThUbrfeynPAwkdvei7R64m8tq+XQjRRKF/J6bOvpeX7zEuWGX7d5LQ2zLVSwusrqhf43htK5wjgq4R/PlQ2TceUqVKApjAKJdDY2iatGpef8RPEB+yq8AU+O22j6crm0fk/6K9HEYvFRbcAR0QiJNqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761573992; c=relaxed/simple;
	bh=Wn/4Q/6QncFnmsBFjs2JghWPE+g8DTPLpfr8ewaC1Io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TnbbCyJALF2hYASr0IpxhqhL4cpa9RgKX4XnZNj47Tz6Y28mXVhEyQ9l7agrH5uctdtYa2XBUaWJwDQac0Ijvy8H4Io2+IP0pz4Aw2UROx1L+egn0r8Q+Wt32iFGTRW+ubXS+NSruc/Bu/QWhIPgLNdIhxnh5qf7O5o1TOJKAaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fiGNjAcL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B23C116D0;
	Mon, 27 Oct 2025 14:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761573992;
	bh=Wn/4Q/6QncFnmsBFjs2JghWPE+g8DTPLpfr8ewaC1Io=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fiGNjAcLSpQMgxa3zzktJeg7O8HX0fY1myYInqW9qQyx6bCuC8LE46wDKbLUunrzK
	 1IPigFZSeT0V0lzSuHcmTw647UtjPffBwlJbnpz6ShLX+tT5tMmepU55WWJsl4z+O3
	 27dsBo2dcGGFdU47Iu9Z65DwqTdQ3aOvRGiD+oO77yQAoWSvwZ5p7AELthkj5cr6dx
	 XgD+giWzztf6E+1+cNeFgGUfLHl1f5JRoSKLOMnEtvptE+6+DLAN1oQ8wVo/N6X0Ag
	 /1LzsP7eowc4Gth8BxP+p+lPgdQO5mPjSNZHeNXaNJqOKAkO7Eos0NsEpL2tzA9q9o
	 1yOfISy3FtbYg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] Drop unused USB4 master clock frequencies
Date: Mon, 27 Oct 2025 09:09:07 -0500
Message-ID: <176157405454.8818.14234880012578642796.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010-topic-gcc_usb4_unused_freq-v1-0-4be5e77d2307@oss.qualcomm.com>
References: <20251010-topic-gcc_usb4_unused_freq-v1-0-4be5e77d2307@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 10 Oct 2025 12:24:49 +0200, Konrad Dybcio wrote:
> The lowest frequency remains unused in practice across the board,
> remove it from the frequency tables to reduce confusion (both user and
> possibly software..).
> 
> 

Applied, thanks!

[1/3] clk: qcom: gcc-sc8280xp: Remove 85.71 MHz USB4 master clock frequency
      commit: 205a5d29b47ecd6ffbc53b02a3952684d6720fd7
[2/3] clk: qcom: gcc-x1e80100: Remove 85.71 MHz USB4 master clock frequency
      commit: 54e5da4d1fbccf03042de1ecfa33987e2ff80268
[3/3] clk: qcom: gcc-glymur: Remove 85.71 MHz USB4 master clock frequency
      commit: 5e26bb2a17789754e44aec2519fa719bd1fc04e0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

