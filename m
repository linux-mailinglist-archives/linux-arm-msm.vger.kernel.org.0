Return-Path: <linux-arm-msm+bounces-61042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E684AD665F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 06:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A67E17F3C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 04:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6403C1E378C;
	Thu, 12 Jun 2025 04:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hfaeqdvi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355561DF75D;
	Thu, 12 Jun 2025 04:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700856; cv=none; b=CLj9o4JpfgsDUtcq13DqeAQnrk+jvnaHY3nXUB/yrMQXcihA1OUCKIo2J788Z/wF0eiyrYf5R1uL0d9uoUsjqo7F3qwBqINadtEzzlQkDiEvxhSd6IoKRG/iHj1G7ff2lcd24BWeEv/vmVawTrm4hzcfydfNL3kv2OLFc8X/J/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700856; c=relaxed/simple;
	bh=g1i3IadCjMyVHlW8wXsPLLdfwkk3+gIYb7B9MPiXNL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ExzXNvAasvBcjLS+gfuXXqRvk8SI24Cg9DN+chBNJEBFt3rABzKqDWMRE09PyDoKHH4uQEnZbaNcZyycrJ0W/8d68p64Mr1Gn7EZhboZ4qj3SbxDN72XK6TijgR1RYUyaT9gRJWxbt9pv+yNV2Zhg4fQAWzaQ1mjnETujknzeNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hfaeqdvi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EAD7C4CEF0;
	Thu, 12 Jun 2025 04:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749700855;
	bh=g1i3IadCjMyVHlW8wXsPLLdfwkk3+gIYb7B9MPiXNL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hfaeqdvisgrmZZXyU+/nf3Yr967oJOkD5ZaaDRPpwXQp8jdZlZPI5AHKM44Du36e/
	 lCuL8gLchDcWraaMTgey5RUxOZUdcBhup310NkLC3Lg1yFaFabuFXfDQYJEjg7hlY+
	 HQeabAJsl17X1bvOiMKHY+kmUk33qpBJmaNKod8zUHdTofUqqFNdZnHdCOLc7TO08e
	 EEK33bFGwGl+LXPF8ng+xDHladbkVNwteeQ0NBUU1ZaFD0UrSPve2tyaWHq3zLxlOw
	 0E9zWg4ZWEDS8l5o9SGrKgcHmUnbBryF/Kslp23bmE38kok6CD4sCttB8V/3wJt8/P
	 vC3zkO4J9WkEQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: x1e80100-hp-x14: add usb-1-ss1-sbu-mux
Date: Wed, 11 Jun 2025 23:00:35 -0500
Message-ID: <174970084203.547582.156329907994435318.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610-hp-x14-v3-0-35d5b50efae0@oldschoolsolutions.biz>
References: <20250610-hp-x14-v3-0-35d5b50efae0@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 10 Jun 2025 19:25:38 +0200, Jens Glathe wrote:
> The usb_1_1 port doesn't have the PS8830 repeater, but apparently some
> MUX for DP altmode control. After a suggestion from sgerhold on
> '#aarch64-laptops' I added gpio-sbu-mux nodes from the x1e80100-QCP
> tree, and this appears to work well. It is still guesswork, but
> working guesswork.
> 
> Added and rewired for usb_1_1
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: x1e80100-hp-x14: add usb-1-ss1-sbu-mux
      commit: b9137c58c737c928d71c3dd2bb3abc47abdd05b6
[2/3] arm64: dts: qcom: x1e80100-hp-x14: remove unused i2c buses
      commit: 8766cead89ff362fa19fa5fd93f6752bdf68c2c4
[3/3] arm64: dts: qcom: x1e80100-hp-x14: amend order of nodes
      commit: 0bc88e66b3a1e9086f786f1033a03867777a1104

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

