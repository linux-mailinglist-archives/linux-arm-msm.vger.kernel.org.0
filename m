Return-Path: <linux-arm-msm+bounces-57761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A77AB5DFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 22:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5ACA6162ACB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 20:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA1C2C1090;
	Tue, 13 May 2025 20:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T7SnjTEb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8B32C1084;
	Tue, 13 May 2025 20:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747168945; cv=none; b=bhOzWmxaKKDKF5EpDuZsAgU2eQvWafKcHKaK3N9z5n7Ysg8TC7ckzSbFXJ7WgWyTcVRLbU19twU3VcGmZSyZXi/YdXiuU6xObrGk/m5IR5blTuv9XLZe9/BaxYyXVdM3CxoVeDk44xUS8d+iuraqb0dyEYq0DPdbZbUHsNfE464=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747168945; c=relaxed/simple;
	bh=YiBpwm6OJL7WJlpWaLFsnkQwOFrU965bR4dC2D3qrTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iuXAh5IjE+05j/1iZA2YQS3NiTZpRbCtglX6LZedu+4jJDk/1uPueMXPIXDooCOfDZuqrHsgH/JAUZNI//rQgiesPNrqzA/mdOnwWtEBgPyEZ79NrTRlb8S9p60wn/t3Oj0jVR3ripwhPBc6foj7+W3zPsHh9opHGTXi5zJNsaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T7SnjTEb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07D6C4CEF5;
	Tue, 13 May 2025 20:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747168944;
	bh=YiBpwm6OJL7WJlpWaLFsnkQwOFrU965bR4dC2D3qrTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T7SnjTEbLeTDAEpn6k1f+CRVGi4ztZeL3V3xADUa0ZoXXuAGz3hRYsngy2qeHUFBK
	 qMCFzjEJgSnCwuONhQ2lEKvynmNhzd1gpGexc3MYH33GsVAWMIVbNGhknxispPrSkY
	 R1WjNfF/kI6v27Ffn0SSXHoO42iI57mI5bBx3JPadfQozljwVPMTbkJjngqfhz88Ju
	 b/v5hwia8PZa13RwRg3BrLsHpWHkpVVjAHoH64gwAB+NmYvzsWwxnmFQmnSYLw7jzs
	 MK6rN/jymY3UNbcMJxojhv1OGNMEGTMid0ZeLkpEucT6Xg3dQogpHoDeuGpa6JJsfa
	 9Pcs/h1kM8HdQ==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Luca Weiss <luca@lucaweiss.eu>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/1] remoteproc: qcom_wcnss: Fix on platforms without fallback regulators
Date: Tue, 13 May 2025 15:42:13 -0500
Message-ID: <174716891500.3696994.17530759263131945454.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511234026.94735-1-matti.lehtimaki@gmail.com>
References: <20250511234026.94735-1-matti.lehtimaki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 12 May 2025 02:40:15 +0300, Matti Lehtimäki wrote:
> Recent change to handle platforms with only single power domain broke
> pronto-v3 which requires power domains and doesn't have fallback voltage
> regulators in case power domains are missing. Add a check to verify
> the number of fallback voltage regulators before using the code which
> handles single power domain situation.
> 
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom_wcnss: Fix on platforms without fallback regulators
      commit: 4ca45af0a56d00b86285d6fdd720dca3215059a7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

