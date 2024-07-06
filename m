Return-Path: <linux-arm-msm+bounces-25429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B841929579
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 00:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D3CF1C20B4B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 22:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA6713BC1B;
	Sat,  6 Jul 2024 22:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grdIyWMq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A5713BACE;
	Sat,  6 Jul 2024 22:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720303298; cv=none; b=SpfI5joh1z7vAQhX6SZ3r7FS203ksUXLRDsA0OwjANd6CFFbY9RlaohQL42+4LaDHDFeAxmsK7+6Qo+KHGAZGsHx9JmrV/Clv1rBE/ONy+E17f4mbDP57LkW0SOX3ZPMk5G5bhZZbZRfs5fuNsgDMDHh0+IOllr5ro4SLLOyQ0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720303298; c=relaxed/simple;
	bh=DwYA4lKLusu/HdiC/Bc/2Uz1DEuya/5nwJtqPH6jewg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jxSknWnhbPPbbca+Z31OoP8qzPpA+jtygxFZql/YyeFGQ3QJf2KsleC0L63SzcukiFIP75SaTOizzwTCTIBbSTosn8HVsXyctgScT5xsD8A+Op/Xz3IPwmrjbQ4czF+dK+Q2emJLwa2d3qWgJbSfoMM4jcApTS6JF1tbdY/+iaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=grdIyWMq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC91C2BD10;
	Sat,  6 Jul 2024 22:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720303297;
	bh=DwYA4lKLusu/HdiC/Bc/2Uz1DEuya/5nwJtqPH6jewg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=grdIyWMqaY+aaZisW1GOn1SomAtPlZENmocwQHlkgoNoK3xtT0/5u73zNepBLo5eC
	 KwfBIn94vQDRiO6aucm+Q1Ve33p7EkCr7MULGDG92s+sqOCAdKe39QPLuKnnHMls02
	 G0m6cQ9W8EnelISVy1ENUb17UWtSw+hmwj+9EWxQ/+ImVobXtVNItgHd/iwBsFR9hr
	 TsaMu5Tmh/T8ynaML50RFHRrHilrWZoeiDkxOXzOTyFUa4ovTvOHebHVvbfaOAUHuy
	 s6Og1l+3blOEefbjZWGJ7qPjUK59+atMK5oGRd+erc2RmMN2xKtoGtQqw9mAdz/BNs
	 VjL2yK979JkOg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] soc: qcom: simplify with cleanup.h
Date: Sat,  6 Jul 2024 17:01:20 -0500
Message-ID: <172030328798.28909.3009844287621696089.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703-thermal-const-v1-0-6e59e139c65d@linaro.org>
References: <20240703-thermal-const-v1-0-6e59e139c65d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 03 Jul 2024 11:42:35 +0200, Krzysztof Kozlowski wrote:
> Allocate the memory with scoped/cleanup.h to reduce error handling (less
> error paths) and make the code a bit simpler.
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[1/5] soc: qcom: llcc: simplify with cleanup.h
      commit: 04e60d7a72b65f8aa45ef04458c818e9c95fe584
[2/5] soc: qcom: mdt_loader: simplify with cleanup.h
      commit: 01dd825d2b54edc90394f297830c63047b424da1
[3/5] soc: qcom: ocmem: simplify with cleanup.h
      commit: 20635bcc12d5feb1b0005d559cf7cf27743045df
[4/5] soc: qcom: pdr: simplify with cleanup.h
      commit: 0ed06fcc7a84ea4861564862545dc7805c0f132e
[5/5] soc: qcom: wcnss: simplify with cleanup.h
      commit: b066a2c430f3f8d0aedba44991e0a69e21b512d3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

