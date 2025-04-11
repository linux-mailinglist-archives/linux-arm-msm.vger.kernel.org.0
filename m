Return-Path: <linux-arm-msm+bounces-54013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01856A85CA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 14:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 056C44A689A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C1629DB6E;
	Fri, 11 Apr 2025 12:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gx+YEbdM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FAB29344B;
	Fri, 11 Apr 2025 12:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373468; cv=none; b=Luhkg54AKeEE6p44UunREU1RQnJLHEWacoF7MpbXi/AvcKe9XUIZe410TWcxNAnS2Bvns45l+t9bctTIxqjGqrl/FoyMwTSy6sSdpdRxvOS7LtDtTbE0+4el1wFR6kDKcIJceuDKDy+xYbL0hw56McYbmOitu+QCmpeGHpetpf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373468; c=relaxed/simple;
	bh=d+FLiWuinx/mnrMg1djQFjn220kbb6rhpINiatKBBLA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qPtTZXtvNb1OYfOL0tdysg+Pi4rHvuYa4ZWVD29DXlpke8z9AxYI7sPKytbmbrgzQ8ZEHYDPOSWdCSQMIQxNBK4SYfRMBBctcRYCYcaqpg3yDZ0x17+6CHtHkVtD6/MoLahipbhXKFShvgIBcu+pInRBR2ImA4eMtyRa7rg6Vc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gx+YEbdM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDF1C4CEE2;
	Fri, 11 Apr 2025 12:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744373468;
	bh=d+FLiWuinx/mnrMg1djQFjn220kbb6rhpINiatKBBLA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gx+YEbdMFS3jQ3nJQJAkyi7Q6MKRLcUIyVT96m3Tpp6fTNCHVQsqKRdTyJIbF3JW5
	 W/K8IstBhsDJPWKFat640JKteq+vINh8/ee/PvKVr29MOxDAwneKsfF6PvZJTw744p
	 gJshN5dI7YngxelyDks/Wvx4Jn3IFswA067NQweRE658r9WJeYCa252GwO1fz5Zc0q
	 wCWoGJTxe/b2uVTCM7YRZwSO7+KyfnFIB7rAL6ngTwmINeLIPXFZQK/8JLv833Hk3p
	 llPLLOcCrgmX456j8uz0T7Lg9X3c6K4NV9yR/coVss3tDoqdcpXyLvdpQvazFA7vg6
	 yEss+5665JJ+w==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, p.zabel@pengutronix.de, abel.vesa@linaro.org, 
 quic_qianyu@quicinc.com, neil.armstrong@linaro.org, 
 manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com, 
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <lumag@kernel.org>, Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com, 
 quic_mrana@quicinc.com, quic_cang@quicinc.com
In-Reply-To: <20250411113120.651363-1-quic_wenbyao@quicinc.com>
References: <20250411113120.651363-1-quic_wenbyao@quicinc.com>
Subject: Re: [PATCH v7 0/2] phy: qcom: qmp-pcie: Add PCIe PHY no_csr reset
 support
Message-Id: <174437346409.673939.2537740696548096560.b4-ty@kernel.org>
Date: Fri, 11 Apr 2025 17:41:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 11 Apr 2025 19:31:18 +0800, Wenbin Yao wrote:
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
> [...]

Applied, thanks!

[1/2] phy: qcom: pcie: Determine has_nocsr_reset dynamically
      commit: ea57d7fe4f5af517b5ce91fdff96cc33be932690
[2/2] phy: qcom: qmp-pcie: Add PHY register retention support
      commit: 0cc22f5a861c3149171485349dafac3047212a5d

Best regards,
-- 
~Vinod



