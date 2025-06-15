Return-Path: <linux-arm-msm+bounces-61325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEA8ADA2B1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 18:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CD1A16A31E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 16:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D8C262FE2;
	Sun, 15 Jun 2025 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oK36/PSj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAAA27CB35;
	Sun, 15 Jun 2025 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750006362; cv=none; b=rrMloBmhmpNNKTFoWVnedLagp2QmumDVBZ5dmVma8bKZlKsXoS0h+VKmugj4dyZ94G4lbmxv5YtO/vL31irE0cHGTli44N0ZWNd2jkupzMnN0ZK/+vAhLW7+ZYY6+w98mLN9nGHauia9B82lfqTXRlSCnv7wBzp9boHXNFqoUSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750006362; c=relaxed/simple;
	bh=XMEHfO8NpJNJDxf49A9byfF0rBihRzDMUh8boP0Kq0A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=R8lix0Z9yNTN/y/I91IuOcgYF7B60x100WN1JwcwNkWbAc0qsuiBTLO2fxuvaiBV/I9+ueGlyVr0GQoIRO+ogGQ1ERwbX6Hgjgm+UTf3oijE1boQn5il2p1b9E+8azCt6FVyGns6DXiR4o/6nV4LRTMUNkXHH7EZ/O/pli9UtHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oK36/PSj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8997EC4CEF1;
	Sun, 15 Jun 2025 16:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750006362;
	bh=XMEHfO8NpJNJDxf49A9byfF0rBihRzDMUh8boP0Kq0A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oK36/PSjkrxG8EOfMVNPaCUtiPyt3ifZtN+IkUCbfXv620FHXgbVr10r8sD9GvOAJ
	 /PEmxB99ZO1DI+1AuuY8U+btN5aiPN5MIglPOkfpPN4ZxXDWl+utbmnc924Ze+sJ67
	 auc+WnBCg+KR3phBU9OyEAG+qTz2OcZ7Cx59Z3USZd27d32vDHpehQj/IczLwT34yY
	 R+NfE4HcTsljkqtTSxrKM1sH2LBo/138PprfgvRk9rXFzYGkroUN+spD4iqtMUE6c4
	 xJn185QDPN8tr7fsF2lqOoaf3FFR9nFDwyO/PQBh6eb2XfORG28Jyh5nCeBVQGNsRj
	 q9+kkDmb2/CZA==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, James.Bottomley@HansenPartnership.com, 
 martin.petersen@oracle.com, bvanassche@acm.org, andersson@kernel.org, 
 neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com, 
 dmitry.baryshkov@oss.qualcomm.com, Manivannan Sadhasivam <mani@kernel.org>, 
 Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
In-Reply-To: <20250526153821.7918-1-quic_nitirawa@quicinc.com>
References: <20250526153821.7918-1-quic_nitirawa@quicinc.com>
Subject: Re: (subset) [PATCH V6 00/10] Refactor ufs phy powerup sequence
Message-Id: <175000635719.1180927.17273493527375634687.b4-ty@kernel.org>
Date: Sun, 15 Jun 2025 22:22:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 26 May 2025 21:08:11 +0530, Nitin Rawat wrote:
> In Current code regulators enable, clks enable, calibrating UFS PHY,
> start_serdes and polling PCS_ready_status are part of phy_power_on.
> 
> UFS PHY registers are retained after power collapse, meaning calibrating
> UFS PHY, start_serdes and polling PCS_ready_status can be done only when
> hba is powered_on, and not needed every time when phy_power_on is called
> during resume. Hence keep the code which enables PHY's regulators & clks
> in phy_power_on and move the rest steps into phy_calibrate function.
> 
> [...]

Applied, thanks!

[02/10] scsi: ufs: qcom: add a new phy calibrate API call
        commit: 399c75b6a9ed2fd609f9ad4c22cdd6364bc9d441
[03/10] phy: qcom-qmp-ufs: Rename qmp_ufs_enable and qmp_ufs_power_on
        commit: dbd20821946a74e803208a25dddfafe1ae2e34e6
[04/10] phy: qcom-qmp-ufs: Refactor phy_power_on and phy_calibrate callbacks
        commit: cbfd6c124f27ad2b4c0f617dc40ad8a08a063463
[05/10] phy: qcom-qmp-ufs: Refactor UFS PHY reset
        commit: d58b9ff47775042acc501d0a892af8bd08128a65
[06/10] phy: qcom-qmp-ufs: Remove qmp_ufs_com_init()
        commit: 7bcf4936aac6ec8d6fafbfd6f4f62302e5296a0d
[07/10] phy: qcom-qmp-ufs: Rename qmp_ufs_power_off
        commit: acc6b0d73d902d3296d8c77878a9b508c2c6a5bf
[08/10] phy: qcom-qmp-ufs: Remove qmp_ufs_exit() and Inline qmp_ufs_com_exit()
        commit: 7f600f0e193a6638135026c3718ac296ed3f5044
[09/10] phy: qcom-qmp-ufs: refactor qmp_ufs_power_off
        commit: a079b2d715340482e425ff136b55810ab8279800
[10/10] scsi: ufs: qcom : Refactor phy_power_on/off calls
        commit: 77d2fa54a94574f767d5fb296b6b8e011eba0c8e

Best regards,
-- 
~Vinod



