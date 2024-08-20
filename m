Return-Path: <linux-arm-msm+bounces-29113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F343B9585EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 13:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 319CA1C24499
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 11:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D53718EFD9;
	Tue, 20 Aug 2024 11:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e8MfaN4y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A1218DF9F;
	Tue, 20 Aug 2024 11:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724153685; cv=none; b=pRs+e43ccEokc+Hk0iCxGknbEP+7s8QTz8lsmlSDskqT6eBwqtvTstulEQ7gQpeqks7DftK4M/bWROxItXTh6xcRwsO9ANvdV/ejPRfHPkgEChUQboK37oLYPrv7txA5g3SbNPfkxoaLMfjwQgh+x22E608DZrI+LwpbjdZQ+9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724153685; c=relaxed/simple;
	bh=uBuAtjt4MaGg8XwvsJADshzHwUmpcbF+Z52rKGPynqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f++lBDxvOnm2kJyCYhgQnfIlZ86Jahb7ZcrSS0r+WmkkyNYmoU/WENVNrL91NfyjJHH9RkIrWz74OhYdiv1yudOzM3w516Z0FCS72UhA3E/Vb8TyBbR2zF1mDs+MhktOQV2gbKYoQYzdHi8JptRgG6Y3Qhk9l8H9E6l8gxDsI0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e8MfaN4y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70EEC4AF0F;
	Tue, 20 Aug 2024 11:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724153684;
	bh=uBuAtjt4MaGg8XwvsJADshzHwUmpcbF+Z52rKGPynqA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e8MfaN4yLZSFtWIjS+0GOj/ttxjXcZtjl9+JrYAUoBmOo/YZ7gcP2OL8vd0G7UW6p
	 ifwo9s86tv4P3Nv67tWSImQP7lKDcVmA2Jc/Tl5hpg/mQ0aSoCAoc7fHr+aOkFdepn
	 wuTPVJ3sNIdbkYPLPkVZCQx3UdkWMMU8E5JMddiFleL0cl+RE8su3d3UWCfFtuygNU
	 qAokwTzjTmBco6JOjPI15F7D62BW60pXm0/AjBkezRNUwkWDukaLmKWNbiH4g3z7Ob
	 WFSy4/CNxdMWI/guTUsuDlCZfIg0sOKItDB6CByYmhQ5CD1X06QNe/aXvBkfFssnh3
	 R2Fdi9+VmTguw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 20 Aug 2024 13:34:22 +0200
Subject: [PATCH v2 1/2] dt-bindings: usb: qcom,dwc3: Document X1E80100 MP
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240820-topic-h_mp-v2-1-d88518066372@quicinc.com>
References: <20240820-topic-h_mp-v2-0-d88518066372@quicinc.com>
In-Reply-To: <20240820-topic-h_mp-v2-0-d88518066372@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krishna Kurapati <quic_kriskura@quicinc.com>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724153674; l=1310;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=praaIHrNRKkxhfpYFLVEk6FRJmBsIKoqMHiXk+BZxc4=;
 b=wqG2UHKLKDIKJhwulZX0718FUyyEHvFo6pqHut+sb4U87xOpP4VXO9Q3HAMpaqOffoni4p4VD
 H83oDuANbBXBo3nbWKfAv5wHrArm/g5gZxLersyi5P0OP2UXoQM+m2/
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <quic_kdybcio@quicinc.com>

The X1E80100, just like its predecessors, has a Multiport controller.
This time around, 2 HS (eUSB) and 2 SS PHYs are attached.

Document it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index e99c55bb4e9c..18758efb8d29 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -52,6 +52,7 @@ properties:
           - qcom,sm8550-dwc3
           - qcom,sm8650-dwc3
           - qcom,x1e80100-dwc3
+          - qcom,x1e80100-dwc3-mp
       - const: qcom,dwc3
 
   reg:
@@ -289,6 +290,7 @@ allOf:
               - qcom,sc8280xp-dwc3
               - qcom,sc8280xp-dwc3-mp
               - qcom,x1e80100-dwc3
+              - qcom,x1e80100-dwc3-mp
     then:
       properties:
         clocks:
@@ -501,6 +503,7 @@ allOf:
           contains:
             enum:
               - qcom,sc8180x-dwc3-mp
+              - qcom,x1e80100-dwc3-mp
     then:
       properties:
         interrupts:

-- 
2.46.0


