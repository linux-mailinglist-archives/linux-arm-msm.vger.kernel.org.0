Return-Path: <linux-arm-msm+bounces-82717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3C4C758FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 18:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id 2BFBA289D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 17:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE8E36CDE6;
	Thu, 20 Nov 2025 17:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="no505gVk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D3832471D;
	Thu, 20 Nov 2025 17:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763658667; cv=none; b=h05vVVmtLTQWshEYxuWGE5q39xFTNqpbm7UNOfndno7bpUS2hVJK3/OC3RLVwBq8eR8otOAAmYVIX1i3wEjr7/6IGIzdDOXJ3zB3a15O1Z7H8AaojN8/dE0Hb0QkydweuXdftj9llK9+evtG7GI/9Z5P8CTbXzHe6yHFnibnbOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763658667; c=relaxed/simple;
	bh=xyRZEuNoOtmwK7QjfAkmVwp6Fuz90wGnSs5wkHI7Ib4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aBZAe5MtWXN93YnCl+Jt1bjRrVFu0K5RJjV2QF9ic7FU9ALp+T+w1YCTcbjQfpodN2kuhSr9Lt8oghLLrMA9SqYIbveeyUAC40vuow4sFKN5eHOOwfQKFZqG71EtWv2x0+4l8x3XVT2P0J7i4e2Rmtp9D4RgHhMM26eZdBJKqGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=no505gVk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1E3C116C6;
	Thu, 20 Nov 2025 17:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763658666;
	bh=xyRZEuNoOtmwK7QjfAkmVwp6Fuz90wGnSs5wkHI7Ib4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=no505gVk3Jg5ybrW5UuuUwgGtyMzV+v8r+8RBBDhk1yd5Y0Swx7xO6ZIB7+V7RwHM
	 y6dyUactujRh2gD0HIoCQQPQWLMc7ASW9NO6XkakGxREU7eRTFC8YWWUYJRm1o+8OJ
	 G4xOGkiFbpJeGfm6eFlhKKnMtbIPMM7tZXKZrnqwE07rcOGbkaRbDidN8cJjHCkyVP
	 i6rL1GycsaMrZutXdMI2Sn9onwVCL158Gexzeqv+GbkwUcIIV3bcIR9/RJxujZPKgX
	 LdCIhd17LZmLY6RkEk7xTDd5S0V6D93O1C6DSENRgVDUQrPgFBP4meI5CZY/z7xUMo
	 ndFMLxXYycWDw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Faisal Hassan <faisal.hassan@oss.qualcomm.com>
In-Reply-To: <20250922135901.2067-1-faisal.hassan@oss.qualcomm.com>
References: <20250922135901.2067-1-faisal.hassan@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qcom-qmp-combo: Use regulator_bulk_data with
 init_load_uA for regulator setup
Message-Id: <176365866344.207696.2538575283551353793.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 22:41:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 22 Sep 2025 19:29:01 +0530, Faisal Hassan wrote:
> Replace the custom qmp_regulator_data structure with the standard
> regulator_bulk_data and use the init_load_uA field to set regulator
> load during initialization.
> 
> This change simplifies the regulator setup by removing manual
> allocation and load configuration logic, and leverages
> devm_regulator_bulk_get_const() to automatically apply load settings
> before enabling regulators.
> 
> [...]

Applied, thanks!

[1/1] phy: qcom-qmp-combo: Use regulator_bulk_data with init_load_uA for regulator setup
      commit: 81d75558406609f311766a37ec4b2c74d7b11ea0

Best regards,
-- 
~Vinod



