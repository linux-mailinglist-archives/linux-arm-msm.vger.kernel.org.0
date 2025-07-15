Return-Path: <linux-arm-msm+bounces-65059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C6EB06230
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 17:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F096E50373A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 14:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32EDA20B800;
	Tue, 15 Jul 2025 14:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QjrROioe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C762063F3;
	Tue, 15 Jul 2025 14:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752591272; cv=none; b=IWTl+ZAlvk+XOLPpG3lgjXWpHPXvTTmSIQ3JpvIZovv5BevBpHNbYyoKvmi1qaDW8SUYOdUriwDw2LTzRhNi5RpG1apUYW6T0WwucIrWFfvD9ERWsWlFrgYHWccP/M56KbYfaIPN0ZYFBjrdgx7iYtTy1zKR/eE3gUo5wVXQ2RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752591272; c=relaxed/simple;
	bh=MN/yJ7MAHbvlr/l+bA2ZmJcwc9TCpbXzc1yDPL5SQEc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TsaMc28wmGgZh25T7yRbS/G/rzbnO7AChlqXFxKZS53dz7SN7Z6gaH/9Mvslp72jR0J4MMbVkFkPqoW2+VvoKv/MCU12KB6QgHhU6cFH4oJ4VBpEHK6x0OtfLTHCwTawejZEQe3ox+3BejrYgtjRvjClWqz5cDqaHSVYekyjF3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QjrROioe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96E1C4CEF8;
	Tue, 15 Jul 2025 14:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752591271;
	bh=MN/yJ7MAHbvlr/l+bA2ZmJcwc9TCpbXzc1yDPL5SQEc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QjrROioebKQog5Qmy1xuXqSqqA6HwSEQs2YpRHEI7QjJCerihsmRBPNUQqTwF1EvD
	 y3/8IV4+M9bsJ+Rh7xK/hKYtDVdW/ClP6bTcO9FgZ/Mi7oZF1G2RlcthCo9Xuzoo2x
	 9vYsb2qJBNnESXl8hiX8rnIHa52wY34qcHw9WoVMTslYelvJedHv9vqT8OXgKO0mMi
	 cUq3dd3/0mMcJdBThfWhcTDSjqfb5TfvHfEnlBSEXdferx1X4HvKxRpzTzunGmbTH4
	 jcIgZu2tZoHE/G537KhLuuXowUJAyubFpYK36jEkBE5t7rtwAQDx94wsCVZt3nbv6u
	 U2DE1OyNcgbhg==
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>, 
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Sanyog Kale <sanyog.r.kale@intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>, 
 Amit Pundir <amit.pundir@linaro.org>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 linux-sound <linux-sound@vger.kernel.org>, 
 lkml <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
In-Reply-To: <20250709174949.8541-1-amit.pundir@linaro.org>
References: <20250709174949.8541-1-amit.pundir@linaro.org>
Subject: Re: [PATCH] Revert "soundwire: qcom: Add set_channel_map api
 support"
Message-Id: <175259126744.517280.1761573363863267576.b4-ty@kernel.org>
Date: Tue, 15 Jul 2025 20:24:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 09 Jul 2025 23:19:49 +0530, Amit Pundir wrote:
> This reverts commit 7796c97df6b1b2206681a07f3c80f6023a6593d5.
> 
> This patch broke Dragonboard 845c (sdm845). I see:
> 
>     Unexpected kernel BRK exception at EL1
>     Internal error: BRK handler: 00000000f20003e8 [#1]  SMP
>     pc : qcom_swrm_set_channel_map+0x7c/0x80 [soundwire_qcom]
>     lr : snd_soc_dai_set_channel_map+0x34/0x78
>     Call trace:
>      qcom_swrm_set_channel_map+0x7c/0x80 [soundwire_qcom] (P)
>      sdm845_dai_init+0x18c/0x2e0 [snd_soc_sdm845]
>      snd_soc_link_init+0x28/0x6c
>      snd_soc_bind_card+0x5f4/0xb0c
>      snd_soc_register_card+0x148/0x1a4
>      devm_snd_soc_register_card+0x50/0xb0
>      sdm845_snd_platform_probe+0x124/0x148 [snd_soc_sdm845]
>      platform_probe+0x6c/0xd0
>      really_probe+0xc0/0x2a4
>      __driver_probe_device+0x7c/0x130
>      driver_probe_device+0x40/0x118
>      __device_attach_driver+0xc4/0x108
>      bus_for_each_drv+0x8c/0xf0
>      __device_attach+0xa4/0x198
>      device_initial_probe+0x18/0x28
>      bus_probe_device+0xb8/0xbc
>      deferred_probe_work_func+0xac/0xfc
>      process_one_work+0x244/0x658
>      worker_thread+0x1b4/0x360
>      kthread+0x148/0x228
>      ret_from_fork+0x10/0x20
>     Kernel panic - not syncing: BRK handler: Fatal exception
> 
> [...]

Applied, thanks!

[1/1] Revert "soundwire: qcom: Add set_channel_map api support"
      commit: 834bce6a715ae9a9c4dce7892454a19adf22b013

Best regards,
-- 
~Vinod



