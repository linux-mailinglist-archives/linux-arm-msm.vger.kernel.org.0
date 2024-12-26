Return-Path: <linux-arm-msm+bounces-43381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE5E9FCC9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62034162A28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C53145B25;
	Thu, 26 Dec 2024 18:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4/bOpx9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433594E1CA;
	Thu, 26 Dec 2024 18:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237636; cv=none; b=n+L9zBsISDX/XU84IqXRquDoBiV8ZSbd0pwmnTJHqu9CP1Mor/g6+JGWsVOA3p8m8nP255Vbz/Ps9O6xJNR9W3sYhFXlSwjcQGYsNqQcZ8UpbZvpovn2Hbw74DAJ2JPJunJMnDvs48SkjapHZTFWZJgDXbLE6DvJLkhw+C/VmEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237636; c=relaxed/simple;
	bh=Uhtp92dkcUkVDxdnGOIHjX8quu7l5PlB0PnfJ3M6lqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WaNvzqiDEa0DisDNkDKEfMiNtpQc4eZXNsBIqBci/lhyWZS9cjdGnoREsEelBPUQ77B7lFxp1kGraVWxIWf8BxPkndl4LbRFaKOzuoo0n51bdUrIfgt1UADZfysMakrnQtGqECZxFuLo/LUdaXiXBLSfOkE2srxcFAhwD7R6D/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4/bOpx9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B7EC4CED1;
	Thu, 26 Dec 2024 18:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237634;
	bh=Uhtp92dkcUkVDxdnGOIHjX8quu7l5PlB0PnfJ3M6lqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I4/bOpx9BKB9rDPR/x/S/fTKyLRt7FnCfgCYzq/zz2kLtXQ6RLVAurIPQbVprOu/U
	 jRtXhAeKIVRR9l3A0Lqbb5lyYdub2nvWb3oOk6hkg+j0vH7vJHShvDAhUGW41TK9kN
	 svmdrz9YagLtOA/s2nqzeHoY6+GxLhDgW0DlGcDzOsVtuHsVpIM0HukQXG2rxyic9I
	 eHFu7/OApir7EqWJhLbyJJC9HQzZ77ho8JXQV2/Plu7syCJ2LlfUHWSNOJdeZc/PIi
	 toxM1Orpn2wKACX5OPZ3+uYQFYexsze3AKTgWegM9po/F/PwxPPBculiRY9LtsoGSQ
	 JyoEKueoTqmrg==
From: Bjorn Andersson <andersson@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] arm64: dts: qcom: x1e80100: Describe SDCs and enable support on QCP
Date: Thu, 26 Dec 2024 12:26:33 -0600
Message-ID: <173523761371.1412574.9917534102710391938.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212-x1e80100-qcp-sdhc-v4-0-a74c48ee68a3@linaro.org>
References: <20241212-x1e80100-qcp-sdhc-v4-0-a74c48ee68a3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 12 Dec 2024 18:50:38 +0200, Abel Vesa wrote:
> The X1E80100 has two SDHC controllers (called SDC2 and SDC4).
> Describe both of them and enable the SDC2 on QCP. This brings
> SD card support for the microSD port on QCP.
> 
> The SDC4 is described but there is no device outthere yet that makes
> use of it, AFAIK.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: x1e80100: Describe the SDHC controllers
      commit: ffb21c1e19b17f3b2f5f56c70e379ef7c96afad5
[2/2] arm64: dts: qcom: x1e80100-qcp: Enable SD card support
      commit: ab8f487d2f8905641541c27c7929363ee538b0f8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

