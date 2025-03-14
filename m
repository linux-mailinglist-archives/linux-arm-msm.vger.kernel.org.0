Return-Path: <linux-arm-msm+bounces-51485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7351A61B96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC0C5188AB5F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEA821018F;
	Fri, 14 Mar 2025 20:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBMbTQSP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75F320FAB9;
	Fri, 14 Mar 2025 20:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982506; cv=none; b=fZZjZyDeuyw+GFDne3fhW8R/GigKMPiBtdcEgDPHk0GofmOSUUwn1OBxbNAnFqgC0K0WpZX40J424OG9e+mBJq7ZNdVs5VxUKWguHbH5qkK25lYJk8wYnOKKhN8SWe3iCjVgwxUEBUgto4FyJ7LrrqZ7F6PTBllkhWxOmOhH94A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982506; c=relaxed/simple;
	bh=3UFQ0EPj145Uc9qC3lW+xdXUcLQGqiAKI3P68RusgUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QWMJJ3Skr+6CY81qsH5XyW4Mcny4qhQVSM4zgZt2HDKtoazqlLPyL8rt2lNQAxTgV8tLX4rGM5mSscXYlM7PyYbrN1CbWUkXsTGkXUA1aQX31b03Ack+0prg40x0FxH340wkvtBQViqbgfvtqT9ck+i2PfUM9JYy6CdhsyCP2mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBMbTQSP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B047EC4CEF2;
	Fri, 14 Mar 2025 20:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982506;
	bh=3UFQ0EPj145Uc9qC3lW+xdXUcLQGqiAKI3P68RusgUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dBMbTQSPbe4i1uig2lWTuRYq3F0l8NvpJf8slwTWMKuJEwau81WC5pbGXwm/TvTlZ
	 GLguRCtHoKUJ7Ou9iNxvbXZgnfYRNGMSs8adHcbdcl1lM2pwszO2/0pBjj76D5xXdF
	 7TCmFL4JDzYQrTzZY9YETd/2kSeCMLNtK6IJHUunHheo6LijJmN/PcJtsleg9jq/BG
	 jzzyEGf8lk9kE6Bh8VJyyQvQ8JWxf+GmX+HS09n4WnyntGXi+zMl+rK7BGK28IsYjp
	 rbGuOBFwF5Y1gzA8CpofACWRiDekC/SjwvGFekQDDNLAfWNdVPwO9FN6b+61YPquMH
	 eFzPHY6IB3QwA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] arm64: dts: qcom: sm8650: switch to 4 interrupt cells to add PPI partitions for PMUs
Date: Fri, 14 Mar 2025 15:01:00 -0500
Message-ID: <174198247882.1604753.3686286270349952301.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228-topic-sm8650-pmu-ppi-partition-v4-0-78cffd35c73d@linaro.org>
References: <20250228-topic-sm8650-pmu-ppi-partition-v4-0-78cffd35c73d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 28 Feb 2025 09:40:24 +0100, Neil Armstrong wrote:
> Swich to 4 interrupt cells on the GIC node to allow us passing
> the proper PPI interrupt partitions for the ARM PMUs.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sm8650: switch to interrupt-cells 4 to add PPI partitions
      commit: 9ce52e908bd5c0a93a3f17ef28d19209873b573f
[2/2] arm64: dts: qcom: sm8650: add PPI interrupt partitions for the ARM PMUs
      commit: 2c06e0797c32997a2ea9d1458bcdbb97c7090406

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

