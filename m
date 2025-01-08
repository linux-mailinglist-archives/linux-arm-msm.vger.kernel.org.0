Return-Path: <linux-arm-msm+bounces-44301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D631FA05241
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 05:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7774A1889812
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 04:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3711A9B38;
	Wed,  8 Jan 2025 04:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FT9V4wBO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93481A9B29;
	Wed,  8 Jan 2025 04:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736311437; cv=none; b=lCx6TjLFAvrU+kRJqPcdcKglsJpy8RfKYDrrZ17PRP2/vrfKtWSy7kHX06qY+0P6IlLcZOi0w2TfDFTahLKhXNBirPR3JOL8ZnwhZHG9n8Im9iQmg01e15h8w22X84Qqdyuh5kOJy5/OFlXSMNtcvd4wZ0GwTDV6PHyzVEBy6QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736311437; c=relaxed/simple;
	bh=bWk0N/iUuUmPksh/fczOo0wVV/WukZ+Ms8pDNiaGQZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sBVInowThbjycyts52RXmhzyNKDdbxqVmRzm4FckGF831T6BuXCIdfRJ2LXN80M3trInTq/WxezAFRAVbYd6s+6WfZmrlEaywNDGov5LfU8mVw3wTiduDaBufYXcLxAKjYGW86I5t8OpDr250T24zdi3k2ca8hZd5wth+9iCrxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FT9V4wBO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE28C4CEE2;
	Wed,  8 Jan 2025 04:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736311437;
	bh=bWk0N/iUuUmPksh/fczOo0wVV/WukZ+Ms8pDNiaGQZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FT9V4wBOcYKFm9ooYjuOUc5VUz92Sa4MO8GtMmeSlOGiU/eCZYC8h0ksHiggXR2oW
	 e/MkVeTSnekWnHo95vgdfpNDIZx2db1MaT3toMjKBAKuIFWG17KWygtuNeKcBut3E+
	 olEbW0fpP9BPIUIi189MEdux8LTT0tOJmB3SipqFCyUfek1tBEgl/IPWwatpy0bKTd
	 gP1Ib9gkgQ6IlyBrXF0BVqVjHG2vkkdvP0kUDMi7IVFOc1GlMeN4DMYEZ31z7mpli7
	 tbl1t9f/G4+3Wgj42foeKfwhn0C9Cp6Bb2jOSLj1Ug8IjhuDjn+4LT27RIJEuKDIGQ
	 55knD7HfJ5/og==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Xin Liu <quic_liuxin@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	quic_jiegan@quicinc.com,
	quic_aiquny@quicinc.com,
	quic_tingweiz@quicinc.com,
	quic_sayalil@quicinc.com
Subject: Re: (subset) [PATCH v4 0/3] Enable UFS on QCS615
Date: Tue,  7 Jan 2025 22:43:45 -0600
Message-ID: <173631142070.110881.10056360680137751835.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241216095439.531357-1-quic_liuxin@quicinc.com>
References: <20241216095439.531357-1-quic_liuxin@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 16 Dec 2024 17:54:36 +0800, Xin Liu wrote:
> From: Sayali Lokhande <quic_sayalil@quicinc.com>
> 
> Add UFS support to the QCS615 Ride platform. The UFS host controller and
> QMP UFS PHY hardware of QCS615 are derived from SM6115. Include the
> relevant binding documents accordingly. Additionally, configure UFS-related
> clock, power, and interconnect settings in the device tree.
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: qcs615: add UFS node
      commit: a6a9d10e796957aefbc4c8d53ed7673714e83b31
[3/3] arm64: dts: qcom: qcs615-ride: Enable UFS node
      commit: 4b120ef62ed653f4bc05e5f68832d2d2ac548b60

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

