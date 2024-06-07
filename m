Return-Path: <linux-arm-msm+bounces-22007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEB98FF9FF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 04:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC79C2866B0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 02:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE35C1804F;
	Fri,  7 Jun 2024 02:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kv9XgTs7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6C117BBA;
	Fri,  7 Jun 2024 02:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717727644; cv=none; b=XcGtAHz20DGeG/cIq4CpraYm8ceZKVWNpu7AOn7xD2VKcBYxROLQv0sb85y8zcoAMeff67wRjhuW0VP/hU3YqEdruwnQXvVJJfwGrgrVI+FHIcRZ0+ECSoZUYiEJ031Ea4trzNPGciKV7msdE7T6NuYELBbyhRpSzJZomk8ySiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717727644; c=relaxed/simple;
	bh=/GQ3hOMDYoOcXBYWT7M0QSDh47TQ+y5K4/LOftuYvGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g4kX9U8htIR1sefGcNBkw+/IG2Hj/py3JjUBMTbcCY861BoQBpwxWKiHCr2WDVBe7EdHYFHVMIrW+nLwn24f7HLl9oL0riMMqkfg4pYv0e4VJUkqhzoBHdCCWo5niM1NwyGxEwJMQpyhFjiIMXFyTe01OtCqE2B/SWK4GP242vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kv9XgTs7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED11C4AF08;
	Fri,  7 Jun 2024 02:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717727644;
	bh=/GQ3hOMDYoOcXBYWT7M0QSDh47TQ+y5K4/LOftuYvGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kv9XgTs7dApXFYJ41C+CmszsPLrGJnFyMn6tkAgCk63nJzLFvbQ560/mp+FE+ahPv
	 Ms+BZV6lxUFwj48sjcnxlDAkUTGepmbJizEzos5WAtx0Nm8NSuQGlcEgLAvB6jjYg8
	 DDWlpLs2GxMaZUoOFH3AjbpHLbxmX4SfJRYw3Sn0Z43ardadAfBjMLLyxdkbDRAhWs
	 tENxbvJ2GPE7q9572t04Uz+hzmNqmB5BFmf81LQEw1DkQ0o45Ms54v1ut+e8NZNc+/
	 L+fdk3c6nHw7IWwBFFe/NDJPIQGOzYOIbVGJaujTMox9dXcpfT3ACaoyL41kBCOWwL
	 I6GrlJrxa37Uw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v6] arch: arm64: dts: sm8650-hdk: add support for the Display Card overlay
Date: Thu,  6 Jun 2024 21:33:58 -0500
Message-ID: <171772763757.789432.5477136594796584773.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240606-topic-sm8650-upstream-hdk-v6-1-fb034fe864cc@linaro.org>
References: <20240606-topic-sm8650-upstream-hdk-v6-1-fb034fe864cc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 06 Jun 2024 14:50:22 +0200, Neil Armstrong wrote:
> With the SM8650-HDK, a Display Card kit can be connected to provide
> a VTDR6130 display with Goodix Berlin Touch controller.
> 
> In order to route the DSI lanes to the connector for the Display
> Card kit, a switch must be changed on the board.
> 
> The HDMI nodes are disabled since the DSI lanes are shared with
> the DSI to HDMI transceiver.
> 
> [...]

Applied, thanks!

[1/1] arch: arm64: dts: sm8650-hdk: add support for the Display Card overlay
      commit: bc90f56a169987975072efa56c3b595eda19668a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

