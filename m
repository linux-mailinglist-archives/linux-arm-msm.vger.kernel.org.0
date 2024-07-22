Return-Path: <linux-arm-msm+bounces-26742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBCD938C40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 679341F21D56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E34C16D9A3;
	Mon, 22 Jul 2024 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SgCm7WFr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF8F16D4F1;
	Mon, 22 Jul 2024 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721641425; cv=none; b=VK9OsgubWDWdzcTlDtxVgSasrEBG7Yb1vS25nG8fFDt3DGakS9vc7zT7X5wr6LXxMNvzgvb8+tU+7kMV6uDA+SLpwWsrekhkh2Q//hs/c9JF8ZIC0VHe2fRWLfJc1lOyosWnLu4ZzZRR5j+JpLhpyLEvVwY3AThrADpVNA1TSFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721641425; c=relaxed/simple;
	bh=7+ptnipHTToE3faUBAb0QiyuuHmqnphVZmpfWbsyLGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EXGJc9YVFCl9mCnnpVXKAMZ1IoTcFDEbBN/4ojAWz3jIlqFVblZgxQWXOfaF7baPOLbJXWZamTshl1CvlDJT6Q4BHWxy4BaZp4qSOM8GMhA/gsQTYHqV8fBG4l/Hzx/dIiWi1tg2CBoIli9S69Il2kwAv6ZKQTFHDN/DOd0tHI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SgCm7WFr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D617C4AF0A;
	Mon, 22 Jul 2024 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721641425;
	bh=7+ptnipHTToE3faUBAb0QiyuuHmqnphVZmpfWbsyLGE=;
	h=From:To:Cc:Subject:Date:From;
	b=SgCm7WFr9jYg16CHCtEA5fwtDV0yxLmK2e9v+HLG7NpmaJ1f8AN40PYYmbCyV0OXO
	 negw8ovlFWU1qYvbtuJDHr3OZDQMQDwnu7pCvrBH1NF9LEmxPjZ5Pf3cJ5CDxN1GcD
	 oiJgzcO5B++vTJNjyJskP46p0Gc+Qsda9KyVVo/Pwj1Op83fMSNDWCShNigfCl2cPD
	 bSRoOLXIUaMB8GcVn0Zw+N/a20dcNI1SyUBeH3BBmPgjEaPbu5LDRZ1UcvI8TtJxzO
	 EG2iaVPirJVtJHboo1nDDtCAH8RAeWoNJnhh87dFW1snGKj4M6eeO+iyoUwFmD4sAs
	 8ll1FAEt2aNKQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sVpa3-000000006u7-1zEM;
	Mon, 22 Jul 2024 11:43:44 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 0/8] arm64: dts: qcom: x1e80100: PCIe fixes and CRD modem support
Date: Mon, 22 Jul 2024 11:42:41 +0200
Message-ID: <20240722094249.26471-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes some issues with the current x1e80100 PCIe support,
adds the PCIe5 nodes and enables the modem on the CRD.

The fixes should go into 6.11, but the modem support depends on them so
I decided to send everything in one series.

As Konrad noted some of these issues have been reproduced in the other
x1e80100 dts. I'll send a separate series addressing that.

Johan


Changes in v2
 - add missing minimum OPPs
 - move 'pinctrl-name' under 'pinctrl-0'


Johan Hovold (8):
  arm64: dts: qcom: x1e80100-crd: fix PCIe4 PHY supply
  arm64: dts: qcom: x1e80100: fix PCIe domain numbers
  arm64: dts: qcom: x1e80100: add missing PCIe minimum OPP
  arm64: dts: qcom: x1e80100-crd: fix up PCIe6a pinctrl node
  arm64: dts: qcom: x1e80100-crd: disable PCIe6a perst pull down
  arm64: dts: qcom: x1e80100-crd: fix missing PCIe4 gpios
  arm64: dts: qcom: x1e80100: add PCIe5 nodes
  arm64: dts: qcom: x1e80100-crd: enable SDX65 modem

 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 110 +++++++++++++++++--
 arch/arm64/boot/dts/qcom/x1e80100.dtsi    | 128 +++++++++++++++++++++-
 2 files changed, 227 insertions(+), 11 deletions(-)

-- 
2.44.2


