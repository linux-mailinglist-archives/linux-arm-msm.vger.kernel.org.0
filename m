Return-Path: <linux-arm-msm+bounces-21491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D888D84EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 16:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57EC21C218C0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 14:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A4A12E1F2;
	Mon,  3 Jun 2024 14:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nziQ/mVX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA01132110;
	Mon,  3 Jun 2024 14:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717424811; cv=none; b=cBXNuOUJJj3Ak+I+fOiwom9p53VBnAobCjBc0v4MCpIBwjzWXhYV9CA6ZhmvtFSzE71hvm4eF5GwajEWPCFr7YBZftvsEeUVo9fkBqrt7WpBc46Jce30BaBmbVePsN3JlxXaG0N9LH6oE56NQpZxPLkGM5Bu99ZfVyzDHctDPXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717424811; c=relaxed/simple;
	bh=axgOU2f60G0C43RP1CrPbQ4L1znDGnP/69ACpWN0I38=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tWv1g5uvuqmkOqvHUdKssb03TAuFpIHBKrDXyo778WHp6aDkeIXD5PvY7vdnl8eSKAzFQxqWT2KYqtTIVbgVUi15fVfXsBaKc8Z+4ro3sN4piQdkR1RXV7J57RXQyn2iHbu8FuZcprSPfsy3hX72xzeXkg92XSlbYF242PJXX70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nziQ/mVX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9FCEC2BD10;
	Mon,  3 Jun 2024 14:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717424811;
	bh=axgOU2f60G0C43RP1CrPbQ4L1znDGnP/69ACpWN0I38=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=nziQ/mVXp7YCNa7p4zsni3uaJ3zs9YhugkQBFdbHAS/9jJ8XhXpqeimMgVzz0cxlq
	 C7c4Hy89R/6ZW4SyO4GmPdkf/y05AbxgcXYNONDPNFcbYvb6bhYjxIq5LTYqbOhriO
	 7A74qQWsotYogJsqml0n7f01l8Upy2ligRZrIgMs1byEiZw7yg3FcpEGsgPoQZZSAy
	 r/7ei65O8uBcEGznjUL53Un+QiqZclw4v0zmpxuUk6djf543JXoYJHgRcSC3xn/D9o
	 JTsVFdLlPQnD+FGKiZTnoIveEvKQC+IAY4NoHZ6Hysu9BYZV1gAkcIwQfBFbEKRvlR
	 +IWGh2HFYtxrg==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org, 
 quic_msarkar@quicinc.com, quic_qianyu@quicinc.com, abel.vesa@linaro.org, 
 quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devi priya <quic_devipriy@quicinc.com>
In-Reply-To: <20240516032436.2681828-1-quic_devipriy@quicinc.com>
References: <20240516032436.2681828-1-quic_devipriy@quicinc.com>
Subject: Re: [PATCH V4 0/4] Add support for PCIe PHY in IPQ9574
Message-Id: <171742480737.106728.8115956533813966138.b4-ty@kernel.org>
Date: Mon, 03 Jun 2024 19:56:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 16 May 2024 08:54:32 +0530, devi priya wrote:
> This series adds support for a single-lane and two-lane PCIe PHYs
> found on Qualcomm IPQ9574 platform.
> 
> [V4]
> 	Picked up the R-b/A-b tags.
> 	Split the phy driver and headers to individual patches.
> [V3]
> 	https://lore.kernel.org/linux-arm-msm/20240512082541.1805335-1-quic_devipriy@quicinc.com/
> [V2]
> 	https://lore.kernel.org/linux-arm-msm/20230519085723.15601-1-quic_devipriy@quicinc.com/
> [V1]
> 	https://lore.kernel.org/linux-arm-msm/20230421124150.21190-1-quic_devipriy@quicinc.com/
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document the IPQ9574 QMP PCIe PHYs
      commit: 29f09daab910c797f5468afda91a51e3e29de7ee
[2/4] phy: qcom-qmp: Add missing offsets for Qserdes PLL registers.
      commit: f1aaa788b997ba8a7810da0696e89fd3f79ecce3
[3/4] phy: qcom-qmp: Add missing register definitions for PCS V5
      commit: 71ae2acf1d7542ecd21c6933cae8fe65d550074b
[4/4] phy: qcom-qmp-pcie: Add support for IPQ9574 g3x1 and g3x2 PCIEs
      commit: 2f2f5c13cc5ea87f1dd2debfd06fe5f624e5c0fd

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>


