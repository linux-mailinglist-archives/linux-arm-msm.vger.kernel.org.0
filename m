Return-Path: <linux-arm-msm+bounces-87548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5B7CF555B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 20:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D619A300E611
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 19:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C32A345CAA;
	Mon,  5 Jan 2026 19:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LlmZ++1f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DDD34575D;
	Mon,  5 Jan 2026 19:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767640603; cv=none; b=kFWJBC7XQpl8DBAOjT15s0TddbmZO948YvXAJ7N403vQnNgzs7fiJYis5aSs58W/5kIDMjSfrEyDn8Mfbd03/x4puHpjGWJxUqg1lN7sA5fuphrviE8XdG3GHMbA56Eg8oT4NV4O0g8L9AcI35AK8t56g/S1z+mI1+OoeIQuNMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767640603; c=relaxed/simple;
	bh=oNgY2uEcB0JrxOla9NvG/TIjKVii7qPb8tlktL43CqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=umXplZZxicXq+8cHAv4iF/7JYhN6FhjssWGyF21q3c09uoP/7RRrdxEC13u7HBaPTIje/pvHo616XZ6QY05q1+xv3HSCfYHZ45RzSngcdzMdm0BSnXfETEFJi5pImil2lMXvfh4lJwRoQuhxtzuSx/rjkmfuXJkIrv/9mkVPhIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LlmZ++1f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3413FC116D0;
	Mon,  5 Jan 2026 19:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767640603;
	bh=oNgY2uEcB0JrxOla9NvG/TIjKVii7qPb8tlktL43CqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LlmZ++1fHPiAh7NXHwxmqhEvx/FzlwMK1sUvhvv9ZAFWcvWNYGKIAk8ad6YyHXn8n
	 uZWcJgaooESJmc3K4R58tg5fMMehRpfuoi9W1ohhtej/NJqqeb6glkVafpsOhoiLtN
	 Txlb2gda1VpNAhOX2NhM/6zRtyyN7SXpmaSdEFoCJYx5s9Fpi4bAT0iEIoS2x8ifTw
	 zBFoVmMcReyS0VFMzoYwmVIBrl35yj1364Gx6zla0a2OLpcnrMy0QMq4+GWBGchUte
	 sTohSH445NmHlpQMp+GtF53u/StXKReC+cbf/dd5KSvjRtTay2gmfcJisgK2yzpfAd
	 yD5yF0hXPbNEg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mani@kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe switch node
Date: Mon,  5 Jan 2026 13:16:22 -0600
Message-ID: <176764058401.2961867.2880201861288332662.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105-tc9563-v1-1-642fd1fe7893@oss.qualcomm.com>
References: <20260105-tc9563-v1-1-642fd1fe7893@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 05 Jan 2026 15:55:24 +0530, Krishna Chaitanya Chundru wrote:
> Add a node for the TC9563 PCIe switch, which has three downstream ports.
> Two embedded Ethernet devices are present on one of the downstream ports.
> As all these ports are present in the node represent the downstream
> ports and embedded endpoints.
> 
> Power to the TC9563 is supplied through two LDO regulators, controlled by
> two GPIOs, which are added as fixed regulators. Configure the TC9563
> through I2C.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe switch node
      commit: aa7b4bbcb3a1ddf11a94f1500b05a39041efb7b4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

