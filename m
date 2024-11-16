Return-Path: <linux-arm-msm+bounces-38110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 126DF9CFE64
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2024 12:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C54CD2858B6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2024 11:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC0719412E;
	Sat, 16 Nov 2024 11:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7hSz039"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F1628FF;
	Sat, 16 Nov 2024 11:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731755882; cv=none; b=oxOI7ARhloTysV0UpC7KydumWol0vL9a7e/RBWoons+X9xeIudHCyaPl5y/pcMAJus3z5+0GkaSEzZVa1MrEi9jjzkkDJAWyAiyDvdGebsKFjXwXKNHY7jALCVlJ8/g+Qg5ii/Aa8NHWvgkiaq1OO/ima10ZXOGcTKI8qEVPn48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731755882; c=relaxed/simple;
	bh=HIbSD780GkWfyn1Kfr1abSzw1kccJda/MC5SHguIvzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KS2GgBlqwByGxNCpseqXS/enkwAFQ3YMfA0015aLkSJgEZPUxiiu1iiGqAtCPynoyMbBtMfqzd4b/E89fTEeoD1EKBS1MC5bqxQV7B9ESkyRdctAF80XkWgdeU3nYKT8HtaBVw09JZpZPuoT0pDmU06a42c26hV4pJxcuNzsZpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7hSz039; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321AAC4CEC3;
	Sat, 16 Nov 2024 11:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731755881;
	bh=HIbSD780GkWfyn1Kfr1abSzw1kccJda/MC5SHguIvzA=;
	h=From:Date:Subject:To:Cc:From;
	b=d7hSz039oEa8kW1N6rEukFBjX6iU1zRLRFYo3pzJW0auPYPTfjJBtATXox90aSgO3
	 WmU4arDt7ZDUBKXIruf1pnlzMsRxOFrDGoy9Up7rqfDFo695HwrGWb99m1bJ1cPeM8
	 32Nbp2Bax/pg/SUXVHohOPiQhg5pj9kKpsJ6HAEwOkipVtVTIkZAIMfM64Q2FHhj2l
	 0AFGxk2UETLF2jnoXFygqz5yA1K0dXdSVGQkIHFA5bDMRaZauQxingQnkTvFJ6ma0/
	 1VIdAzxpHBTvInje7Uh+fb+oI0iLU0/J5FZseKsXqX2Embl09ojNsFgi3Ip9+G4zwn
	 2MN7kEo4NG3FA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 16 Nov 2024 12:17:52 +0100
Subject: [PATCH] dt-bindings: usb: qcom,dwc3: Make ss_phy_irq optional for
 X1E80100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241116-topic-x1e_usb2_bindings-v1-1-dde2d63f428f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAF9/OGcC/x3MQQ5AMBBA0avIrDUxVRWuIiJag9mUdBCJuLvG8
 i3+f0AoMgm02QORLhbeQgLmGfh1DAspnpJBF9ogolXHtrNXN9JwitOD4zBxWERZT01lx8KWtYF
 U75Fmvv9z17/vB130mj5pAAAA
X-Change-ID: 20241116-topic-x1e_usb2_bindings-6ce956a06374
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731755877; l=1224;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=gZExH4KpKRDPrzwmZvAXK4xItpr/HRx5XcV7uUS0NiQ=;
 b=zRspkGNnvpU5Ibmbyfg+jtehOsK0oyAS7f6xNmbLI/ai7wuThq9qUAS+zQ/k0cp+spOQbhoG/
 LqGrqYO2nUFDEL8RaQkhOoFQavDtSaaaF1TQ6ZonM/q/xiSqO0mJIj5
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

X1 has multiple DWC3 hosts, including one that's USB2, which naturally
means it doesn't have a SuperSpeed interrupt. Make it optional to fix
warnings such as:

usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 935e204b607bbd3bc9bfbdcd03519202197c9eb4..98bb82c795d4589c2aa55ebe8168e3e681d1d41b 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -453,8 +453,10 @@ allOf:
     then:
       properties:
         interrupts:
+          minItems: 3
           maxItems: 4
         interrupt-names:
+          minItems: 3
           items:
             - const: pwr_event
             - const: dp_hs_phy_irq

---
base-commit: 744cf71b8bdfcdd77aaf58395e068b7457634b2c
change-id: 20241116-topic-x1e_usb2_bindings-6ce956a06374

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


