Return-Path: <linux-arm-msm+bounces-45529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1627A16409
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 22:51:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AD7E18845D0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 21:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9913D1DF747;
	Sun, 19 Jan 2025 21:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="DDikOSGz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C63199E9A
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 21:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737323480; cv=none; b=keBfyd6aysOCTVSZvES4dc3LrJOxusTMAoKwKPfC5AII34vo8JBfpQU/c6wZcS3LvMnWMDgGsyNFJ+4Ho7e1FWulmisJ0gxM0wCttM00SbWfWYYFj8Py0xp974g/nVyHNReRlUpCk+E6xUeCTOByVJ+M4ZIWJpG0pr/S/WkDjKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737323480; c=relaxed/simple;
	bh=DtHbQQN+qVTDsVHdhO5QpCYGiksuFoWrqfYahD/OEms=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=aKOwZ6TlzMeSiIKT/2EPCmWZ+eKrAQ2S3BOxBniVJfYWEo6jxG2oISrJmigzYwpnhEur+VRDyOnBLpQic6wuXKZ1P9XyM44wWNZ+dV2Dc3Sso/wh7FtP/VXUulrWVLHgdInwpvIOqe+s6HkzAO0HAWyFvcTsqRQZwcwAPo5Aa2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=DDikOSGz; arc=none smtp.client-ip=195.121.94.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: 59d6fa3a-d6af-11ef-bc52-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 59d6fa3a-d6af-11ef-bc52-005056992ed3;
	Sun, 19 Jan 2025 22:50:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=Ba+oCcEXwRAfeJ+hCcqMoI8w20KBjX5hL4oVTPNGrsg=;
	b=DDikOSGzMwRBX3YSstQIjDwS/Re68zPvyC58NwxZBA37yI+jaFClAmlgbAXpC1V+9b3t3BZborJ2J
	 fYb9DDf+a946Hyis1uw9kZeUDIlG5M91AA0qFFw8pzsssoNDo0QwFRJlib7SoEBOwa36YrLQcjLM+V
	 AlRikun5T3zgo3r6vQk6VhEFfkrc4PP/U+A6PGLlGJ1v2vhKbGzS7s8W1kiNCBtEIrFBGCHPGpUzpH
	 Dmz6ia6FlQNj9M+9o32mYf7tW7/0Y2ejFj5x3j/MLkzorHl2JxvjD0Q3wYZV+G/KdcKjp2ZwzgyB/q
	 MAawlKgCcBV5OE4zcVBC+3y6R0EslVQ==
X-KPN-MID: 33|IYx1PdsHTsPFw3DqoHAWrgWwfav/+LTWqgpnY2WqnjFVJA5YV9I/mOaV9/m8Zwr
 tqWABf0Cm0zlB4J2zNlBHvm444fHBSVRpfJ5r0y0BB9Y=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|ExaAR9L9F4aQnMlEU0YOoNQVZt1ixV4vs3xnkoInPkDm53uKE7dqPNdHLkwou8g
 Gzi5aoSR4xZag5cFHSGzwfA==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 59da0722-d6af-11ef-8950-00505699d6e5;
	Sun, 19 Jan 2025 22:50:09 +0100 (CET)
Date: Sun, 19 Jan 2025 22:50:08 +0100
Message-Id: <87ed0ytqwf.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, maud_spierings@hotmail.com
In-Reply-To: <20250119-usb_a_micro_sd-v1-1-01eb7502ae05@hotmail.com> (message
	from Maud Spierings on Sun, 19 Jan 2025 15:50:51 +0100)
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-vivobook-s15: Enable USB-A
 ports
References: <20250119-usb_a_micro_sd-v1-0-01eb7502ae05@hotmail.com> <20250119-usb_a_micro_sd-v1-1-01eb7502ae05@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

> From: Maud Spierings <maud_spierings@hotmail.com>
> Date: Sun, 19 Jan 2025 15:50:51 +0100
> 
> The asus vivobook has 2 USB type A ports on the right side, enable them
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 103 ++++++++++++++++++++-
>  1 file changed, 102 insertions(+), 1 deletion(-)
> 

Makes those ports work with OpenBSD as well.

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>

