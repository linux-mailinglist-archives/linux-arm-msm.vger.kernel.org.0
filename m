Return-Path: <linux-arm-msm+bounces-1196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3045B7F18E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 17:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF6E3282420
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 16:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4421E536;
	Mon, 20 Nov 2023 16:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n+qXcFJd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6081DFE1;
	Mon, 20 Nov 2023 16:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C1EC433C7;
	Mon, 20 Nov 2023 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700498618;
	bh=hylOU4j/LA+CLsIR16LNKqzRwGIrrPV+YZyr1iajJBY=;
	h=From:To:Cc:Subject:Date:From;
	b=n+qXcFJd2DRLploMiyooJ5oVX7TPOGLYbAbTd173+vLchJWbj1evNfLjOjyY8EXNk
	 2onyQDcWbGLZ9VJObcAJ5yPcvCdns+yDeqyyQlICiQ9N1Icj/rnEwB+mILWBrhVYrH
	 /mM7ouhp/A4mP72KmSTmsgz4ako55fQfCo+lShuT/8ZKnChGKeB2Jsp8W4ilQD5OGA
	 KtCUPTa/oNHHiPzCLHygH1ukR+I1qTmhJOcTdw4YMrcZQECYcC261KXhMJP8Sdw3Q2
	 yyAAn5ibbFj1E/ykekiaFdnBY7G8EVB8D4pfO3g8y3XfaJ0I8tFV0lvM6bUO8tfGxK
	 vRjBcI7tci+Pw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r57ND-00027R-0b;
	Mon, 20 Nov 2023 17:43:47 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 00/11] ARM/arm64: dts: qcom: fix USB wakeup interrupt types
Date: Mon, 20 Nov 2023 17:43:20 +0100
Message-ID: <20231120164331.8116-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When testing a recent series that addresses resource leaks in the
Qualcomm dwc3 glue driver [1], I realised that probe deferral can break
wakeup from suspend due to how the wakeup interrupts are currently
requested.

The following series fixes this by no longer overriding the firmware
defined trigger types for the wakeup interrupts:

	https://lore.kernel.org/lkml/20231120161607.7405-1-johan+linaro@kernel.org/

It turns out a number Qualcomm devicetrees have also gotten the trigger
types wrong, something which this series addresses.

Specifically, the HS/SS PHY wakeup interrupts are level triggered while
the DP/DM HS PHY interrupts are edge triggered, and which edge to
trigger on depends both on the use-case and on whether a Low speed or
Full/High speed device is connected.

Fortunately, there should be no dependency between this series and USB
one as all devicetree use the correct trigger type for the HS/SS PHY
interrupts and the HS one has never been armed by Linux anyway. The
DP/DM interrupt trigger types are also updated on suspend currently.

The only exception may be sc7280 where a recent cleanup patch
inadvertently switched the SS and DP trigger types, but that one should
just be backported anyway.

Note that the binding example is updated in the USB driver series
mentioned above.

Johan


[1] https://lore.kernel.org/lkml/20231117173650.21161-1-johan+linaro@kernel.org/


Johan Hovold (11):
  ARM: dts: qcom: sdx55: fix USB wakeup interrupt types
  arm64: dts: qcom: sa8775p: fix USB wakeup interrupt types
  arm64: dts: qcom: sc7180: fix USB wakeup interrupt types
  arm64: dts: qcom: sc7280: fix usb_1 wakeup interrupt types
  arm64: dts: qcom: sc7280: fix usb_2 wakeup interrupt types
  arm64: dts: qcom: sc8180x: fix USB wakeup interrupt types
  arm64: dts: qcom: sdm670: fix USB wakeup interrupt types
  arm64: dts: qcom: sdm845: fix USB wakeup interrupt types
  arm64: dts: qcom: sm6375: fix USB wakeup interrupt types
  arm64: dts: qcom: sm8150: fix USB wakeup interrupt types
  arm64: dts: qcom: sm8550: fix USB wakeup interrupt types

 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi |  4 ++--
 arch/arm64/boot/dts/qcom/sa8775p.dtsi  | 12 ++++++------
 arch/arm64/boot/dts/qcom/sc7180.dtsi   |  4 ++--
 arch/arm64/boot/dts/qcom/sc7280.dtsi   |  8 ++++----
 arch/arm64/boot/dts/qcom/sc8180x.dtsi  |  8 ++++----
 arch/arm64/boot/dts/qcom/sdm670.dtsi   |  4 ++--
 arch/arm64/boot/dts/qcom/sdm845.dtsi   |  8 ++++----
 arch/arm64/boot/dts/qcom/sm6375.dtsi   |  4 ++--
 arch/arm64/boot/dts/qcom/sm8150.dtsi   |  8 ++++----
 arch/arm64/boot/dts/qcom/sm8550.dtsi   |  4 ++--
 10 files changed, 32 insertions(+), 32 deletions(-)

-- 
2.41.0


