Return-Path: <linux-arm-msm+bounces-28677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D851953BA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC44AB239AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6B9155315;
	Thu, 15 Aug 2024 20:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfikZjxH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D52E154C1D;
	Thu, 15 Aug 2024 20:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754465; cv=none; b=kyg/vShoXzaBe0KLsCP+FvUmI0/Tpt4quf9lOEzdcj+UXIjxBJK5oKKn68qGXf1EQQKZoRoXdivDyyG0UuWjONepT7RYPkRlEHfKehd//pColFQIFYtGAWMATWdLAYrt9yI0UygiGitBTcxgWocaoQrqy7EOOoEQ+a3Mp/Q7iEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754465; c=relaxed/simple;
	bh=MZ3VtNm+s9BKqAlpg0aWMlgqWVE8wcurrnQztja4myU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GktUICjt/0F6LXG+msaxjg2npKinDnHXoBuWrkcx7MjGy6lxAIxqi33rdCggQxoKvD4qDJwO2EO3t1GbohlluXlhkCPhdECVf/57IsNqGXT58D6FXZ9gXIGSAb9qiW/YsyHK1JbW+Jm63TMh+WAsctgUBDm5ouWIaEdxHCfR8V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfikZjxH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B6EC4AF54;
	Thu, 15 Aug 2024 20:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754464;
	bh=MZ3VtNm+s9BKqAlpg0aWMlgqWVE8wcurrnQztja4myU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CfikZjxHUd5LSHxr+pH5ewcEWwsFmnzpI7zArxBYfQtoKFDPOapsA6iuqlsZnbas/
	 NjCXq8rONLeIj283IKA/WKjM+3+dl4G2lwoXRPZ8t5e45XnkVTRHJ7oCDFHmcPuoey
	 vM1tAhrvSkvMgb3QgcSmEbhc6dunKHjLnuth0Aw1qW4pc8Zx6QbkhRE+Y8lORD2Aoa
	 01yObkgV/Z2K3kt2urxLQgKD1+LwThSNOpXFKCVHm2IMRH4pNeDB8l0GDz8+BW4n8D
	 n535q4xgqmq0AsG8nXXQ8v5vQ8W1QHERYrRRcFMye91k+M5AjJMuRIFRv48CgJUIKG
	 zFYXiZ552FD/w==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	buddyjojo06@outlook.com,
	david@mainlining.org,
	Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org
Subject: Re: [PATCH] arm64: dts: qcom: sm7125-xiaomi-common: Add reset-gpios for ufs_mem_hc
Date: Thu, 15 Aug 2024 15:40:23 -0500
Message-ID: <172375444820.1011236.1936159567573716820.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731182412.27966-1-danila@jiaxyga.com>
References: <20240731182412.27966-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 31 Jul 2024 21:24:12 +0300, Danila Tikhonov wrote:
> The SC7180/SM7125 SoCs have a special pin for UFS reset. Generally, this
> pin is the same for all devices on the same SoC because it is hardcoded
> in the pinctrl driver. Therefore, it might seem appropriate to add this
> pin configuration in sc7180.dtsi. However, this pin is defined in the
> device-specific DTS files instead of the SoC-level DTS files in all
> Qualcomm DTS. To maintain consistency with this approach, we will follow
> the same style.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm7125-xiaomi-common: Add reset-gpios for ufs_mem_hc
      commit: 0bdadbf5c6fa4b42b33b3fb5595aaf34c5f4390b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

