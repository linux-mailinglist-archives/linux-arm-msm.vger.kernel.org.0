Return-Path: <linux-arm-msm+bounces-51467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 918BFA61B4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:01:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5C004209B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12A31FCFF4;
	Fri, 14 Mar 2025 20:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EX4XKH/E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A97F193077;
	Fri, 14 Mar 2025 20:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982485; cv=none; b=qQNlB77eKswnGVH8FLKR85zj5I8lr1Dt6oyIX2uHhCTMRXL+mp6EmqCI6x2JZBnwR4hNdYICzdmwnoNB0gJ2ic9fvWdGlf+pyIRxTKf7z0NzZlLh9W7dUx0ZC/71OVoI/cVZxMe0kFGY9l+DR7jwEh8fCj4j8mgfSbLXox9KdcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982485; c=relaxed/simple;
	bh=3wZHJtLo5xE0IdV3kasFedRKu0iF2VKw2OoYDYy0390=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EZsff7MpTozyOIcoJSsfinjlGTTMwkeNMz0OaGLjqPHFOf0vMBnBS2J6iNqYUltRw3zUB2LKaVgIkixp/l//88ReqZ2uX28P64BKJaaw8TX8fTEPr6IThx4RSVofGOjIuHSVUcCOufavTDOJh/XfOMqVGbC4FR0a2Ts3vCuw2ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EX4XKH/E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368F3C4CEE3;
	Fri, 14 Mar 2025 20:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982485;
	bh=3wZHJtLo5xE0IdV3kasFedRKu0iF2VKw2OoYDYy0390=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EX4XKH/EUe3U5VaBgImsuevSsmJ7wqdRPJJOmwunHYa4WRrgTgSA5jPC8OaH7zWqL
	 +EKRyU7GMCw3HnkTHXIa9PAkp0FbMKqP6neP9tJoUp5XOT+SCILkGYXBssdKKHzjKu
	 iCR9pPvLqnH/QxY1grKW7NqOYg1+nAmUic/pzDaAUCBjeLPU62vFcQwg04gkULTgLZ
	 2cB+b5Ux2DETnal38etVC4RgzpQtm/RxzNzgUo13pcGgfrOpyzYsHpADQ/fIV7/lGi
	 R7OS63Guf7qIeC8jtBLi3oQv7pTEg8OU9ctqnCxbUAC9JaIVsrmATKFm0rApS8CfPS
	 DEVk4bNS4lxUQ==
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
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: x1e78100-t14s: Rework devicetree for LCD and OLED SKUs
Date: Fri, 14 Mar 2025 15:00:41 -0500
Message-ID: <174198247898.1604753.43826909478233023.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310141504.3008517-1-abel.vesa@linaro.org>
References: <20250310141504.3008517-1-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 10 Mar 2025 16:15:01 +0200, Abel Vesa wrote:
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

