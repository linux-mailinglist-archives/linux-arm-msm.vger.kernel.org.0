Return-Path: <linux-arm-msm+bounces-84552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D24ACCAA023
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 05:01:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC48E32663B0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 03:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5AD2BE04F;
	Sat,  6 Dec 2025 03:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOJoRIm3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F16A29C338;
	Sat,  6 Dec 2025 03:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764993594; cv=none; b=q7zVK7dCG2TvaKUlcsJYUxrBPPwKVLulaw2K9wguSYcGe/Rq3AyoKCF/Cy+R3r2ZmFp7efOnoxyzO7/fb3YwxSM8boHy/SvdJh0mn6yA4IEpqCJHuocm74oB04bdsfGMfLSnktVf/vIj2rL6N9VNSLALE57WTYuFffHKwLOq+t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764993594; c=relaxed/simple;
	bh=2DZJeLeeyjOyimMtAm8m8Hshzz7OTC7uUcZqmvjYJVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pw0jcBxJxcFU3GfjgrrA6Yyf283nGsgDMg3bSCfTbc1ETb7YHz4NU7fJMrbAFiLWvSnrm8Z439sHXX2YLSRL7fXR25V7aN4kv9IbVr77zbi+AhhTDWj1uSRYmepfxoLm+lgHU/fOOZgO2mq9M0QNR3JBpGRWX9dwBjOW0nUqbVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FOJoRIm3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE95C19422;
	Sat,  6 Dec 2025 03:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764993594;
	bh=2DZJeLeeyjOyimMtAm8m8Hshzz7OTC7uUcZqmvjYJVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FOJoRIm398krv7wuSBNpdPKMrq74+Qx+gOfE/zrqZ8jU2NKggrdt5uF5+6+gNFRd2
	 XYE+Rvu9rK67AwssA1sYxL5Pv9GIelkb4Y1z3woFDjk7AVzVGkBYfUnUNSxpwvZb5Y
	 vtu3LO5jcmohNykqZWvqaE4oeevTdZYJU0KyeZPNZ297rI+XU/vSbyl5jaC8F7F/eR
	 Rx3BcFUIK1CvGXBkuIzQktGfkC6EtBri8kSYWeF6I7m/GoXS15CDpSD9CHuaSpNLQi
	 P0nemW9jTdSVn3YJpiqZUmKt4W4j+WgyA/NdE8SknvDdOV/da6RECw0nw4DLB5wAXB
	 rAhBxb3nBniDw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix compile warnings for SM8550 and SM8650
Date: Fri,  5 Dec 2025 22:06:07 -0600
Message-ID: <176499396492.224243.6226641533387065460.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251203144856.2711440-1-krishna.kurapati@oss.qualcomm.com>
References: <20251203144856.2711440-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 03 Dec 2025 20:18:54 +0530, Krishna Kurapati wrote:
> arch/arm64/boot/dts/qcom/sm8550.dtsi:4133.22-4223.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
> 
> arch/arm64/boot/dts/qcom/sm8650.dtsi:5086.22-5177.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
> 
> Fix them up accordingly.
> 
> This series has only been compile tested.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sm8550: Fix compile warnings in USB controller node
      commit: 2d0165726d20395cb700546b1528df3fa614e5a3
[2/2] arm64: dts: qcom: sm8650: Fix compile warnings in USB controller node
      commit: 825db404fbed0580deb19f587d69b9f75980055a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

