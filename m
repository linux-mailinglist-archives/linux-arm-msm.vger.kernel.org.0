Return-Path: <linux-arm-msm+bounces-57757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B7AAB5DEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 22:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D068167505
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 20:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7031F4180;
	Tue, 13 May 2025 20:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWbtqrog"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7571BC3F;
	Tue, 13 May 2025 20:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747168942; cv=none; b=M3szJ6NvmDnD4meb8dMiWigopXpFZ9CJjniyYMkBG5fR302u0R6xg3Pi3nvmgWyvUSJkhiMnGa96gEizvU4ChyPpyFVMXHuTXA/x9//CjuImAPnI6f8mXpvBh38fc9V5WKC7ZWXVh0EkHNyGhyKj2qDK18wD0uTLJ12ie0csrTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747168942; c=relaxed/simple;
	bh=zE2KJI8tD41HF9asN3EFFys1c6UuUWALgh/fM6HZUH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L3kvUeDZ6bT15N8xe+PdkT4am3P/wTnH4E6yzS1OAo02B4GzZO6uRHg21t6pWClpx0W1BrcHbzGEZCWP+b3h0RHcK2CbmOSnoWBg+b8/5M/xqayMPyamsbPK/XQstl4Dc1reNKMz/1rzx0Ujxtmtzoa4kghiDTXxBquqxqEbCGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWbtqrog; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F28C4CEE4;
	Tue, 13 May 2025 20:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747168940;
	bh=zE2KJI8tD41HF9asN3EFFys1c6UuUWALgh/fM6HZUH8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PWbtqrog/Yal/Bjln8ebeA+JNwKeSKSZDveJM3pe7xEM2OGyVuaohEwUc2lABJ3dW
	 +TIua8uXgHZ5ygufuDIICH/fTxDAPGveAoxqKwMjCIiEGhr2F9x+iWw4SgIfseC4uQ
	 hAp9vMil2GYi+fhTnlESsB6AGm9vNJTttAIV0I3hgl4WEWL8Qxeu/3Hi+cNHx65Hzg
	 l7GxiNwm61sd6pXmGCoGjx9FLbcxMmGWIMbsZhbyZjF8UsRlT28obF9dvKKqt4l9M7
	 3u40qGZX8HfCpPfnVtJo0V0PGFEds7nxSLMINTCdAMVrc03sTgpg4luD5Y9qJft+3k
	 lgrV2OKUoBneQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_wcnss_iris: Add missing put_device() on error in probe
Date: Tue, 13 May 2025 15:42:09 -0500
Message-ID: <174716891494.3696994.7405706762307984150.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <4604f7e0-3217-4095-b28a-3ff8b5afad3a@stanley.mountain>
References: <4604f7e0-3217-4095-b28a-3ff8b5afad3a@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 02 Apr 2025 13:59:51 +0300, Dan Carpenter wrote:
> The device_del() call matches with the device_add() but we also need
> to call put_device() to trigger the qcom_iris_release().
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom_wcnss_iris: Add missing put_device() on error in probe
      commit: 0cb4b1b97041d8a1f773425208ded253c1cb5869

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

