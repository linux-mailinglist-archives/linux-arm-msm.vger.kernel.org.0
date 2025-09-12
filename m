Return-Path: <linux-arm-msm+bounces-73202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C35FEB54085
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 04:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93E471C8824C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 02:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96C120298C;
	Fri, 12 Sep 2025 02:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XI/LykuW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8329E1FBEAC
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 02:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757644717; cv=none; b=moyXKj9wg3xQxvsd6Yw3N7u3npsGJJR5Fton10B69mOOXx+8UwtBRQQBhxLhOXEhKSIej6bojeJzDGH/zK1pcQF7DiNSLftalO34mSoHld+nXZYx4Ya0yIs+uWCvzz5Wf83xGXaAc9lR5rUx1G0LNybw7SGs/CBn6jx5TUwZ/Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757644717; c=relaxed/simple;
	bh=JD55iuZQFxBzspgKnX6WhVjBbiN7P9Nc9vdzLa++7FE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kGjGxdYEsOWdrDdcS9Grt38hChdHZ4V+1aSWiKBVGqBEeNo+HAicMfgoWikToUcT8BfFV8Cfq4n+QL0Asx1CgkX9B44F18VdTlhMG+F6BVeX7KI/BxP7QqPHZQXbAwnmxtIs8+AwqwvmguxEMT6UJs1hbR6NfEddJEp4cMRM6zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XI/LykuW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9681AC4CEF9;
	Fri, 12 Sep 2025 02:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757644717;
	bh=JD55iuZQFxBzspgKnX6WhVjBbiN7P9Nc9vdzLa++7FE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XI/LykuWaR/JGkpXjoc6hWS5+G9ljGridwEunJWmn9Okgi3khmEtKchT7zzdSKwuu
	 gQui+is4Ru2VXhVtgU1D26yXGsLeH/vWHim6XxBDRhPg4uL9f6F0v5cSVz+xDx+EKG
	 Az/0faeU4rBINtw4caWIK/6S2bV5pmqNvY7cD2sWrgmXr7REETiwpxa1sV8y6u5gp+
	 BGABvv5x+6REnPghr9maqaFS3s4b2mFKueudHnMgNhvvBcQP+0LUCbzdUo/Ir9In+q
	 F4SOAyKOoxgBxHV1TxLKMOy5U7BXy6Nhcg5sNqg4duIlt2Ds83FwRechRqIj/oCKxZ
	 JdAY00P6ooyFw==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Petr Vorel <petr.vorel@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Alex Elder <elder@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 1/1] ARM: defconfig: Remove obsolete CONFIG_USB_EHCI_MSM
Date: Thu, 11 Sep 2025 21:38:34 -0500
Message-ID: <175764471181.3066893.17551247684653242505.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250829165031.110850-1-petr.vorel@gmail.com>
References: <20250829165031.110850-1-petr.vorel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 29 Aug 2025 18:50:31 +0200, Petr Vorel wrote:
> CONFIG_USB_EHCI_MSM was removed long time ago in v4.14-rc6
> 8b3f863033f9f ("usb: host: remove ehci-msm.c").
> 
> 

Applied, thanks!

[1/1] ARM: defconfig: Remove obsolete CONFIG_USB_EHCI_MSM
      commit: 3e23fc50890d3f04ec8e3670c6927eb239930136

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

