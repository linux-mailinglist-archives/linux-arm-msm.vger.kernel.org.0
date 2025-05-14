Return-Path: <linux-arm-msm+bounces-57993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF7BAB7797
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3787F7B008D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420A1297A4F;
	Wed, 14 May 2025 21:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CiOoMLNi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1718B297A4D;
	Wed, 14 May 2025 21:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747256661; cv=none; b=n1gs8b+vHw+ySuyYBdmqtTDIT0ekNlBiZCQXfFKABOxxuVdyrJEtkj76+2ZBvIo9Za33A2Vjz1ypynqYJeqrprkIn0HUBQ0ba0f3/zrFxXoUrVr20F8DpDyyriz8HFHVlwEEU6rVig2N2DFxQGiSxJ+CdDUB4Auecd/PKhfFAAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747256661; c=relaxed/simple;
	bh=cN6Cs9jwPNvolfnxzm8tACImCMexiA/MUI9W9fBPDMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dUSZGMmRGBLOpoKgCRy+dadSL/4sypGW+uj+OjaYVhaU/odIBCO1sJvFVcuehKZBObM3LKUjnntmjugsuAC1tjze21An0vpQQP930DpdT7WsK4AWskgjtCi5adIQm2EmyYHdRde9yp7WyYxExAOU3cLcN4Ifdow9UdrQIBNwx9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CiOoMLNi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73182C4AF0B;
	Wed, 14 May 2025 21:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747256660;
	bh=cN6Cs9jwPNvolfnxzm8tACImCMexiA/MUI9W9fBPDMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CiOoMLNi7kZztSrO+1BFYnfG1B5irLw3iVGwW3ACy4dijB4tjmQ1JCd/V6H5v3tf9
	 rGPY146RoICJarF/e2aFO0XgHerjBH32vQ3PlqL+M2/XYNi8eS02OieJTVPjTdkIFL
	 WzoYNfD6tGZdFO3nZLH/qthV+2pS0wV6ahhQ4vw++UyiJolKitXIKX1UUjCshu9VJ3
	 /ZzywL0OOLTXAJ63gYBF6TaLYsVVSjr/d8E5U5juAsuAPchRxXjD4/JbjIZKyzBHj3
	 ZXidWUeXp7lXOwsH9zKlP43JSHDq1BNkPKCb/A6GXpyAOx0xd1csFwAZIdMCi4FXPE
	 i3l4xV+X/F+Vg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rudraksha Gupta <guptarud@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom-msm8960: add missing clocks to the timer node
Date: Wed, 14 May 2025 22:03:47 +0100
Message-ID: <174725663048.90041.9540026815042329050.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318-expressatt-solve-dts-errors-v1-1-14012a4bc315@gmail.com>
References: <20250318-expressatt-solve-dts-errors-v1-1-14012a4bc315@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Mar 2025 22:10:47 -0700, Rudraksha Gupta wrote:
> In order to fix DT schema warning and describe hardware properly, add
> missing sleep clock to the timer node.
> 
> Solved by Dmitry Baryshkov on the APQ8064 SoC
> Link: https://lore.kernel.org/all/20250318-fix-nexus-4-v2-6-bcedd1406790@oss.qualcomm.com/
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: qcom-msm8960: add missing clocks to the timer node
      commit: b81dcdad43daf10f79ae149826fff9e467b95e8b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

