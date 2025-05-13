Return-Path: <linux-arm-msm+bounces-57762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60806AB5E0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 22:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82C89189A6B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 20:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DDB81EBA19;
	Tue, 13 May 2025 20:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9cLBUoE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718211B4227;
	Tue, 13 May 2025 20:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747169215; cv=none; b=ewZrBt25KDCrdQKVeBm3bFl/bAlCI7b1gci4hu/4jBE0DHPXmXMDAo+eIfnIsrggR95XZF+BecIFf3mHBjr9oUn2keLKazzXTGvQuyQ/BR5KOxKZ3DSGpP+AxuXQBn9ioqy9Q8Ygs6nIunCM9Z2ZiU5YB6CCZtNYsnm4bskdedY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747169215; c=relaxed/simple;
	bh=4rS8kIjpSaUs/I/PlN++Dg/CWce8A2ho3C7mZqqX7As=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FFM4NYVmDpRjcszJameN+X3+O6JYi9qJtok3hDlzl6xYGwIj9dE2RdGdrQv0RLrAoOR3d7BZAUEldb0D+X7UiXPYdabv2gg8EV3QZnCg0/glWE9TKfj8IwPMJ5DRL7cb9c5wjuL54qg/jW8w6StSO/Q/HW126ApIRGub9Jua0mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9cLBUoE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F499C4CEE4;
	Tue, 13 May 2025 20:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747169213;
	bh=4rS8kIjpSaUs/I/PlN++Dg/CWce8A2ho3C7mZqqX7As=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V9cLBUoEdGU740Kf84wUc+E0Jkxd76wBBGSNyYr9cyjroV47RUdEVEljzRJDUgLP4
	 /RWXqLlKTVkMn9c8+EMiGwSH7XKoY+yItu1t1sfDOPzlLWAIzkYmzJ95fitxfKJRUn
	 p3JwHCW5mXd28P9+snEONt0B02RbGRqrUCDeiXyq3OJMwCvbAGjTfZebdjLEeuvkDv
	 O3JjyYKB/i1hvP/QV5BSIBwsIOdR8ofMbZZqcFRns6639rqTKBNE8Vo5F/+wO8HZfX
	 g71xkQFOxW2DMiOCc3rwlhtnrfs1UMAG89H1t5LsT70c5FTn4L3BQA9lIjLjfxJrgI
	 UYrgeCNGWEtYw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: x1e001de-devkit: USB retimers related fixes
Date: Tue, 13 May 2025 21:46:38 +0100
Message-ID: <174716895383.39748.703153321484020943.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-0-1c092f630b0c@linaro.org>
References: <20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-0-1c092f630b0c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Mar 2025 17:50:33 +0200, Abel Vesa wrote:
> These fixes align all the USB retimer related nodes on the Devkit with the
> CRD and T14s.
> 
> This patchset is based on Johan's:
> https://lore.kernel.org/all/20250318074907.13903-1-johan+linaro@kernel.org/
> 
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: x1e001de-devkit: Describe USB retimers resets pin configs
      commit: f76fdcd2550991c854a698a9f881b1579455fc0a
[2/2] arm64: dts: qcom: x1e001de-devkit: Fix pin config for USB0 retimer vregs
      commit: 635d0c8edf26994dc1dcbc09add9423aa61869b0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

