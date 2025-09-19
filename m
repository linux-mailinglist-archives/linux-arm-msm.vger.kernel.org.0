Return-Path: <linux-arm-msm+bounces-74129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4A8B883DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 09:44:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66BF33BD28E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 07:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DFB2D0C82;
	Fri, 19 Sep 2025 07:44:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6DA2C029C;
	Fri, 19 Sep 2025 07:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758267854; cv=none; b=Py1SAjYPBLgRx6laXk7a4YUDnhnqOoty61NhGsxZuLyS7Cq6hbQ3Q1XgPTKJJKZQkY9MVxP2QXrydx1oE0vff7KjAI2Zl42HpBP2I6bG1dprd9RycP13IV2S3uYniruGe5Z47rg97gannhwIX2miknXmu8DPv+TXwXFDFJ0HpTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758267854; c=relaxed/simple;
	bh=r9GxQxXLRb/I6EYwZFXl3JdLsGecv7jRX9Q+Qc6XOyg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O2c1sD28d0wIUer5afpFo9Mtbtao17Xmva45swviAr3MZd146UsQt0F8qn/glKHLKt8hw8pqxqT+0dVGIbvQ04F/kWzpIDZlMEjGN9I/RYA2D52FoClcFydOvfutczl1m9BrBkwP2fTje/Vi28J/eLhPexiVwG6bA9dIpkyv768=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA3AC4CEF7;
	Fri, 19 Sep 2025 07:44:10 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Vivek.Pernamitta@quicinc.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vivek Pernamitta <quic_vpernami@quicinc.com>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250912-uevent_vdev_next-20250911-v4-0-fa2f6ccd301b@quicinc.com>
References: <20250912-uevent_vdev_next-20250911-v4-0-fa2f6ccd301b@quicinc.com>
Subject: Re: [PATCH v4 0/6] bus: mhi: host: Enable SRIOV support in MHI
 driver
Message-Id: <175826785090.11800.16930813701456157095.b4-ty@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 13:14:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 12 Sep 2025 18:18:04 +0530, Vivek.Pernamitta@quicinc.com wrote:
> This patch introduces several enhancements for the SRIOV support in MHI driver
> focusing on enabling SRIOV and improving the MHI driver removal process.
> 
> - Add support to enable SRIOV.
> 
> - Remove health check monitor for VF's and read PF's device id for VF.
> 
> [...]

Applied, thanks!

[1/6] bus: mhi: host: Add support for separate controller configurations for VF and PF
      commit: a9e3d5a69cf8d1a73733c52f593a3f803f576391
[2/6] bus: mhi: host: pci_generic: Read SUBSYSTEM_VENDOR_ID for VF's to check status
      commit: b4d01c5b9a9d2dc39f52be22809e845cc4c46f03
[3/6] bus: mhi: host: pci_generic: Add SRIOV support
      commit: fd6e0509d0e86059f9a1c25b0b91ef5d0021701f
[4/6] bus: mhi: host: pci_generic: Remove MHI driver and ensure graceful device recovery
      commit: 12543f4405887da9f3e401e708ca0ff796a7b866
[5/6] bus: mhi: core: Improve mhi_sync_power_up handling for SYS_ERR state
      commit: aa1a0e93ed21a06acb7ca9d4a4a9fce75ea53d0c
[6/6] bus: mhi: host: pci_generic: Support independent DMA mask for VFs
      commit: 54c67740fff7360b6607d02b8499d09b944b3fda

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


