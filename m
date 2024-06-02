Return-Path: <linux-arm-msm+bounces-21383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F0D8D738B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 05:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6C1CB212BF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 03:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994358493;
	Sun,  2 Jun 2024 03:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q9X2/eDk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634D22F2C;
	Sun,  2 Jun 2024 03:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717300432; cv=none; b=GXT3U2AOU4Te4RzrwE+UC8XMsZq0ks5M7HaHd732bu+d6F2SRg9gsfN2/I9EXwFrZR7Ifrb4xWlAAZ1sjgFjHZcXiNfoIDV9610pL6OacpMmCD9qGzlGG162Kck+7w+PZMNv9UWyniJOdm8NKuHntrGsaGejzBZdiNztmLcBPAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717300432; c=relaxed/simple;
	bh=31vacXdRidHiNH68N0KAfJcNVUH4wgAyTY7bsyTHzZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u/HQfGQCopKtWnfGSntlM6Zi5Kd1YoUChqtdOJVK0tmrVeI3wu6unmmjUIxDHhXDKRgW1Yoya+xzdqT2gEBp0GXbduPKvfpTVEU12m25WqJ1Xdc0/6l2lEOr3LlPOie2iRZ32j+KnlLCMIY3+f1b/rEz6tG2hOQSpyKrKY432z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q9X2/eDk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C62C2BBFC;
	Sun,  2 Jun 2024 03:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717300431;
	bh=31vacXdRidHiNH68N0KAfJcNVUH4wgAyTY7bsyTHzZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q9X2/eDkb+AT0v3UkGoBpvPUziOikNwETdI+pB5bJ/NifveHZlJXTS013QLofKrxh
	 gBKYMw3xZYO94zx0NWUjuMdmHM0+KgMlFBrGXg58nTyzmK4jB1EoqaXv+k4oKd7uhq
	 An6xKuNNSGCMoxDZxbvOzEmfnJWGO/oXarRIPehgQq8Le1W+y61uoHuvaGSDjhx2He
	 GV6lzZ6u3Z0kFdgCh6O9SzOxCaBEmMEv2oO30/Ypv7mE9bcWgHTBjNoLPxdgM3MyP/
	 Vmk536o9K/bZShmYGheVefpxxrmqKIBphJLUETH1IHhP6UXbbIURKaMGuQGRpW1kkS
	 TlbDqEFLzrozg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: x1e80100: Fix the supplies to the USB1 SS[0-2] PHYs
Date: Sat,  1 Jun 2024 22:53:38 -0500
Message-ID: <171730042584.665897.3533769147362670886.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-0-6eb72a546227@linaro.org>
References: <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-0-6eb72a546227@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 May 2024 19:35:44 +0300, Abel Vesa wrote:
> According to documentation, the current supplies for the USB1 SS0,
> SS1 and SS2 both QMP combo PHYS and eUSB2 PHYs are all wrong. Fix
> them accordingly.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: x1e80100-crd: Fix USB PHYs regulators
      commit: ae5cee8e7349d7e5deff4cf90a08cbd738287155
[2/2] arm64: dts: qcom: x1e80100-qcp: Fix USB PHYs regulators
      commit: 20676f7819d7364b7e8bd437b212106faa893b49

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

