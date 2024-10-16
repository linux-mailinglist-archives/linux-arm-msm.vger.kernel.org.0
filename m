Return-Path: <linux-arm-msm+bounces-34620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCFC9A0E5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 17:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3585F1F23CC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 15:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22F62144CC;
	Wed, 16 Oct 2024 15:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZmPjpza"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8626C20E03E;
	Wed, 16 Oct 2024 15:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729092748; cv=none; b=ZYC83WA6OR/yvzTN5hHNZIN+pYF0h55dhJ7uIfAa9P9AIbkpr3bXCoKP91gETXJhk4dfqGhc2+P6pdxp0Azjuzo4R+sl5GtPcR3zG3BiXHs/sF6pwBqS65J85Lw6SlJ9Z6+Cbq1Yvw7ttJzjOzLes/0YwsjmDE41o4nYQpwF69U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729092748; c=relaxed/simple;
	bh=XIB12gcajYMXJfBtxg6nzzAzUgnx/qnQG8lsbrl/rM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RpI7Jzj4FmQUwkanVOiXCZBuOeP8YKl63skTiq4fnr9vfsY2PfGH8p4scRYYb1CpthYarmePljQlceN9k4NUJ6N2uugvEKMwElgeoNE5LWJEsiGBHZ8+FBKeL0o3pWzCXSbSvCZZ2EpUM/ANt66CeJlw3MvOnQ8TKZqL/29Dm4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZmPjpza; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEBA1C4CED1;
	Wed, 16 Oct 2024 15:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729092746;
	bh=XIB12gcajYMXJfBtxg6nzzAzUgnx/qnQG8lsbrl/rM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hZmPjpzaaYIu4OVveZibhG835NrFvMDvIzLGdK4SvPXdFxFLUcxfy97KOxYdfT3f8
	 cPu7GKOaYXjZIiQuLhZCt+UqysWSmAndVDcwQa0hAMEj1kWhHKuPb5S0gfFCy4kyDq
	 1GTj2rYtJSKMYP3CKpauGwmDwOZX/j6O4a1W8uSfzjsVng7OhD+xS1WSniWiMzgVHO
	 ARh9jtZlN27csS9qfbwAT+ijF3B1lE7wKgeSkWZ/9CMzb2CLwguuWw8B+fs5PnoMel
	 nwC7uVKK1lJhkHvVAvGkecMUI87aTzdkpGyeXNBqLCHIYlTcqcdWUYaAcybJH4T8Lw
	 xbJySeP4hVxFQ==
From: Bjorn Andersson <andersson@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	abel.vesa@linaro.org
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e80100-t14s: add another trackpad support
Date: Wed, 16 Oct 2024 10:32:20 -0500
Message-ID: <172909273717.703216.12760826985203436814.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004130849.2944-1-srinivas.kandagatla@linaro.org>
References: <20241004130849.2944-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 04 Oct 2024 14:08:49 +0100, srinivas.kandagatla@linaro.org wrote:
> Trackpad HID device on T14s could be found on two possible slave addresses
> (hid@15 and hid@2c) on i2c0 instance.
> With the current state of DT boot, there is no way to patch the device
> tree at runtime during boot. This, however results in non-functional
> trackpad on Product Models 21N2ZC5PUS which have trackpad on hid@2c
> slave address.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-t14s: add another trackpad support
      commit: 8847c970ea06b4ab6f5d713a4adfe01982e4fa20

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

