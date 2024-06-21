Return-Path: <linux-arm-msm+bounces-23503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 132AB911AFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCB43283D4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 06:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F5E14D449;
	Fri, 21 Jun 2024 06:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GN1hycuv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB081149C65;
	Fri, 21 Jun 2024 06:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718950294; cv=none; b=X+03jxPGwV04Hp5LYkI2fGPgPeKNewOnVycjgHIVL/9dQiaP4cS2nJ4mPWlWqmZIM9aoR7ZT7nDwdwLfpRUUoyEKOaeEro3M3qwzd0MFUJdgl2eXjISsedoJ1g6jMIGva+55uVM40Qd7wbcdMDwOzMHkwpq3NNUT63UItHHszEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718950294; c=relaxed/simple;
	bh=Bqd4wlqK9QlN0yzJ4b3abfw/05x6FyfB/M5Rjae7FJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NoXyDpz0qL+3t3SSOHqJ/DLnnXzAOFSQxQO5z88GfngmBIFvjTPyZ0yKNrBbq/y0X7PVF/1ksaL2WhlxA4fTBMfo5DqVJz9Q7o3PgDVM0n9BEz189Yqi0REpolGuJ6/3kS8b9t5EWRtockpKPRTd1QF+bi3HIS1bH+ANwSX6aqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GN1hycuv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB83C4AF0B;
	Fri, 21 Jun 2024 06:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718950294;
	bh=Bqd4wlqK9QlN0yzJ4b3abfw/05x6FyfB/M5Rjae7FJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GN1hycuvvDdk6PT6ALqaTYsw/ek/yX4XBy7inkCXVvSqmdJNgqrW5kg6/FhDvllKX
	 FAcAtPt1AP3wHHChaZm+PZJh2ioRSKrTm5CXlVyC2UBNVfjAGwMdtWhjOq/d61HQjd
	 CJqdAqtS6EHfIG/B7tHlD2vpRW6MTXp1xhu32XKeyYdH+CuVmH6w1zXeb2ijn238ZJ
	 uQQ9BhI4leuYl+HERh1t/JqvPAKYHPioXFeLcB4/bJpkOYxASOsMfaTUwv83x9uPJY
	 iY9wzHbs2fXafgVhu39nT57xmUPcM9K4OPQArAPiDYGNtvFXZXj99pkC/HC1mql3k/
	 kLJ5ZUYPm2r9w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Caleb Connolly <caleb.connolly@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] qcom: dts: qrb4210-rb2 usb/emmc fixes
Date: Fri, 21 Jun 2024 01:11:16 -0500
Message-ID: <171895028793.12506.13113542494347666974.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619-rb2-fixes-v1-0-1d2b1d711969@linaro.org>
References: <20240619-rb2-fixes-v1-0-1d2b1d711969@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 19 Jun 2024 22:33:37 +0200, Caleb Connolly wrote:
> Add the missing iommus property on the first sdhc, and set a default
> mode for USB role switch. The iommus property in particular is necessary
> when running U-Boot as a first-stage bootloader, since it can't rely on
> EDK2 to configure the SMMU and crashes with:
> 
> [020b9ed0d]TLB Dump Message:Not a valid memory address to dump TLBs for device APPS_TCU or no memory available.
> [020b9f533]SMMU GLOBAL TCU NON-SEC FAULT: bit mask=0x00002000
> [020b9fb23]SMMU:>> APPS_TCU NonSec Global Fault:
> [020b9ff9f] NSGFSR=0x80000002
> [020ba0404] NSGFAR=0x00000000bf6c6800
> [020ba0909] NSGFSYNR0=0x00000000
> [020ba0d1b] NSGFSYNR1=0x00c000c0
> [020ba117d] NSGFSYNR2=0x00000000
> [020ba15a9] NSCR0=0x00200406
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sm6115: add iommu for sdhc_1
      commit: 94ea124aeefe1ef271263f176634034e22c49311

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

