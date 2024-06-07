Return-Path: <linux-arm-msm+bounces-22006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FAD8FF9FB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 04:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AD211F23817
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 02:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C315171AD;
	Fri,  7 Jun 2024 02:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jyj9PmJ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D392715ACB;
	Fri,  7 Jun 2024 02:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717727643; cv=none; b=ggA1p6RR2lbqcxpAVKJCPlztimziZ+gSwh0ngkhS6e1SBdGPHGFRX2WpYzcMq7t081BP0JqAzwZtegnKjJY8mzVJonNR12JU1Iflqf1Q6ASDTbtrkE3OYI2H5Qu3Y979K1EDDRVMXH6vXbhbPK+Hb4ylBb54WlNELhF32yQb6M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717727643; c=relaxed/simple;
	bh=OImrMNr6YZDlvLd6QZl8OCLpKTRmTbD8QMLvEyYQPeU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uh+C6u3HwXnD7yS+NKFfEGhA3YV8wLOAnRSgGOLf6msf+c+e3Jq+oCr3x1bY9BNO61rxHwHX7fxZIdoV6aA0PjR+Lm4kAvRYA9hSzZBnZlbKvh8EJcbmcLB6r8ksj9xup4Gm/SJh0uKMYLDUSE77G4fow12LMgr1VD7oWMe4Sco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jyj9PmJ4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE04EC32782;
	Fri,  7 Jun 2024 02:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717727643;
	bh=OImrMNr6YZDlvLd6QZl8OCLpKTRmTbD8QMLvEyYQPeU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jyj9PmJ4ouc5R7QEH/dEHRTLzepmMN2J8Bs5I7XRtVG2Ort8RqS2cth3ntoOh5tHj
	 g3MlI5j8EPAUO/db4eprM4uP75Wo8hhep/fYkGPGTEp3NQywxKBtpRGvv2lu01PHQl
	 fdhk47+165PsVDzgxweXrSnE7T0LSkYeyQwV2sERqD9PpkrRyy/GnM5fRfWQFB2UTD
	 /Nu+yytfsyOviN3TxT9lLf/JIcVNJh7Q4z/9lgB+fWWjS/57MmRGHkExclTuui74kJ
	 TQ+hbGO/KAxDA84oOVYbzuNi82OyyGMqBACmFt4aMJ7N5FHglHOVrORuyFk3N2EsJh
	 t6JrDFm/4UwRQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RFT 1/4] arm64: dts: qcom: sm6350-pdx213: correct touchscreen interrupt flags
Date: Thu,  6 Jun 2024 21:33:57 -0500
Message-ID: <171772763758.789432.12879427405888315916.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240605160032.150587-1-krzysztof.kozlowski@linaro.org>
References: <20240605160032.150587-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 05 Jun 2024 18:00:29 +0200, Krzysztof Kozlowski wrote:
> Interrupt flags 0x2008 looks like some downstream copy-paste, because
> generic GPIOLIB code, used by Qualcomm pin controller drivers, ignores
> flags outside of IRQ_TYPE_SENSE_MASK.  Probably the intention was to
> pass just 0x8, so IRQ_TYPE_LEVEL_LOW.
> 
> 

Applied, thanks!

[1/4] arm64: dts: qcom: sm6350-pdx213: correct touchscreen interrupt flags
      commit: d044c0e36d095996f7b29a928e06c9475c4075e6
[2/4] arm64: dts: qcom: sm6375-pdx225: correct touchscreen interrupt flags
      commit: fa2c8cad202195bfa87b18dc44ff4981d45085b4
[3/4] arm64: dts: qcom: sm8250-sony-xperia: correct touchscreen interrupt flags
      commit: 46822d2750822dbe58bcd999cbedf24147cb5fc3
[4/4] arm64: dts: qcom: sm8450-sony-xperia: correct touchscreen interrupt flags
      commit: 05d84f973d84d23e0a249ae5b3f6d7572fdc5e1e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

