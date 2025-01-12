Return-Path: <linux-arm-msm+bounces-44816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD79A0A6EE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jan 2025 03:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D54703A2329
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jan 2025 02:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C55D2FB;
	Sun, 12 Jan 2025 02:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+UWA78p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A758F58;
	Sun, 12 Jan 2025 02:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736647738; cv=none; b=ClSnTvQ1aNLZubM3mGQ07jjpH19VQN2QP/Rr7rDkGqbyGk1nK4MIyGzPVu5r1K+E+nqaBFEvEo/PNonLCmF56H2pa1gQMrd3xJk7KOqAzxrLbQMDZSI7YcliRLrdZPEY+URvQZlngwPJ42Sd1tp+HhbpaqeRoap233a+25+fj2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736647738; c=relaxed/simple;
	bh=0F2rvgq/BKFd5UaczbZcAh3F2vQ7HBPh4uTynCA4XKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nLhKELWLqUJxZDDIgvGBSm0dcKHOa4JqGYR2oD5DFTczS/POGLUcDvdCChZdDvxtZrUktP0jO0e6aKS/LaNqPBjUNkEOlQl7SyxoMmYNmHxz+1CHptL1HVoX5ZNSwcfrGoCzIK9Z9l26Aeqn8CylNE1ZvX8XAP6Sqqw/3sBYjvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+UWA78p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8DCC4CED2;
	Sun, 12 Jan 2025 02:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736647737;
	bh=0F2rvgq/BKFd5UaczbZcAh3F2vQ7HBPh4uTynCA4XKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T+UWA78pkOaSKpwlYYzOfZ6Ma0uYnsDy1rhPzU3bNqJii2NrT+chbdo74Z38NrUdJ
	 a+Az68ZA1lNCrUI/u5CUiSvewkNgDzFuq9W5/BYjMxZE5t6IKPjgCOBZY2II0RUxX2
	 cY1LvJ6epqrylvklu49URY8BzG/It7kq4M3I4BhJpO9RG9FvCC2q1AG5nBYl/myXjc
	 w4e+CuC371sF0rGRYxoIfhBppNhLNo8FCAWUJaR+p/BxZXB03dpEQKroaToLcQgB12
	 g1MmSreP7eB9IlQuC5ByuPYuyMNejp+bX+w1AH3e2UM85ttdx9PKbmajIlI5w8PP0q
	 ta7mZiL8KsyCA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/2] Some X1 fixups for sleep
Date: Sat, 11 Jan 2025 20:08:51 -0600
Message-ID: <173664772972.450688.14775128843894191949.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250111-topic-x1e_fixups-v1-0-77dc39237c12@oss.qualcomm.com>
References: <20250111-topic-x1e_fixups-v1-0-77dc39237c12@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 11 Jan 2025 17:54:17 +0100, Konrad Dybcio wrote:
> Found some trivial things that need fixing, with patch 1 specifically
> the GPU is once again functional without clk_ignore_unused.
> 
> This series DOES NOT fix all the issues related to sleep, but solves
> real bugs that prevent us from achieving it.
> 
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: x1e80100: Set CPU interconnect paths as ACTIVE_ONLY
      commit: d11a787f391f76b6a64a070f2386f69f2c9c9010

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

