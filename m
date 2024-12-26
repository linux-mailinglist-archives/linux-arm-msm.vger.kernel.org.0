Return-Path: <linux-arm-msm+bounces-43412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CEA9FCD01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FABE162EA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5631DF97B;
	Thu, 26 Dec 2024 18:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwQGlyp0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A721DF971;
	Thu, 26 Dec 2024 18:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237671; cv=none; b=enU3vnnFY/p/HnruY6iALRrg8Q4eEQ4Bo226BY+u1cWwH7snMkhQiLbO++TJah/avb16aHBibktIckYQ90Un5Gqd7jLKC1kb31dIgEZsNMP01+6SMY4rPLOh2lzdlwXBlv6G46UNGvvPsv90MzTf6Gqt+VHkdyDZCvatt/6S5Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237671; c=relaxed/simple;
	bh=VP0YmaV52KiBLWvUfKNgIGV7VPXZlEnTFAFGrFi4buI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a8+AVTBtXbC95esNhx2Cjiv1NZI9VIqfBuciprYAeWKvVq1QvtVx6FmXvZvMpAQbf7b5NnBTgdhdtil+ECAmlDudpEBms6FHMszNNUQQuskgytUs2nKs231/cSpsWLsrAWFeojWoz6b7pz0KplGPO+q3PF3z1dH7D2U6kjvx+Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwQGlyp0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8F7C4CEDC;
	Thu, 26 Dec 2024 18:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237670;
	bh=VP0YmaV52KiBLWvUfKNgIGV7VPXZlEnTFAFGrFi4buI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZwQGlyp0zo85l+eI3NfBgOOhrjLM87OVqzV7R1uqZq2RUYmAHw3y4WNvZCiAEmTjK
	 lWxfv2c3D2XKygSM4C+c98UanuQklAZhL+sjxoFNUDN/Inn23+vLC5QxfjcisGPQpt
	 2r8OZf2ZP/5vOjoJHj/dL11HuRWSPVbxH2c2vyLHyPG1hMY4tj9EmiztXnd9j1P9IN
	 cHRM4LLaXq2b42UCw8CLTOmA5/btiN/Wx71VpXp21p8DwxoICrkXafDjZbfR2CU9AM
	 0t+VlocDiREo5YyIX07Wmz9O3zXX3IcpOTUplwoAPnXXUlrKuLfWGx6U8QxeDBILho
	 zBxdJcCjvM6aQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: defconfig: Enable sa8775p clock controllers
Date: Thu, 26 Dec 2024 12:27:05 -0600
Message-ID: <173523761387.1412574.291134430312189223.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com>
References: <20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 24 Oct 2024 23:22:55 +0530, Taniya Das wrote:
> Enable the SA8775P video, camera and display clock controllers to enable
> the video, camera and display functionalities on Qualcomm QCS9100 ride
> and ride rev3 boards.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable sa8775p clock controllers
      commit: 8592294dfc7b46c7b964f453d64e90e6c1137090

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

