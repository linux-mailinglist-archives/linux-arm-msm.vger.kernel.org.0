Return-Path: <linux-arm-msm+bounces-86398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAA3CDA207
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2858F3009B02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DA63009C1;
	Tue, 23 Dec 2025 17:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ImAZa2Gi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0502234844F
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766511236; cv=none; b=GDPj7Eg08mPbmJkqCcihv+L2At/oFjsXzZXeB2zgd4aDK4q8POeoQ+DBaQq20eGO4JCEgoAnP2M52AIhbM3mNLgAZHMZF/5UHBgr9GuB9O0M6lyaFRwr7BCJynIaM2r2BdsLvCCEMLEfzig/9TE4O9+AIJ2QSu0hiyFp6roqFJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766511236; c=relaxed/simple;
	bh=v8zte2v/K+J876rOP8zQ5mxBjYpcNNsbcPhghDEfu6Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ECi3fQoOOVyJR/zN/OrQtauZtIX1jRgNV4w/3/it2ASrlwmJXLpWPP5OgUZCoOYwTd+OIBd0kPEWX0CNIFqlv/GK7YiRe/ND1cyDXoLVtRrpoke33SgkzEmq02nPOExoGNINcu7aSCbcM2SQfqstbS61PZjQMKqC0xxOW0ToX44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ImAZa2Gi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8A8C19421;
	Tue, 23 Dec 2025 17:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511235;
	bh=v8zte2v/K+J876rOP8zQ5mxBjYpcNNsbcPhghDEfu6Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ImAZa2GiCmxn9wXhBA+wyiResrJlkc2wLUBF0q0R8ndbQV0y4m0MBSEbnvFseEx1X
	 5p+2GOoKPF1nS7vkjN5d4UQq01kGRG13VEKbdzGXXALdBE0hFBy0lgVD1egmaxeOqe
	 qGxbM+SxyRoKFiddJe/0kUQnRsvERNX9DwZ7AhtdHxNEZUmkGYrmHXpxKJaNtCh2x2
	 tXzaQFc9Lh2pB/I1ewEa2aa03Bnxs61gLfqg6GlG9FJY8fTn0uPC3B2veNK7uENNbA
	 7w5vSGO9oPtVaYNoZEnVFbGgJFRT1ftyWcMmgvBelZahFeTo2ZwXhFbxRRLsnHu10h
	 mhq2zImllEotQ==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 andersson@kernel.org
In-Reply-To: <20251219085640.114473-1-loic.poulain@oss.qualcomm.com>
References: <20251219085640.114473-1-loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH v4] phy: qcom-qusb2: Fix NULL pointer dereference on
 early suspend
Message-Id: <176651123322.749296.4504100315872807969.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 23:03:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 19 Dec 2025 09:56:40 +0100, Loic Poulain wrote:
> Enabling runtime PM before attaching the QPHY instance as driver data
> can lead to a NULL pointer dereference in runtime PM callbacks that
> expect valid driver data. There is a small window where the suspend
> callback may run after PM runtime enabling and before runtime forbid.
> This causes a sporadic crash during boot:
> 
> ```
> Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a1
> [...]
> CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 6.16.7+ #116 PREEMPT
> Workqueue: pm pm_runtime_work
> pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : qusb2_phy_runtime_suspend+0x14/0x1e0 [phy_qcom_qusb2]
> lr : pm_generic_runtime_suspend+0x2c/0x44
> [...]
> ```
> 
> [...]

Applied, thanks!

[1/1] phy: qcom-qusb2: Fix NULL pointer dereference on early suspend
      commit: 1ca52c0983c34fca506921791202ed5bdafd5306

Best regards,
-- 
~Vinod



