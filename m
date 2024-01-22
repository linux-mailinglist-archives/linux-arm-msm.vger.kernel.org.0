Return-Path: <linux-arm-msm+bounces-7812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B2A836A46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 17:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB5611F2520D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 16:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD074137C42;
	Mon, 22 Jan 2024 15:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="yTwaCPiy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C25137C33
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705936484; cv=none; b=CdiUZ3IJ2LKSLA5oGdE6MyIb9jlpeCBxf1429qjsszZYzBWzRrJSzA/gmx2rMxr6+e8y7BEBF9s3EPaGCETXqoH7OpdSdzf2qFpkZ2u+uY2/1gwNgK0VEC0qt9MadMeqQ2dNU8sQqNNwrtYYvOfRfTRB8nIIAHLVFhxyzQoX610=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705936484; c=relaxed/simple;
	bh=8xFLD5XlzNw6zyK2a6hzmBpPytKq9ZtpEWZxExST8nI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EUTbW6J8xvyMbkW3Eqqo39Gr7htTePArrjJ5QYvucHpzKjPiIbinI6zVrRBvP90IFdSuLMTAbqLOD1kYwv0W9ChNlXItKT2CroqqKamY6zWTp7nXwlfYdKQtXUKNvr9pyJLHEcILbUUtIZB6Q/yyRI1wPE0unKDV3MyNF3QyTlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=yTwaCPiy; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705936481;
	bh=8xFLD5XlzNw6zyK2a6hzmBpPytKq9ZtpEWZxExST8nI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=yTwaCPiyDDgjHUsbAwmaFw46xIGkcj9NiHY0P56HMzyFP/JSd67nT/a9anLJkIK3b
	 7Vif8/gv+n3QEgJxX0VBCSxAluGBVUFtNqrAa169czXfdxu57h0L5oxp0odgCUtC2q
	 lxL4Mocfj8nvUy5ezO9LHmSFObimZjrlISPkIcc2ZJFPUU62CNOoDUfhoZ9+B0xh2m
	 2wY/DjTaoMxaohhbqs/WZWdGMFHqd796UlO71mm56o7U+S28hWHnng1hTD+Q0Vepc3
	 SzkwGri9V6io6bOYKRK68UGYF3XeEo9ObMhkZxvZtaxLxcS5uM86f8FlGs81Aatuk/
	 nvgOSR9lT8vkA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CB4DB3781477;
	Mon, 22 Jan 2024 15:14:40 +0000 (UTC)
From: Laura Nao <laura.nao@collabora.com>
To: laura.nao@collabora.com
Cc: cros-qcom-dts-watchers@chromium.org,
	dianders@chromium.org,
	dmitry.baryshkov@linaro.org,
	kernel@collabora.com,
	konrad.dybcio@linaro.org,
	linux-arm-msm@vger.kernel.org,
	swboyd@chromium.org,
	angelogioacchino.delregno@collabora.com
Subject: Re: sc7180 kernel hang with linux-next
Date: Mon, 22 Jan 2024 16:14:50 +0100
Message-Id: <20240122151450.60234-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240104101735.48694-1-laura.nao@collabora.com>
References: <20240104101735.48694-1-laura.nao@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 1/4/24 11:17, Laura Nao wrote:
> 
> Yes, I'll try to bisect this through KernelCI and report back.
> 

KernelCI has not bisected this regression yet. However, upon further
investigation I noticed the kernel was getting consistently stuck while
disabling the display clocks (namely disp_cc_mdss_pclk0_clk ) and booted
consistently without issues after adding clk_ignore_unused to the 
cmdline.

The kernel configuration used by KernelCI had CONFIG_SC_DISPCC_7180=y ;
setting CONFIG_SC_DISPCC_7180=m fixed the issue as the display clock
controller is being initialized a bit later in the boot. 

We're going to set CONFIG_SC_DISPCC_7180=m in the configuration used by
KernelCI and monitor the results for a while, I'll report back to
confirm whether the issue is still present or not.

Best,

Laura 

