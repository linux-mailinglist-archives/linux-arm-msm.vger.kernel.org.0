Return-Path: <linux-arm-msm+bounces-30332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23694966F0A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 05:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE5C51F23339
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 03:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD4E13C9CB;
	Sat, 31 Aug 2024 03:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tbVYKLle"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3AB13C68E;
	Sat, 31 Aug 2024 03:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725074337; cv=none; b=NJFDpVfyF/2Xn9Gm1vC+9ZDS1/LIPG1XCNcgauNv5e85zXYeeETLc7IgE/TedDPPAxbZH3jaepFDfLDOOa8icERMuHtZNL9g1ZwjiiYC1KSdf7+WzisZVp9XWXyN/3/rNo8cfooG4NaaY0V1oV6AwWoh+4NhNODLWCbS5WNROK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725074337; c=relaxed/simple;
	bh=Z/C4jbQoZhpuH06E5YtrvtuIdZmaT78NRqr20g8IN88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OrvtTbFHCn/BNouXWGM87oAcAcY7IMNPVvOMe0XsEdr7BogvTGiKYxoccYuqsCi1Uz/ve04SP0lq5iDaQdl/e9ZGroIqa4iL3qQj1GRmwzGemOtHUKoqwP8c2/vwolYZi6gJz50et4YdCWTJGztJm+sw/lLwrq1pSfx/IgwHKLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tbVYKLle; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B9BC4CEC0;
	Sat, 31 Aug 2024 03:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725074337;
	bh=Z/C4jbQoZhpuH06E5YtrvtuIdZmaT78NRqr20g8IN88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tbVYKLlePUtrVfzV8jnO3ywdONj/k0NzHuRJL8mKguwljtDNbXvO4CBe4hPnulkTD
	 aZ7WMUG+ViIFvg9PcNP03bCUBKUL19IvlebegP+AtQfGWop1HvYnlA4Aw8oI6mpkWG
	 lZAIzDpStJpTHFidaje8/IPjs3a3Vt5owOfZmyE1u4vB+bHIkqNQ8h8M3sa5IvC1AN
	 EvsVOhlmRA9YgJ1vxB/s57MojZDxsY5hKO3ugM/1AmYDRzXdozfxCK7K9xjjTZ4tvs
	 bro2I7VrspiKBvXx02bH7+hwN/ChifdzLsKGZUDqAseAP8YJMZLW02DzY1W+ioCD+j
	 khHbwMKFS5vRw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "arm64: dts: qcom: msm8939-longcheer-l9100: Add rear flash"
Date: Fri, 30 Aug 2024 22:18:38 -0500
Message-ID: <172507431836.12792.1003409106538102062.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830-revert_flash-v1-1-ad7057ea7e6e@apitzsch.eu>
References: <20240830-revert_flash-v1-1-ad7057ea7e6e@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 30 Aug 2024 22:49:50 +0200, André Apitzsch wrote:
> Patch "arm64: dts: qcom: msm8939-longcheer-l9100: Add rear flash" has
> been applied twice. This reverts the older version of the patch.
> 
> Revert the commit f98bdb21cfc9 ("arm64: dts: qcom:
> msm8939-longcheer-l9100: Add rear flash")
> 
> 
> [...]

Applied, thanks!

[1/1] Revert "arm64: dts: qcom: msm8939-longcheer-l9100: Add rear flash"
      commit: 4b520e4983c37b2e33ea0dd5171cb8a79fd7e022

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

