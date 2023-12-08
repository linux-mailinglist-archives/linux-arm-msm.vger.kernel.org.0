Return-Path: <linux-arm-msm+bounces-3814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 909E18099A4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 426A028227C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8254432;
	Fri,  8 Dec 2023 02:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSWUtJXJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCC3442D;
	Fri,  8 Dec 2023 02:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D0DC433C9;
	Fri,  8 Dec 2023 02:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004009;
	bh=xZdmIwyY8K5lx3uY+q3rAA6tBSRCBzA3ItYlVNTccWk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BSWUtJXJ4JG34G2+IJnDUQzxzpxjJmPpg04TuKDKqyRLLmzuSMZaJHSwA3cVKXD3i
	 QaMxA8gDhTe2XpmNmWMcgJWZ3D+7vl19xZgoDysMmbbbZdkwhnYCmMK6cgIv4qyrC9
	 L9nI2QPxo+5fZ/CF4ySu0If8/1caxWSMs7memHQ5JfcZLcVsKDQEQEbDJZKUkoM3dY
	 cawiIVJcQGmozNSQgy8Hfit/8ix1FbDD/VdbLnRuIFvOEoqx9qc/vK0rWgbHPf3zLv
	 /f3Yb0n1dC6bPJ/L0+4i17RKSomssqDFLTRxOOJseUvf5/1AOOOUNFw4GPnH6RZny6
	 eYhLxJBCJ8EXA==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Vivek Gautam <vivek.gautam@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/2] arm64: dts: qcom: sdm845-db845c: correct LED panic indicator
Date: Thu,  7 Dec 2023 18:57:33 -0800
Message-ID: <170200426919.2871025.9067840242673353894.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231111095617.16496-1-krzysztof.kozlowski@linaro.org>
References: <20231111095617.16496-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 11 Nov 2023 10:56:16 +0100, Krzysztof Kozlowski wrote:
> There is no "panic-indicator" default trigger but a property with that
> name:
> 
>   sdm845-db845c.dtb: leds: led-0: Unevaluated properties are not allowed ('linux,default-trigger' was unexpected)
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sdm845-db845c: correct LED panic indicator
      commit: 0c90c75e663246203a2b7f6dd9e08a110f4c3c43
[2/2] arm64: dts: qcom: sdm845: correct Soundwire node name
      commit: 74eed6f467db53b9b8b7fb225f6ac475449ad073

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

