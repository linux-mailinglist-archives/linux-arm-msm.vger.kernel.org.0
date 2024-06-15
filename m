Return-Path: <linux-arm-msm+bounces-22765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9189F9099A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2024 20:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DEF91F221B8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2024 18:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE3B49622;
	Sat, 15 Jun 2024 18:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eovqLs4J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1354437;
	Sat, 15 Jun 2024 18:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718477539; cv=none; b=ryVhTz/bnDwhoI4Gzv+LdkaQsQdLm+A4GO42P8UI7UoYe1Or1UDgV/h4/HZkTBcDzRrd72U16LfwR9consKNg1O0q7qNkEG3YdmdRb0zA9NXbGpnkcP65XMBzd+aucUkpWFOdpHxQ+OEi2nmwXe3nboYqVYg52QVVAkM4r235E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718477539; c=relaxed/simple;
	bh=enrBKJyKrU9vC5DRQWn1UK9WzDWEr1TxDOe1KX2Jmd4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MdTFmQ7dnC6+Bh9vdpMfepGE2q1hBBOrucBLqyvCBYWnXXJCARGX7hNOLBpwGFQw2VEaQTd5h/1s7k1f2Ho6vlh8Y3ds5F5CaLc3zKEnvk31eHZWzSFWdmtxbDnYF+ouamh8SUezUI5LavzKQmSDrUUoouf+t0WnZHmyYNgRwmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eovqLs4J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B506C116B1;
	Sat, 15 Jun 2024 18:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718477539;
	bh=enrBKJyKrU9vC5DRQWn1UK9WzDWEr1TxDOe1KX2Jmd4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eovqLs4JeCzg6zV8iHc7O76k2SjW6YtkXUFva2ahd71eDgraXPVoCtYe99mPcLscK
	 SSgf1MzRPQWW87w0F/q3JvJdZVLOeKe8xTtBFcVZF4Ok8P+rIj3biwRBLHnAlMwgxi
	 3JxW/CUtjQwapSoXXA488w/JHO7GZ+2bc4CTaw+CMVWnjJ3ojvoWQqUAQx3cIkGdBH
	 wlkWlCS1Yue4zfOJ3hSIgSTEXIEUeno+4fhmqm2xcVunEQbO+9HZo8LY1V4QAtdMzR
	 aPEMPftu0gZFWGI35hXJW5OlB5j2kR0t716DiWOYUhp+hSJDocl2pzIeoX1UPwKALK
	 VcI2TSotcDHew==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org
In-Reply-To: <20240614-fix-pcie-phy-compat-v3-0-730d1811acf4@linaro.org>
References: <20240614-fix-pcie-phy-compat-v3-0-730d1811acf4@linaro.org>
Subject: Re: [PATCH v3 0/5] phy: qcom: qmp-pcie: drop second
 clock-output-names entry
Message-Id: <171847753469.716119.16988871542371189941.b4-ty@kernel.org>
Date: Sun, 16 Jun 2024 00:22:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 14 Jun 2024 13:18:23 +0300, Dmitry Baryshkov wrote:
> While testing the linux-next on SM8450-HDK I noticed that one of the
> PCIe hosts stays in the deferred state, because the corresponding PHY
> isn't probed. A quick debug pointed out that while the patches that
> added support for the PIPE AUX clock to the PHY driver have landed,
> corresponding DT changes were not picked up for 6.10. Restore the
> compatibility with the existing DT files by dropping the second entry in
> the clock-output-names array and always generating the corresponding
> name on the fly.
> 
> [...]

Applied, thanks!

[1/5] phy: qcom: qmp-pcie: restore compatibility with existing DTs
      commit: 912cee11c14376a6f707d72fcaf343a40bff48e8
[2/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: drop second output clock name
      commit: 7cd3e586068aca123ff244fc259ba62ba96b6d31
[3/5] arm64: dts: qcom: sm8450: drop second clock name from clock-output-names
      (no commit info)
[4/5] arm64: dts: qcom: sm8550: drop second clock name from clock-output-names
      (no commit info)
[5/5] arm64: dts: qcom: sm8650: drop second clock name from clock-output-names
      (no commit info)

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>


