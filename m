Return-Path: <linux-arm-msm+bounces-68552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE407B2149E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 20:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B7537AD71A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 18:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF4E2E3B1A;
	Mon, 11 Aug 2025 18:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NduAltwG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436032E3B12;
	Mon, 11 Aug 2025 18:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754937679; cv=none; b=pUq91nFxN89+cacKM6ZjpkwoBRR87lZeALrFcAhpqD6qiUfGnoCWyHDnqIXtJVx8eaYuQDEJdCwE8Vw8eGQkEAR08v6YeiVOYNRIsRjG0DHK4rGiPOnMzGIyy8W2x48OVuag2mhvn3sGC+OVY3QAmOn8AD/gjVrWSuyX76ikRIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754937679; c=relaxed/simple;
	bh=+zsGa2+vFar2a+6iTKTcF0XLThdIA3Cz3b0VrYnE6fA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K6DXr3Ib/FcnF8hcJJ+cKaTLdj3x6jWyO3Z71QtOq2PlvO7tMUFppPFEWUBJs+hRZpoCXGWnHKFDC9lOpBlzSaDfnGdHkD7wMXQMBkw4X524arNTVI05swHfKMHrJS+1007MVLPK59stnRhp6BoeJsv43ZRQVqmm2itGEVygif8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NduAltwG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B41CC4CEF7;
	Mon, 11 Aug 2025 18:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754937678;
	bh=+zsGa2+vFar2a+6iTKTcF0XLThdIA3Cz3b0VrYnE6fA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NduAltwGTGvgVLgnL3qC+Fg2Oriz74paKUpnTJlnj3hfvIzED8VgiGv7NyynnoKEP
	 cO4narpvzapdcv6Whkr8PPgStKjl9G1RGbyxL6W4t4mssGra2Qb2R6SqrApwSY79YS
	 DwQAS4VInbhqB0ywtnGymw9fvigmUa6vsY+FnRn+a5QesnkvcVy5z1hvWqpvVU5pgl
	 ZjT9cPLgZc2flspWX+Frj43kZcBjPQh2edOTkU6HjJIp9tZk773tkDg3zhN8tUuCCu
	 zN3q1AcU17meglQL6zSM23GtnOLEsik9ss3EEAjKtZ4jFBhEvkH0b/WUptgcc+1OwN
	 FIeztzZOEA3qw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Sort nodes by unit address
Date: Mon, 11 Aug 2025 13:40:57 -0500
Message-ID: <175493766110.138281.6112861432588496958.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250727193652.4029-2-krzysztof.kozlowski@linaro.org>
References: <20250727193652.4029-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 27 Jul 2025 21:36:53 +0200, Krzysztof Kozlowski wrote:
> Qualcomm DTS uses sorting of MMIO nodes by the unit address, so move
> few nodes in SM8650 DTSI to fix that.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8650: Sort nodes by unit address
      commit: 8def31f8c1e1f3d28e4ee3dcf6818a74c9a9a2f7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

