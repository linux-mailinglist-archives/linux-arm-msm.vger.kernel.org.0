Return-Path: <linux-arm-msm+bounces-23802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F126913E5E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 23:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B897281031
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 21:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C851891A8;
	Sun, 23 Jun 2024 21:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bu+ab+S1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070F0188CDC;
	Sun, 23 Jun 2024 21:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719176550; cv=none; b=IoSlCPvYHJICkqKr6pNYG5Qg6aG65PpfcIpXFBp87L/sVZRw5v9OixmtElDyLA4ZiGpq2Q09HwoUp00XTWJx+1HbtQN5a3QDnvKlrhO8LhtFBSWYMMTBJe5IoTCyeHBli1ANZy4/S+iRuYl0b+dNkcf+eBXTVBaFYEoHLGrM9uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719176550; c=relaxed/simple;
	bh=8zUtRc7IzzEWMvqcDqrkVzsrKwWGiubeoxzWviVvAVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=azaH3UOa6uW3nCmWU3ioQIwioOB3uY+4Velx9fHM6MuCbb3s3vjSQRKi3yjAAqEA+1RhXBc89f2/IVComTm3vCed2zmU6D3SBG/0A32qJZ2tdkLk2cshsM1zEiVgVNqv9lMWrxh20oDkVEPmQ9iDVe7pxRTJFNwkYS2bUv2ooFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bu+ab+S1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B9DC32782;
	Sun, 23 Jun 2024 21:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719176549;
	bh=8zUtRc7IzzEWMvqcDqrkVzsrKwWGiubeoxzWviVvAVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bu+ab+S1RxPb50HHhUYTB9O6M+C6y/8N13qlyG2xmp5jxZtK0mAW3/IOyNS+/rzOv
	 LqhufYMAv5ccsa9XQhDaxP5nz1gBhW9iCmdLN179Eo5Dbni4/6O/3sgMJfsIdk0CYe
	 XDilRF29G7jddZ3pmZbM9O0EKG/k7ghBnP+M/dhT4/HICGlGQ1GRStLEr6QJRwCNur
	 uBBoPjqd+O/zrk9/Bc8qMH4bxsJZOyiFwBf4qYM8PkPFoUdF3K63slCsrvdn4xjpyD
	 wdHLb1IzwtYZiUj08SKU09mgZ6ovLFC4mBEgLUc/Fl+jmsZFl7T8fChCwiKxGgqH8m
	 75K4wFwUQlJCw==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming <~postmarketos/upstreaming@lists.sr.ht>,
	phone-devel <phone-devel@vger.kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Valeriy Klimin <vdos63@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/3] Add Sony Xperia Z3 Compact smartphone
Date: Sun, 23 Jun 2024 16:02:20 -0500
Message-ID: <171917653472.4580.15887595900632751809.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240621-sony-aries-v2-0-dddf10722522@gmail.com>
References: <20240621-sony-aries-v2-0-dddf10722522@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 21 Jun 2024 17:26:41 +0300, Valeriy Klimin wrote:
> This is almost the same as the dts of the Xperia Z3, except for the
> battery charge limits.
> 
> The current on the l21 regulator for shinano is also bumped up
> to stop SD card errors.
> 
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Add Sony Xperia Z3 Compact
      commit: a69274e1c6f557c2fa7f35f194acb51d723adbc8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

