Return-Path: <linux-arm-msm+bounces-21389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 315E78D739E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 05:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 613931C211C2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 03:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD9F374FA;
	Sun,  2 Jun 2024 03:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6amt8V0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101AD374DD;
	Sun,  2 Jun 2024 03:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717300439; cv=none; b=Oax86Rm4fISxdaNDjBjgQuxcJo6zHDag/sI8P9/IffIvae3yDjRa+6RlnZDtsz0Lni8CFqQrSZyi98CWM7DKd8Sx+SVYG+X+oK/CX5kJRdsiPi79UZL/86sg/zaAyyH8RgOF9ErzSJZYODWfCST8Sw6ewAbzRWkx16YBcy8GJ9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717300439; c=relaxed/simple;
	bh=KZuafHnWGVEW/qEf4aAVgGvZYgEcJIEKMNDxYSu+DRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ah+E9H70awHIf6kG9Qx5sjdN/ubznXk5nvX1IPQyhRluCZIw/Dfo/R1Wq8Lvvb/3pJ66j8YBFc/SFJAmlNcvVw6IAFOEPOmy+rqTYSDfqLML6bD5HLwome0YawwOLG0lAJF0p//krJRpisHYyAd7ademukbrTXi7b1UuhQux4WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6amt8V0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77B2C4AF0E;
	Sun,  2 Jun 2024 03:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717300438;
	bh=KZuafHnWGVEW/qEf4aAVgGvZYgEcJIEKMNDxYSu+DRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V6amt8V0HnIjHaosG7Ir3l3Ah7xUkTEeQcOCsri+g+VD9ff9ihf/0yyHIMzjJFRbU
	 cJwsrW1IP52DSXrvrb+r0RgfVI9HCn0Z4C09u+2YGSkcMe0/5ND8L0BHKqibFEgiVq
	 yY7BaoGwX9FhygHoLes1RAQySW0wEQYlegqDkIV90vbPIesM14av1/6g+qlY7V5Q8T
	 HyEv9MKm8AHva7mGbCT/aMfdqr9M87yloGSFpV7Pk0W4qUF19phRd3J/R2rcnNWaKx
	 5r9+NLso829F0LbArfAe7qIgPtLcmb9S3E0Np87U6JrT8bXf7XAWVriRuG/6oLncGK
	 TjYa3+Qk8YU+A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 0/3] Add TCPM support for PM7250B and Fairphone 4
Date: Sat,  1 Jun 2024 22:53:44 -0500
Message-ID: <171730042586.665897.530218516306617254.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240530-fp4-tcpm-v3-0-612d4bbd5e09@fairphone.com>
References: <20240530-fp4-tcpm-v3-0-612d4bbd5e09@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 May 2024 17:05:46 +0200, Luca Weiss wrote:
> This series adds support for Type-C Port Management on the Fairphone 4
> which enables USB role switching and orientation switching.
> 
> This enables a user for example to plug in a USB stick or a USB keyboard
> to the Type-C port.
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konrad.dybcio@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: ~postmarketos/upstreaming@lists.sr.ht
> Cc: phone-devel@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: pm7250b: Add node for PMIC VBUS booster
      commit: 37ff5d0d75fece536cc493d0979e09f33edb75c4
[2/3] arm64: dts: qcom: pm7250b: Add a TCPM description
      commit: 6b5b15a1d785d5fb484d3a662b01776066d33137
[3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB role switching
      commit: 6814d454c26b552f0009c803ffc0ce3434eaed7e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

