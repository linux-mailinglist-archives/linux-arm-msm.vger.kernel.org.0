Return-Path: <linux-arm-msm+bounces-68390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 673FBB20CBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 16:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4603B189A885
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 14:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFAAC2DEA90;
	Mon, 11 Aug 2025 14:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3MOnV2l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A692DEA89;
	Mon, 11 Aug 2025 14:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754924246; cv=none; b=q7D38uMS6YwcL/Ly9A2z+jZq8kjsmpOApyZdu6jRbQK8CBhVDYhHCdd0pRC+BhVJxCteNSOdqXc8WRkgQXkTYmuKIvfO/h2r+V5lyZP4s9W0cN/kN5kXZhTKd9WMW0GQsTuQhjjOXqr7W/fP/h/xMmwJ/+U5SUcmYzNZG1KqbRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754924246; c=relaxed/simple;
	bh=0wtAO7e7m9gGPsX0MdV3BMf9S3FRFecK2tRjTxp18U8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ukkq6KIg9h7VAJ+wCOfqBrNp2t/nRl3ioWw8WrtaIIDvu3M3DeQW2WAxcUCA9+RkCo6gvtu+jV3QK+uK6W8myM5OTBsoZChT9oBLo63fd6ZJfzzR4dU1J39amn/NZ/tO7YcVv8UqbvgtOsDYPcYgutC2rQ20SNJkCRfuxICIMcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3MOnV2l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF77C4CEF4;
	Mon, 11 Aug 2025 14:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754924246;
	bh=0wtAO7e7m9gGPsX0MdV3BMf9S3FRFecK2tRjTxp18U8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h3MOnV2lIcjxyTzeVmKDvOKHWoUg5QucdbQbCpvyvu8NJIkGsF0h+OJ6MSNw//FOl
	 HvUXg1neMt9mmPbseTREzKzCb3GFWXM3VCF9EjNzgH6mD6JC04aTAyM2YARpROXS94
	 vmz3vBbf/Ic7HqydQN8cEGNYB7/ekaGR5hJ0hCCZ8uzTNoLUMdhdaFeuifLZgiRe6h
	 Zk9MEe0Un6Rsc4HOPSFjNkVu8NLl5cTVWHM0u9lxxMc2Qtp7xXwqjZIVcb55HSbR4u
	 L6cp3pW2J5xTvYthh9I+GUBdYnpGeFKV9ZEu120gFK2jUHvIG1NANcentouCpQ5oJ3
	 EwoTOnktN4aIg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] soc: qcom: mdt_loader: Deal with zero e_shentsize
Date: Mon, 11 Aug 2025 09:57:20 -0500
Message-ID: <175492423747.121102.11898677714187683397.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250730-mdt-loader-shentsize-zero-v1-1-04f43186229c@oss.qualcomm.com>
References: <20250730-mdt-loader-shentsize-zero-v1-1-04f43186229c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 30 Jul 2025 15:51:51 -0500, Bjorn Andersson wrote:
> Firmware that doesn't provide section headers leave both e_shentsize and
> e_shnum 0, which obvious isn't compatible with the newly introduced
> stricter checks.
> 
> Make the section-related checks conditional on either of these values
> being non-zero.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: mdt_loader: Deal with zero e_shentsize
      commit: 25daf9af0ac1bf12490b723b5efaf8dcc85980bc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

