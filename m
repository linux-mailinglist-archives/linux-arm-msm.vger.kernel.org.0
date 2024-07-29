Return-Path: <linux-arm-msm+bounces-27173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 235D193EC33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 06:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C32491F22B55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 04:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E319132492;
	Mon, 29 Jul 2024 03:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJjsrnBX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D1013212E;
	Mon, 29 Jul 2024 03:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225531; cv=none; b=pkQK7OYG3g8jdJDg7nyAMAFOKKpLTaiB60n89/cF9GUsgBd/DaJBxCqA2IniODuaEMhWQ6VIkbV7POWWLMN6rZyNsy79w5ny8Y44PdxkcKXXLERLtsXb/Y9H6HLLjigIM/t0qrT3ZUoF01u+p4zhbcNg29WlCY/dibryiO4yKZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225531; c=relaxed/simple;
	bh=APVt9llq5myGDFCtafVZJaXHoIIcdZz+kIdn3LaHTnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ATLbZ7GvudRaSHpNBHwAMkxkfWTy5rY2m7ueR/PfStnfuvdLK9mFeYA4pgK/dSxipq064Wfiet2AHoURIy3+rPr1uxefSWj3Pu4KIC7s94OY8bcESmRWUbLC1KIx/UVTnr7xIY4kgvkj7+a8Wm8f7Q7wh/3CuJKwqWyap4h47Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJjsrnBX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5539FC4AF09;
	Mon, 29 Jul 2024 03:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225531;
	bh=APVt9llq5myGDFCtafVZJaXHoIIcdZz+kIdn3LaHTnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LJjsrnBXTBuYxr9GVG64C5gAz6IicTYKdCiePGQZiVYzGd5cEh18K/O6frLEq4WNy
	 ZpVJbA/4K2FA1PIyKVuLV10SPXXAEMgR4vYeep6Zyt4RL/BN81RNsIHtZpGN53w5/G
	 XbB0v5a091Qo7sNmkNXeXNFLxqN6KgKtuWapT2wE37ce8JopLThCSRJ1iCkTdte8+I
	 xWjfYA8dDWwWJza8M2uNOt0fQonHbrELs4V15rdEcAYAOAS9r0SKu10xmCZOlRGp6l
	 K1ppYe+iRxc+KkjD4XPK0Wh2mPAr+bLpZCL2+ho5hnC0HUUsEE4Oq2w5fijh+lN4wT
	 JP/jt1Pr5PXjg==
From: Bjorn Andersson <andersson@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-sm8450: Do not turn off PCIe GDSCs during gdsc_disable()
Date: Sun, 28 Jul 2024 22:58:17 -0500
Message-ID: <172222551323.175430.9264124704995863171.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240722105733.13040-1-manivannan.sadhasivam@linaro.org>
References: <20240722105733.13040-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 22 Jul 2024 16:27:33 +0530, Manivannan Sadhasivam wrote:
> With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
> can happen during scenarios such as system suspend and breaks the resume
> of PCIe controllers from suspend.
> 
> So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
> during gdsc_disable() and allow the hardware to transition the GDSCs to
> retention when the parent domain enters low power state during system
> suspend.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-sm8450: Do not turn off PCIe GDSCs during gdsc_disable()
      commit: 889e1332310656961855c0dcedbb4dbe78e39d22

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

