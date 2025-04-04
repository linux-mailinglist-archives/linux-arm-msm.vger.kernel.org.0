Return-Path: <linux-arm-msm+bounces-53250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F1EA7C053
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 17:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31CDF176217
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 15:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221851F461B;
	Fri,  4 Apr 2025 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUPQmRq5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73F01EFF9D;
	Fri,  4 Apr 2025 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743779585; cv=none; b=OX0UCxTU4ilwz8IcRrbBq4OSlYuTUmix1bzqFU4irCV6J8W7nyQ6CMI7n8lfjgJqa/HWd6ulyaRzoPYqUrE1okhRA3I8hzw7PbdB5BRjCX8Pu5R2YypVUCkqmRbt3ghdnQcrLuO9VeEafKFLkx7Ln6x7oC9schQ1/r2ZTJrG98M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743779585; c=relaxed/simple;
	bh=FP3tFb7Y7bfvGa0ApcazABFfYZtkfCm210aLvxNGQGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4LChgqJofWv4zrTRXXPilVigi13vYc6H/KzBmea2nawDyPaL9bFGz8ytpwJl5cblhC6VJp4t9N11y4aEmesXIdJDmzYAF2NWqOD6rWmwpKMXoMv1JDTzGFtFB+iV+a1D8D9APOcsgWVTRGL/2N8369g4+w8/bWd6XSPV4DGtPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUPQmRq5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F390CC4CEDD;
	Fri,  4 Apr 2025 15:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743779584;
	bh=FP3tFb7Y7bfvGa0ApcazABFfYZtkfCm210aLvxNGQGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gUPQmRq5EXOp+mQwNUabADYpwjaWw+w7ZokORBXILQBS4O84eA2+5q9p7wrXn1LTL
	 JGTQgnVUhgiAzxW+DMk4b0Cc8BrrgKRVntfqBYhyVRnaMNobzueZB5Qdim4GVC7t+L
	 h4TgRmemcobifY1FCComkjQ08o+gaXP9oOgLgabmSLeMFA8JVEhgYeHo0tdrW5ahM0
	 05A0FB/9/7QcBbFA8TnLbx6wFaTedMXxUsJYjbZXIcrhVO1l+oZjUQfElG2ZSWcBMm
	 YmIEYsdvMpPBnA5gYZDA0MVhMQa9VWg8UXJ8Us650LR1E2Ik17WCxM2j8fraH/d2KL
	 GBCR57oBvKTLQ==
Date: Fri, 4 Apr 2025 16:13:00 +0100
From: Lee Jones <lee@kernel.org>
To: danielt@kernel.org, Henry Martin <bsdhenrymartin@gmail.com>
Cc: jingoohan1@gmail.com, deller@gmx.de, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4] backlight: pm8941: Add NULL check in
 wled_configure()
Message-ID: <20250404151300.GD372032@google.com>
References: <Z-uqpxcge0J99IPI@aspen.lan>
 <20250401091647.22784-1-bsdhenrymartin@gmail.com>
 <174377951404.402191.3996310155954584937.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174377951404.402191.3996310155954584937.b4-ty@kernel.org>

On Fri, 04 Apr 2025, Lee Jones wrote:

> On Tue, 01 Apr 2025 17:16:47 +0800, Henry Martin wrote:
> > devm_kasprintf() returns NULL when memory allocation fails. Currently,
> > wled_configure() does not check for this case, which results in a NULL
> > pointer dereference.
> > 
> > Add NULL check after devm_kasprintf() to prevent this issue.
> > 
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] backlight: pm8941: Add NULL check in wled_configure()
>       commit: b0fdeb96ead46de57a6226bc3a3ac7f9b50c0ace

Next time, please send subsequent patch versions independently.

-- 
Lee Jones [李琼斯]

