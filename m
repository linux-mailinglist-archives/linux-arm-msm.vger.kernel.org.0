Return-Path: <linux-arm-msm+bounces-87493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 028E8CF4C76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 17:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E04823155CEA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 16:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8AE33BBD4;
	Mon,  5 Jan 2026 14:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uOAHJSWs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA6B33AD8F;
	Mon,  5 Jan 2026 14:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622122; cv=none; b=HZKpa2xnrjH8tjdzIHXVfKY5SGCllZj/5e3DlrNBO9CUyVF4UaLH15RUZP6v4pyckodyZB471qoT4uCasaHapAtH+JlONLuvlhCH5f9ILCcKzMBCloyJTZkw+t3HXMHVTFKMkQ18if0qiupAf4tot+WOpa+IEI8au/G8G3uzwjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622122; c=relaxed/simple;
	bh=BmIPWhWYgZ9mw5gJSXT2k5vuSAmFcWv6nIfcGW0uDo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DKwGECoOWgTiYIYXtNBbywY6z0un4wtoteSiaFPNrBrVTWG31KkA8PuTVgdjQ9Qel7KRTRwwVpZbgNx9FXezbM3/aDuD7MUn5xF7Q/s/1TXI4w/dCvwek+UcgLeU61iZNQFZcNmdEP9+TPHOQZ7r8teDHJulkV10bbpTFJJLOcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uOAHJSWs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C761FC16AAE;
	Mon,  5 Jan 2026 14:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622121;
	bh=BmIPWhWYgZ9mw5gJSXT2k5vuSAmFcWv6nIfcGW0uDo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uOAHJSWsHJYr5PjCGJaBcrxGDq3Whd3M0fYdHaSYriTo9nY2vUmJfyUKMf7F2xBd3
	 kG/wlkcpSJb9qxprwWuRVQNUYWzD6cFC0RojTTvWK54EYcnpX+VWSIefxIkuIQMzI0
	 O8XkrPnIIRSgCN2Nr5a9sil3bzhg+659bfewYd/xjRdLLZkuvmAB9xRhEjZl1zhUwZ
	 OzC6nI18LM7jiRrb6IA/MLS7em1O1j96/u1wdcOyKerYIINClyZXusm6WNCs01CBhv
	 0iSNWi9ANOv7wWKqkrbdl0kjNuEgJYnQkLMBvKZlmOUG7Lz66YxADLd+K8L3zx1xf9
	 DXjP27Oq051Qw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v11 0/3] SCM: Support latest version of waitq-aware firmware
Date: Mon,  5 Jan 2026 08:07:40 -0600
Message-ID: <176762206369.2923194.12446124492390083856.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217-multi_waitq_scm-v11-0-f21e50e792b8@oss.qualcomm.com>
References: <20251217-multi_waitq_scm-v11-0-f21e50e792b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 17 Dec 2025 20:04:18 +0530, Shivendra Pratap wrote:
> This series adds support for the latest improvements made in SCM
> firmware that allow for multiple wait-queues in firmware.
> 
> To support multi VM synchronization when VMs make SMC calls on same CPU,
> waitqueue mechanism is added in firmware which runs at EL2 & EL3 exception
> levels.
> 
> [...]

Applied, thanks!

[1/3] firmware: qcom_scm: Add API to get waitqueue IRQ info
      commit: da9e6b1a96b1eef47542ec46b67e3f4f883fed3b
[2/3] firmware: qcom_scm: Support multiple waitq contexts
      commit: ccd207ec848e768da41465352a0f52081eec6bb1
[3/3] firmware: qcom_scm: Use TASK_IDLE state in wait_for_wq_completion()
      commit: 366f05e348b2ba454869ba7148ace6f25f229540

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

