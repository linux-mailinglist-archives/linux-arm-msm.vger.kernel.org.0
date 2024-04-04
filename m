Return-Path: <linux-arm-msm+bounces-16428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AB4899027
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 23:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A38462830A0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 21:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17D013C903;
	Thu,  4 Apr 2024 21:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GO7n9/LQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8451113C8F7;
	Thu,  4 Apr 2024 21:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712265809; cv=none; b=l4exUfBzA1NI9rx+ZZpAmhs0RppJFqbi5VBCmUiLY4rEHkjQNvrloeiREzldzVke1AbEplPbp6IlZGsK9SgbLalQcO4TQOl7cjBnH7Hswl512xesKQiJt/jIq8gPNk/Ma7uS219GhYr86BjVr/7YAx84Y+b00arkR5Opvk0dpMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712265809; c=relaxed/simple;
	bh=XskxHdCENVkS3EXRHaM/AyrUGlxXnbHidgr0G3usAfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KGojMIMimdeQ3qIqJQPy1Y9xFPl9c7a+wdmBFZfrQJDFXf7smlSu3MFVkywaYs5gLvxlEfXm6LVuZNdahgog1tq2ElOGsuso+6dI+yy6pdTMCOdT9tt6AtxGvcrf6iyjoyoQfFNzH6LwIQV6tG7OnE1YfAygBlYmM1MZiJqMwVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GO7n9/LQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A984C433B1;
	Thu,  4 Apr 2024 21:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712265809;
	bh=XskxHdCENVkS3EXRHaM/AyrUGlxXnbHidgr0G3usAfw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GO7n9/LQW3LoVzFX2NhIexwV5ymCkzVUDjkzics7DgcDi2pedGUsB0YjR04LwJ2co
	 QeMUh0xmkNR02zEboKnEKjYeY9h9zkh/jpXgEjiUDhkZIpUuDUJu4NSNZfpFXEn7zt
	 r+d3dsNUZua8vd9jvr1SzanlX9SEvxFzT2xhJ8KW1Pbm21VslG+ffX26TPLiCV4keq
	 wE8iF2HLqHIXCy/b1CjNgrZy23bbWi1cRMCUYEGW651P5O2WYKtxLIGtO3mfxGSpEb
	 mzg6XmhCy4qHT6UJ3X2p0hYE8P3XhsPD3M9DDlpa9zwtFJiisqKa/X6sOQrxUTJHi8
	 vzr2J6n8FTHRg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sumit Garg <sumit.garg@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: apq8016-sbc: correct GPIO LEDs node names
Date: Thu,  4 Apr 2024 16:22:56 -0500
Message-ID: <171226578682.615813.4008947568394540538.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240314112657.167006-1-krzysztof.kozlowski@linaro.org>
References: <20240314112657.167006-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 14 Mar 2024 12:26:57 +0100, Krzysztof Kozlowski wrote:
> Individual LEDs in a GPIO LEDs device node are not addressable, thus
> unit address is not correct.
> 
> dtc is also not happy:
> 
>   Warning (unit_address_vs_reg): /leds/led@5: node has a unit name, but no reg or ranges property
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: apq8016-sbc: correct GPIO LEDs node names
      commit: 216e62744b91c9716228fe13f564e83381a1342e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

