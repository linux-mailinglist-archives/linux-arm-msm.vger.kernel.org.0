Return-Path: <linux-arm-msm+bounces-79023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FF6C11BC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9F052352722
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FAC132D0F0;
	Mon, 27 Oct 2025 22:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nW2LLV2m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3461532D0DF;
	Mon, 27 Oct 2025 22:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604489; cv=none; b=GtaUTlQ98KWllttnQZF4zooBCFb6CZVnoi32FSi6tAlQ0HLXjYOuvSHZr/kshLPlM0PiTTduRre6NGWQxw3hGaiFYXd3WZZA3lo44/z8MUk3D1a/j2tHAzQlhtZcNEojH7flyw3Qojc7qz+FOHlu42OEDn/dtvSvNu0KC6Nz/7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604489; c=relaxed/simple;
	bh=BM+OQLX8bQ9CFsnLfMrtnfQV95wfFs3lPsMroIVfWgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mNcLK1LGveUteWT2h8QF0/Fi5fDvpSREL31ETPMNj4oMRixNHbAViHqEhceMFzmxiUDGZz9U82uRfISqTsSwqnKsrFwYspbq5p6DKHkTuxH68D8EVFiv2hqlU/LiJJi44x4vQrb0lCdlhzLTmKwBezv4/na0fc35ANc67EO6+eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nW2LLV2m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED42C116B1;
	Mon, 27 Oct 2025 22:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604488;
	bh=BM+OQLX8bQ9CFsnLfMrtnfQV95wfFs3lPsMroIVfWgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nW2LLV2mO/HnHQyUJYlOwcDEWtilZztSjhvU97aIpg94vNWf/Stn1l7Qsx/lR7yly
	 pHzaZFHgn2mzzjIGcsRXRR1p1C2MSPVo71ybOg/AmX/+Z1leeWzOu/31u2xVKCPDOv
	 7qkXqvTzG7+2jLR8TBeOpEWlOQ87BMZ3UZ959jHGI687T8RFXA+1j042G/LMeRuLWs
	 +v2gplo/8/JwPWtHCMMcqRr3I1K7lZskNcbKnM5NaiaYLj67i7muNVeg3PX9sA8Js0
	 eTdRIdWwUrlnXTarPxLi+LfRlkiZMUrjq84cDv2kz8A9NmObp9zNC0PEByuJzpphA7
	 LSzBKO3TFqcHQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: x1-asus-zenbook-a14: LCD, WiFi for X1E support
Date: Mon, 27 Oct 2025 17:36:44 -0500
Message-ID: <176160465202.73268.17354669592197756282.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250927-zenbook-improvements-v3-0-d46c7368dc70@vinarskis.com>
References: <20250927-zenbook-improvements-v3-0-d46c7368dc70@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 27 Sep 2025 15:21:34 +0200, Aleksandrs Vinarskis wrote:
> Round of improvements for Asus Zenbook A14, two changes:
> 1. Support LCD option on X1 (UX3407QA) variant. Until now, 'edp-panel'
>    was used for both X1/X1E models, for both OLED panels. The lower end
>    model also comes with IPS, which unfortunately needs PWM brightness
>    controls. Follow example of Lenovo t14s - create a dedicated DT with
>    dedicated 'compatible'. To maintain backward compatibility, do not
>    rename current devicetree nor the 'model'.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Add Asus Zenbook A14 UX3407QA LCD/OLED variants
      commit: 1ade4b89d84656744acd60d5c826923451f5c23b
[2/3] arm64: dts: qcom: Rework X1-based Asus Zenbook A14's displays
      commit: 462b39931cab3415ffc47863a58372399e600f4f
[3/3] arm64: dts: qcom: x1e80100-asus-zenbook-a14: Enable WiFi, Bluetooth
      commit: c2ca1cc0d465ca56be7ddde40b366b5fc63c2f99

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

