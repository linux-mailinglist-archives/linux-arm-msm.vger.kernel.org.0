Return-Path: <linux-arm-msm+bounces-51638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 335BFA65986
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 18:05:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5732E7A3510
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 17:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307D61A5B9C;
	Mon, 17 Mar 2025 17:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfoKHWtw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18FF176FB0;
	Mon, 17 Mar 2025 17:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231058; cv=none; b=b6b3cwUBF06S60k+Bud5LWRLR6yFLGKQPjEk5Eoc0fBaA6vSeSLefEW/kaTKuY5K+MGKMKYGNuEOT5xn+ItgbSyKYLX50B+jlHlt0PFG389+7IMF39zlaPT8qTYKpH8zsdRJN8Zr59Y6oFZpThq2bXLvnxWCCeP/vGPJ49g9l/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231058; c=relaxed/simple;
	bh=+0Yok0f4BvfhWWxYAciYqdDpMnOmtFLo3n6+UuKVRgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ui/SswNE3BMIPtnAXBI2ylKPeUsNyEO1xI/BNKNlxGZwsQHXgTmWuNPTaAY86VesWhb0Pcwj2BxhNhVqbTM6N+ymY/EFKsNtiROjM3DW+7SfWxcVKU8BjO1uJQCek13ukNXllgHClJV4rB7R60A63DBUjT2/g8TaFZb1tiWepgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfoKHWtw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954E4C4CEE3;
	Mon, 17 Mar 2025 17:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742231057;
	bh=+0Yok0f4BvfhWWxYAciYqdDpMnOmtFLo3n6+UuKVRgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kfoKHWtwnkmFbMNWJlgQddRElUpFQ964Egvhgn+4DBOHbw1x1hxBwBOWIpdr+V6gN
	 +uXysXkEPYgBcnny+7t2souzVBkzw+MFZBgzpDT5SRIJEsBQWwz+263CKI5GX5FbFi
	 Q82LTP7hXXc+GlW+P2OVgkhvJRTih6XF99NJ1OeivS8Q5sDJMIaSwG2Xm8NYBYcxiV
	 a2Y6T5tgWCJwrJA5yl4uznPRdi9Xt0AWMf3Dm2oqYgXTG3xBvSpV6dRV7rQK9wD80u
	 7PpD8CCA4gxsVOFgUus5fGj6hgwq8DtZcQFoe4yNY0RdViWTHwXu/wLAzN6vX9yh/g
	 6LJPH6HCIcDFw==
From: Bjorn Andersson <andersson@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com,
	geert+renesas@glider.be,
	lumag@kernel.org,
	heiko@sntech.de,
	biju.das.jz@bp.renesas.com,
	quic_tdas@quicinc.com,
	nfraprado@collabora.com,
	elinor.montmasson@savoirfairelinux.com,
	ross.burton@arm.com,
	javier.carrasco@wolfvision.net,
	ebiggers@google.com,
	quic_anusha@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: quic_varada@quicinc.com,
	quic_srichara@quicinc.com
Subject: Re: (subset) [PATCH v12 0/6] Add NSS clock controller support for IPQ9574
Date: Mon, 17 Mar 2025 12:04:13 -0500
Message-ID: <174223105141.2000272.10352611755097062716.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313110359.242491-1-quic_mmanikan@quicinc.com>
References: <20250313110359.242491-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 13 Mar 2025 16:33:53 +0530, Manikanta Mylavarapu wrote:
> Add bindings, driver and devicetree node for networking sub system clock
> controller on IPQ9574. Also add support for gpll0_out_aux clock
> which serves as the parent for some nss clocks.
> 
> Changes in V12:
> 	- nsscc driver
> 		- Pick up R-b tag.
> 	- dtsi
> 		- Pick up R-b tag.
> 	- defconfig
> 		- Pick up R-b tag.
> 	- Rebased on linux-next tip.
> 
> [...]

Applied, thanks!

[6/6] arm64: defconfig: Build NSS Clock Controller driver for IPQ9574
      commit: 95204a95fd9657ffbd3f3c4a726e458833e4213d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

