Return-Path: <linux-arm-msm+bounces-25442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F089295A2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 00:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A2FF281BE9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 22:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227F22C181;
	Sat,  6 Jul 2024 22:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+XhgEAR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDE11CD31;
	Sat,  6 Jul 2024 22:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720303742; cv=none; b=io4kTBMczBRIptGHbD7/Yho7Yrg4h6rOrxmDg/pFcs2cBedgmV+DBAUOPUA+0Sx9NdJkdcxH3g58/3M41PVIqowiwP/Eh6qNKsaqUnXwboSz0PIpG9smyGA0rXvKd1UYhI3sp8aDsDCYQAYb9nK3Dq59X7fv0yzjq9JZF3W9b6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720303742; c=relaxed/simple;
	bh=Dugv1gTt6phAkOgWqtJfMeJpuf/B+u/pk0fLDqzZQuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MB9kRY0EJzocnkOGxjrdmIrOS8cCxHytHM1eSh0qbJjWgO50dobHcgsqEouyA5eO0ZFEzmtBCK4dx3JcKCo1H5NV767PuceUK7lWuUKqNMzGSuPhZivMyidmNHyBRG/ayeJeT+2nc1lVur0ZipWgcB6bFtJ3DXQTJhjoCQkUqjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+XhgEAR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47739C2BD10;
	Sat,  6 Jul 2024 22:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720303741;
	bh=Dugv1gTt6phAkOgWqtJfMeJpuf/B+u/pk0fLDqzZQuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t+XhgEARX448VJNLSJaMZukuIvzhlb7wLF43wq35WuXSb8/Cdl+3byLKWU4UCjCD/
	 12ymokpCjQbTjxMP/b8TosGANpSGI92zbNaLuNdiV78Aaf2JsvPqiLq+WgGhOkQ+Z1
	 vi4SRxNCksIpZYhVSeld+UScpxQ1dJKaSbSW1JF9rfJny2CY/4v2sqHvQ0nJQLeCW1
	 3ObOs8DXhjA1rjukJ6nfkmHePehm0owzpPyWgzYYNhl0FN5G8xm+Y+bgt+EBtcvQLo
	 69JXvSZIInD1L1s304KYiMHM7yF1l5t+bPm0cxM9IklwejFWMklLigLTfQE1ucMSfq
	 zowG8clBda+ig==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Cristian Cozzolino <cristian_ci@protonmail.com>,
	Anton Bambura <jenneron@postmarketos.org>
Subject: Re: [PATCH 0/3] Introduce msm8916 based LG devices
Date: Sat,  6 Jul 2024 17:08:58 -0500
Message-ID: <172030373506.31220.15270675650118221294.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240623-msm8916-lg-initial-v1-0-6fbcf714d69b@trvn.ru>
References: <20240623-msm8916-lg-initial-v1-0-6fbcf714d69b@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 23 Jun 2024 14:26:29 +0500, Nikita Travkin wrote:
> This series introduces two msm8916-based LG devices:
> 
> - LG Leon LTE (c50)
> - LG LG K10 (m216)
> 
> The devices only have basic support for now.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Add msm8916 based LG devices
      commit: 2c69048c5dafb315e11c257f7100f7fb3cabfa8a
[2/3] arm64: dts: qcom: msm8916-lg-m216: Add initial device tree
      commit: 0655b447461607f93c55435b32a7783aa7d711ef
[3/3] arm64: dts: qcom: msm8916-lg-c50: add initial dts for LG Leon LTE
      commit: 88bf3be9c327f2d78c65e7e4c10c677d4b36128a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

