Return-Path: <linux-arm-msm+bounces-26629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3BF937840
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 15:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20230281B80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 13:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5976013DDCC;
	Fri, 19 Jul 2024 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NaDChEZ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D13112D1EA;
	Fri, 19 Jul 2024 13:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721395049; cv=none; b=sVbCeu9Q+d5mUluMGkq4DWlyfoD5DHwjZCh+JREpULmP9Xx3vxJ9fxDsBKN3jWm15hHUin8G7yFq3m0tIt141a3bNTU3bX19pK8UTPYw4tWJOPJRjS/voB+lenm12UqrlyooSLb3BZ/UzH4TC+YeNzA4WhwKX4vdA6rMak1TYPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721395049; c=relaxed/simple;
	bh=0XRZypzPYXE0e00veUNHsKWkWyhcO5XmFRBNK8mnvXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IBqLLMwH4F11EB5R8BwKtJ+C4GCUM22BgriQNHYnP9m5pVjncsa0+UbYG4ZWu2ixmswZeaJdsKcLvBzOOAurCmbllBSSlN5AZ1+DoIsRdGCAUn8RykllEgpuLwMbm2gq05lHE+O5sqKqQT3QU63j3CbUAdDe0I8jTIFSMYYICqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NaDChEZ1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7EA7C4AF0D;
	Fri, 19 Jul 2024 13:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721395048;
	bh=0XRZypzPYXE0e00veUNHsKWkWyhcO5XmFRBNK8mnvXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NaDChEZ1G9N2mftf+n5SUfSYXk10ia3Ph+/kuew62ZD7N3OFbR/NQVU/mP8FZUYG2
	 mSTWW7ui6IdOm5kMbtP2q1cnzAAwbr4oCT1wgPI4/bXi0YQdZtWfiOwsm6Y+PNyaxh
	 FlmzoddKJKOxPvz/XbmWfJ5c6/vM7myU3tTBnZH3VhWAvV0+/3uH5WmlHx3fmf/h25
	 P8+qqgawN+lHKTsSB3cHdRcWKoz0LaRv6IvFNMwc/saDsXVi6PcQ0U/qIkJjTUSRcv
	 YEBN5hBweNaIe10qBsM5SiJSv52CJ0/AG7RfMrMBXsZqgDNpCwhFEB6OxBEOv0g7V8
	 haaiO3+DTZKtA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sUnUO-000000002BI-2pQo;
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
Subject: [PATCH 4/7] arm64: dts: qcom: x1e80100-crd: disable PCIe6a perst pull down
Date: Fri, 19 Jul 2024 15:17:19 +0200
Message-ID: <20240719131722.8343-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240719131722.8343-1-johan+linaro@kernel.org>
References: <20240719131722.8343-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disable the PCIe6a perst pull-down resistor to save some power.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 41d05ce01cbb..7406f1ad9c55 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -987,7 +987,7 @@ perst-n-pins {
 			pins = "gpio152";
 			function = "gpio";
 			drive-strength = <2>;
-			bias-pull-down;
+			bias-disable;
 		};
 
 		wake-n-pins {
-- 
2.44.2


