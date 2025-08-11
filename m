Return-Path: <linux-arm-msm+bounces-68555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A56B214A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 20:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CABA33E46A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 18:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809EF2E54C3;
	Mon, 11 Aug 2025 18:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NnMXSgWq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527102E54B9;
	Mon, 11 Aug 2025 18:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754937682; cv=none; b=P5TyQS6Aw89zlnkg4h4MeQ5r9GdA4nyVVklgRapPUcIH9cX7+B2F+RICwDrFqr84tEzdBuCtENW5wGCiYNHv28qfuNTBWgIEnsFMm4adF4jQqoLCFHr8LcAIdhLdzuGyCVgJioSVv3ZsKjnBVvK7i1NFLeX7yf2cR6xlyCWKP/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754937682; c=relaxed/simple;
	bh=1rNeM3ymFT7iwSuEMp13G4ceSPU83/RAs5kNysUQ74Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OG3oXxrJfwkhqkASR4QzFxUNBE/gwviAg+fIs3b0DdED0XOMN5px/hjQWMLPrbfoZJtO2PxrXL7plP2cdFZXqa05zlTf68vHmzZnV3Zc6yb6ogak32xfHRumAPDVnMFxbDsl9Ty6LVOYwlEqwsyB0Sb2IRo+qptFZt9AJ/oyvrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NnMXSgWq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB64C4CEF5;
	Mon, 11 Aug 2025 18:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754937681;
	bh=1rNeM3ymFT7iwSuEMp13G4ceSPU83/RAs5kNysUQ74Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NnMXSgWq8mB2TwrUk18r3pR+5qGMVy58QkpKua8UIg9HwL/CZmHrSkSodF7hxVdsC
	 4ZB9V8ElC91lnS4R6RrC3y7/oHykVGuD9LqoCTnimpDwbDTqq+9oqpQ5WzwX7Ww2c6
	 HLOMxY7ebLqH34d+GFcv7/vTcM05S55tpmxKH44VgCSsl7vZIB4BLChjtHo7e7Lexv
	 F3zCPkOEAPpK7fKUm1cBJqwImHv3Ky1au5S0lqg6YNULEyDyJQwZ4kShCzMnNPCW7H
	 8NsfsE+OG/IONdQj6Za9cH4dQjqwzyP4JIuLbosULVXz1ywulWJpaWzKpfyP5CvLz8
	 Jm92o3QBaBLrQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: pmk8550: Correct gpio node name
Date: Mon, 11 Aug 2025 13:41:00 -0500
Message-ID: <175493766103.138281.7291273927061053567.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625-pmk8550-gpio-name-v1-1-58402849f365@fairphone.com>
References: <20250625-pmk8550-gpio-name-v1-1-58402849f365@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 25 Jun 2025 11:11:25 +0200, Luca Weiss wrote:
> The reg for the GPIOs is 0xb800 and not 0x8800, so fix this copy-paste
> mistake.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: pmk8550: Correct gpio node name
      commit: 35e0b432d5ca73b7498398d7eb369c5665cc3ab1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

