Return-Path: <linux-arm-msm+bounces-3831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AB38099D7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FDF41C20D08
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DAB63D7;
	Fri,  8 Dec 2023 02:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLWt3ca8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14126AB0;
	Fri,  8 Dec 2023 02:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D0CC433C9;
	Fri,  8 Dec 2023 02:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004026;
	bh=Fz0tiY104hQ+SP9PBMlxjLEbkXLArrk6DRdKJTOJeOs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HLWt3ca85Zr7bkNYtm+NUwtm8tt0OoEMCf5kiWXQNHe5nj3XZCYTIaCFHwLt9Ussi
	 JvuhJiLI85KRJSbkw28pRC5PVZ09JsLU0t1feTe5hhcWBAb99s0v18JVGfS24eCPfi
	 2ASzi4czvDvwD37vDC6PIq48HPtmQ8p9K8pQDsHrP1WdeO8QCp5szd9R7h+MyyAZxI
	 ZNKlw6lLRRUJkNEMkTwOy7X7enlJQKnJrftXVjFxEj+eKTChwUOOOnkF0SM8f+VSio
	 0GeXFyECe6I2KyAKZ0YMZM17AHbR8y9Jz22EqAZ9crcTCflA7j1lJGDk/1cefSk/pi
	 9ZVuOBAOEXEWA==
From: Bjorn Andersson <andersson@kernel.org>
To: agross@kernel.org,
	konrad.dybcio@linaro.org,
	lee@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	Mukesh Ojha <quic_mojha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/4] dt-bindings: mfd: qcom,tcsr: Add compatible for sm8250/sm8350
Date: Thu,  7 Dec 2023 18:57:50 -0800
Message-ID: <170200426910.2871025.1931459275540622967.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <1698253601-11957-1-git-send-email-quic_mojha@quicinc.com>
References: <1698253601-11957-1-git-send-email-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 25 Oct 2023 22:36:38 +0530, Mukesh Ojha wrote:
> Document the compatible for both sm8250 and sm8350 SoCs.
> 
> 

Applied, thanks!

[2/4] arm64: dts: qcom: sm8250: Add TCSR halt register space
      commit: d59653233e8779e3fe082eb5635b9785f2095af6
[3/4] arm64: dts: qcom: sm8350: Add TCSR halt register space
      commit: 1accc6031d925c6045c4776d5f3646996b0b242a
[4/4] arm64: dts: qcom: sm8550: Enable download mode register write
      commit: 44b1f64cad5703c87918cc9ffbf9b79bb959418d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

