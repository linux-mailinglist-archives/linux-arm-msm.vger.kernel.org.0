Return-Path: <linux-arm-msm+bounces-88770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D0CD189E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 13:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FC2B301818C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 12:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BA938BF9F;
	Tue, 13 Jan 2026 12:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCrFxAeE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F264629A2;
	Tue, 13 Jan 2026 12:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305659; cv=none; b=SKik4xeF3K2GESzr+jBupBbgYb6s4pDrtfNkXtpdHz2x41c4bK6s85OSRONGJf9VW52MPSo6EmI/CbtCmOQVFI6ZfB/77jNXhDj7aocg3c/R1wDnhTvyS8+0d+jTQYwUYjgnng6HUG3zSC9oXUiHfnSzix52O9ZQUpEPtf66Kkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305659; c=relaxed/simple;
	bh=mqeFINh0lcaoGMDWtCok1S/caE3mdnBWa3OQ+vMRNWI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bUCvwgblcnodWZ7x3S2U7YbV9QyUzlN3ArgTILcuhXW0IXyNqZ3lYvs/Lbn3rZXXwHC/VQV/k6ycVRoh8LzB+spV1cYIg6JW0BsyMG+Zd8p4+1XFGD24J6EDkreftFZtk1akFJnBZVp2eWYAILC2Rafc9rFp9i5npvqyr5xbQu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCrFxAeE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DA2EC116C6;
	Tue, 13 Jan 2026 12:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768305658;
	bh=mqeFINh0lcaoGMDWtCok1S/caE3mdnBWa3OQ+vMRNWI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UCrFxAeEwYhNR+Cw8ssn+5DxmDhdqdtmOj8feiHhM7eN02t7dTuU6fBzJUyWPtye5
	 Ae04SFhU0VjhIAdqvzZ7OlzMamxWEPIpO5CSxbgVgZEBRcjfP4V5m3pFQI/NDjtm2U
	 aXLREFubOpcyEj1JwqdTcScRz3hPRluaKv04+waeh3xMv794PTzm+v9WiUJPKqE1DL
	 FPbs2W6fsllkSh+kYxhHpP0n9AdHVmUAT3mEkwWdOoXgiHJLbQfwrfDVf//zDfPapV
	 jqVBugu4Vw5HP/42DHT9b4DmgNQ/byYYtGuyPkOtciZ9sRJtcvMF/of16+Xv2qrxS1
	 EondEb136XNCg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 aiqun.yu@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com, 
 yijie.yang@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com
In-Reply-To: <20251215-knp-pmic-leds-v3-0-5e583f68b0e5@oss.qualcomm.com>
References: <20251215-knp-pmic-leds-v3-0-5e583f68b0e5@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] dt-bindings: leds: Add bindings for Kaanapali
 PMIC peripherals
Message-Id: <176830565503.2820182.11923707151729950479.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 12:00:55 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Mon, 15 Dec 2025 16:41:03 +0530, Jishnu Prakash wrote:
> Add bindings for flash led and PWM devices present on Kaanapali PMICs.
> 
> 

Applied, thanks!

[1/2] dt-bindings: leds: leds-qcom-lpg: Add support for PMH0101 PWM
      commit: b0235d5724851d223d347b16630b6db304a1b15d
[2/2] dt-bindings: leds: qcom,spmi-flash-led: Add PMH0101 compatible
      commit: a19ae77cf3c71379188b71aacdc3ed906f84f22b

--
Lee Jones [李琼斯]


