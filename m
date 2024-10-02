Return-Path: <linux-arm-msm+bounces-32928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A8198D0B3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 12:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D32891C20DC4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 10:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D001E6329;
	Wed,  2 Oct 2024 10:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CuapXjdt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5C21E630C;
	Wed,  2 Oct 2024 10:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727863355; cv=none; b=l4KLn2zL9GL8PImYrjPsVa1zQ1yU3rW7bFLZ3l+UCBj9Hv5J7VRCOorcAR8MeD9oC9AqT6iwMBmd4NRgeJe80+/3fdXSa4ObVuImGtNY9sXRdnoSsuwnEMCMYvoE/+lPufwAN9fbbTJKEcdtr5T4DPXh4xxmQNQc3s1rqKZAgwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727863355; c=relaxed/simple;
	bh=bK0PlkXjRaQYCzZ66Gl74bdXfzenRDfzNxWMFfKbky4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PrIu4MAVCNs6FNG3R6awzRkSwqQw2+0/zLLF4F8lx5H0gP8DKEbzBoBVf8MLAyad/3gY9mBBTyfzNkG2xfn5wQURU6cf3Mzc9yuQn+/mtV1iPrlTPQ/b266erIwMLloB/2T+ZZhFO2jqQjstIK3eBvwhSSN4YIZqaxmyGkiChtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuapXjdt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1118C4CECD;
	Wed,  2 Oct 2024 10:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727863354;
	bh=bK0PlkXjRaQYCzZ66Gl74bdXfzenRDfzNxWMFfKbky4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CuapXjdtPfxDcEhCafHE5nquqnhaQpCTwPoRrOMkCyMr0rtHk5ejvtZwhyhHsAfrx
	 2QNwhj/mzFOQastVNXBTQPTHIqWYykyLDqeEmu7o9zpYTHAaCKQMD8JeMoRqlCf57C
	 YUyLWl6pgfgoW8XJ7NZKAAGOGPVSV58HBIoaDk7PVCErAQuSOpVa6W0OpBgQqVgLVl
	 L8xU+x30WV3D86jrobVa5LEr4xv0EcfNrvzOmCjx5GkJa+pcdJmenX4SJNjJal6F84
	 kLKZz5H5Um7c4YhMtj3FRv1cWEJUDDHTZ10yP1t6NEN7GxSAIhpL/7RvPxfZhAX00b
	 xt1HMM4e2Q8cg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1svwBm-000000004uy-3t9x;
	Wed, 02 Oct 2024 12:02:34 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mukesh Ojha <quic_mojha@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 2/2] arm64: dts: qcom: x1e80100: describe tcsr download mode register
Date: Wed,  2 Oct 2024 12:01:22 +0200
Message-ID: <20241002100122.18809-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002100122.18809-1-johan+linaro@kernel.org>
References: <20241002100122.18809-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the TCSR download mode register to enable download mode
control.

This specifically allows the OS to disable download mode in case the
boot firmware has left it enabled to avoid entering the crash dump mode
after a hypervisor reset by default.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 7241bf0b1fa2..359156161a26 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -310,6 +310,7 @@ scm: scm {
 			compatible = "qcom,scm-x1e80100", "qcom,scm";
 			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			qcom,dload-mode = <&tcsr 0x19000>;
 		};
 
 		scmi {
-- 
2.45.2


