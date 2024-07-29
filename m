Return-Path: <linux-arm-msm+bounces-27181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC4493EC4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 06:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2331D282016
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 04:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E2113E033;
	Mon, 29 Jul 2024 03:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8s4RGhb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B6613DDDF;
	Mon, 29 Jul 2024 03:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225540; cv=none; b=Y7vbr3a+rpC+HOXFgFaQm+D8lSYaJjlfBPzKM4ZE6rSJxll49VPRkNPJxnQ1/Zsq71fJPum2Woypbfvmnq/bPyAFyvaNDbXRxijKNBbvCe5V6Pk8bKoC8cy5+Utpf9316o3KcKLCtGlrBELx5k+33kBMvH/ixB++IMd7FagPWIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225540; c=relaxed/simple;
	bh=x+iIysTNVvwsLB7wzLlhEWpk4nkmH0ynoZP4o9CFC5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mxpngU9xGuD+5W66+cHDX3ycATwHk2riYm/UzcbjsREeY1iosjiZffOD2m+M8Gb3d8WUUv6z78YVLzZI2Cxajm5gUZp/eVpRNxTyOz/dxz+SUQcRh01EG4S7d02EUMe7j21udTrTZ6i2nEZciByG9K1Vah6bPOjDGZF23FQbGAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8s4RGhb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3772CC4AF09;
	Mon, 29 Jul 2024 03:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225539;
	bh=x+iIysTNVvwsLB7wzLlhEWpk4nkmH0ynoZP4o9CFC5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j8s4RGhbeV9Emd29S9nDhom2UJOBTHX0dg+X8k86w50pUNxnSieQU/G3sYP8eMWnH
	 UmaNqODMzoN/X7psYDdhph/fgM2QJHHwX8KWTcQuu0rcsoHddJwJ9Ki+S6jnWOWAI+
	 7fVxKeK+zH5N2tWUdW3FnbUUHO9WCOgeOytLW4QlCXIN8Kw1Vi3g/GYkZ06/4Dpe1I
	 MQycfQbmkPP85THZJKfJ+v+uV2ZFNMfX9g72JrSEXMReZZN4L5m9d9uOKkzDaWdz25
	 UAhkPk/TLWtw+mLChKHcRs5DTe6mSgzZXJBgh3tcwVJMU3JGaW903NDiFdOJFgzbJO
	 bMOHQPchs9CMw==
From: Bjorn Andersson <andersson@kernel.org>
To: quic_bjorande@quicinc.com,
	quic_clew@quicinc.com,
	mathieu.poirier@linaro.org,
	quic_deesin@quicinc.com,
	Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Use of devname for interrupt descriptions and tracepoint support for smp2p
Date: Sun, 28 Jul 2024 22:58:25 -0500
Message-ID: <172222551313.175430.15678784450452674361.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716173835.997259-1-quic_sudeepgo@quicinc.com>
References: <20240716173835.997259-1-quic_sudeepgo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 16 Jul 2024 23:08:32 +0530, Sudeepgoud Patil wrote:
> This commit enhances the smp2p driver by adding support for using the device
> name in interrupt descriptions and introducing tracepoint functionality.
> These improvements facilitate more effective debugging of smp2p-related issues.
> 
> The devname patch, along with the callback to print the irq chip name as the
> device name and the removal of the ‘smp2p’ string from the irq request,
> results in a unique interrupt description.
> 
> [...]

Applied, thanks!

[1/2] soc: qcom: smp2p: Use devname for interrupt descriptions
      (no commit info)
[2/2] soc: qcom: smp2p: Introduce tracepoint support
      commit: 85a55eeed40db02dfe292712c1789953712f86a4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

