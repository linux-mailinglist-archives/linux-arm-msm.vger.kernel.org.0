Return-Path: <linux-arm-msm+bounces-28685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A566953BC4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F23F1F2587B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913C215B15D;
	Thu, 15 Aug 2024 20:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOCxcpBA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641CE15B14B;
	Thu, 15 Aug 2024 20:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754477; cv=none; b=uKdmNEFE29PTZDY7E/3DYRAU7a7FjSyx7CNU/RVAc4uGY+wEsjcjjb46sPnBORMlkOyJyLp/lASoJt1FuREIJR70dkCh6yboX9d/uJsN5/NK6YwirYoT2aSQSj2fjLzSLAWw1KvUjn5hXJ2DAbsh/HgztcYG6JhEEjDLuid4bqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754477; c=relaxed/simple;
	bh=PvoSBLcsFkiZ61vIQf0gteyF3WBUp8LYafg6D6HKjYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jgstr4nNjlqcPSYD84ASr8UbPkIBjOFAHe0VGmBraSYq/9N4LEtNnGLOMqU3ceTRlCgFZReu675bRDwKWK42/idYajbVVd/9QzPRhToVpwXTWZpACFFxkDAw6jrniyjNxrWh9LEjYZ2D2ExZL+iqyS1M+ZGqxXeaakiEDD+RRfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOCxcpBA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F72FC4AF09;
	Thu, 15 Aug 2024 20:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754476;
	bh=PvoSBLcsFkiZ61vIQf0gteyF3WBUp8LYafg6D6HKjYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TOCxcpBA6F7P8NyCeBZ+7D963bvMKnr2+hODJ/NXv9pFPQc4q9omzrN5Krur/vYEu
	 7k2p+WZmk3frheU3lPFy5vhrbAaMve7fxHNS4xL6DVcPUiZOk1o+Is06214Gkiaizt
	 xGkJiBE3AnpHpeqa4CKBwskExy8lwZwbZgO6gApMhkglpEBBUhPjXLPpLQVL75DIs6
	 kTRCyTqHMYbgUt4EYeuwLeOT1LxfkNlxhbM7a8Ki9l+cw4x/Pxe0va2/XzIWEZZP3z
	 bhcG1gGyOL54kFPGYqwAYKGd/qeepsVRJ1VUZA/CkFkNBKa7gN3H3apljklsSBPMaP
	 yaVpE/ezB/kbg==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH 0/7] Add CPU frequency scaling support for MSM8226
Date: Thu, 15 Aug 2024 15:40:31 -0500
Message-ID: <172375444799.1011236.3821270590230686544.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
References: <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 19 Jun 2024 23:02:44 +0200, Luca Weiss wrote:
> Apart from a bunch of bindings updates, add support for the a7pll found
> on the SoC and wire up everything in the dtsi. And finally switch over
> to using apcs via mbox interface to stop using the apcs via syscon.
> 
> Only a limited list of CPU frequencies are supported for now, higher
> ones require speedbin support which I plan to work on after this lands.
> 
> [...]

Applied, thanks!

[5/7] ARM: dts: qcom: msm8226: Add CPU frequency scaling support
      commit: 02f2ddaa1a78cbebd4255f78260781b404225170
[6/7] ARM: dts: qcom: msm8226: Hook up CPU cooling
      commit: 807dfab845209062e4d268157cfbf0ba46652df7
[7/7] ARM: dts: qcom: msm8226: Convert APCS usages to mbox interface
      commit: c47dd4a87160fd604577aca41ca8b3391b5c5d3e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

