Return-Path: <linux-arm-msm+bounces-20690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF79B8D12C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 05:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB3871C21AF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 03:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A611B13C825;
	Tue, 28 May 2024 03:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="koGs4K7j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7865418EA2;
	Tue, 28 May 2024 03:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867182; cv=none; b=RVg2I1TNDh139yYLhDmRoZ4jrsrCBhUyCFgq9EZfhmvdQ8y0D9i74rk2jwX9Jyw7CLsH4oB9aXLk2nKKe1UhzGSA2ZIdlzm0B6F7MA7XKHW/QA4sLZclJ0IXGI/JIFWTsA1LOhz5xpRvqrAFzldGpvtpAwPL7SPVt2W1hdYQ+5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867182; c=relaxed/simple;
	bh=emVDmQ4EAbSrFQopqibHQQUxBsN4LtoH+WusU4KtwJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ai1sbFKmYA/mREm0ZZpBQ4gdHw4YuA1n3WJol93kCh6dJQ3HtC6ItYD2YIvUgSd92D+n13f7BEaq+n5fTgFjTBJfb3XtAsHXSCCwV9IPevHns37tJAxtOOjBpUX5sgZLJT/u5zHUiC2MaVOiCnKEdvpJG+J+pkVP6XInnzVJqsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koGs4K7j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B789C32782;
	Tue, 28 May 2024 03:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716867182;
	bh=emVDmQ4EAbSrFQopqibHQQUxBsN4LtoH+WusU4KtwJU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=koGs4K7joTMxG9f6k5bqB9RjKdEEpxHTvMzcuRE6y7D6L5EfT59hJg4rvCyWPjZ0x
	 tlqmlhbbiq8ovviZe+WC/SeZJGB2Qx9Htj05/vyRNkanGZy7eSeBYxoqx2p2Bfe7DC
	 612iLFN/ASeWxrsaiyOohF431AqsZV4t275At6FB/h07sWmUsoj/WuXva81GgHtKRZ
	 StTutd7OA0pAIxFDYs20OObIQsU0mYbtUZukL5p9gRClkc00jf7M8xCxmr4ZNrVrhx
	 +7zo7Yo0aiAcZi8df3NXN6Qc8UnopYtpHaxoHAZmT1hqXofuFRBJ9qxovwgRuC1QQI
	 0se+LWhjPmiiQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: net: ipq4019-mdio: add IPQ9574 compatible
Date: Mon, 27 May 2024 22:32:23 -0500
Message-ID: <171686715161.523693.13551499551993284.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240507024758.2810514-1-mr.nuke.me@gmail.com>
References: <20240507024758.2810514-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 06 May 2024 21:47:57 -0500, Alexandru Gagniuc wrote:
> Add a compatible property specific to IPQ9574. This should be used
> along with the IPQ4019 compatible. This second compatible serves the
> same purpose as the ipq{5,6,8} compatibles. This is to indicate that
> the clocks properties are required.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: ipq9574: add MDIO bus
      commit: e60ac570137b42ef61a01a6b26133a8e2d7e8d4b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

