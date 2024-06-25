Return-Path: <linux-arm-msm+bounces-24061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 23311915D3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 05:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A04A5B21B05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 03:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FDD433CB;
	Tue, 25 Jun 2024 03:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nvvWfmCx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37731BC57;
	Tue, 25 Jun 2024 03:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719285388; cv=none; b=DusS+xjihd87cQvb/ws0CDmsEKX9tai9x5+jRTcPmiYwzRDdHUcfjCczeenMNMRqMADBmAz4BNDwAI6xlC37xpVL11JaOEA4IJ6NcO4OFS1hhg1X5YpCQQ6Viuz8d3El59StoB/qi/gsHw5r5qxYGh7U4mNDo0jI7v2Hr3D/A0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719285388; c=relaxed/simple;
	bh=ACGm7ZVRHNB+Un9OtjAhAwARqpBHPHGdA81qQtaeLog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qFzGaL7yCy9TORUEMMx0K459Ld2TcD68wjLJagka+SUbtBdWlh6z80SR17vMYxnSBEX5CiPSBooRZPYJ+j7Bx8yvws5+8xJ6c/VOryoixLo16zsw6N8k/rB8bu2FEbxw4VJAhcioLPxQCvpR86s4o6+DuxUgbb0HPjFMzo38LAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nvvWfmCx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01F7C32782;
	Tue, 25 Jun 2024 03:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719285388;
	bh=ACGm7ZVRHNB+Un9OtjAhAwARqpBHPHGdA81qQtaeLog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nvvWfmCxXP25YzkXRMRtkxud7E4yeY+Se3+SNkaPqqqFLb3lVnLD7I0g3SWfLEWlp
	 JaUJHsCwjlRE2TMkHd4cNlzeSn5xC5h4QHEMtGpN5Mv2tyrreQnDrqAMYeVGdMplKZ
	 E5kV61Txfc1kh0/ef5ugBByMQZq/vhe4akcOgciYBwQHnMD7jAIwOqjjwOLEQpkkF8
	 R9zGLxAjbBkw7wO78rLRHVZhR9506UTeqXTM9v+sga0/MBeU9dB7x/qgVva4omYyLW
	 ey8Nt8k2/vceHSAFvVCqEe5nq+fGIpxDrTp+sUaRxPhusreF5gudqarIdJvNZhk8HW
	 57f1pxLJvgtrw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] firmware: qcom: tzmem: export devm_qcom_tzmem_pool_new()
Date: Mon, 24 Jun 2024 22:16:24 -0500
Message-ID: <171928538272.25855.14466635722872184957.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624190615.36282-1-brgl@bgdev.pl>
References: <20240624190615.36282-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Jun 2024 21:06:14 +0200, Bartosz Golaszewski wrote:
> EXPORT_SYMBOL_GPL() is missing for devm_qcom_tzmem_pool_new() which
> causes build failures with randconfig. Add it and fix the issue.
> 
> 

Applied, thanks!

[1/1] firmware: qcom: tzmem: export devm_qcom_tzmem_pool_new()
      commit: d96377892dd89bd4e7e5ae7293647f6bc7bddf7d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

