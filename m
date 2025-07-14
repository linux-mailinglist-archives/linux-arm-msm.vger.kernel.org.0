Return-Path: <linux-arm-msm+bounces-64816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EA3B03F1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 15:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2700189DC41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 13:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A8B1F4615;
	Mon, 14 Jul 2025 13:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ym3ywdOh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01151134A8;
	Mon, 14 Jul 2025 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752498012; cv=none; b=DKIpsCwa931BnEnT83EekkSCOIjDIMAmd+tFumS2z4Bu9tuiCiNgiBTjkXoJML3iosZtNXmFNsezblwCM2h8Skb5xkFr3W/cRZu973+8hNqXu0v1vkGP99dhEMpLXVt3Acec16tYVHG3WOt0g5h8WhBqZT9Xd5RZ8WsqUR0ZGUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752498012; c=relaxed/simple;
	bh=BtCeJNubMO+s3Yq8nd4vAdChWR7E6XXazpcsl4bjxHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImdbSwWF3qTa4uffhEuSco/Z02ZVLA9V/s0s6PaGtNLopcvZN7obLp8r8EDriMhDLZtcvl0Jj29Pi0PMkmnKUwk5KfYAMt3M1VBVqv/AKXej4bDBCECb+1qh1YaOqrFBlKfHAVv1tfuhGEGKNmnF5muoJqxCSM3Puux8ozxMGAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ym3ywdOh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868A6C4CEED;
	Mon, 14 Jul 2025 13:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752498009;
	bh=BtCeJNubMO+s3Yq8nd4vAdChWR7E6XXazpcsl4bjxHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ym3ywdOhV85Irh4xn4QTr6jmQGs5Ssi+OI8p6w9nsz0V96ENAy9pUOZ/WnhM1JONt
	 qnZ5nGI5fDuO9XNSXps4nz3Ev5an/sTriBjHbZGvoxN4HsJzXWYAkX2D9NPjigSdns
	 TprTkiXHSYg+w/MhqAdwjE03XYENZaUX6bLxIHD7XzSE6P5NGMTLUbvuhDq3vcH/i+
	 x0KHRuHZjrXA+13KUi3CZM4IJ1GmQ4OSch0FaoycTAW+ZgKQzs3b4/zowQ45sXWtp1
	 pRk8yisKCS9wPy0O4jp7Y/Qpv/8nYF+hcZNFF45ROCNNH0PQRTpzUlYhHdsJx9IQRD
	 2YujQGZ+T+U2w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1ubImq-000000002KX-27E9;
	Mon, 14 Jul 2025 15:00:04 +0200
Date: Mon, 14 Jul 2025 15:00:04 +0200
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint reader
Message-ID: <aHT_VIKk1kvMgoM4@hovoldconsulting.com>
References: <20250714-x1e80100-crd-fp-v2-1-3246eb02b679@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714-x1e80100-crd-fp-v2-1-3246eb02b679@linaro.org>

On Mon, Jul 14, 2025 at 01:48:15PM +0200, Stephan Gerhold wrote:
> The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
> multiport controller on eUSB6. All other ports (including USB super-speed
> pins) are unused.
> 
> Set it up in the device tree together with the NXP PTN3222 repeater.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
> Changes in v2:
> - Describe all PHYs, also the unused ones (Johan)
> - Put #phy-cells property last (Johan)
> - Sort supplies alphabetically (Johan)
> - Johan suggested dropping output-low, but together with bias-disable this
>   would leave the line temporarily floating until the driver probes.
>   Perhaps dropping bias-disable would be better since it shouldn't make a
>   difference for output-only GPIOs(?), but for now keep it as-is to match
>   all other X1E devices.
> - Drop defconfig patch since Bjorn sent a different one that was applied
> - Link to v1: https://lore.kernel.org/r/20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

