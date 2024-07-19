Return-Path: <linux-arm-msm+bounces-26634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBB493784D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 15:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DC451C216E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 13:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D162F14535F;
	Fri, 19 Jul 2024 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dK/4pf1h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F011143C43;
	Fri, 19 Jul 2024 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721395049; cv=none; b=HsygvEAtc2waSwqKZEDKlUm4Y7fOEzSIipVnn0vxt60B/eiTnypo78UUTz63G626nFoDSPndzwYgrjR6fcP3mIos8H2PbhfREno5HWoXmGVzlL5RZaQBWEAiBDxg8YCy+ohrI4ZhY1U30nw5QwF4SriPHfO8Ub2g6r09a/OlG64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721395049; c=relaxed/simple;
	bh=GP+A9yKbskhnBiPHxYqK+ArihuCz/xHef1rX97PfIpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CLSok3Pz6tVuS5Tc5CVj2mfW6+U+aC/fs9kvZFjO+WMCEy1jXgKf0HMbWUaXA5NTRNcMYWfe5KF9RTstkO0I0WaeKvEyXT5yAP8+UtF0SwWs0QfYXk+zaO8D4Cz9sY9ob4evz5UHvDSqPFTpvultnI0XZIQgNJmAtwS2+hK/9zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dK/4pf1h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE2DC4AF0E;
	Fri, 19 Jul 2024 13:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721395048;
	bh=GP+A9yKbskhnBiPHxYqK+ArihuCz/xHef1rX97PfIpU=;
	h=From:To:Cc:Subject:Date:From;
	b=dK/4pf1haPKmlpB5uTlTx8s2hKYIHU21a30kNd4YeioychegX2J+5r9KnePSUtdp8
	 Mp4hZrKeb/nXKQgJJvYlvUPpPYu1JQ2AjhIxt0ocaJzNco++IKJtFaoIPuV23uwKWj
	 Zb+5qiFxDhbepZ3Z3Ic/bMMh7Da+9oMKVem+PUrIwFd/5lJ6zM55OKQgulatHNaeMm
	 hQCYa+XJtEO/BYs+rLUExBYBNDe2VoXWMckWtEKKY/BNDrX0xqA246z0X8jU8qnfp+
	 HsylTTBzthz2IlIJZYvvVjXEHezQndfwc2Iez55L40Q2ypDWQP/LfhfyaiY/enIvW5
	 dcOw9fewcq6IA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sUnUN-000000002BA-2dsF;
	Fri, 19 Jul 2024 15:17:36 +0200
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
Subject: [PATCH 0/7] arm64: dts: qcom: x1e80100: PCIe fixes and CRD modem support
Date: Fri, 19 Jul 2024 15:17:15 +0200
Message-ID: <20240719131722.8343-1-johan+linaro@kernel.org>
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

Johan


Johan Hovold (7):
  arm64: dts: qcom: x1e80100-crd: fix PCIe4 PHY supply
  arm64: dts: qcom: x1e80100: fix PCIe domain numbers
  arm64: dts: qcom: x1e80100-crd: fix up PCIe6a pinctrl node
  arm64: dts: qcom: x1e80100-crd: disable PCIe6A perst pull down
  arm64: dts: qcom: x1e80100-crd: fix missing PCIe4 gpios
  arm64: dts: qcom: x1e80100: add PCIe5 nodes
  arm64: dts: qcom: x1e80100-crd: enable SDX65 modem

 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 110 +++++++++++++++++--
 arch/arm64/boot/dts/qcom/x1e80100.dtsi    | 125 +++++++++++++++++++++-
 2 files changed, 224 insertions(+), 11 deletions(-)

-- 
2.44.2


