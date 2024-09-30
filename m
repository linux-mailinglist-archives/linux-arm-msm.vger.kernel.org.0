Return-Path: <linux-arm-msm+bounces-32789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 208CB98A77E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 16:44:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C17881F22A0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 14:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF5A192581;
	Mon, 30 Sep 2024 14:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ey1iSMRh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DF01922F6;
	Mon, 30 Sep 2024 14:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727707426; cv=none; b=M8rEBnD+uWJVacQxoyytLuNtmofY0D1EelrO4cC1kan4mn1dxxJA6grtREoIsLDRFGBpsTcpJTBTIM1ai8aI9Ji/pJbWo5AiBzs9DbXydczz2IgFmhyP/+pybz7kotGDLWDcKIeYdt1qoZQeeExg5jcUxFxbhBtDTRUiSX23nVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727707426; c=relaxed/simple;
	bh=Q2YuJhchLQ06poSHZTzxtq2r4V1ioxkny0f6QHo+LAU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eyNBEhF0DjWg5fqpKeLWEfHOa7Mw0Ug28i8I9DF+J/SBIzcp4IRkhUNN1jseyVp3nohxI+6ceUC3xAJOaPieGr6otLOBweTCSrJyApVKcz1l400lvLlqM/KtDjvqrOCsbG16AK//okcJKefr5KNykCgdbiFnssK5vQP605110J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ey1iSMRh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F900C4CEC7;
	Mon, 30 Sep 2024 14:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727707426;
	bh=Q2YuJhchLQ06poSHZTzxtq2r4V1ioxkny0f6QHo+LAU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ey1iSMRhogguUBkHmM2gdxTFxCJ7EEaHnXOcz/fEy5qg/C9Td8rGsuQ7vjC2cL8XD
	 J/Vt2agO32fRKlkQCoZOfyveSJl4UO9WKfZL2cH50mSKPTJUxL63RaT/nTapEKmjwI
	 1Cr6J+GBsxFOxBkmlzGYyMYW1JUXtGzyAM2ELYUjb5n0WkouJAgnLmBCZfXt2OVyuZ
	 vRdGVUn9N86kTUKjUUbSPIBAuk9JsQtvf/Yn/i2XJteH/y3yeQVHGou5ufb8pf2bnY
	 LMitkZa96iQc1mxIOgHrJGnN2GobBb94MfFWkBuqDK76Aqse7jJ8MA30wHU14q1Jrm
	 R5PpBJR8u5BRQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Nishanth Menon <nm@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
In-Reply-To: <20240903184710.1552067-1-nm@ti.com>
References: <20240903184710.1552067-1-nm@ti.com>
Subject: Re: (subset) [PATCH V2] mfd: syscon: Use regmap max_register_is_0
 as needed
Message-Id: <172770742318.523866.16912261914335612487.b4-ty@kernel.org>
Date: Mon, 30 Sep 2024 15:43:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 03 Sep 2024 13:47:10 -0500, Nishanth Menon wrote:
> syscon has always set the optional max_register configuration of
> regmap to ensure the correct checks are in place. However, a recent
> commit 0ec74ad3c157 ("regmap: rework ->max_register handling")
> introduced explicit configuration in regmap framework for register
> maps that is exactly 1 register, when max_register is pointing to a
> valid register 0. This commit solved a previous limitation of regmap
> framework.
> 
> [...]

Applied, thanks!

[1/1] mfd: syscon: Use regmap max_register_is_0 as needed
      commit: bf5b2ddf06da57fa623c11d599697a98f1007752

--
Lee Jones [李琼斯]


