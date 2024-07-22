Return-Path: <linux-arm-msm+bounces-26755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AB6938CB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 939401C21D4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E7916D4D4;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQ5XsWhd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB5716C69C;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721642120; cv=none; b=Ntp+Bj2p5KPbRzsy+C2FiR7jNLhvZ0ZVJ3fgOKPghI0hJZlqIA8kj/FfyywFASvce5BtVBht3BuJ4Atq4/7CrrLV6dR/e46/vjfY8sT5qVESwanWE3lKMWqHfQnNAjniI6aJnYh6lee32SAU+iYDg+7OXY2k9CTTb417ZqHd9rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721642120; c=relaxed/simple;
	bh=cLbprmf6R7GxoeY00WPtIhXSjYQfSDnonGHL7DPydr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UMNWK4xVP95PwLyXoZBvXHIw4ISpS/XE+9KQ+NlTHv0KpcQhBkW0AW8t8qSBIUyex+JYqu+mtykjfYk+K/6oHrwu2Wsn+0s4vImGbOtZpVoWnScFm/I+BoGNTl9Q9Q1nct1fG+/BYZECLo81F8DeI4VnDKI59v/fhIXz0X8AXKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQ5XsWhd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB8AC4AF0B;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721642120;
	bh=cLbprmf6R7GxoeY00WPtIhXSjYQfSDnonGHL7DPydr4=;
	h=From:To:Cc:Subject:Date:From;
	b=oQ5XsWhdtp1CRVbYBH6FxpLcIbnSZYsHkPP1R6cND1bM4eRb6jU+WFAR1sXxbVtoe
	 CISm9Jf2Vy8jNFdANDaDl37BezamFWllN6rohdO9ot9mAFH2FXoCDfgmhC4Y+LQ3KD
	 +85QrPgEFLkPKA2HUCfJVIcKSfyrhsmD/If1lgCDULZc4/GFXQGHcqQwxCqpZ0uhx8
	 qtdnm0Ol0io8vwmkonK5yB/AWODdTjYX7Ga/MI5RK20N/RoCO1EFk5SIpOt4ZQ0Zm1
	 AufYyjskljnHxYNtuFaABREwHlYMRDDO178y5MT9dIXmI70qQN5riCG05j+nKfBtYH
	 XxLaB8oNaXlQQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sVplG-0000000079I-13WI;
	Mon, 22 Jul 2024 11:55:18 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Xilin Wu <wuxilin123@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 00/12] arm64: dts: qcom: x1e80100: QCP/Vivobook/Yoga PCIe fixes
Date: Mon, 22 Jul 2024 11:54:47 +0200
Message-ID: <20240722095459.27437-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's a follow-up series addressing some issues in the QCP, Vivobook
and Yoga devicetrees that had been carried over from the x1e80100 CRD
dts.

Note that I don't have access to the schematics for these machine so
this is based on the qualified assumption that the PHY supplies are the
same as on the reference design (and similarly for the PCIe4 pins).

This is fixed for the x1e80100 CRD here:

	https://lore.kernel.org/lkml/20240722094249.26471-1-johan+linaro@kernel.org/

Johan


Johan Hovold (12):
  arm64: dts: qcom: x1e80100-qcp: fix PCIe4 PHY supply
  arm64: dts: qcom: x1e80100-qcp: fix up PCIe6a pinctrl node
  arm64: dts: qcom: x1e80100-qcp: disable PCIe6a perst pull down
  arm64: dts: qcom: x1e80100-qcp: fix missing PCIe4 gpios
  arm64: dts: qcom: x1e80100-vivobook-s15: fix PCIe4 PHY supply
  arm64: dts: qcom: x1e80100-vivobook-s15: fix up PCIe6a pinctrl node
  arm64: dts: qcom: x1e80100-vivobook-s15: disable PCIe6a perst pull
    down
  arm64: dts: qcom: x1e80100-vivobook-s15: fix missing PCIe4 gpios
  arm64: dts: qcom: x1e80100-yoga-slim7x: fix PCIe4 PHY supply
  arm64: dts: qcom: x1e80100-yoga-slim7x: fix up PCIe6a pinctrl node
  arm64: dts: qcom: x1e80100-yoga-slim7x: disable PCIe6a perst pull down
  arm64: dts: qcom: x1e80100-yoga-slim7x: fix missing PCIe4 gpios

 .../dts/qcom/x1e80100-asus-vivobook-s15.dts   | 42 +++++++++++++++--
 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 45 +++++++++++++++----
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts     | 45 +++++++++++++++----
 3 files changed, 113 insertions(+), 19 deletions(-)

-- 
2.44.2


