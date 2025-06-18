Return-Path: <linux-arm-msm+bounces-61660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAFFADE212
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 06:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CB573B78E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 04:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D04205E2F;
	Wed, 18 Jun 2025 04:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="al3ylt2M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1663B204C0C;
	Wed, 18 Jun 2025 04:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219776; cv=none; b=LPsqXxnqjS2JmroL9u6Y3X7yt7/qkmqc1DCr80US2E4Dc3X1XTndTfiGaYCWlDuvlqRgyVeimumloSfpRIQ0fgqZnT8BbPpTLEfaFjQCM/nZI99M1Ruydu4Gp3kps3WeE5Rf/sJYell5L+XqJikD1cd5LcZ7BuP5UHZevx5fp/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219776; c=relaxed/simple;
	bh=W7rbb2k00VILWmdelCarKFOVq8fZyoXNg2jVzAMIWFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bpwqvXk00RLjQSkqFwuB0K0/nl2SnsPZ3xMPbnrWd2U+EDhq8T18YrnDp1dPd9RQELaoJWPzKiShZzyeodYP+1BHVECTtivv8S1DUCmTpxktxMk2Mcs0Rs1Oswl1Cpruc4nx6lYPs80zEJddysAlPG6UN+7Z4flPzhFfwAlL8fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=al3ylt2M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E26C4CEEF;
	Wed, 18 Jun 2025 04:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750219775;
	bh=W7rbb2k00VILWmdelCarKFOVq8fZyoXNg2jVzAMIWFY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=al3ylt2MLI/GL7/U9jDYLOyH3aVE4+ATgTmtsSfcZvQOAGNPWi0CDpyIB/uA4u+gE
	 KLUCiluZ8rah4RhPDOa3RJjXCJhJ6jk53yOrhpbXyX2pejVP/QXHoG7E2sOIU0RzOn
	 wEsIFVo2gueqHCeKcn53dCe3PTd1lNwXOBmoy45KCbTF/VUxpYKH97oXUZtK/EjodT
	 da/pH6Gl9Afwe7R+i3wL+KBe5XcdwABUCJgE9vr4utEvxCK9xLAaEZWXZXdPxoabJy
	 YcAAuz2H7d+w4qa6TAcyAlZuZXllc2k/D+3FdLF0lCX8m9WxnhpQuHeVc2D3qqMnc/
	 XLi9173UJfpZg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: fix a crash issue caused by infinite loop for Coresight
Date: Tue, 17 Jun 2025 23:09:19 -0500
Message-ID: <175021976643.732077.1360707124929823302.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522005016.2148-1-jie.gan@oss.qualcomm.com>
References: <20250522005016.2148-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 22 May 2025 08:50:16 +0800, Jie Gan wrote:
> An infinite loop has been created by the Coresight devices. When only a
> source device is enabled, the coresight_find_activated_sysfs_sink function
> is recursively invoked in an attempt to locate an active sink device,
> ultimately leading to a stack overflow and system crash. Therefore, disable
> the replicator1 to break the infinite loop and prevent a potential stack
> overflow.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs615: fix a crash issue caused by infinite loop for Coresight
      commit: bd4f35786d5f0798cc1f8c187a81a7c998e6c58f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

