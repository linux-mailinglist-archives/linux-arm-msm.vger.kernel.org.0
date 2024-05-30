Return-Path: <linux-arm-msm+bounces-21044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DA98D4416
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 05:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 879AE28670C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 03:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E9454FAD;
	Thu, 30 May 2024 03:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="prGN8qBe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250A2256A;
	Thu, 30 May 2024 03:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717039624; cv=none; b=mX+tRyBbUVz+w1uOkH5oj2d/AdnFk9VUGa9oRjAfM7QLrYT6sqTx9Jr10+lbjdqueu0tr47zA7T62hbiTKftbVEU26a4JX70yGkMVm4EDwLCZG0wgnlr++aTOV2l/NE9BQxB06EE2t+gQJYUi2w2uw5XUFxDuF8Ejp2+le/4dEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717039624; c=relaxed/simple;
	bh=DnkSvGggy9P21X2SwYE7P25c9/iaDSrDHC4Zl5Wh+mQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Os8WXIM/Rxb+t9KHhoLs227ue02hsG5r9/PXCdj5bsqHUhrr2ZpOBQAJN9H9M7bJw8vn5C3Dl/A+gjWuNK+yWMbW2Wx96Aixz57aPBm0JlCob3ziZYPENb8Cm6YEbt8oiuFKy5Nl2IyYhDLHJZ7/hT5Po8l6rFbtz66TvkktT5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=prGN8qBe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3C9C116B1;
	Thu, 30 May 2024 03:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717039623;
	bh=DnkSvGggy9P21X2SwYE7P25c9/iaDSrDHC4Zl5Wh+mQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=prGN8qBeY1RGuVbw5gFxJtwNcLFYYCUL9463Erys0MTGsTnPFFBMlbCzPxUZXmhpD
	 r941MIWSGzopgHreCBCR2JJzvndTmN0X0LKqVQEV6CpwCIKRiF7+vULLO3csCABq6d
	 NSzK3eI4bIkO09ALJFholMXQfz+MQWG3wO2CtxgOgw2hN4O6F3xJ1EwIKoCCS5kzko
	 23vU6fRHe7er+U+2dNlDTD70n8gCM5N+aNeEa6VrmgtcDJ7atp4uQxdQod3tZcbofc
	 IG6HmVZfLwalve60y39JWt7sM+XYee4n0gtET48C/CVO9wRTG71aYl4mcfuIHs/22K
	 ALRG23oQff83Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Caleb Connolly <caleb.connolly@linaro.org>
Cc: Alexander Martinz <amartinz@shiftphones.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Connolly <caleb@postmarketos.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 0/2] qcom: initial support for the SHIFTphone 8
Date: Wed, 29 May 2024 22:26:58 -0500
Message-ID: <171703961681.615222.1022457801034628056.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240530-otter-bringup-v3-0-79e7a28c1b08@linaro.org>
References: <20240530-otter-bringup-v3-0-79e7a28c1b08@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 May 2024 01:39:15 +0200, Caleb Connolly wrote:
> The SHIFTphone 8 is an upcoming QCM6490 smartphone, it has the following
> features:
> 
> * 12GB of RAM, 512GB UFS storage
> * 1080p display.
> * Hardware kill switches for cameras and microphones
> * UART access via type-c SBU pins (enabled by an internal switch)
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Add QCM6490 SHIFTphone 8
      commit: f51df82d984838b960592ec83d9ec92de8d8c094
[2/2] arm64: dts: qcom: add QCM6490 SHIFTphone 8
      commit: 249666e34c24aba3f12a201c79d19ab2a3ca3e17

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

