Return-Path: <linux-arm-msm+bounces-58255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F054BABA879
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 07:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A69201BA3F75
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 05:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FCC61B87D5;
	Sat, 17 May 2025 05:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipZB0eqj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5E11A256B;
	Sat, 17 May 2025 05:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747461454; cv=none; b=eHcgDrGydDZ2dUulL+A/a9zGbqU/cdDXdcxrmQp1zhZ9f7kWkbITFP4dRcibM+/GhCPAD0T3bK6NWqFD2eGijOIh9HUac2DsH8p4/1lmyn57v47fZ/icTgwF1gUGdq+vQS/7ia/HSDenxp9AFM3zkJHtg1z5ikvvd22X73EWQX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747461454; c=relaxed/simple;
	bh=eDJ+gcwqf996sQmare7xFthBUaav7unPR0BnTpwaMBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=luiVwd7jgYXUzSUAJ10BgKUXxUhWXwplLdYvtSru7w2yxRicAcxYMQW5BJCCbqnt0AhG6BmuAmX133jj0hruQvUty5zr5Trbk79DHN6f56uAn42FgpMF+zJ7IEYqrdi5gfYdgbERIpSJMQ6kWbSfZr9u0wxAc/3w0b9FCG+l9Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipZB0eqj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D04C4CEE3;
	Sat, 17 May 2025 05:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747461453;
	bh=eDJ+gcwqf996sQmare7xFthBUaav7unPR0BnTpwaMBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ipZB0eqjIMGmdcuo/+iLm/molbuAw8y+IYUVlJlYlqdsaZf4SeSDLl90wV9p2p+wd
	 v+HjWh/6YHBHicnNStRadyO6SW45E5oktm+SAyceeNs4nONYhd9O1NmaPuPng7Uj27
	 rDUvaKAN5Ix2I21TcO7/D4L9FqnEMexOlkGKOQlBdnRVjFgcnfQnXAg7LjuRVuchYj
	 y7qwu8ZoC4M78k/XGCn6JWxMFqfW1PNoODhhNBG2AnBoDHZpo8ZbPoMjkMVHfmqWpR
	 PXM9mbWJXDwmfnGv9DLBvJQMaFB3Lm+AEg8T0spgJTvXKrb/g20wbn/Xo3SLwVPM/q
	 77kpM/XIzM/Lw==
From: Bjorn Andersson <andersson@kernel.org>
To: peda@axentia.se,
	broonie@kernel.org,
	krzk+dt@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Christopher Obbard <christopher.obbard@linaro.org>
Subject: Re: (subset) [PATCH v6 6/6] arm64: dts: qcom: x1e78100-t14s: Enable audio headset support
Date: Sat, 17 May 2025 06:57:15 +0100
Message-ID: <174746143138.152010.11250887062386242256.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327100633.11530-7-srinivas.kandagatla@linaro.org>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org> <20250327100633.11530-7-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Mar 2025 10:06:33 +0000, srinivas.kandagatla@linaro.org wrote:
> On Lenovo ThinkPad T14s, the headset is connected via a HiFi mux to
> support CTIA and OMTP headsets. This switch is used to minimise pop and
> click during headset type switching.
> 
> Enable the mux controls required to power this switch along with wiring up
> gpio that control the headset switching.
> 
> [...]

Applied, thanks!

[6/6] arm64: dts: qcom: x1e78100-t14s: Enable audio headset support
      commit: 5603525e40e3257ea507ff34f8acd5790fb8bc49

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

