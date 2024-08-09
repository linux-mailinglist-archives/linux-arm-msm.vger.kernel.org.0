Return-Path: <linux-arm-msm+bounces-28248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1674194D10C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 15:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C44F7284B24
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 13:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BB51957F4;
	Fri,  9 Aug 2024 13:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqbKgWXD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5628719046B;
	Fri,  9 Aug 2024 13:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723209518; cv=none; b=lrDALw3dpvMzUusDNNa4sBr1c16c+RLUdjc+XmL3V+uwdgMfU6n2YVBu+a4pZRPORJvEmXUsC3zk60NVs6qqFFnFkNSOmvjoZ5GIF5mHzYiAFFCnfWGRSrXPDeGsHMBpdQ4R5a0BIq4UXfSlA7MKUWinGSP8hFO82Qi3re05qxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723209518; c=relaxed/simple;
	bh=qPDXYs0t+KCjLut77ceTV7SGMVhbMKc30rt8tKpzGcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FWojlCTBhR1sH5JpZ/7XlHLpFh9mOugn+Zw4kS2bs1HJlJMpwD5ZNXQhNFNER/6o/3aUS9j+ERMWV4wYAUXDPM4c76eKKLvhQvTsdSi8rKCtjAUadU9DxClMnZCzi66v89APKE/s6pmt+jkvOH1BUAYvh05cmeJFVr+qTixvht8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqbKgWXD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A606C4AF10;
	Fri,  9 Aug 2024 13:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723209517;
	bh=qPDXYs0t+KCjLut77ceTV7SGMVhbMKc30rt8tKpzGcA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lqbKgWXD7oc438lelQHxic1AZn3jf6Ii83QLvadHUedgmsoGr70iPljDSsDLxxJC9
	 O4rid+MGjkiLKhdTHA0oiCI9yvfa81Lv2WQQulVH3HUwSiR1/FWw8zK+HgcwpoED3P
	 hPliFCS6E0mWDQSuCo2dsf5VBBWpQMFA7vxPkAMqhLlg4LiosltBYQtuil/0l/Bs9h
	 WB4Hg8hkGuixjPPa9s4np3QEkPpbth4JneZ3PpI5ll6HKjV335vI9juOVxNQZoKPtT
	 Zfw5PieX+KKmTjLlHXPWkqxOwy0rIf8YtgIgC8Ul0+N3ZiZcQuaMLu/0hcXFj5ztSO
	 uVr2AxqqnwtXA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 09 Aug 2024 15:18:21 +0200
Subject: [PATCH 1/2] dt-bindings: usb: qcom,dwc3: Document X1E80100 MP
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-topic-h_mp-v1-1-3c5f468566d8@quicinc.com>
References: <20240809-topic-h_mp-v1-0-3c5f468566d8@quicinc.com>
In-Reply-To: <20240809-topic-h_mp-v1-0-3c5f468566d8@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krishna Kurapati <quic_kriskura@quicinc.com>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723209509; l=1243;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=3Qrv0vcFFLIuxHpeKgszhwxTA2vXSBhWotVnTSN9RYo=;
 b=apC5GPSx9+eguK7SE0wjzsMWBd388+vnVhh/MeEcqnkIy+J52i0VK0mL3K34ETeIQ6Ua9uo8G
 Wr923c9fe8DBCKp6Go8DPhdo40vWAXsRd+UNqz8OJs/AIzc7W5CO8dD
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <quic_kdybcio@quicinc.com>

The X1E80100, just like its predecessors, has a Multiport controller.
This time around, 2 HS (eUSB) and 2 SS PHYs are attached.

Document it.

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


