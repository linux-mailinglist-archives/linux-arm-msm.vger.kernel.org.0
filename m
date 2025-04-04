Return-Path: <linux-arm-msm+bounces-53249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C95CA7C04B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 17:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 427553B94D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 15:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D961F3FE5;
	Fri,  4 Apr 2025 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qdmxfg9s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78201A3172;
	Fri,  4 Apr 2025 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743779516; cv=none; b=mEIUV0GapI1ja4q6AIY3hTOwafAdtavpMSerVZ6KVm/i+Y3Zu1a7aqTrT9mpE/j+eCfQ3zh9nynAaaITdJjPaX42ilDMZVptLhKz5TuaWh17DVqBhmHtUjQO3fEcYBFTcBeUghNJJ5UBUcMvuB1jzS+hO0Fk37vAeWSxNdVzBdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743779516; c=relaxed/simple;
	bh=E5w6pjZPs5pNVgmLcae3JWpXqM9z7gWCU8pWPUyis3o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SIpvXbQ6/wQAeglXC+jTtVhyv66FJce7u/4l29MEa198iguRQO+mnRbqDP7oeL0IV2ihl0GR/j2B/q8iY7x4WMI0qqLuklWB4Zn68A2id6QhLEUUYRW5pFe7xBKft2K8jREXJNkk3Z2dWul/kIJAWPnxN+hwWXnKxxb01ShNFsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qdmxfg9s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548E2C4CEE9;
	Fri,  4 Apr 2025 15:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743779516;
	bh=E5w6pjZPs5pNVgmLcae3JWpXqM9z7gWCU8pWPUyis3o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Qdmxfg9sNdy1Qpx8MB/cKv0UT6R2yNNI3F3pH02LLCH7lEt5HwLB3kJcioJIlz5v4
	 1+6phH/J2ngQ0t8AXPchQ+4rhZRKkFitqhPUWXZE4u7XLGAHFD1n7zCSfdglt0JAm7
	 8TtXmdN5RjJiDh7VaVj6F6A+/HTrA/uQA44C9PeMyWBXfuMjjeGze6U/GoqjDELDg5
	 GB7fO0AuX1HXgEuCgE+1EFjRfbGso2ifiLeJTcMtEwHtF4EKGfXrrX/hZuaFPZsUw/
	 xw7C3KpGMBES7dCqpkFTIEMb0KkCwrouRo+IX+7fsSGyyqCRGtPFw2doe+8VZ03+Am
	 9SpFfoC3n3hvA==
From: Lee Jones <lee@kernel.org>
To: danielt@kernel.org, Henry Martin <bsdhenrymartin@gmail.com>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250401091647.22784-1-bsdhenrymartin@gmail.com>
References: <Z-uqpxcge0J99IPI@aspen.lan>
 <20250401091647.22784-1-bsdhenrymartin@gmail.com>
Subject: Re: (subset) [PATCH v4] backlight: pm8941: Add NULL check in
 wled_configure()
Message-Id: <174377951404.402191.3996310155954584937.b4-ty@kernel.org>
Date: Fri, 04 Apr 2025 16:11:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Tue, 01 Apr 2025 17:16:47 +0800, Henry Martin wrote:
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> wled_configure() does not check for this case, which results in a NULL
> pointer dereference.
> 
> Add NULL check after devm_kasprintf() to prevent this issue.
> 
> 
> [...]

Applied, thanks!

[1/1] backlight: pm8941: Add NULL check in wled_configure()
      commit: b0fdeb96ead46de57a6226bc3a3ac7f9b50c0ace

--
Lee Jones [李琼斯]


