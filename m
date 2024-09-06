Return-Path: <linux-arm-msm+bounces-31169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1593296FBBF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 21:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63A24B2850A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 19:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D287D3F1;
	Fri,  6 Sep 2024 19:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Nk3e5N3H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A02A1B85F6;
	Fri,  6 Sep 2024 19:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725649318; cv=none; b=JKOCljz6V1zC0g4KGkUkoB5QNyCOJiROSmIpBBittda0sHR10tXp3SiCvBk/kT5yZ2Ddn9AZLgKJtgdtGj+w/9TgXq8kuoj77ybHylu2XHUOEs+8DXKQHx5M/J2CHM7OJ+fuiUAwL2gyfX1ffa6zAbiRBK1Gt/yCrs3x8UQMMBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725649318; c=relaxed/simple;
	bh=gYGgNpO0Dc6WIwYRmkqCcOZG3hyCLUye2imyMbj+fM0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uPPmpOWwdLJVyJOB+V+2c7PeToB6Gpc6/PysZpAXKYs+B3k12K6k9tcYusTSEMFF0AaHOMXXLyuV8rrwv8b7Ij1CFc+qTIqyOjIh/XH2Kmgj6nvzvR5b8A1L5Uf9tAQPyjreo5PTzZ+QxRmZkSq6CJ5PSnzrEvECv+dhX6DK7T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Nk3e5N3H; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 69A2142B32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1725649316; bh=XJsz4WENGfSRSt3I6YJl8iWcScYb0NwDimb1QPg0fFw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Nk3e5N3Hbf9quV9UlHJ0LR+iyxuYKD6U7HMmZ0QDSI2wb06xxNXRZzwk2to7hPVp3
	 W6nTfI0AqqQc7rLQOrIXkSc55fZ+IJSFO/3AJILYm6qwQtnChcHGSoaY4nRzezl18v
	 aEMoPY/QZr/BMKk0hDED2GzhxWq761YoYEDSb4MLOIFQezuko1q5S4sagoJJA+iWYr
	 N2PgxzbJ5cOS+iPGSOlBgaLJh7B2hmdVaurfcsr8/WU7Ddpjk3RhoW5UCT/2Ezvi0+
	 tunYc/UZwBcDoeG2potIo/nn3VhjVRx0zd6rVby6oeNdert7A0D+KxJCtVhJRmetKI
	 efGNEL+/xIs8w==
Received: from localhost (c-24-9-249-71.hsd1.co.comcast.net [24.9.249.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 69A2142B32;
	Fri,  6 Sep 2024 19:01:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Andrew Kreimer <algonell@gmail.com>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, Carl Vanderlip <quic_carlv@quicinc.com>, Pranjal
 Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>, Oded Gabbay
 <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Andrew Kreimer <algonell@gmail.com>
Subject: Re: [PATCH] accel/qaic: Fix a typo
In-Reply-To: <20240906080136.4423-1-algonell@gmail.com>
References: <20240906080136.4423-1-algonell@gmail.com>
Date: Fri, 06 Sep 2024 13:01:55 -0600
Message-ID: <87zfokd2sc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andrew Kreimer <algonell@gmail.com> writes:

> Fix a typo in documentation.
>
> Signed-off-by: Andrew Kreimer <algonell@gmail.com>
> ---
>  Documentation/accel/qaic/qaic.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/accel/qaic/qaic.rst b/Documentation/accel/qaic/qaic.rst
> index efb7771273bb..628bf2f7a416 100644
> --- a/Documentation/accel/qaic/qaic.rst
> +++ b/Documentation/accel/qaic/qaic.rst
> @@ -93,7 +93,7 @@ commands (does not impact QAIC).
>  uAPI
>  ====
>  
> -QAIC creates an accel device per phsyical PCIe device. This accel device exists
> +QAIC creates an accel device per physical PCIe device. This accel device exists
>  for as long as the PCIe device is known to Linux.

Applied, thanks.

jon

