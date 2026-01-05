Return-Path: <linux-arm-msm+bounces-87486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6C9CF445C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 16:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 584B6300CF36
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 15:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101A433A028;
	Mon,  5 Jan 2026 14:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfYaoE+i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1D1314B86;
	Mon,  5 Jan 2026 14:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622107; cv=none; b=HbOuy69fDyyAgtQOvUr6A0YvV8GmK1/MIIv1jgh8zK/2YpVAfuUpDJtBiQ04EKA10OqIWeErylK9/kmBuCABI8AsqXYBlK+6gtypoaT3yWp49NGn54Nwjy78Qrdd+U4Q0Z3fWp9YvXtEVyyrZFUy0BijNUZAPvtfpOgHcjfvdbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622107; c=relaxed/simple;
	bh=rgwvarEcd76+ypLeUaD3y5gBAR7/Pau59dCY4GHKs20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KYoy4DMB7rKu7DmV3FEcZn+l19x0pvFC/fWcByPIuXeViMU+uXupE+1oX0aAN0fAbExHk51Pe0mlwh2Hm1NbTJf0Yw4MEOJRmDFPzxRvDZeRUKwJSaiFs+6CplRUXXnwFJroxJApEemvvP0Ee5NLLm6as5gwpPC8wsLrprBfoMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IfYaoE+i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BCDCC2BCB6;
	Mon,  5 Jan 2026 14:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622106;
	bh=rgwvarEcd76+ypLeUaD3y5gBAR7/Pau59dCY4GHKs20=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IfYaoE+iJt3A/dAECy12Cc67LNgXCaER1hX/c5/PUOPIzTlVmsE9Mm5cxgwEMj55r
	 g1ebwpwXZS2OpQjla3TOLPEIQle3PLBNaraREG4FRwlbalh+L6h4tdaWCD4xC84ZlY
	 Ib2nNEiix6ynC70B+Nu7/AcIUC9/AJqsaKzEtmjDiOo19pDBcifegPrUx43XjO7eFC
	 6I2Em+3gd/79nhQ9i1PMUMHjruToyCCbjH6gjrJFs0D8j0g9iBBLTf6ChE9BJx6YMy
	 WL9Ogkr1H/lxwrWXVtbxUANl5AHyoiaGzW/vFBhlFbekXhJVdTadeUkDhJyK5XCkP6
	 HjA/pveEXRpxA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable options for Qualcomm Milos SoC
Date: Mon,  5 Jan 2026 08:07:33 -0600
Message-ID: <176762206365.2923194.14017762679747233922.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219-milos-defconfig-v1-1-f58012ac8ef6@fairphone.com>
References: <20251219-milos-defconfig-v1-1-f58012ac8ef6@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 19 Dec 2025 12:39:03 +0100, Luca Weiss wrote:
> Enable the pinctrl, clock and interconnect drivers for the Qualcomm
> Milos SoC. This is required for booting The Fairphone (Gen. 6).
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable options for Qualcomm Milos SoC
      commit: 94d5285f2fe5a3e2e9b8de88b73711a1173c4159

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

