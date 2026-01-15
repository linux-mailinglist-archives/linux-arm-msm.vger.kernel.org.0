Return-Path: <linux-arm-msm+bounces-89095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01710D22388
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 04:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C043E303D69F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 03:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C9828A3EF;
	Thu, 15 Jan 2026 03:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUXQD+CC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DF3286412;
	Thu, 15 Jan 2026 03:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768446010; cv=none; b=o1R10IouFMUOGcpesI55fCZkc/GnBcRJulUq77J0+ePcejBzIbifrpNZ2D1yATnD6tYxEA2AYGvnosaw4K1cvRQB1abl/UPh10hsYhYccF1itMk44BNc006i5C23EQpV/x9TRd+3FOhpbXHLGO7Z34mFf14t+U5IqAlokppF7zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768446010; c=relaxed/simple;
	bh=LrRF8y/4j63+5uhmvkksHp3XOQoqAPVHF0JEdxtt/gg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lbdvAn9Rnzui3ufkkcy5pog6hxUnT3pTMrA3Tc2VvDOkkAxZ2nBeztAtAjvWeGZiTgFi3SKYnG5oTaE43ToL0RqXuD5XUAKcUvyvwHnWE/GYB8ex6QXnef83CXMo2eho90m4eMcZV5WfDnEm1oLWMx15YxOt006rllbtJj+X+6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUXQD+CC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83171C16AAE;
	Thu, 15 Jan 2026 03:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768446010;
	bh=LrRF8y/4j63+5uhmvkksHp3XOQoqAPVHF0JEdxtt/gg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XUXQD+CCS59gkPlEM7Vh2nD70a1GMleAgVdRup100L6YyX80FCzbiCDijootppgcm
	 HAdctXXhzNCQ81l6ffjTrBbYPKcAT1vjCcKAz3fWgaQzSyURdErBA2+7/1KzmwnpVw
	 Z9l959pKKR9bMdMP7OAkRKwDSgpASv5NN8E098aKPweCmVW6p5Q8KUuTV5laDslIDo
	 6TD8LeiZqgTxyHYDlxdotHsigVrVLvRBU8kqD0nhOwKUbZITAXJrRsQSrINZ9SwtGC
	 1WcAHBcQ8eTPSm76L6WcjkESR5b6lyi4LW8ZFgeT0NcK+Xts0VssdB3K/k1pDdyB3k
	 tku3hPeP90pvA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH RFT] arm64: dts: qcom: sm6125-ginkgo: Fix missing msm-id subtype
Date: Wed, 14 Jan 2026 21:00:02 -0600
Message-ID: <176844599497.144315.15271921389870369164.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229142806.241088-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251229142806.241088-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 29 Dec 2025 15:28:07 +0100, Krzysztof Kozlowski wrote:
> qcom,msm-id property must consist of two numbers, where the second
> number is the subtype, as reported by dtbs_check:
> 
>   sm6125-xiaomi-ginkgo.dtb: / (xiaomi,ginkgo): qcom,msm-id:0: [394] is too short
> 
> Xiaomi vendor DTS for Trinket IDP and QRD boards uses value of 0x10000,
> so put it here as well.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm6125-ginkgo: Fix missing msm-id subtype
      commit: 2c3b8260d1a0d9a388f2d30e3bbe50d93edfa2aa

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

