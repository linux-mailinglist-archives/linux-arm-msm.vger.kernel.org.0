Return-Path: <linux-arm-msm+bounces-39637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA049DED1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 23:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 741892821E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 22:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C821A726F;
	Fri, 29 Nov 2024 22:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ClX3IEgo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E96AD23;
	Fri, 29 Nov 2024 22:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732918383; cv=none; b=MvwFUwL6omG4pY6gjYjwGXxl2j2WCs+vgCgoELyHIGDXigpgQeB3O+H72c6x4MVFTa6CHpCroxgBuF1BSofAcJAfiUB/aPBafg47C0MIjsGS7d4mGlP+kJtslldaOLQN9LlqFbRfWwDaRDVyxJsJzBMcE8BADcUSGvFRyWdnNaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732918383; c=relaxed/simple;
	bh=fmNXJ89XhVNXNRClZiT8e8WLaiExixBwcfbMMnoHnVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sSXgqFYOrCXAgjGQhTPUkErJaYd9AUvwQPhMn2EjsZxVCsMpKP9wHye5H4lOMdWkRH66SgEzAwpQ1kw38sFs4b/GnGz9LqxaUMD3PqC+MN5jcI3DOOJHYZua32ESxq+4fE5S6cpfVYy7BVY5dYIQQHhePeUCu3KtNVcoGArrgAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ClX3IEgo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F157AC4CED2;
	Fri, 29 Nov 2024 22:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732918382;
	bh=fmNXJ89XhVNXNRClZiT8e8WLaiExixBwcfbMMnoHnVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ClX3IEgoishEvx8aCpUoZaOTLOX8UyUeTv1VlHBQKo9DM2SMUAaeM8siUobE2+oXc
	 OXqMbFfmOeJdwAxPDHj3L+2BYclK9ZI1oYeVfbxEC9OQ5YBIWmkISZBLSC2T/CX+/I
	 TS3PQzZl/DUR/KJ5mmT22DQjykhWmUZ+QPL+l6ufao62JZGzIBG8ikDH+AAG8DrQ+h
	 vRNp3KE3xP5q5MyisoS0sCw0P28ZlyizOVWv+RDy49rSfuOFTLl36yvFntrBirN+rr
	 UmdoSmycMPk79EeqaapapPms9S2/cn4PzZniJ1b+y+xRgqM5ohT0+IbS/4+RXDfw3P
	 D8vwjtSrrHG1g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 29 Nov 2024 23:12:45 +0100
Subject: [PATCH RFT 1/4] dt-bindings: usb: qcom,dwc3: Make ss_phy_irq
 optional for MSM8996
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241129-topic-qcom_usb_dtb_fixup-v1-1-cba24120c058@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732918371; l=1041;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=3YpwH3VuIY5AJtCG2vndatg8MeOqvhNEnUEF/2XhSUY=;
 b=mEWNmvf70ccqVrD9+fFq6ZsuTpmdBxaT8W/96yu599OB6QocvG7P+S8Hq2uuF635XQlDS2bRU
 4oRALynrILJCgu88QecGugHmSnXEbQkzG/+a2owxeYkU/olfZn5Xzs4
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

MSM8996 has two DWC3 hosts, one of which is USB2, which naturally
means it doesn't have a SuperSpeed interrupt. 3 interrupts are already
allowed, apply the same logic to interrupt-names.

This fixes warnings such as:

usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 935e204b607bbd3bc9bfbdcd03519202197c9eb4..7ce56db1bbd4cd801129929616eb17f968b097f1 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -422,6 +422,7 @@ allOf:
           minItems: 3
           maxItems: 4
         interrupt-names:
+          minItems: 3
           items:
             - const: pwr_event
             - const: qusb2_phy

-- 
2.47.1


