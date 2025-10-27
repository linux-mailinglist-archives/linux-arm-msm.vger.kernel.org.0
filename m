Return-Path: <linux-arm-msm+bounces-79048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C142C11CEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7519E5658B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11B6343207;
	Mon, 27 Oct 2025 22:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDdycJC8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6CB3431F2;
	Mon, 27 Oct 2025 22:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604516; cv=none; b=Vxt0WBswkzSrjawnbUPSTB3MZVYKAwJEbn/qpUE+Gre9fz2uiG7kPV75HWDXImeH/SnOOtKOoADCXcDfrwwJpsOLwCOBcOQix9Q6gnsvzFlgx71wEcHC+yKlFmwWFdMcTCfwnZWDCr0I+neXpHUO6oCdL9A3Zd6p2CsUr0MIuQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604516; c=relaxed/simple;
	bh=f5JyND1iZERpNMqOTyNPKRhwmnoEKCl56MPsiCT9H34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QBGmVgGJH+u8q814xquXj0uYWxzrKG3gBarFzh317enWUjubXkfrMGFJEw1DHBuArd8cSasAT5uRuLM3cRDyAKDA3pMDGadBkFtfPEnimwHedq7knxaR08ChpG6VveQMWn4zQ8DRC5X/IpkiWlYS2dLTkEb6HKCn4/5g+f47VD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDdycJC8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6913FC4CEF1;
	Mon, 27 Oct 2025 22:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604516;
	bh=f5JyND1iZERpNMqOTyNPKRhwmnoEKCl56MPsiCT9H34=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nDdycJC8h5VyIOkbP0l6+z116B9fdwFm3z773OPkKw9JkGnhbRKGzjF8sdB8ZWM/0
	 t7UdAAXEBBAZ7bicHsVMAS0d2isBib04Fmx6W9cl+5Q0RtqAtjof4S7QI5KezAoNF5
	 5CLu6d3TjOL1sEE242OQdW7t4hI88fjG/5i7qM/zvyfAXiGy8GeHcrPuw5swnV/Krr
	 XCr+1ZVIOKqY+SX/S+OOeV/IrVNazJXxkJW2eZjhN0165kvBUJOce81bAiWVc1NyW0
	 /I1nsBvx6OFgRRdQ2x41HJzsAY1okZCpXTKAIbQdUnv5Ty88iK3AqY5aIOuFS8HPxf
	 27Xm1kI6ZRoGA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] Add MDSS_CORE reset for SM6350 MDSS
Date: Mon, 27 Oct 2025 17:37:09 -0500
Message-ID: <176160465186.73268.14240222712087541285.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
References: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 19 Sep 2025 11:57:22 +0200, Luca Weiss wrote:
> With v6.17-rc kernel, the display stack needs reference to the
> MDSS_CORE, otherwise display init becomes quite broken.
> 
> Add the resets into the dispcc driver and add a reference to the dts.
> 
> 

Applied, thanks!

[3/3] arm64: dts: qcom: sm6350: Add MDSS_CORE reset to mdss
      commit: f618fef3f1a97395f73d028d925b021b0b204bea

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

