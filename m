Return-Path: <linux-arm-msm+bounces-27191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C75DB93EC6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 06:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F6D41F259C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 04:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC522145A1E;
	Mon, 29 Jul 2024 03:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxwFbop7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F860145A17;
	Mon, 29 Jul 2024 03:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225551; cv=none; b=BLPVxdCgAgFzVibWi3WVexgYg9C7hVP3CR3TOr2ij8uxdgXgYFazC+ntVldxZ16m99D1YsbitzszpywCWxl46Hf3AHmMkoofpwCeEkmcIWV72wEM2CTEJZBSyCamKYVPvvGQ7o5BDA/in07hcC0MRPPKqiyaXSoEMONkpx4UrE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225551; c=relaxed/simple;
	bh=WAfvyJZp5H3lwYiCYPkPIErsOF3cuWdP3P6hsXJ+9vw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jx/T1EU3ibY3xJlA+QXa1DjNRf5f75yv+zehxRRQb6IF2I+D0dw1jPYcSVDsQOD+fW3fJw3hxelTuwdX/Q93+Si8sD7L5AOTP/+nPJGp+ANZmgDvKRzPTUmiEQWMFYutUw+arj+pp6SEA9lVkdSwrxy/zNiKr89kM0tmeTQYk6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxwFbop7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA63BC32786;
	Mon, 29 Jul 2024 03:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225551;
	bh=WAfvyJZp5H3lwYiCYPkPIErsOF3cuWdP3P6hsXJ+9vw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PxwFbop7Nvguk7IFpc2fr1xnbYtzXIs75PvwgcLdpuR6B0TAP+DZlmdsKphmcoXTn
	 w1RFlPFYVdjdyGbcLS2//jti17V+ZJMe7gyS3A6RnsReoNCTClY4yKgOzzDcfLqqUt
	 P4u5TfpGheED3mJRaSaYszLhURynqERqoFwvaD9Zx4bmHgT2DtHPlJWBqaK8KqkJVZ
	 rfi8Q4+DDFrO3dWB2ZVPN5dvfR6kczJhjktar/ZWGddlIQxVLIqCHZ5QmB91UWlzxM
	 pXThad/T9Yu2kHvCfJd+qf5bHYYSSkvRJvN2cmkHSPQuH4EPVnNYfgHU/OM56fWrOU
	 HqjTeD1CKtuzg==
From: Bjorn Andersson <andersson@kernel.org>
To: Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bingwu Zhang <xtex@envs.net>
Cc: Bingwu Zhang <xtexchooser@duck.com>,
	Rong Zhang <i@rong.moe>,
	Daniele Debernardi <drebrez@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Luca Weiss <luca@lucaweiss.eu>
Subject: Re: [PATCH v2] ARM: dts: qcom: msm8974pro-samsung-klte: Add pstore node
Date: Sun, 28 Jul 2024 22:58:35 -0500
Message-ID: <172222551306.175430.14351550167986918903.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715122201.345426-2-xtex@envs.net>
References: <20240715122201.345426-2-xtex@envs.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 15 Jul 2024 20:22:01 +0800, Bingwu Zhang wrote:
> Add pstore node to allow for retrieving crash logs.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: msm8974pro-samsung-klte: Add pstore node
      commit: 56080a49773935fb899c6559c390a5f8439b5632

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

