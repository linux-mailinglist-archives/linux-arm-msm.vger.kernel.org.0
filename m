Return-Path: <linux-arm-msm+bounces-39638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9249A9DED21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 23:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3507D16389F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 22:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCF81A9B52;
	Fri, 29 Nov 2024 22:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vb0gijGt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656591A4F09;
	Fri, 29 Nov 2024 22:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732918387; cv=none; b=ZJRLSIXFEsLofOdiqz0yd4qA+rHmsPrVOenp+Hr6o4i1XNqswDqzXHIwPJVO//Xfvbeb20/zn6KfeW7HUpBvgpmOdrGmHP9Ef6YhxIqxWpAWDkskOk3fWJHq/FAcgOlwSlIPCaaghLCYeJvaMk0m66ZeGf6W47s3C1bCGn7KXhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732918387; c=relaxed/simple;
	bh=zgSt9E9eYLZhU3v4oROWjzAasMeEyCaINI54A9l3ubQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p+3IqZ6CGZB7mVJkp5Ql6mXRq0pFHSaycgxPOhOH7HuDCH3ktftIj/VMs7RMIAoWDD1rS9XAf9DA4L1sVmnPCfuSJ86zLAmjmJOvPXDh50tkVLzZ+u2rvYCKelAnXkCgFAj8csNoijXGWKw2p8xo9izM2of7oCgLeWrHo8aGKlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vb0gijGt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54A3C4CECF;
	Fri, 29 Nov 2024 22:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732918387;
	bh=zgSt9E9eYLZhU3v4oROWjzAasMeEyCaINI54A9l3ubQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Vb0gijGtVIJjwB3RCd+Rk7BXQ2vMWkgC/Lgwig74kMm5k9MNBN38Ee2Qp5ZJ5HE/P
	 uhOE6W0Jj7b9NWLm/gGqzZj9jVEwLfQBw4byq57sk5LzecE3D9gstVISdnZkODajqr
	 FihIhw5JX32WKdtrkJ5qSJXJmm6EeJ7ldamL6AJMYC/oSXA/FiylOobVN1QL0QJgO4
	 +y4XDQvvtyQDCc2ce1Fwf3sRaOVOzSJSaWTdw8HwrsHRIBUa4Gfu89yGJq+OJ0fUy2
	 iXmUy/Drq2Qdx9lwZKb48g/hJwtbX30gM3JliEYqnSexlCiSboiLT69z7MkdQxt8Do
	 l/bALGW/I4Wag==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 29 Nov 2024 23:12:46 +0100
Subject: [PATCH RFT 2/4] dt-bindings: usb: qcom,dwc3: Fix MSM8994 interrupt
 spec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241129-topic-qcom_usb_dtb_fixup-v1-2-cba24120c058@oss.qualcomm.com>
References: <20241129-topic-qcom_usb_dtb_fixup-v1-0-cba24120c058@oss.qualcomm.com>
In-Reply-To: <20241129-topic-qcom_usb_dtb_fixup-v1-0-cba24120c058@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@gmail.com>, Petr Vorel <pvorel@suse.cz>, 
 =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>, 
 Alexander Reimelt <alexander.reimelt@posteo.de>, 
 Dominik Kobinski <dominikkobinski314@gmail.com>, 
 Harry Austen <hpausten@protonmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732918371; l=1153;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=BIFYO+CLtWkBnRHvBOajO+beyOCJj9NvQbQ/HDfTLKg=;
 b=pWStGpoJqL6ki0Y1D6Ax9RDDwi1XD3/T6Txs6dJzq8+RXpE/f0JYcsJviePmM45Dzcol21OIX
 IzEeztB8dedAciiHqcPC3hUP5LWeN+d8PE3bAS80IBSV7mW05CYTM3+
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This SoC doesn't seem to have separate DP/DM interrupts, move it to the
category that has a "qusb2_phy" one instead.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 7ce56db1bbd4cd801129929616eb17f968b097f1..8c9f675083bc9d5964374304d2186c803e81be29 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -411,6 +411,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,msm8994-dwc3
               - qcom,msm8996-dwc3
               - qcom,qcs404-dwc3
               - qcom,sdm660-dwc3
@@ -469,7 +470,6 @@ allOf:
             enum:
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
-              - qcom,msm8994-dwc3
               - qcom,qcs8300-dwc3
               - qcom,qdu1000-dwc3
               - qcom,sa8775p-dwc3

-- 
2.47.1


