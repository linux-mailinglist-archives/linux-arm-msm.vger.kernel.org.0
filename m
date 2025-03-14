Return-Path: <linux-arm-msm+bounces-51468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 308E3A61B4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:01:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDF687ADC0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBBEF204F84;
	Fri, 14 Mar 2025 20:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6yq4ZWt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90253204C3E;
	Fri, 14 Mar 2025 20:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982486; cv=none; b=pDg9XgCra5YujMLRJYYMxChWZeIpSjf8eES0ZCdK+LFJTx1IJVYQcxaT0iGm+cJoelcrtgHGT1SYR20SRgFVAFsrUwFa4D8OhMSxRzCt+KM2AE4ZfVhdc5ZV3iWvoeBg2JfshMfbTiLlN7TI1eYymiNKov8NPuc1hEaBZOs2Fto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982486; c=relaxed/simple;
	bh=WBAAZalRYYHWbyXToi/u9v+7v0p2Rb0L9PzP5RRvpH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sr8Cv4ysRAUFVWal38PVm6uY5UPywFxKOFhHxcUQQ/pxyoe0qq6ygYfehFaMHHOUTlqovBTAJDTzA+dlxFHngoFJwKHNEUaTafdwYVfExcNkgf41ujRbY3uNv666vu6Yq523k5yyfaUIDIi4VyC9u3AgL6dQihquPYjxh3l6+a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s6yq4ZWt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A4DC4CEF0;
	Fri, 14 Mar 2025 20:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982486;
	bh=WBAAZalRYYHWbyXToi/u9v+7v0p2Rb0L9PzP5RRvpH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s6yq4ZWt4F9kkb7MftBQo+o4OfMzlRqJHLLufzg8wnxF+GUy7oGpdx7EXkRxhz0yg
	 9YvX+eXJBNSv23DgOdCqjn6o1ZxJeeL/vwCgJ8uNyh9dLAW5Kuh4qttZxPjN7wKrGN
	 4W6hVHskeUdMszdBAKZIzI2iTWTBYonpFo+LlaZh73Usda9dakqAyMwS6SMMR9EtZ/
	 0XNLmYf9WZE1n20bkqWr3JgDadVf73bZwehbznzQf4Ue9wtcfRjt5za+GVfkEVjkVq
	 bmCuN/591gRPLNNSmj90xjeWMAw8j7MNE0CjQu1r/8xAl2uX2Rr+HmKVY33LUIJaEz
	 oFvfCIyzYA4mA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: x1e78100-t14s: Rework devicetree for LCD and OLED SKUs
Date: Fri, 14 Mar 2025 15:00:42 -0500
Message-ID: <174198247901.1604753.2955236264513009210.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314140325.4143779-1-abel.vesa@linaro.org>
References: <20250314140325.4143779-1-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 14 Mar 2025 16:03:22 +0200, Abel Vesa wrote:
> The Lenovo Thinkpad T14s Gen6 comes in different SKUs when it comes to
> panels. The only difference that is important is whether it is an OLED
> or an LCD. The way that backlight is handled in devicetree between OLED
> and LCD forces the need of two separate DTBs.
> 
> So create a common T14s dtsi that describes everything except the
> backlight handling, by renaming the existent dts to dtsi. Then make the
> legacy dts the LCD version, while adding a prepended oled dts. Both
> include the generic T14s dtsi.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Document Lenovo ThinkPad T14s Gen 6 LCD and OLED
      commit: 26cc0304d1352a4b1db7d2807cd276ab31e4da05
[2/3] arm64: dts: qcom: x1e78100-t14s: Add LCD variant with backlight support
      commit: 31eff589d00b1b41376800ff1322dc88d81f6ee1
[3/3] arm64: dts: qcom: x1e78100-t14s: Add OLED variant
      commit: ace6b365cf2a49a3600271186455b1b281babe5c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

