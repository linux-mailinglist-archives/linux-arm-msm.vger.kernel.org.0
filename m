Return-Path: <linux-arm-msm+bounces-4556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 266AC811B3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 18:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71EDB1C2123B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 17:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17DD56B96;
	Wed, 13 Dec 2023 17:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h8oCRKep"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7078A59526;
	Wed, 13 Dec 2023 17:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 916ECC433CC;
	Wed, 13 Dec 2023 17:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702488859;
	bh=NKdFm0dpgumWF6a9vHnaczsLx7HZHodkaXNcxMTtQdQ=;
	h=From:To:Cc:Subject:Date:From;
	b=h8oCRKepJGRSe+bxbKuzY6Owt0Lw+V20bQv0j4OEGVi6cnhila9yei5P+Bh37eREW
	 //4bvfSmtUy5/jvM+cxXh4G9nX0N0/sfdh6L0mpuJkcPvHspXpzSofHtUKVnnokFBe
	 lCbC2NReNH/F1/36LQ1ZmtIiD0laJKjUPicRBDl/AnjZJYbobb9i6RcdMD1lWJOGXu
	 D1QQRk2971zijY7HW3NAC71gL2mnHU5ykEF0OzMSRpZH7dwRs2Dka7w7Q+MuRshkiA
	 E1R0p5GRf8x6LbRgdktAk+A6j0gQ0aZUWdGnc8MHzWmn1M0EdNGWj2vbZq0t9BVj1Y
	 ro0t0f1lUV6xg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rDT7h-0007gu-0z;
	Wed, 13 Dec 2023 18:34:17 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/5] arm64: dts: qcom: fix USB wakeup interrupts again
Date: Wed, 13 Dec 2023 18:33:58 +0100
Message-ID: <20231213173403.29544-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB DP/DM HS PHY interrupts need to be provided by the PDC interrupt
controller in order to be able to wake the system up from low-power
states and to be able to detect disconnect events, which requires
triggering on falling edges.

A recent commit updated the trigger type but failed to change the
interrupt provider as required. This leads to the current Linux driver
failing to probe instead of printing an error during suspend and USB
wakeup not working as intended.

While at it, fix also the SS PHY interrupt so that it too can be used to
wakeup the system up.

Thanks to Konrad for reporting the probe failure on sc8180x and
providing the corresponding PDC interrupts and to Krishna for providing
the remaining PDC interrupts. The exception is for the second controller
on sm8150 whose PDC vectors I inferred from sdm845.

Note sdm670 and sm6375 need similar fixes and I believe Bjorn is trying
to dig out the corresponding vectors. The SS PHY interrupt on sc8180x
should also be fixed.

Also note that these patches have only been compile tested.

Johan


Johan Hovold (5):
  arm64: dts: qcom: sc8180x: fix USB DP/DM HS PHY interrupts
  arm64: dts: qcom: sdm845: fix USB DP/DM HS PHY interrupts
  arm64: dts: qcom: sdm845: fix USB SS wakeup
  arm64: dts: qcom: sm8150: fix USB DP/DM HS PHY interrupts
  arm64: dts: qcom: sm8150: fix USB SS wakeup

 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 16 ++++++++--------
 arch/arm64/boot/dts/qcom/sdm845.dtsi  | 16 ++++++++--------
 arch/arm64/boot/dts/qcom/sm8150.dtsi  | 16 ++++++++--------
 3 files changed, 24 insertions(+), 24 deletions(-)

-- 
2.41.0


