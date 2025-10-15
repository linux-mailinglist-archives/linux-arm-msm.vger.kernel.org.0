Return-Path: <linux-arm-msm+bounces-77378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F82BDE528
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 13:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2D3E0503672
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 11:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162A7322C67;
	Wed, 15 Oct 2025 11:47:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9F3322C65;
	Wed, 15 Oct 2025 11:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760528838; cv=none; b=b5y519Dkt4GrekT7D9+BFK3+D8l6IZh5ZetnKKmLf5PEcMje4FUw7VMjCOv6dHrySFCvqH1FlFTjc4M/J284Q0sryGbVPoPVItQtpgh7ussTuVAtUc8Y+K0w72+l0hIhZdE0a2ypBmV+8FU4j0MFLDOAXjnuS4vS/ry00bALBjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760528838; c=relaxed/simple;
	bh=dSpFMxJoNaTrYYxi2RkGdU/qpeyndamWExs2f+Xn2mU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ONgwrGFF+p21Y8mkqbe8Vxbwo/rAmocgdDm/XAxnLJbXvJvPZzKq84QBX+Y9kidDElwhrD8fcnaK1fanOKmwCv57ZQlfoh9OV5aefqVj9g8yAT+SVZ3EUo3u+uz0c17Tk1V5LrerMmOIeswmnKqGs6JrFcCBb5LU9Y1pRkVMtgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD9DC4CEF8;
	Wed, 15 Oct 2025 11:47:14 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Daniele Palmas <dnlplm@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
In-Reply-To: <20251015102059.1781001-1-dnlplm@gmail.com>
References: <20251015102059.1781001-1-dnlplm@gmail.com>
Subject: Re: [PATCH 1/1] bus: mhi: host: pci_generic: Add Telit FE990B40
 modem support
Message-Id: <176052883475.14919.13583138946979648074.b4-ty@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 17:17:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 15 Oct 2025 12:20:59 +0200, Daniele Palmas wrote:
> Add SDX72 based modem Telit FE990B40, reusing FN920C04 configuration.
> 
> 01:00.0 Unassigned class [ff00]: Qualcomm Device 0309
>         Subsystem: Device 1c5d:2025
> 
> 

Applied, thanks!

[1/1] bus: mhi: host: pci_generic: Add Telit FE990B40 modem support
      commit: 6eaee77923ddf04beedb832c06f983679586361c

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


